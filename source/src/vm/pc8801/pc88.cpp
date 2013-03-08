/*
	NEC PC-98DO Emulator 'ePC-98DO'
	NEC PC-8801MA Emulator 'ePC-8801MA'
	NEC PC-8001mkIISR Emulator 'ePC-8001mkIISR'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2011.12.29-

	[ PC-8801 ]
*/

#include "pc88.h"
#include "../beep.h"
#include "../event.h"
#include "../i8251.h"
#include "../pcm1bit.h"
#include "../upd1990a.h"
#include "../ym2203.h"
#include "../z80.h"
#include "../../config.h"
#include "../../fileio.h"

#define DEVICE_JOYSTICK	0
#define DEVICE_MOUSE	1
#define DEVICE_JOYMOUSE	2	// not supported yet

#define EVENT_TIMER	0
#define EVENT_BUSREQ	1
#define EVENT_CMT_SEND	2
#define EVENT_CMT_DCD	3

#define IRQ_USART	0
#define IRQ_VRTC	1
#define IRQ_TIMER	2
#define IRQ_SOUND	4

#define Port30_40	!(port[0x30] & 0x01)
#define Port30_COLOR	!(port[0x30] & 0x02)
#define Port30_MTON	(port[0x30] & 0x08)

#define Port31_MMODE	(port[0x31] & 0x02)
#define Port31_RMODE	(port[0x31] & 0x04)
#define Port31_GRAPH	(port[0x31] & 0x08)
#define Port31_HCOLOR	(port[0x31] & 0x10)
#define Port31_400LINE	!(port[0x31] & 0x11)

#define Port31_COLOR	(port[0x31] & 0x04)	// PC-8001
#define Port31_320x200	(port[0x31] & 0x10)	// PC-8001

#define Port32_EROMSL	(port[0x32] & 0x03)
#define Port32_TMODE	(port[0x32] & 0x10)
#define Port32_PMODE	(port[0x32] & 0x20)
#define Port32_GVAM	(port[0x32] & 0x40)
#define Port32_SINTM	(port[0x32] & 0x80)

#define Port33_SINTM	(port[0x33] & 0x02)	// PC-8001
#define Port33_GVAM	(port[0x33] & 0x40)	// PC-8001
#define Port33_N80SR	(port[0x33] & 0x80)	// PC-8001

#define Port34_ALU	port[0x34]

#define Port35_PLN0	(port[0x35] & 0x01)
#define Port35_PLN1	(port[0x35] & 0x02)
#define Port35_PLN2	(port[0x35] & 0x04)
#define Port35_GDM	(port[0x35] & 0x30)
#define Port35_GAM	(port[0x35] & 0x80)

#define Port40_GHSM	(port[0x40] & 0x10)
#define Port40_JOP1	(port[0x40] & 0x40)

#define Port44_OPNCH	port[0x44]

#define Port53_TEXTDS	(port[0x53] & 0x01)
#define Port53_G0DS	(port[0x53] & 0x02)
#define Port53_G1DS	(port[0x53] & 0x04)
#define Port53_G2DS	(port[0x53] & 0x08)
#define Port53_G3DS	(port[0x53] & 0x10)	// PC-8001
#define Port53_G4DS	(port[0x53] & 0x20)	// PC-8001
#define Port53_G5DS	(port[0x53] & 0x40)	// PC-8001

#define Port70_TEXTWND	port[0x70]

#define Port71_EROM	port[0x71]

#define PortE2_RDEN	(port[0xe2] & 0x01)
#define PortE2_WREN	(port[0xe2] & 0x10)

#define PortE3_ERAMSL	port[0xe3]

#define PortE8E9_KANJI1	(port[0xe8] | (port[0xe9] << 8))
#define PortECED_KANJI2	(port[0xec] | (port[0xed] << 8))

#define PortF0_DICROMSL	(port[0xf0] & 0x1f)
#define PortF1_DICROM	!(port[0xf1] & 0x01)

#define SET_BANK(s, e, w, r) { \
	int sb = (s) >> 12, eb = (e) >> 12; \
	for(int i = sb; i <= eb; i++) { \
		if((w) == wdmy) { \
			wbank[i] = wdmy; \
		} else { \
			wbank[i] = (w) + 0x1000 * (i - sb); \
		} \
		if((r) == rdmy) { \
			rbank[i] = rdmy; \
		} else { \
			rbank[i] = (r) + 0x1000 * (i - sb); \
		} \
	} \
}

#define SET_BANK_W(s, e, w) { \
	int sb = (s) >> 12, eb = (e) >> 12; \
	for(int i = sb; i <= eb; i++) { \
		if((w) == wdmy) { \
			wbank[i] = wdmy; \
		} else { \
			wbank[i] = (w) + 0x1000 * (i - sb); \
		} \
	} \
}

#define SET_BANK_R(s, e, r) { \
	int sb = (s) >> 12, eb = (e) >> 12; \
	for(int i = sb; i <= eb; i++) { \
		if((r) == rdmy) { \
			rbank[i] = rdmy; \
		} else { \
			rbank[i] = (r) + 0x1000 * (i - sb); \
		} \
	} \
}

static const int key_table[15][8] = {
	{ 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67 },
	{ 0x68, 0x69, 0x6a, 0x6b, 0x00, 0x6c, 0x6e, 0x0d },
	{ 0xc0, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47 },
	{ 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f },
	{ 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57 },
	{ 0x58, 0x59, 0x5a, 0xdb, 0xdc, 0xdd, 0xde, 0xbd },
	{ 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 },
	{ 0x38, 0x39, 0xba, 0xbb, 0xbc, 0xbe, 0xbf, 0xe2 },
	{ 0x24, 0x26, 0x27, 0x2e, 0x12, 0x15, 0x10, 0x11 },
	{ 0x13, 0x70, 0x71, 0x72, 0x73, 0x74, 0x20, 0x1b },
	{ 0x09, 0x28, 0x25, 0x23, 0x7b, 0x6d, 0x6f, 0x14 },
	{ 0x21, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
	{ 0x75, 0x76, 0x77, 0x78, 0x79, 0x08, 0x2d, 0x2e },
	{ 0x1c, 0x1d, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00 },
	{ 0x0d, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00 }
};

static const int key_conv_table[6][2] = {
	{0x2d, 0x2e}, // INS	-> SHIFT + DEL
	{0x75, 0x70}, // F6	-> SHIFT + F1
	{0x76, 0x71}, // F7	-> SHIFT + F2
	{0x77, 0x72}, // F8	-> SHIFT + F3
	{0x78, 0x73}, // F9	-> SHIFT + F4
	{0x79, 0x74}, // F10	-> SHIFT + F5
};

static const uint8 intr_mask2_table[8] = {
	~7, ~3, ~5, ~1, ~6, ~2, ~4, ~0
};

void PC88::initialize()
{
	memset(rdmy, 0xff, sizeof(rdmy));
//	memset(ram, 0, sizeof(ram));
#ifdef PC88_EXRAM_BANKS
	memset(exram, 0, sizeof(exram));
#endif
	memset(gvram, 0, sizeof(gvram));
	memset(gvram_null, 0, sizeof(gvram_null));
	memset(tvram, 0, sizeof(tvram));
#if defined(_PC8001SR)
	memset(n80mk2rom, 0xff, sizeof(n80mk2rom));
	memset(n80mk2srrom, 0xff, sizeof(n80mk2srrom));
#else
	memset(n88rom, 0xff, sizeof(n88rom));
	memset(n88exrom, 0xff, sizeof(n88exrom));
	memset(n80rom, 0xff, sizeof(n80rom));
#endif
	memset(kanji1, 0xff, sizeof(kanji1));
	memset(kanji2, 0xff, sizeof(kanji2));
#ifdef SUPPORT_PC88_DICTIONARY
	memset(dicrom, 0xff, sizeof(dicrom));
#endif
	
	// load rom images
	FILEIO* fio = new FILEIO();
#if defined(_PC8001SR)
	if(fio->Fopen(emu->bios_path(_T("N80_2.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n80mk2rom, 0x8000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N80_3.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n80mk2srrom, 0xa000, 1);
		fio->Fclose();
	}
#else
	if(fio->Fopen(emu->bios_path(_T("PC88.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88rom, 0x8000, 1);
		fio->Fread(n80rom + 0x6000, 0x2000, 1);
		fio->Fseek(0x2000, FILEIO_SEEK_CUR);
		fio->Fread(n88exrom, 0x8000, 1);
		fio->Fseek(0x2000, FILEIO_SEEK_CUR);
		fio->Fread(n80rom, 0x6000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N88.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88rom, 0x8000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N88_0.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88exrom + 0x0000, 0x2000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N88_1.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88exrom + 0x2000, 0x2000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N88_2.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88exrom + 0x4000, 0x2000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N88_3.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n88exrom + 0x6000, 0x2000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("N80.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(n80rom, 0x8000, 1);
		fio->Fclose();
	}
#endif
	if(fio->Fopen(emu->bios_path(_T("KANJI1.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(kanji1, 0x20000, 1);
		fio->Fclose();
	}
	if(fio->Fopen(emu->bios_path(_T("KANJI2.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(kanji2, 0x20000, 1);
		fio->Fclose();
	}
#ifdef SUPPORT_PC88_DICTIONARY
	if(fio->Fopen(emu->bios_path(_T("JISYO.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(dicrom, 0x80000, 1);
		fio->Fclose();
	}
#endif
	delete fio;
	
	// memory pattern (from M88)
	for(int i = 0; i < 0x10000; i += 0x80) {
		uint8 b = ((i >> 7) ^ i) & 0x100 ? 0x00 : 0xff;
		memset(ram + i, b, 0x40);
		memset(ram + i + 0x40, ~b, 0x40);
		ram[i + 0x7f] = b;
	}
	ram[0xffff] = 0;
	
	// create semi graphics pattern
	for(int i = 0; i < 256; i++) {
		uint8 *dest = sg_pattern + 8 * i;
		dest[0] = dest[1] = ((i & 1) ? 0xf0 : 0) | ((i & 0x10) ? 0x0f : 0);
		dest[2] = dest[3] = ((i & 2) ? 0xf0 : 0) | ((i & 0x20) ? 0x0f : 0);
		dest[4] = dest[5] = ((i & 4) ? 0xf0 : 0) | ((i & 0x40) ? 0x0f : 0);
		dest[6] = dest[7] = ((i & 8) ? 0xf0 : 0) | ((i & 0x80) ? 0x0f : 0);
	}
	
	// initialize text palette
	for(int i = 0; i < 9; i++) {
		palette_text_pc[i] = RGB_COLOR((i & 2) ? 255 : 0, (i & 4) ? 255 : 0, (i & 1) ? 255 : 0);
	}
	
#ifdef SUPPORT_PC88_HIGH_CLOCK
	cpu_clock_low = config.cpu_clock_low;
#else
	cpu_clock_low = true;
#endif
	
#ifdef SUPPORT_PC88_JOYSTICK
	joystick_status = emu->joy_buffer();
	mouse_status = emu->mouse_buffer();
	mouse_strobe_clock_lim = (int)((cpu_clock_low ? 720 : 1440) * 1.25);
#endif
	
	// initialize cmt
	cmt_fio = new FILEIO();
	cmt_play = cmt_rec = false;
	
	register_frame_event(this);
	register_vline_event(this);
	register_event(this, EVENT_TIMER, 1000000 / 600, true, NULL);
}

void PC88::release()
{
	release_datarec();
	delete cmt_fio;
}

void PC88::reset()
{
	// memory
	memset(port, 0, sizeof(port));
	port[0x31] = 0x01;
	port[0x32] = 0x98;
	for(int i = 0; i < 8; i++) {
		port[0x54 + i] = i;
	}
	port[0x70] = 0x80;
	port[0x71] = port[0xf1] = 0xff;
	
	memset(alu_reg, 0, sizeof(alu_reg));
	gvram_plane = gvram_sel = 0;
	
#if defined(_PC8001SR)
	if(config.boot_mode == MODE_PC80_V2) {
		SET_BANK(0x0000, 0x7fff, wdmy, n80mk2srrom);
		port[0x33] = 0x80;
	} else {
		SET_BANK(0x0000, 0x7fff, wdmy, n80mk2rom);
	}
#else
	SET_BANK(0x0000, 0x7fff, ram, n88rom);
#endif
	SET_BANK(0x8000, 0xffff, ram + 0x8000, ram + 0x8000);
	
	// misc
	usart_dcd = false;
	opn_busy = true;
	
	// memory wait
	update_mem_wait();
	
	// crtc
	memset(&crtc, 0, sizeof(crtc));
	crtc.reset();
	
	set_frames_per_sec(60);
	set_lines_per_frame(260);
	
	for(int i = 0; i < 9; i++) {
		palette[i].b = (i & 1) ? 7 : 0;
		palette[i].r = (i & 2) ? 7 : 0;
		palette[i].g = (i & 4) ? 7 : 0;
	}
	update_palette = true;
	
	// dma
	memset(&dmac, 0, sizeof(dmac));
	dmac.ch[2].src = dmac.ch[2].dest = this;
	
	// keyboard
	key_kana = key_caps = 0;
	
	// mouse
#ifdef SUPPORT_PC88_JOYSTICK
	mouse_strobe_clock = current_clock();
	mouse_phase = -1;
	mouse_dx = mouse_dy = mouse_lx = mouse_ly = 0;
#endif
	
	// interrupt
	intr_req = intr_mask1 = intr_mask2 = 0;
	intr_req_sound = false;
	
	// fdd i/f
	d_pio->write_io8(1, 0);
	d_pio->write_io8(2, 0);
	
	// data recorder
	close_datarec();
	cmt_play = cmt_rec = false;
	cmt_register_id = -1;
}

#ifdef Z80_MEMORY_WAIT
void PC88::write_data8w(uint32 addr, uint32 data, int* wait)
{
#else
void PC88::write_data8(uint32 addr, uint32 data)
{
	int wait_tmp;
	int *wait = &wait_tmp;
#endif
	addr &= 0xffff;
	*wait = mem_wait_clocks;
	
#if defined(_PC8001SR)
	if((addr & 0xc000) == 0x8000) {
#else
	if((addr & 0xc000) == 0xc000) {
#endif
		switch(gvram_sel) {
		case 1:
			*wait = gvram_wait_clocks;
			gvram[(addr & 0x3fff) | 0x0000] = data;
			return;
		case 2:
			*wait = gvram_wait_clocks;
			gvram[(addr & 0x3fff) | 0x4000] = data;
			return;
		case 4:
			*wait = gvram_wait_clocks;
			gvram[(addr & 0x3fff) | 0x8000] = data;
			return;
		case 8:
			addr &= 0x3fff;
			switch(Port35_GDM) {
			case 0x00:
				*wait = gvram_wait_clocks + 1; // read modify write ???
				for(int i = 0; i < 3; i++) {
					switch((Port34_ALU >> i) & 0x11) {
					case 0x00:	// reset
						gvram[addr | (0x4000 * i)] &= ~data;
						break;
					case 0x01:	// set
						gvram[addr | (0x4000 * i)] |= data;
						break;
					case 0x10:	// reverse
						gvram[addr | (0x4000 * i)] ^= data;
						break;
					}
				}
				break;
			case 0x10:
				*wait = gvram_wait_clocks;
				gvram[addr | 0x0000] = alu_reg[0];
				gvram[addr | 0x4000] = alu_reg[1];
				gvram[addr | 0x8000] = alu_reg[2];
				break;
			case 0x20:
				*wait = gvram_wait_clocks;
				gvram[addr | 0x0000] = alu_reg[1];
				break;
			case 0x30:
				*wait = gvram_wait_clocks;
				gvram[addr | 0x4000] = alu_reg[0];
				break;
			}
			return;
		}
	}
#if !defined(_PC8001SR)
	else if((addr & 0xfc00) == 0x8000) {
		// text window
		if(!Port31_MMODE && !Port31_RMODE) {
			addr = (Port70_TEXTWND << 8) + (addr & 0x3ff);
		}
		ram[addr & 0xffff] = data;
		return;
	}
#endif
	wbank[addr >> 12][addr & 0xfff] = data;
}

#ifdef Z80_MEMORY_WAIT
uint32 PC88::read_data8w(uint32 addr, int* wait)
{
#else
uint32 PC88::read_data8(uint32 addr)
{
	int wait_tmp;
	int *wait = &wait_tmp;
#endif
	addr &= 0xffff;
	*wait = mem_wait_clocks;
	
#if defined(_PC8001SR)
	if((addr & 0xc000) == 0x8000) {
#else
	if((addr & 0xc000) == 0xc000) {
#endif
		uint8 b, r, g;
		switch(gvram_sel) {
		case 1:
			*wait = gvram_wait_clocks;
			return gvram[(addr & 0x3fff) | 0x0000];
		case 2:
			*wait = gvram_wait_clocks;
			return gvram[(addr & 0x3fff) | 0x4000];
		case 4:
			*wait = gvram_wait_clocks;
			return gvram[(addr & 0x3fff) | 0x8000];
		case 8:
			*wait = gvram_wait_clocks;
			addr &= 0x3fff;
			alu_reg[0] = gvram[addr | 0x0000];
			alu_reg[1] = gvram[addr | 0x4000];
			alu_reg[2] = gvram[addr | 0x8000];
			b = alu_reg[0]; if(!Port35_PLN0) b ^= 0xff;
			r = alu_reg[1]; if(!Port35_PLN1) r ^= 0xff;
			g = alu_reg[2]; if(!Port35_PLN2) g ^= 0xff;
			return b & r & g;
		}
#ifdef SUPPORT_PC88_DICTIONARY
		if(PortF1_DICROM) {
			return dicrom[(addr & 0x3fff) | (0x4000 * PortF0_DICROMSL)];
		}
#endif
	}
#if !defined(_PC8001SR)
	else if((addr & 0xfc00) == 0x8000) {
		// text window
		if(!Port31_MMODE && !Port31_RMODE) {
			addr = (Port70_TEXTWND << 8) + (addr & 0x3ff);
		}
		return ram[addr & 0xffff];
	}
#endif
	return rbank[addr >> 12][addr & 0xfff];
}

void PC88::write_io8(uint32 addr, uint32 data)
{
	addr &= 0xff;
	uint8 mod = port[addr] ^ data;
	port[addr] = data;
	
	switch(addr) {
	case 0x00:
		// load tape image ??? (from QUASI88)
		if(cmt_play) {
			while(cmt_buffer[cmt_bufptr++] != 0x3a) {
				if(!(cmt_bufptr <= cmt_bufcnt)) return;
			}
			int val, sum, ptr, len, wait;
			sum = (val = cmt_buffer[cmt_bufptr++]);
			ptr = val << 8;
			sum += (val = cmt_buffer[cmt_bufptr++]);
			ptr |= val;
			sum += (val = cmt_buffer[cmt_bufptr++]);
			if((sum & 0xff) != 0) return;
			
			while(1) {
				while(cmt_buffer[cmt_bufptr++] != 0x3a) {
					if(!(cmt_bufptr <= cmt_bufcnt)) return;
				}
				sum = (len = cmt_buffer[cmt_bufptr++]);
				if(len == 0) break;
				for(; len; len--) {
					sum += (val = cmt_buffer[cmt_bufptr++]);
					write_data8w(ptr++, val, &wait);
				}
				sum += cmt_buffer[cmt_bufptr++];
				if((sum & 0xff) != 0) return;
			}
		}
		break;
	case 0x10:
		d_rtc->write_signal(SIG_UPD1990A_C0, data, 1);
		d_rtc->write_signal(SIG_UPD1990A_C1, data, 2);
		d_rtc->write_signal(SIG_UPD1990A_C2, data, 4);
		d_rtc->write_signal(SIG_UPD1990A_DIN, data, 8);
		break;
	case 0x20:
	case 0x21:
		d_sio->write_io8(addr, data);
		break;
	case 0x30:
		if(mod & 0x08) {
			if(Port30_MTON) {
				// start motor
				if(cmt_play) {
					// detect the data carrier at the top of tape
					usart_dcd = true;
					if(cmt_register_id != -1) {
						cancel_event(cmt_register_id);
					}
					register_event(this, EVENT_CMT_DCD, 1000000, false, &cmt_register_id);
				}
			} else {
				// stop motor
				if(cmt_register_id != -1) {
					cancel_event(cmt_register_id);
					cmt_register_id = -1;
				}
				usart_dcd = false;
			}
		}
		break;
#if defined(_PC8001SR)
	case 0x31:
		if(mod & 0x03) {
			update_n80_write();
			update_n80_read();
		}
		if(mod & 0xf4) {
			palette[8].b = (data & 0x20) ? 7 : 0;
			palette[8].r = (data & 0x40) ? 7 : 0;
			palette[8].g = (data & 0x80) ? 7 : 0;
			update_palette = true;
		}
		break;
	case 0x33:
		if(mod & 0x80) {
			update_n80_read();
			update_mem_wait();
			update_gvram_wait();
			update_palette = true;
		}
		if(mod & 0xc0) {
			update_gvram_sel();
		}
		if(mod & 0x02) {
			if(intr_req_sound && !Port33_SINTM) {
				request_intr(IRQ_SOUND, true);
			}
		}
		break;
#else
	case 0x31:
		if(mod & 0x06) {
			update_low_memmap();
		}
		if(mod & 0x11) {
			if(Port31_400LINE) {
				set_frames_per_sec(55.4);
				set_lines_per_frame(448);
			} else {
				set_frames_per_sec(60);
				set_lines_per_frame(260);
			}
			update_palette = true;
		}
		break;
	case 0x32:
		if(mod & 0x03) {
			if(Port71_EROM == 0xfe) {
				update_low_memmap();
			}
		}
		if(mod & 0x10) {
			if(config.boot_mode == MODE_PC88_V1H || config.boot_mode == MODE_PC88_V2) {
				update_tvram_memmap();
			}
		}
		if(mod & 0x40) {
			update_gvram_sel();
		}
		if(mod & 0x80) {
			if(intr_req_sound && !Port32_SINTM) {
				request_intr(IRQ_SOUND, true);
			}
		}
		break;
#endif
	case 0x35:
		if(mod & 0x80) {
			update_gvram_sel();
		}
		break;
	case 0x40:
		// bit0: printer strobe
		d_rtc->write_signal(SIG_UPD1990A_STB, ~data, 2);
		d_rtc->write_signal(SIG_UPD1990A_CLK, data, 4);
		// bit3: crtc i/f sync mode
		if(mod & 0x10) {
			update_gvram_wait();
		}
		d_beep->write_signal(SIG_BEEP_ON, data, 0x20);
#ifdef SUPPORT_PC88_JOYSTICK
		if(mod & 0x40) {
			if(Port40_JOP1 && (mouse_phase == -1 || passed_clock(mouse_strobe_clock) > mouse_strobe_clock_lim)) {
				mouse_phase = 0;//mouse_dx = mouse_dy = 0;
			} else {
				mouse_phase = (mouse_phase + 1) & 3;
			}
			if(mouse_phase == 0) {
				// latch position
				mouse_lx = -((mouse_dx > 127) ? 127 : (mouse_dx < -127) ? -127 : mouse_dx);
				mouse_ly = -((mouse_dy > 127) ? 127 : (mouse_dy < -127) ? -127 : mouse_dy);
				mouse_dx = mouse_dy = 0;
			}
			mouse_strobe_clock = current_clock();
		}
#endif
		d_pcm->write_signal(SIG_PCM1BIT_SIGNAL, data, 0x80);
		break;
	case 0x44:
	case 0x45:
#ifdef HAS_YM2608
	case 0x46:
	case 0x47:
#endif
		d_opn->write_io8(addr, data);
		break;
	case 0x50:
		crtc.write_param(data);
		break;
	case 0x51:
		crtc.write_cmd(data);
		break;
#if !defined(_PC8001SR)
	case 0x52:
		palette[8].b = (data & 0x10) ? 7 : 0;
		palette[8].r = (data & 0x20) ? 7 : 0;
		palette[8].g = (data & 0x40) ? 7 : 0;
		update_palette = true;
		break;
#endif
	case 0x54:
	case 0x55:
	case 0x56:
	case 0x57:
	case 0x58:
	case 0x59:
	case 0x5a:
	case 0x5b:
#if !defined(_PC8001SR)
		if(Port32_PMODE) {
			int n = (data & 0x80) ? 8 : (addr - 0x54);
			if(data & 0x40) {
				palette[n].g = data & 7;
			} else {
				palette[n].b = data & 7;
				palette[n].r = (data >> 3) & 7;
			}
		} else {
			int n = addr - 0x54;
			palette[n].b = (data & 1) ? 7 : 0;
			palette[n].r = (data & 2) ? 7 : 0;
			palette[n].g = (data & 4) ? 7 : 0;
		}
#endif
		update_palette = true;
		break;
	case 0x5c:
		gvram_plane = 1;
		update_gvram_sel();
		break;
	case 0x5d:
		gvram_plane = 2;
		update_gvram_sel();
		break;
	case 0x5e:
		gvram_plane = 4;
		update_gvram_sel();
		break;
	case 0x5f:
		gvram_plane = 0;
		update_gvram_sel();
		break;
	case 0x60:
	case 0x61:
	case 0x62:
	case 0x63:
	case 0x64:
	case 0x65:
	case 0x66:
	case 0x67:
	case 0x68:
		dmac.write_io8(addr, data);
		break;
#if defined(_PC8001SR)
	case 0x71:
		if((mod & 1) && Port33_N80SR) {
			update_n80_read();
		}
		break;
	case 0xe2:
		if(mod & 0x01) {
			update_n80_read();
		}
		if(mod & 0x10) {
			update_n80_write();
		}
		break;
	case 0xe3:
		if(mod) {
			update_n80_write();
			update_n80_read();
		}
		break;
#else
	case 0x71:
		if(mod) {
			update_low_memmap();
		}
		break;
	case 0x78:
		Port70_TEXTWND++;
		break;
	case 0xe2:
		if(mod & 0x11) {
			update_low_memmap();
		}
		break;
	case 0xe3:
		if(mod) {
			update_low_memmap();
		}
		break;
#endif
	case 0xe4:
		intr_mask1 = ~(0xff << (data < 8 ? data : 8));
		update_intr();
		break;
	case 0xe6:
		intr_mask2 = intr_mask2_table[data & 7];
		intr_req &= intr_mask2;
		update_intr();
		break;
	case 0xfc:
		d_pio->write_io8(0, data);
		break;
	case 0xfd:
	case 0xfe:
	case 0xff:
		d_pio->write_io8(addr, data);
		break;
	}
}

uint32 PC88::read_io8(uint32 addr)
{
	uint32 val = 0xff;
	
	addr &= 0xff;
	switch(addr) {
	case 0x00:
	case 0x01:
	case 0x02:
	case 0x03:
	case 0x04:
	case 0x05:
	case 0x06:
	case 0x07:
	case 0x08:
	case 0x09:
	case 0x0a:
	case 0x0b:
	case 0x0c:
	case 0x0d:
	case 0x0e:
		for(int i = 0; i < 8; i++) {
			if(key_status[key_table[addr & 0x0f][i]]) {
				val &= ~(1 << i);
			}
		}
		if(addr == 0x0e) {
			val &= ~0x80; // http://www.maroon.dti.ne.jp/youkan/pc88/iomap.html
		}
		return val;
	case 0x20:
	case 0x21:
		return d_sio->read_io8(addr);
#if defined(_PC8001SR)
	case 0x30:
		return (config.boot_mode == MODE_PC80_N ? 0 : 1) | (config.boot_mode == MODE_PC80_V2 ? 0 : 2) | 0xfc;
	case 0x31:
		return (config.boot_mode == MODE_PC80_V2 ? 0 : 0x80) | 0x39;
	case 0x33:
		return port[0x33];
#else
	case 0x30:
		return (config.boot_mode == MODE_PC88_N ? 0 : 1) | 0xc2;
	case 0x31:
		return (config.boot_mode == MODE_PC88_V2 ? 0 : 0x80) | (config.boot_mode == MODE_PC88_V1S || config.boot_mode == MODE_PC88_N ? 0 : 0x40);
	case 0x32:
		return port[0x32];
#endif
	case 0x40:
		return (crtc.vblank ? 0x20 : 0) | (d_rtc->read_signal(0) ? 0x10 : 0) | (usart_dcd ? 4 : 0) | 0xc0;
	case 0x44:
		val = d_opn->read_io8(addr);
		if(opn_busy) {
			// show busy flag for first access (for ALPHA)
			val |= 0x80;
			opn_busy = false;
		}
		return val;
	case 0x45:
		if(Port44_OPNCH == 14) {
#ifdef SUPPORT_PC88_JOYSTICK
			if(config.device_type == DEVICE_JOYSTICK) {
				return (~(joystick_status[0] >> 0) & 0x0f) | 0xf0;
			} else if(config.device_type == DEVICE_MOUSE) {
				switch(mouse_phase) {
				case 0:
					return ((mouse_lx >> 4) & 0x0f) | 0xf0;
				case 1:
					return ((mouse_lx >> 0) & 0x0f) | 0xf0;
				case 2:
					return ((mouse_ly >> 4) & 0x0f) | 0xf0;
				case 3:
					return ((mouse_ly >> 0) & 0x0f) | 0xf0;
				}
				return 0xf0; // ???
			}
#endif
			return 0xff;
		} else if(Port44_OPNCH == 15) {
#ifdef SUPPORT_PC88_JOYSTICK
			if(config.device_type == DEVICE_JOYSTICK) {
				return (~(joystick_status[0] >> 4) & 0x03) | 0xfc;
			} else if(config.device_type == DEVICE_MOUSE) {
				return (~mouse_status[2] & 0x03) | 0xfc;
			}
#endif
			return 0xff;
		}
#ifdef HAS_YM2608
	case 0x46:
	case 0x47:
#endif
		return d_opn->read_io8(addr);
	case 0x50:
		return crtc.read_status();
	case 0x51:
		return 0xff;
	case 0x5c:
		return gvram_plane | 0xf8;
	case 0x68:
		return dmac.read_io8(addr);
	case 0x6e:
		return (cpu_clock_low ? 0x80 : 0) | 0x7f;
	case 0x70:
		return port[0x70];
	case 0x71:
		return port[0x71];
	case 0xe2:
		return (~port[0xe2]) | 0xee;
	case 0xe3:
		return port[0xe3];
	case 0xe8:
		return kanji1[PortE8E9_KANJI1 * 2 + 1];
	case 0xe9:
		return kanji1[PortE8E9_KANJI1 * 2];
	case 0xec:
		return kanji2[PortECED_KANJI2 * 2 + 1];
	case 0xed:
		return kanji2[PortECED_KANJI2 * 2];
	case 0xfc:
	case 0xfd:
	case 0xfe:
		return d_pio->read_io8(addr);
	}
	return 0xff;
}

uint32 PC88::read_dma_data8(uint32 addr)
{
#if defined(_PC8001SR)
	return ram[addr & 0xffff];
#else
	if((addr & 0xf000) == 0xf000 && (config.boot_mode == MODE_PC88_V1H || config.boot_mode == MODE_PC88_V2)) {
		return tvram[addr & 0xfff];
	} else {
		return ram[addr & 0xffff];
	}
#endif
}

void PC88::write_dma_io8(uint32 addr, uint32 data)
{
	// to crtc
	crtc.write_buffer(data);
}

void PC88::update_mem_wait()
{
#if defined(_PC8001SR)
	if(config.boot_mode == MODE_PC80_V1 || config.boot_mode == MODE_PC80_N) {
#else
	if(config.boot_mode == MODE_PC88_V1S || config.boot_mode == MODE_PC88_N) {
#endif
		mem_wait_clocks = 1;
	} else {
		mem_wait_clocks = cpu_clock_low ? 0 : 1;
	}
}

void PC88::update_gvram_wait()
{
#if defined(_PC8001SR)
	if(config.boot_mode == MODE_PC80_V1 || config.boot_mode == MODE_PC80_N) {
#else
	if(config.boot_mode == MODE_PC88_V1S || config.boot_mode == MODE_PC88_N) {
#endif
		static const int wait[8] = {30, 3, 4, 3, 72, 7, 8, 4};
		gvram_wait_clocks = wait[(crtc.vblank ? 1 : 0) | (Port40_GHSM ? 2 : 0) | (cpu_clock_low ? 0 : 4)];
	} else {
		gvram_wait_clocks  = cpu_clock_low ? 1 : 2;
		if(!crtc.vblank) {
			gvram_wait_clocks *= 2;
		}
	}
}

void PC88::update_gvram_sel()
{
#if defined(_PC8001SR)
	if(Port33_GVAM) {
#else
	if(Port32_GVAM) {
#endif
		if(Port35_GAM) {
			gvram_sel = 8;
		} else {
			gvram_sel = 0;
		}
		gvram_plane = 0; // from M88
	} else {
		gvram_sel = gvram_plane;
	}
}

#if defined(_PC8001SR)
void PC88::update_n80_write()
{
	if(PortE2_WREN || Port31_MMODE) {
		if(PortE3_ERAMSL < PC88_EXRAM_BANKS) {
			SET_BANK_W(0x0000, 0x7fff, exram + 0x8000 * PortE3_ERAMSL);
		} else {
			SET_BANK_W(0x0000, 0x7fff, wdmy);
		}
	} else {
		SET_BANK_W(0x0000, 0x7fff, wdmy);
	}
}

void PC88::update_n80_read()
{
	if(PortE2_RDEN || Port31_MMODE) {
		if(PortE3_ERAMSL < PC88_EXRAM_BANKS) {
			SET_BANK_R(0x0000, 0x7fff, exram + 0x8000 * PortE3_ERAMSL);
		} else {
			SET_BANK_R(0x0000, 0x7fff, rdmy);
		}
	} else if(Port33_N80SR) {
		if(port[0x71] & 1) {
			SET_BANK_R(0x0000, 0x7fff, n80mk2srrom);
		} else {
			SET_BANK_R(0x0000, 0x5fff, n80mk2srrom);
			SET_BANK_R(0x6000, 0x7fff, n80mk2srrom + 0x8000);
		}
	} else {
		if(port[0x31] & 1) {
			SET_BANK_R(0x0000, 0x7fff, n80mk2rom);
		} else {
			SET_BANK_R(0x0000, 0x5fff, n80mk2rom);
			SET_BANK_R(0x6000, 0x7fff, rdmy);
		}
	}
}
#else
void PC88::update_low_memmap()
{
	// read
	if(PortE2_RDEN) {
#ifdef PC88_EXRAM_BANKS
		if(PortE3_ERAMSL < PC88_EXRAM_BANKS) {
			SET_BANK_R(0x0000, 0x7fff, exram + 0x8000 * PortE3_ERAMSL);
		} else {
#endif
			SET_BANK_R(0x0000, 0x7fff, rdmy);
#ifdef PC88_EXRAM_BANKS
		}
#endif
	} else if(Port31_MMODE) {
		// 64K RAM
		SET_BANK_R(0x0000, 0x7fff, ram);
	} else if(Port31_RMODE) {
		// N-BASIC
		SET_BANK_R(0x0000, 0x7fff, n80rom);
	} else {
		// N-88BASIC
		SET_BANK_R(0x0000, 0x5fff, n88rom);
		if(Port71_EROM == 0xff) {
			SET_BANK_R(0x6000, 0x7fff, n88rom + 0x6000);
		} else if(Port71_EROM == 0xfe) {
			SET_BANK_R(0x6000, 0x7fff, n88exrom + 0x2000 * Port32_EROMSL);
		} else {
			SET_BANK_R(0x6000, 0x7fff, rdmy);
		}
	}
	
	// write
	if(PortE2_WREN) {
#ifdef PC88_EXRAM_BANKS
		if(PortE3_ERAMSL < PC88_EXRAM_BANKS) {
			SET_BANK_W(0x0000, 0x7fff, exram + 0x8000 * PortE3_ERAMSL);
		} else {
#endif
			SET_BANK_W(0x0000, 0x7fff, wdmy);
#ifdef PC88_EXRAM_BANKS
		}
#endif
	} else {
		SET_BANK_W(0x0000, 0x7fff, ram);
	}
}

void PC88::update_tvram_memmap()
{
	if(Port32_TMODE) {
		SET_BANK(0xf000, 0xffff, ram + 0xf000, ram + 0xf000);
	} else {
		SET_BANK(0xf000, 0xffff, tvram, tvram);
	}
}
#endif

void PC88::write_signal(int id, uint32 data, uint32 mask)
{
	if(id == SIG_PC88_USART_IRQ) {
		request_intr(IRQ_USART, ((data & mask) != 0));
	} else if(id == SIG_PC88_SOUND_IRQ) {
		intr_req_sound = ((data & mask) != 0);
#if defined(_PC8001SR)
		if(intr_req_sound && !Port33_SINTM) {
#else
		if(intr_req_sound && !Port32_SINTM) {
#endif
			request_intr(IRQ_SOUND, true);
		}
	} else if(id == SIG_PC88_USART_OUT) {
		if(cmt_rec && Port30_MTON) {
			// recv from sio
			cmt_buffer[cmt_bufptr++] = data & mask;
			if(cmt_bufptr >= DATAREC_BUFFER_SIZE) {
				cmt_fio->Fwrite(cmt_buffer, cmt_bufptr, 1);
				cmt_bufptr = 0;
			}
		}
	}
}

void PC88::event_callback(int event_id, int err)
{
	switch(event_id) {
	case EVENT_TIMER:
		request_intr(IRQ_TIMER, true);
		break;
	case EVENT_BUSREQ:
		d_cpu->write_signal(SIG_CPU_BUSREQ, 0, 0);
		break;
	case EVENT_CMT_SEND:
		// check data carrier
		if(cmt_play && cmt_bufptr < cmt_bufcnt && Port30_MTON) {
			// detect the data carrier at the top of next block
			if(check_data_carrier(&cmt_buffer[cmt_bufptr])) {
//				usart_dcd = true;
				register_event(this, EVENT_CMT_DCD, 1000000, false, &cmt_register_id);
				break;
			}
		}
	case EVENT_CMT_DCD:
		// send data to sio
//		usart_dcd = false;
		d_sio->write_signal(SIG_I8251_RECV, cmt_buffer[cmt_bufptr++], 0xff);
		if(cmt_bufptr < cmt_bufcnt) {
			register_event(this, EVENT_CMT_SEND, 5000, false, &cmt_register_id);
			break;
		}
		cmt_register_id = -1;
		break;
	}
}

void PC88::event_frame()
{
	// update key status
	memcpy(key_status, emu->key_buffer(), sizeof(key_status));
	
	for(int i = 0; i < 6; i++) {
		// INS or F6-F10 -> SHIFT + DEL or F1-F5
		if(key_status[key_conv_table[i][0]]) {
			key_status[key_conv_table[i][1]] = 1;
			key_status[0x10] = 1;
		}
	}
	if(key_status[0x11] && (key_status[0xbc] || key_status[0xbe])) {
		// CTRL + "," or "." -> NumPad "," or "."
		key_status[0x6c] = key_status[0xbc];
		key_status[0x6e] = key_status[0xbe];
		key_status[0x11] = key_status[0xbc] = key_status[0xbe] = 0;
	}
	key_status[0x14] = key_caps;
	key_status[0x15] = key_kana;
	
	crtc.update_blink();
	
#ifdef SUPPORT_PC88_JOYSTICK
	mouse_dx += mouse_status[0];
	mouse_dy += mouse_status[1];
#endif
}

void PC88::event_vline(int v, int clock)
{
#if defined(_PC8001SR)
	int disp_line = 200;
#else
	int disp_line = Port31_400LINE ? 400 : 200;
#endif
	
	if(v == 0) {
		if(crtc.status & 0x10) {
			// start dma transfer to crtc
			dmac.start(2);
			
			// dma wait cycles
			busreq_clocks = (int)((double)(dmac.ch[2].length.sd + 1) * (cpu_clock_low ? 7.0 : 16.0) / (double)disp_line + 0.5);
		}
		crtc.clear_buffer();
		crtc.vblank = false;
		request_intr(IRQ_VRTC, false);
		update_gvram_wait();
	}
	if(v < disp_line) {
		if(/*(crtc.status & 0x10) && */dmac.ch[2].running) {
			// bus request
#if defined(_PC8001SR)
			if(config.boot_mode == MODE_PC80_V1 || config.boot_mode == MODE_PC80_N) {
#else
			if(config.boot_mode == MODE_PC88_V1S || config.boot_mode == MODE_PC88_N) {
#endif
				d_cpu->write_signal(SIG_CPU_BUSREQ, 1, 1);
				register_event_by_clock(this, EVENT_BUSREQ, busreq_clocks, false, NULL);
			}
		}
	} else if(v == disp_line) {
		if(/*(crtc.status & 0x10) && */dmac.ch[2].running) {
			// run dma transfer to crtc
			dmac.finish(2);
		}
		crtc.vblank = true;
		request_intr(IRQ_VRTC, true);
		update_gvram_wait();
	}
}

void PC88::key_down(int code, bool repeat)
{
	if(!repeat) {
		if(code == 0x14) {
			key_caps ^= 1;
		} else if(code == 0x15) {
			key_kana ^= 1;
		}
	}
}

void PC88::play_datarec(_TCHAR* file_path)
{
	close_datarec();
	
	if(cmt_fio->Fopen(file_path, FILEIO_READ_BINARY)) {
		if(check_file_extension(file_path, _T(".n80"))) {
			cmt_fio->Fread(ram + 0x8000, 0x7f40, 1);
			cmt_fio->Fclose();
			d_cpu->set_sp(ram[0xff3e] | (ram[0xff3f] << 8));
			d_cpu->set_pc(0xff3d);
			return;
		}
		
		cmt_fio->Fseek(0, FILEIO_SEEK_END);
		cmt_bufcnt = cmt_fio->Ftell();
		cmt_bufptr = 0;
		cmt_fio->Fseek(0, FILEIO_SEEK_SET);
		memset(cmt_buffer, 0, sizeof(cmt_buffer));
		cmt_fio->Fread(cmt_buffer, sizeof(cmt_buffer), 1);
		
		if(strncmp((char *)cmt_buffer, "PC-8801 Tape Image(T88)", 23) == 0) {
			// this is t88 format
			int ptr = 24, tag = -1, len = 0;
			while(!(tag == 0 && len == 0)) {
				tag = cmt_buffer[ptr + 0] | (cmt_buffer[ptr + 1] << 8);
				len = cmt_buffer[ptr + 2] | (cmt_buffer[ptr + 3] << 8);
				ptr += 4;
				
				if(tag == 0x0101) {
					// data tag
					for(int i = 12; i < len; i++) {
						cmt_buffer[cmt_bufptr++] = cmt_buffer[ptr + i];
					}
				} else if(tag == 0x0102 || tag == 0x0103) {
					// data carrier
				}
				ptr += len;
			}
			cmt_bufcnt = cmt_bufptr;
			cmt_bufptr = 0;
		}
		cmt_play = (cmt_bufcnt != 0);
		
		if(cmt_play && Port30_MTON) {
			// start motor and detect the data carrier at the top of tape
			usart_dcd = true;
			if(cmt_register_id != -1) {
				cancel_event(cmt_register_id);
			}
			register_event(this, EVENT_CMT_DCD, 1000000, false, &cmt_register_id);
		}
	}
}

void PC88::rec_datarec(_TCHAR* file_path)
{
	close_datarec();
	
	if(cmt_fio->Fopen(file_path, FILEIO_WRITE_BINARY)) {
		cmt_bufptr = 0;
		cmt_rec = true;
	}
}

void PC88::close_datarec()
{
	// close file
	release_datarec();
	
	// clear sio buffer
	d_sio->write_signal(SIG_I8251_CLEAR, 0, 0);
}

void PC88::release_datarec()
{
	// close file
	if(cmt_rec && cmt_bufptr) {
		cmt_fio->Fwrite(cmt_buffer, cmt_bufptr, 1);
	}
	if(cmt_play || cmt_rec) {
		cmt_fio->Fclose();
	}
	cmt_play = cmt_rec = false;
}

bool PC88::now_skip()
{
	return (cmt_play && cmt_bufptr < cmt_bufcnt && Port30_MTON);
}

bool PC88::check_data_carrier(uint8 *p)
{
	if(p[0] == 0xd3) {
		for(int i = 1; i < 10; i++) {
			if(p[i] != p[0]) {
				return false;
			}
		}
		return true;
	} else if(p[0] == 0x9c) {
		for(int i = 1; i < 6; i++) {
			if(p[i] != p[0]) {
				return false;
			}
		}
		return true;
	}
	return false;
}

void PC88::draw_screen()
{
	// render text screen
#if defined(_PC8001SR)
	crtc.expand_attribs(false);
#else
	crtc.expand_attribs(Port31_400LINE);
#endif
	draw_text();
	
	// render graph screen
	scrntype *palette_pc = palette_graph_pc;
#if defined(_PC8001SR)
	if(config.boot_mode != MODE_PC80_V2) {
		if(Port31_320x200) {
			draw_320x200_4color_graph();
		} else if(Port31_COLOR) {
			draw_640x200_mono_graph();
		} else {
			draw_640x200_attrib_graph();
			palette_pc = palette_text_pc;
		}
	} else {
		if(Port31_COLOR) {
			if(Port31_320x200) {
				draw_320x200_color_graph();
			} else {
				draw_640x200_color_graph();
			}
		} else {
			if(Port31_320x200) {
				draw_320x200_attrib_graph();
			} else {
				draw_640x200_attrib_graph();
			}
			palette_pc = palette_text_pc;
		}
	}
#else
	if(Port31_HCOLOR) {
		draw_640x200_color_graph();
	} else if(!Port31_400LINE) {
		draw_640x200_mono_graph();
	} else {
		draw_640x400_attrib_graph();
		palette_pc = palette_text_pc;
	}
#endif
	
	// update palette
	if(update_palette) {
		static const int pex[8] = {
			0,  36,  73, 109, 146, 182, 219, 255 // from m88
		};
#if defined(_PC8001SR)
		if(config.boot_mode != MODE_PC80_V2) {
			if(Port31_320x200) {
				for(int i = 0; i < 3; i++) {
					uint8 b = (port[0x31] & 4) ? 7 : 0;
					uint8 r = (i          & 1) ? 7 : 0;
					uint8 g = (i          & 2) ? 7 : 0;
					palette_graph_pc[i] = RGB_COLOR(pex[r], pex[g], pex[b]);
				}
				palette_graph_pc[3] = RGB_COLOR(pex[palette[8].r], pex[palette[8].g], pex[palette[8].b]);
			} else if(Port31_COLOR) {
				palette_graph_pc[0] = 0;
				palette_graph_pc[1] = RGB_COLOR(pex[palette[8].r], pex[palette[8].g], pex[palette[8].b]);
			}
		} else {
			if(Port31_COLOR) {
				for(int i = 0; i < 8; i++) {
					uint8 b = (port[0x54 + i] & 1) ? 7 : 0;
					uint8 r = (port[0x54 + i] & 2) ? 7 : 0;
					uint8 g = (port[0x54 + i] & 4) ? 7 : 0;
					palette_graph_pc[i] = RGB_COLOR(pex[r], pex[g], pex[b]);
				}
			}
		}
#else
		if(Port31_HCOLOR) {
			for(int i = 0; i < 8; i++) {
				palette_graph_pc[i] = RGB_COLOR(pex[palette[i].r], pex[palette[i].g], pex[palette[i].b]);
			}
		} else if(!Port31_400LINE) {
			palette_graph_pc[0] = RGB_COLOR(pex[palette[8].r], pex[palette[8].g], pex[palette[8].b]);
			palette_graph_pc[1] = RGB(255, 255, 255);
		}
#endif
		// back color for attrib mode
		palette_text_pc[0] = RGB_COLOR(pex[palette[8].r], pex[palette[8].g], pex[palette[8].b]);
		update_palette = false;
	}
	
	// copy to screen buffer
#if !defined(_PC8001SR)
	if(!Port31_400LINE) {
#endif
		for(int y = 0; y < 200; y++) {
			scrntype* dest0 = emu->screen_buffer(y * 2);
			scrntype* dest1 = emu->screen_buffer(y * 2 + 1);
			uint8* src_t = text[y];
			uint8* src_g = graph[y];
			
#if defined(_PC8001SR)
			if(port[0x33] & 8) {
				for(int x = 0; x < 640; x++) {
					uint32 g = src_g[x];
					dest0[x] = g ? palette_pc[g] : palette_text_pc[src_t[x]];
				}
			} else {
#endif
				for(int x = 0; x < 640; x++) {
					uint32 t = src_t[x];
					dest0[x] = t ? palette_text_pc[t] : palette_pc[src_g[x]];
				}
#if defined(_PC8001SR)
			}
#endif
			if(config.scan_line) {
				memset(dest1, 0, 640 * sizeof(scrntype));
			} else {
				for(int x = 0; x < 640; x++) {
					dest1[x] = dest0[x];
				}
			}
		}
#if !defined(_PC8001SR)
	} else {
		for(int y = 0; y < 400; y++) {
			scrntype* dest = emu->screen_buffer(y);
			uint8* src_t = text[y >> 1];
			uint8* src_g = graph[y];
			
			for(int x = 0; x < 640; x++) {
				uint32 t = src_t[x];
				dest[x] = t ? palette_text_pc[t] : palette_pc[src_g[x]];
			}
		}
	}
#endif
}

/*
	attributes:
	
	bit7: green
	bit6: red
	bit5: blue
	bit4: graph=1/character=0
	bit3: under line
	bit2: upper line
	bit1: secret
	bit0: reverse
*/

void PC88::draw_text()
{
	if(!(crtc.status & 0x10) || Port53_TEXTDS) {
		memset(text, 0, sizeof(text));
		return;
	}
	crtc.status &= ~8; // clear dma underrun
	
	int char_height = crtc.char_height;
	uint8 color_mask = Port30_COLOR ? 0 : 7;
	
#if !defined(_PC8001SR)
	if(Port31_400LINE || !crtc.skip_line) {
		char_height >>= 1;
	}
#endif
	
	for(int cy = 0, ytop = 0, ofs = 0; cy < crtc.height && ytop < 200; cy++, ytop += char_height, ofs += 80 + crtc.attrib.num * 2) {
		for(int x = 0, cx = 0; cx < crtc.width && cx < 80; x += 8, cx++) {
			if(Port30_40 && (cx & 1)) {
				continue;
			}
			uint8 attrib = crtc.attrib.expand[cy][cx];
			uint8 color = (attrib & 0xe0) ? ((attrib >> 5) | color_mask) : 8;
			bool under_line = ((attrib & 8) != 0);
			bool upper_line = ((attrib & 4) != 0);
			bool secret = ((attrib & 2) != 0);
			bool reverse = ((attrib & 1) != 0);
			
			uint8 code = secret ? 0 : crtc.read_buffer(ofs + cx);
			uint8 *pattern = ((attrib & 0x10) ? sg_pattern : kanji1 + 0x1000) + code * 8;
			
			for(int l = 0, y = ytop; l < char_height && y < 200; l++, y++) {
				uint8 pat = (l < 8) ? pattern[l] : 0;
				if((upper_line && l == 0) || (under_line && l >= 7)) {
					pat = 0xff;
				}
				if(reverse) {
					pat = ~pat;
				}
				
				uint8 *dest = &text[y][x];
				if(Port30_40) {
					dest[ 0] = dest[ 1] = (pat & 0x80) ? color : 0;
					dest[ 2] = dest[ 3] = (pat & 0x40) ? color : 0;
					dest[ 4] = dest[ 5] = (pat & 0x20) ? color : 0;
					dest[ 6] = dest[ 7] = (pat & 0x10) ? color : 0;
					dest[ 8] = dest[ 9] = (pat & 0x08) ? color : 0;
					dest[10] = dest[11] = (pat & 0x04) ? color : 0;
					dest[12] = dest[13] = (pat & 0x02) ? color : 0;
					dest[14] = dest[15] = (pat & 0x01) ? color : 0;
				} else {
					dest[0] = (pat & 0x80) ? color : 0;
					dest[1] = (pat & 0x40) ? color : 0;
					dest[2] = (pat & 0x20) ? color : 0;
					dest[3] = (pat & 0x10) ? color : 0;
					dest[4] = (pat & 0x08) ? color : 0;
					dest[5] = (pat & 0x04) ? color : 0;
					dest[6] = (pat & 0x02) ? color : 0;
					dest[7] = (pat & 0x01) ? color : 0;
				}
			}
		}
		if(crtc.status & 8) {
			// dma underrun occurs !!!
			memset(text, 0, sizeof(text));
			break;
		}
	}
}

void PC88::draw_320x200_color_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS && Port53_G2DS && Port53_G3DS && Port53_G4DS && Port53_G5DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b0 = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r0 = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	uint8 *gvram_g0 = Port53_G2DS ? gvram_null : (gvram + 0x8000);
	uint8 *gvram_b1 = Port53_G3DS ? gvram_null : (gvram + 0x2000);
	uint8 *gvram_r1 = Port53_G4DS ? gvram_null : (gvram + 0x6000);
	uint8 *gvram_g1 = Port53_G5DS ? gvram_null : (gvram + 0xa000);
	
	if(port[0x33] & 4) {
		// G1>G0
		uint8 *tmp;
		tmp = gvram_b0; gvram_b0 = gvram_b1; gvram_b1 = tmp;
		tmp = gvram_r0; gvram_r0 = gvram_r1; gvram_r1 = tmp;
		tmp = gvram_g0; gvram_g0 = gvram_g1; gvram_g1 = tmp;
	}
	
	for(int y = 0, addr = 0; y < 200; y++) {
		for(int x = 0; x < 640; x += 16) {
			uint8 b0 = gvram_b0[addr];
			uint8 r0 = gvram_r0[addr];
			uint8 g0 = gvram_g0[addr];
			uint8 b1 = gvram_b1[addr];
			uint8 r1 = gvram_r1[addr];
			uint8 g1 = gvram_g1[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			uint8 brg0, brg1;
			brg0 = ((b0 & 0x80) >> 7) | ((r0 & 0x80) >> 6) | ((g0 & 0x80) >> 5);
			brg1 = ((b1 & 0x80) >> 7) | ((r1 & 0x80) >> 6) | ((g1 & 0x80) >> 5);
			dest[ 0] = dest[ 1] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x40) >> 6) | ((r0 & 0x40) >> 5) | ((g0 & 0x40) >> 4);
			brg1 = ((b1 & 0x40) >> 6) | ((r1 & 0x40) >> 5) | ((g1 & 0x40) >> 4);
			dest[ 2] = dest[ 3] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x20) >> 5) | ((r0 & 0x20) >> 4) | ((g0 & 0x20) >> 3);
			brg1 = ((b1 & 0x20) >> 5) | ((r1 & 0x20) >> 4) | ((g1 & 0x20) >> 3);
			dest[ 4] = dest[ 5] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x10) >> 4) | ((r0 & 0x10) >> 3) | ((g0 & 0x10) >> 2);
			brg1 = ((b1 & 0x10) >> 4) | ((r1 & 0x10) >> 3) | ((g1 & 0x10) >> 2);
			dest[ 6] = dest[ 7] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x08) >> 3) | ((r0 & 0x08) >> 2) | ((g0 & 0x08) >> 1);
			brg1 = ((b1 & 0x08) >> 3) | ((r1 & 0x08) >> 2) | ((g1 & 0x08) >> 1);
			dest[ 8] = dest[ 9] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x04) >> 2) | ((r0 & 0x04) >> 1) | ((g0 & 0x04)     );
			brg1 = ((b1 & 0x04) >> 2) | ((r1 & 0x04) >> 1) | ((g1 & 0x04)     );
			dest[10] = dest[11] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x02) >> 1) | ((r0 & 0x02)     ) | ((g0 & 0x02) << 1);
			brg1 = ((b1 & 0x02) >> 1) | ((r1 & 0x02)     ) | ((g1 & 0x02) << 1);
			dest[12] = dest[13] = brg0 ? brg0 : brg1;
			brg0 = ((b0 & 0x01)     ) | ((r0 & 0x01) << 1) | ((g0 & 0x01) << 2);
			brg1 = ((b1 & 0x01)     ) | ((r1 & 0x01) << 1) | ((g1 & 0x01) << 2);
			dest[14] = dest[15] = brg0 ? brg0 : brg1;
		}
	}
}

void PC88::draw_320x200_4color_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS && Port53_G2DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	uint8 *gvram_g = Port53_G2DS ? gvram_null : (gvram + 0x8000);
	
	for(int y = 0, addr = 0; y < 200; y++) {
		for(int x = 0; x < 640; x += 8) {
			uint8 brg = gvram_b[addr] | gvram_r[addr] | gvram_g[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = dest[1] = (brg >> 6) & 3;
			dest[2] = dest[3] = (brg >> 4) & 3;
			dest[4] = dest[5] = (brg >> 2) & 3;
			dest[6] = dest[7] = (brg     ) & 3;
		}
	}
}

void PC88::draw_320x200_attrib_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS && Port53_G2DS && Port53_G3DS && Port53_G4DS && Port53_G5DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b0 = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r0 = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	uint8 *gvram_g0 = Port53_G2DS ? gvram_null : (gvram + 0x8000);
	uint8 *gvram_b1 = Port53_G3DS ? gvram_null : (gvram + 0x2000);
	uint8 *gvram_r1 = Port53_G4DS ? gvram_null : (gvram + 0x6000);
	uint8 *gvram_g1 = Port53_G5DS ? gvram_null : (gvram + 0xa000);
	
	int char_height = crtc.char_height ? crtc.char_height : 8;
	int shift = Port30_40 ? 1 : 0;
	uint8 color_mask = Port30_COLOR ? 0 : 7;
	
	for(int y = 0, addr = 0; y < 200; y++) {
		int cy = y / char_height;
		for(int x = 0, cx = 0; x < 640; x += 16, cx++) {
			uint8 a = crtc.attrib.expand[cy][cx >> shift];
			uint8 c = (a & 0xe0) ? ((a >> 5) | color_mask) : 8;
			uint8 brg = gvram_b0[addr] | gvram_r0[addr] | gvram_g0[addr] |
			            gvram_b1[addr] | gvram_r1[addr] | gvram_g1[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[ 0] = dest[ 1] = (brg & 0x80) ? c : 0;
			dest[ 2] = dest[ 3] = (brg & 0x40) ? c : 0;
			dest[ 4] = dest[ 5] = (brg & 0x20) ? c : 0;
			dest[ 6] = dest[ 7] = (brg & 0x10) ? c : 0;
			dest[ 8] = dest[ 9] = (brg & 0x08) ? c : 0;
			dest[10] = dest[11] = (brg & 0x04) ? c : 0;
			dest[12] = dest[13] = (brg & 0x02) ? c : 0;
			dest[14] = dest[15] = (brg & 0x01) ? c : 0;
		}
	}
}

void PC88::draw_640x200_color_graph()
{
	if(!Port31_GRAPH/* || (Port53_G0DS && Port53_G1DS && Port53_G2DS)*/) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b = /*Port53_G0DS ? gvram_null : */(gvram + 0x0000);
	uint8 *gvram_r = /*Port53_G1DS ? gvram_null : */(gvram + 0x4000);
	uint8 *gvram_g = /*Port53_G2DS ? gvram_null : */(gvram + 0x8000);
	
	for(int y = 0, addr = 0; y < 200; y++) {
		for(int x = 0; x < 640; x += 8) {
			uint8 b = gvram_b[addr];
			uint8 r = gvram_r[addr];
			uint8 g = gvram_g[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = ((b & 0x80) >> 7) | ((r & 0x80) >> 6) | ((g & 0x80) >> 5);
			dest[1] = ((b & 0x40) >> 6) | ((r & 0x40) >> 5) | ((g & 0x40) >> 4);
			dest[2] = ((b & 0x20) >> 5) | ((r & 0x20) >> 4) | ((g & 0x20) >> 3);
			dest[3] = ((b & 0x10) >> 4) | ((r & 0x10) >> 3) | ((g & 0x10) >> 2);
			dest[4] = ((b & 0x08) >> 3) | ((r & 0x08) >> 2) | ((g & 0x08) >> 1);
			dest[5] = ((b & 0x04) >> 2) | ((r & 0x04) >> 1) | ((g & 0x04)     );
			dest[6] = ((b & 0x02) >> 1) | ((r & 0x02)     ) | ((g & 0x02) << 1);
			dest[7] = ((b & 0x01)     ) | ((r & 0x01) << 1) | ((g & 0x01) << 2);
		}
	}
}

void PC88::draw_640x200_mono_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS && Port53_G2DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	uint8 *gvram_g = Port53_G2DS ? gvram_null : (gvram + 0x8000);
	
	for(int y = 0, addr = 0; y < 200; y++) {
		for(int x = 0; x < 640; x += 8) {
			uint8 brg = gvram_b[addr] | gvram_r[addr] | gvram_g[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = (brg & 0x80) >> 7;
			dest[1] = (brg & 0x40) >> 6;
			dest[2] = (brg & 0x20) >> 5;
			dest[3] = (brg & 0x10) >> 4;
			dest[4] = (brg & 0x08) >> 3;
			dest[5] = (brg & 0x04) >> 2;
			dest[6] = (brg & 0x02) >> 1;
			dest[7] = (brg & 0x01)     ;
		}
	}
}

void PC88::draw_640x200_attrib_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS && Port53_G2DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	uint8 *gvram_g = Port53_G2DS ? gvram_null : (gvram + 0x8000);
	
	int char_height = crtc.char_height ? crtc.char_height : 8;
	int shift = Port30_40 ? 1 : 0;
	uint8 color_mask = Port30_COLOR ? 0 : 7;
	
	for(int y = 0, addr = 0; y < 200; y++) {
		int cy = y / char_height;
		for(int x = 0, cx = 0; x < 640; x += 8, cx++) {
			uint8 a = crtc.attrib.expand[cy][cx >> shift];
			uint8 c = (a & 0xe0) ? ((a >> 5) | color_mask) : 8;
			uint8 brg = gvram_b[addr] | gvram_r[addr] | gvram_g[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = (brg & 0x80) ? c : 0;
			dest[1] = (brg & 0x40) ? c : 0;
			dest[2] = (brg & 0x20) ? c : 0;
			dest[3] = (brg & 0x10) ? c : 0;
			dest[4] = (brg & 0x08) ? c : 0;
			dest[5] = (brg & 0x04) ? c : 0;
			dest[6] = (brg & 0x02) ? c : 0;
			dest[7] = (brg & 0x01) ? c : 0;
		}
	}
}

void PC88::draw_640x400_attrib_graph()
{
	if(!Port31_GRAPH || (Port53_G0DS && Port53_G1DS)) {
		memset(graph, 0, sizeof(graph));
		return;
	}
	uint8 *gvram_b = Port53_G0DS ? gvram_null : (gvram + 0x0000);
	uint8 *gvram_r = Port53_G1DS ? gvram_null : (gvram + 0x4000);
	
	int char_height = crtc.char_height ? crtc.char_height : 16;
	int shift = Port30_40 ? 1 : 0;
	uint8 color_mask = Port30_COLOR ? 0 : 7;
	
	for(int y = 0, addr = 0; y < 200; y++) {
		int cy = y / char_height;
		for(int x = 0, cx = 0; x < 640; x += 8, cx++) {
			uint8 a = crtc.attrib.expand[cy][cx >> shift];
			uint8 c = (a & 0xe0) ? ((a >> 5) | color_mask) : 8;
			uint8 b = gvram_b[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = (b & 0x80) ? c : 0;
			dest[1] = (b & 0x40) ? c : 0;
			dest[2] = (b & 0x20) ? c : 0;
			dest[3] = (b & 0x10) ? c : 0;
			dest[4] = (b & 0x08) ? c : 0;
			dest[5] = (b & 0x04) ? c : 0;
			dest[6] = (b & 0x02) ? c : 0;
			dest[7] = (b & 0x01) ? c : 0;
		}
	}
	for(int y = 200, addr = 0; y < 400; y++) {
		int cy = y / char_height;
		for(int x = 0, cx = 0; x < 640; x += 8, cx++) {
			uint8 a = crtc.attrib.expand[cy][cx >> shift];
			uint8 c = (a & 0xe0) ? ((a >> 5) | color_mask) : 8;
			uint8 r = gvram_r[addr];
			addr++;
			uint8 *dest = &graph[y][x];
			dest[0] = (r & 0x80) ? c : 0;
			dest[1] = (r & 0x40) ? c : 0;
			dest[2] = (r & 0x20) ? c : 0;
			dest[3] = (r & 0x10) ? c : 0;
			dest[4] = (r & 0x08) ? c : 0;
			dest[5] = (r & 0x04) ? c : 0;
			dest[6] = (r & 0x02) ? c : 0;
			dest[7] = (r & 0x01) ? c : 0;
		}
	}
}

void PC88::request_intr(int level, bool status)
{
	uint8 bit = 1 << level;
	
	if(status) {
		bit &= intr_mask2;
		if(!(intr_req & bit)) {
			intr_req |= bit;
			update_intr();
		}
	} else {
		if(intr_req & bit) {
			intr_req &= ~bit;
			update_intr();
		}
	}
}

void PC88::update_intr()
{
	d_cpu->set_intr_line(((intr_req & intr_mask1 & intr_mask2) != 0), true, 0);
}

uint32 PC88::intr_ack()
{
	uint8 ai = intr_req & intr_mask1 & intr_mask2;
	
	for(int i = 0; i < 8; i++, ai >>= 1) {
		if(ai & 1) {
			intr_req &= ~(1 << i);
			intr_mask1 = 0;
			return i * 2;
		}
	}
	return 0;
}

void PC88::intr_ei()
{
	update_intr();
}

/* ----------------------------------------------------------------------------
	CRTC (uPD3301)
---------------------------------------------------------------------------- */

void pc88_crtc_t::reset()
{
	blink.rate = 24;
	cursor.type = cursor.mode = -1;
	cursor.x = cursor.y = -1;
	attrib.data = 0xe0;
	attrib.mask = 0xff;
	attrib.num = 20;
	width = 80;
	height = 25;
	char_height = 16;
	skip_line = true;
}

void pc88_crtc_t::write_cmd(uint8 data)
{
	cmd = (data >> 5) & 7;
	cmd_ptr = 0;
	switch(cmd) {
	case 0:	// reset CRTC
		status = 0;
		cursor.x = cursor.y = -1;
		break;
	case 1:	// start display
		status |= 0x10;
		status &= ~8;
		break;
	case 2:	// set irq mask
		if(!(data & 1)) {
			status = 0;
		}
		break;
	case 3:	// read light pen
		status &= ~1;
		break;
	case 4:	// load cursor position ON/OFF
		cursor.type = (data & 1) ? cursor.mode : -1;
		break;
	case 5:	// reset IRQ
		break;
	case 6:	// reset counters
		status = 0;
		break;
	}
}

void pc88_crtc_t::write_param(uint8 data)
{
	switch(cmd) {
	case 0:
		switch(cmd_ptr) {
		case 0:
			width = (data & 0x7f) + 2;
			break;
		case 1:
			height = (data & 0x3f) + 1;
			blink.rate = 32 * ((data >> 6) + 1);
			break;
		case 2:
			char_height = (data & 0x1f) + 1;
			cursor.mode = (data >> 5) & 3;
			skip_line = ((data & 0x80) != 0);
			break;
		case 4:
			mode = (data >> 5) & 7;
			attrib.num = (mode == 1) ? 0 : (data & 0x1f) + 1;
			break;
		}
		break;
	case 4:
		switch(cmd_ptr) {
		case 0:
			cursor.x = data;
			break;
		case 1:
			cursor.y = data;
			break;
		}
		break;
	}
	cmd_ptr++;
}

uint8 pc88_crtc_t::read_status()
{
	if(status & 8) {
		// dma underrun
		return (status & ~0x10);
	}
	return status;
}

void pc88_crtc_t::write_buffer(uint8 data)
{
	buffer[(buffer_ptr++) & 0x3fff] = data;
}

uint8 pc88_crtc_t::read_buffer(int ofs)
{
	if(ofs < buffer_ptr) {
		return buffer[ofs];
	}
	// dma underrun occurs !!!
	status |= 8;
//	status &= ~0x10;
	return 0;
}

void pc88_crtc_t::clear_buffer()
{
	memset(buffer, 0, sizeof(buffer));
	buffer_ptr = 0;
}

void pc88_crtc_t::update_blink()
{
	// from m88
	if(++blink.counter > blink.rate) {
		blink.counter = 0;
	}
	blink.attrib = (blink.counter < blink.rate / 4) ? 2 : 0;
	blink.cursor = (blink.counter <= blink.rate / 4) || (blink.rate / 2 <= blink.counter && blink.counter <= 3 * blink.rate / 4);
}

void pc88_crtc_t::expand_attribs(bool hireso)
{
	if(!(status & 0x10) || attrib.num == 0) {
		memset(attrib.expand, 0xe0, sizeof(attrib.expand));
		return;
	}
	int char_height_tmp = char_height;
	if(hireso || !skip_line) {
		char_height_tmp >>= 1;
	}
	for(int cy = 0, ytop = 0, ofs = 0; cy < height && ytop < 200; cy++, ytop += char_height_tmp, ofs += 80 + attrib.num * 2) {
		uint8 flags[128];
		memset(flags, 0, sizeof(flags));
		for(int i = 2 * (attrib.num - 1); i >= 0; i -= 2) {
			flags[buffer[ofs + i + 80] & 0x7f] = 1;
		}
		for(int cx = 0, pos = 0; cx < width && cx < 80; cx++) {
			if(flags[cx]) {
				uint8 code = buffer[ofs + pos + 81];
				if(mode == 2) {
					// color
					if(code & 8) {
						attrib.data = (attrib.data & 0x0f) | (code & 0xf0);
						attrib.mask = 0xf0;
					} else {
						attrib.data = (attrib.data & 0xf0) | ((code >> 2) & 0x0d) | ((code << 1) & 2);
						attrib.data ^= ((code & 2) && !(code & 1)) ? blink.attrib : 0;
						attrib.mask = 0xff;
					}
				} else {
					attrib.data = 0xe0 | ((code >> 3) & 0x10) | ((code >> 2) & 0x0d) | ((code << 1) & 2);
					attrib.data ^= ((code & 2) && !(code & 1)) ? blink.attrib : 0;
					attrib.mask = 0xff;
				}
				pos += 2;
			}
			attrib.expand[cy][cx] = attrib.data & attrib.mask;
			
			if(cx == cursor.x && cy == cursor.y) {
				if((cursor.type & 1) && blink.cursor) {
					// no cursor
				} else {
					static const uint8 ctype[5] = {0, 8, 8, 1, 1};
					attrib.expand[cy][cx] ^= ctype[cursor.type + 1];
				}
			}
		}
	}
}

/* ----------------------------------------------------------------------------
	DMAC (uPD8257)
---------------------------------------------------------------------------- */

void pc88_dmac_t::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0x0f) {
	case 0:
	case 2:
	case 4:
	case 6:
		if(!high_low) {
			ch[(addr >> 1) & 3].start.b.l = data;
		} else {
			ch[(addr >> 1) & 3].start.b.h = data;
		}
		high_low = !high_low;
		break;
	case 1:
	case 3:
	case 5:
	case 7:
		if(!high_low) {
			ch[(addr >> 1) & 3].length.b.l = data;
		} else {
			ch[(addr >> 1) & 3].length.b.h = data & 0x3f;
		}
		high_low = !high_low;
		break;
	case 8:
		mode = data;
		high_low = false;
		break;
	}
}

uint32 pc88_dmac_t::read_io8(uint32 addr)
{
	switch(addr & 0x0f) {
	case 8:
		return status;
	}
	return 0xff;
}

void pc88_dmac_t::start(int c)
{
	uint8 bit = 1 << c;
	if(mode & bit) {
		status &= ~bit;
		ch[c].running = true;
	}
}

void pc88_dmac_t::finish(int c)
{
	if(ch[c].running) {
		uint16 addr = ch[c].start.w.l;
		for(int i = 0; i <= ch[c].length.sd; i++) {
			ch[c].dest->write_dma_io8(0, ch[c].src->read_dma_data8(addr++));
		}
		status |= (1 << c);
		ch[c].running = false;
	}
}

