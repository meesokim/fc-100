/*
	Skelton for retropc emulator

	Origin : MAME Z80DMA / Xmillenium
	Author : Takeda.Toshiya
	         Y.S. (Xmil106RS)
	Date   : 2011.04.96-

	[ Z80DMA ]
*/

#include "z80dma.h"

//#define DMA_DEBUG

#define CMD_RESET				0xc3
#define CMD_RESET_PORT_A_TIMING			0xc7
#define CMD_RESET_PORT_B_TIMING			0xcb
#define CMD_LOAD				0xcf
#define CMD_CONTINUE				0xd3
#define CMD_DISABLE_INTERRUPTS			0xaf
#define CMD_ENABLE_INTERRUPTS			0xab
#define CMD_RESET_AND_DISABLE_INTERRUPTS	0xa3
#define CMD_ENABLE_AFTER_RETI			0xb7
#define CMD_READ_STATUS_BYTE			0xbf
#define CMD_REINITIALIZE_STATUS_BYTE		0x8b
#define CMD_INITIATE_READ_SEQUENCE		0xa7
#define CMD_FORCE_READY				0xb3
#define CMD_ENABLE_DMA				0x87
#define CMD_DISABLE_DMA				0x83
#define CMD_READ_MASK_FOLLOWS			0xbb

#define TM_TRANSFER		1
#define TM_SEARCH		2
#define TM_SEARCH_TRANSFER	3

#define OM_BYTE			0
#define OM_CONTINUOUS		1
#define OM_BURST		2

#define INT_RDY			0
#define INT_MATCH		1
#define INT_END_OF_BLOCK	2

#define GET_REGNUM(r)		(&(r) - &(WR0))

#define WR0			regs.m[0][0]
#define WR1			regs.m[1][0]
#define WR2			regs.m[2][0]
#define WR3			regs.m[3][0]
#define WR4			regs.m[4][0]
#define WR5			regs.m[5][0]
#define WR6			regs.m[6][0]

#define PORTA_ADDRESS_L		regs.m[0][1]
#define PORTA_ADDRESS_H		regs.m[0][2]

#define BLOCKLEN_L		regs.m[0][3]
#define BLOCKLEN_H		regs.m[0][4]

#define PORTA_TIMING		regs.m[1][1]
#define PORTB_TIMING		regs.m[2][1]

#define MASK_BYTE		regs.m[3][1]
#define MATCH_BYTE		regs.m[3][2]

#define PORTB_ADDRESS_L		regs.m[4][1]
#define PORTB_ADDRESS_H		regs.m[4][2]
#define INTERRUPT_CTRL		regs.m[4][3]
#define INTERRUPT_VECTOR	regs.m[4][4]
#define PULSE_CTRL		regs.m[4][5]

#define READ_MASK		regs.m[6][1]

#define PORTA_ADDRESS		((PORTA_ADDRESS_H << 8) | PORTA_ADDRESS_L)
#define PORTB_ADDRESS		((PORTB_ADDRESS_H << 8) | PORTB_ADDRESS_L)
#define BLOCKLEN		((BLOCKLEN_H << 8) | BLOCKLEN_L)

#define PORTA_INC		(WR1 & 0x10)
#define PORTB_INC		(WR2 & 0x10)
#define PORTA_FIXED		(((WR1 >> 4) & 2) == 2)
#define PORTB_FIXED		(((WR2 >> 4) & 2) == 2)
#define PORTA_MEMORY		(((WR1 >> 3) & 1) == 0)
#define PORTB_MEMORY		(((WR2 >> 3) & 1) == 0)

#define PORTA_CYCLE_LEN		(4 - (PORTA_TIMING & 3))
#define PORTB_CYCLE_LEN		(4 - (PORTB_TIMING & 3))

#define PORTA_IS_SOURCE		((WR0 >> 2) & 1)
#define PORTB_IS_SOURCE		(!PORTA_IS_SOURCE)
#define TRANSFER_MODE		(WR0 & 3)

#define MATCH_F_SET		(status &= ~0x10)
#define MATCH_F_CLEAR		(status |= 0x10)
#define EOB_F_SET		(status &= ~0x20)
#define EOB_F_CLEAR		(status |= 0x20)

#define OPERATING_MODE		((WR4 >> 5) & 3)

#define READY_ACTIVE_HIGH	((WR5 >> 3) & 1)
#define AUTO_RESTART		((WR5 >> 5) & 1)

#define INTERRUPT_ENABLE	(WR3 & 0x20)
#define INT_ON_MATCH		(INTERRUPT_CTRL & 0x01)
#define INT_ON_END_OF_BLOCK	(INTERRUPT_CTRL & 0x02)
#define INT_ON_READY		(INTERRUPT_CTRL & 0x40)
#define STATUS_AFFECTS_VECTOR	(INTERRUPT_CTRL & 0x20)

void Z80DMA::reset()
{
	WR3 &= ~0x20; // disable interrupt
	status = 0x30;
	
	wr_num = wr_ptr = 0;
	rr_num = rr_ptr = 0;
	reset_ptr = 0;
	
	enabled = false;
	ready = 0;
	force_ready = false;
	
	iei = oei = true;
	req_intr = in_service = false;
	vector = 0;
	
	upcount = 0;
	blocklen = 0;
	dma_stop = false;
}

void Z80DMA::write_io8(uint32 addr, uint32 data)
{
	if(wr_num == 0) {
		reset_ptr = 0;
		
		if((data & 0x87) == 0) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR2=%2x\n"), data);
#endif
			WR2 = data;
			if(data & 0x40) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTB_TIMING);
			}
		}
		else if((data & 0x87) == 4) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR1=%2x\n"), data);
#endif
			WR1 = data;
			if(data & 0x40) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTA_TIMING);
			}
		}
		else if((data & 0x80) == 0) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR0=%2x\n"), data);
#endif
			WR0 = data;
			if(data & 0x08) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTA_ADDRESS_L);
			}
			if(data & 0x10) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTA_ADDRESS_H);
			}
			if(data & 0x20) {
				wr_tmp[wr_num++] = GET_REGNUM(BLOCKLEN_L);
			}
			if(data & 0x40) {
				wr_tmp[wr_num++] = GET_REGNUM(BLOCKLEN_H);
			}
		}
		else if((data & 0x83) == 0x80) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR3=%2x\n"), data);
#endif
			WR3 = data;
			if(data & 0x08) {
				wr_tmp[wr_num++] = GET_REGNUM(MASK_BYTE);
			}
			if(data & 0x10) {
				wr_tmp[wr_num++] = GET_REGNUM(MATCH_BYTE);
			}
			enabled = ((data & 0x40) != 0);
		}
		else if((data & 0x83) == 0x81) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR4=%2x\n"), data);
#endif
			WR4 = data;
			if(data & 0x04) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTB_ADDRESS_L);
			}
			if(data & 0x08) {
				wr_tmp[wr_num++] = GET_REGNUM(PORTB_ADDRESS_H);
			}
			if(data & 0x10) {
				wr_tmp[wr_num++] = GET_REGNUM(INTERRUPT_CTRL);
			}
		}
		else if((data & 0xc7) == 0x82) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR5=%2x\n"), data);
#endif
			WR5 = data;
		}
		else if((data & 0x83) == 0x83) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: WR6=%2x\n"), data);
#endif
			WR6 = data;
			enabled = false;
			
			// check dma stop (from Xmil106RS)
			switch (data) {
			case CMD_CONTINUE:
			case CMD_READ_STATUS_BYTE:
			case CMD_INITIATE_READ_SEQUENCE:
			case CMD_ENABLE_DMA:
			case CMD_DISABLE_DMA:
			case CMD_READ_MASK_FOLLOWS:
				break;
			default:
				dma_stop = false;
				break;
			}
			
			// run command
			switch (data) {
			case CMD_ENABLE_AFTER_RETI:
				break;
			case CMD_READ_STATUS_BYTE:
				// force to read status (from Xmillenium)
				READ_MASK = 1;
				update_read_buffer();
				break;
			case CMD_RESET_AND_DISABLE_INTERRUPTS:
				WR3 &= ~0x20;
				req_intr = false;
				update_intr();
				force_ready = false;
				break;
			case CMD_INITIATE_READ_SEQUENCE:
				update_read_buffer();
				break;
			case CMD_RESET:
				enabled = false;
				force_ready = false;
				req_intr = false;
				update_intr();
				// needs six reset commands to reset the DMA
				for(int i = 0; i < 7; i++) {
					regs.m[i][reset_ptr] = 0;
				}
				if(++reset_ptr >= 6) {
					reset_ptr = 0;
				}
				status = 0x30;
				// reset upcount
				WR3 &= ~0x20;
				upcount = 0;
				break;
			case CMD_LOAD:
				force_ready = false;
				addr_a = PORTA_ADDRESS;
				addr_b = PORTB_ADDRESS;
				upcount = 0;//BLOCKLEN;
				status |= 0x30;
				break;
			case CMD_DISABLE_DMA:
				enabled = false;
				break;
			case CMD_ENABLE_DMA:
				enabled = true;
#ifndef SINGLE_MODE_DMA
				do_dma();
#endif
				break;
			case CMD_READ_MASK_FOLLOWS:
				wr_tmp[wr_num++] = GET_REGNUM(READ_MASK);
				break;
			case CMD_CONTINUE:
				upcount = (dma_stop && upcount != blocklen) ? -1 : 0;
				enabled = true;
				status |= 0x30;
#ifndef SINGLE_MODE_DMA
				do_dma();
#endif
				break;
			case CMD_RESET_PORT_A_TIMING:
				PORTA_TIMING = 0;
				break;
			case CMD_RESET_PORT_B_TIMING:
				PORTB_TIMING = 0;
				break;
			case CMD_FORCE_READY:
				force_ready = true;
#ifndef SINGLE_MODE_DMA
				do_dma();
#endif
				break;
			case CMD_ENABLE_INTERRUPTS:
				WR3 |= 0x20;
				break;
			case CMD_DISABLE_INTERRUPTS:
				WR3 &= ~0x20;
				break;
			case CMD_REINITIALIZE_STATUS_BYTE:
				status |= 0x30;
				req_intr = false;
				update_intr();
				break;
			}
		}
		wr_ptr = 0;
	}
	else {
		int nreg = wr_tmp[wr_ptr];
#ifdef DMA_DEBUG
		emu->out_debug(_T("Z80DMA: WR[%d,%d]=%2x\n"), nreg >> 3, nreg & 7, data);
#endif
		regs.t[nreg] = data;
		
		if(++wr_ptr >= wr_num) {
			wr_num = 0;
		}
		if(nreg == GET_REGNUM(INTERRUPT_CTRL)) {
			wr_num=0;
			if(data & 0x08) {
				wr_tmp[wr_num++] = GET_REGNUM(PULSE_CTRL);
			}
			if(data & 0x10) {
				wr_tmp[wr_num++] = GET_REGNUM(INTERRUPT_VECTOR);
			}
			wr_ptr = 0;
		}
		else if(wr_tmp[wr_num] == GET_REGNUM(READ_MASK)) {
			// from Xmillenium
			update_read_buffer();
		}
		if(++reset_ptr >= 6) {
			reset_ptr = 0;
		}
	}
}

uint32 Z80DMA::read_io8(uint32 addr)
{
	// return status if read buffer is empty (from Xmillenium)
	if(rr_num == 0) {
		return status | (now_ready() ? 0 : 2) | (req_intr ? 0 : 8);
	}
	uint32 data = rr_tmp[rr_ptr];
	
#ifdef DMA_DEBUG
	emu->out_debug(_T("Z80DMA: RR[%d]=%2x\n"), rr_ptr, data);
#endif
	if(++rr_ptr >= rr_num) {
		rr_ptr = 0;
	}
	return data;
}

void Z80DMA::write_signal(int id, uint32 data, uint32 mask)
{
	// ready signal (wired-or)
	uint8 bit = 1 << id;
	
	if(data & mask) {
		if(!(ready & bit)) {
			if(!ready && INT_ON_READY) {
				request_intr(INT_RDY);
			}
			ready |= bit;
#ifndef SINGLE_MODE_DMA
			do_dma();
#endif
		}
	}
	else {
		ready &= ~bit;
	}
}

bool Z80DMA::now_ready()
{
	if(force_ready) {
		return true;
	}
	if(READY_ACTIVE_HIGH) {
		return (ready == 0);
	}
	else {
		return (ready != 0);
	}
}

void Z80DMA::update_read_buffer()
{
	// note: return current count and address (from Xmillenium)
	rr_ptr = rr_num = 0;
	if(READ_MASK & 0x01) {
		rr_tmp[rr_num++] = status | (now_ready() ? 0 : 2) | (req_intr ? 0 : 8);
	}
	if(READ_MASK & 0x02) {
		rr_tmp[rr_num++] = upcount & 0xff;//BLOCKLEN_L;
	}
	if(READ_MASK & 0x04) {
		rr_tmp[rr_num++] = upcount >> 8;//BLOCKLEN_H;
	}
	if(READ_MASK & 0x08) {
		rr_tmp[rr_num++] = addr_a & 0xff;//PORTA_ADDRESS_L;
	}
	if(READ_MASK & 0x10) {
		rr_tmp[rr_num++] = addr_a >> 8;//PORTA_ADDRESS_H;
	}
	if(READ_MASK & 0x20) {
		rr_tmp[rr_num++] = addr_b & 0xff;//PORTB_ADDRESS_L;
	}
	if(READ_MASK & 0x40) {
		rr_tmp[rr_num++] = addr_b >> 8;//PORTB_ADDRESS_H;
	}
}

// note: if SINGLE_MODE_DMA is defined, do_dma() is called in every machine cycle

void Z80DMA::do_dma()
{
	if(!enabled) {
		return;
	}
	bool occured = false;
	bool found = false;
	
	// from Xmillenium (thanks Y.S.)
	if(BLOCKLEN == 0) {
		blocklen = 65537;
	}
	else if(BLOCKLEN == 0xffff) {
		blocklen = (int)65536;
	}
	else {
		blocklen = BLOCKLEN + 1;
	}
	
#ifndef SINGLE_MODE_DMA
restart:
#endif
	while(enabled && now_ready() && !(upcount == blocklen || found)) {
		if(dma_stop) {
			if(upcount < blocklen) {
				upcount++;
			}
			dma_stop = false;
			goto inc_ports;
		}
		uint32 data = 0;
		
		// read
		if(PORTA_IS_SOURCE) {
			if(PORTA_MEMORY) {
				data = d_mem->read_dma_data8(addr_a);
#ifdef DMA_DEBUG
				emu->out_debug(_T("Z80DMA: RAM[%4x]=%2x -> "), addr_a, data);
#endif
			}
			else {
				data = d_io->read_dma_io8(addr_a);
#ifdef DMA_DEBUG
				emu->out_debug(_T("Z80DMA: INP(%4x)=%2x -> "), addr_a, data);
#endif
			}
		}
		else {
			if(PORTB_MEMORY) {
				data = d_mem->read_dma_data8(addr_b);
#ifdef DMA_DEBUG
				emu->out_debug(_T("Z80DMA: RAM[%4x]=%2x -> "), addr_b, data);
#endif
			}
			else {
				data = d_io->read_dma_io8(addr_b);
#ifdef DMA_DEBUG
				emu->out_debug(_T("Z80DMA: INP(%4x)=%2x -> "), addr_b, data);
#endif
			}
		}
		
		// write
		if(TRANSFER_MODE == TM_TRANSFER || TRANSFER_MODE == TM_SEARCH_TRANSFER) {
			if(PORTA_IS_SOURCE) {
				if(PORTB_MEMORY) {
#ifdef DMA_DEBUG
					emu->out_debug(_T("RAM[%4x]\n"), addr_b);
#endif
					d_mem->write_dma_data8(addr_b, data);
				}
				else {
#ifdef DMA_DEBUG
					emu->out_debug(_T("OUT(%4x)\n"), addr_b);
#endif
					d_io->write_dma_io8(addr_b, data);
				}
			}
			else {
				if(PORTA_MEMORY) {
#ifdef DMA_DEBUG
					emu->out_debug(_T("RAM[%4x]\n"), addr_a);
#endif
					d_mem->write_dma_data8(addr_a, data);
				}
				else {
#ifdef DMA_DEBUG
					emu->out_debug(_T("OUT(%4x)\n"), addr_a);
#endif
					d_io->write_dma_io8(addr_a, data);
				}
			}
		}
		
		// search
		if(TRANSFER_MODE == TM_SEARCH || TRANSFER_MODE == TM_SEARCH_TRANSFER) {
			if((data & MASK_BYTE) == (MATCH_BYTE & MASK_BYTE)) {
				found = true;
			}
		}
		upcount++;
		occured = true;
		
		if(found || !now_ready()) {
			if(upcount < blocklen) {
				upcount--;
			}
			dma_stop = true;
			break;
		}
inc_ports:
		if(PORTA_IS_SOURCE) {
			addr_a += PORTA_FIXED ? 0 : PORTA_INC ? 1 : -1;
		}
		else {
			addr_b += PORTB_FIXED ? 0 : PORTB_INC ? 1 : -1;
		}
		if(TRANSFER_MODE == TM_TRANSFER || TRANSFER_MODE == TM_SEARCH_TRANSFER) {
			if(PORTA_IS_SOURCE) {
				addr_b += PORTB_FIXED ? 0 : PORTB_INC ? 1 : -1;
			}
			else {
				addr_a += PORTA_FIXED ? 0 : PORTA_INC ? 1 : -1;
			}
		}
#ifdef SINGLE_MODE_DMA
		if(OPERATING_MODE == OM_BYTE) {
			break;
		}
#endif
	}
	
#ifdef DMA_DEBUG
	if(occured) {
		emu->out_debug(_T("Z80DMA: COUNT=%4x FOUND=%d\n"), count, found ? 1 : 0);
	}
#endif
	if(occured && (upcount == blocklen || found)) {
		// auto restart
		if(AUTO_RESTART && upcount == blocklen && !force_ready) {
#ifdef DMA_DEBUG
			emu->out_debug(_T("Z80DMA: AUTO RESTART !!!\n"));
#endif
			upcount = 0;
#ifndef SINGLE_MODE_DMA
			goto restart;
#endif
		}
		
		// update status
		status = 1;
		if(!found) {
			status |= 0x10;
		}
		if(upcount != blocklen) {
			status |= 0x20;
		}
		enabled = false;
		
		// request interrupt
		int level = 0;
		if(upcount == blocklen) {
			// transfer/search done
			if(INT_ON_END_OF_BLOCK) {
				level |= INT_END_OF_BLOCK;
			}
		}
		if(found) {
			// match found
			if(INT_ON_MATCH) {
				level |= INT_MATCH;
			}
		}
		if(level) {
			request_intr(level);
		}
	}
}

void Z80DMA::request_intr(int level)
{
	if(!in_service && INTERRUPT_ENABLE) {
		req_intr = true;
		
		if(STATUS_AFFECTS_VECTOR) {
			vector = (uint8)((INTERRUPT_VECTOR & 0xf9) | (level << 1));
		}
		else {
			vector = (uint8)INTERRUPT_VECTOR;
		}
		update_intr();
	}
}

void Z80DMA::set_intr_iei(bool val)
{
	if(iei != val) {
		iei = val;
		update_intr();
	}
}

#define set_intr_oei(val) { \
	if(oei != val) { \
		oei = val; \
		if(d_child) { \
			d_child->set_intr_iei(oei); \
		} \
	} \
}

void Z80DMA::update_intr()
{
	bool next;
	
	// set oei signal
	if((next = iei) == true) {
		if(in_service) {
			next = false;
		}
	}
	set_intr_oei(next);
	
	// set int signal
	if((next = iei) == true) {
		next = (!in_service && req_intr);
	}
	if(d_cpu) {
		d_cpu->set_intr_line(next, true, intr_bit);
	}
}

uint32 Z80DMA::intr_ack()
{
	// ack (M1=IORQ=L)
	if(in_service) {
		// invalid interrupt status
		return 0xff;
	}
	else if(req_intr) {
		req_intr = false;
		in_service = true;
		enabled = false;
		update_intr();
		return vector;
	}
	if(d_child) {
		return d_child->intr_ack();
	}
	return 0xff;
}

void Z80DMA::intr_reti()
{
	// detect RETI
	if(in_service) {
		in_service = false;
		update_intr();
		return;
	}
	if(d_child) {
		d_child->intr_reti();
	}
}

