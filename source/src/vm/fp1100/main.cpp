/*
	CASIO FP-1100 Emulator 'eFP-1100'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.06.17-

	[ main pcb ]
*/

#include "main.h"
#include "sub.h"

#define SET_BANK(s, e, w, r) { \
	int sb = (s) >> 12, eb = (e) >> 12; \
	for(int i = sb; i <= eb; i++) { \
		if((w) == wdmy) { \
			wbank[i] = wdmy; \
		} \
		else { \
			wbank[i] = (w) + 0x1000 * (i - sb); \
		} \
		if((r) == rdmy) { \
			rbank[i] = rdmy; \
		} \
		else { \
			rbank[i] = (r) + 0x1000 * (i - sb); \
		} \
	} \
}

void MAIN::initialize()
{
	memset(rom, 0xff, sizeof(rom));
	memset(rdmy, 0xff, sizeof(rdmy));
	
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T("BASIC.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(rom, sizeof(rom), 1);
		fio->Fclose();
	}
	delete fio;
	
	SET_BANK(0x0000, 0xffff, ram, ram);
}

void MAIN::reset()
{
	SET_BANK(0x0000, 0x8fff, ram, rom);
	
	slot_sel = 0;
	intr_mask = intr_req = 0;
}

void MAIN::write_data8(uint32 addr, uint32 data)
{
	addr &= 0xffff;
	wbank[addr >> 12][addr & 0xfff] = data;
}

uint32 MAIN::read_data8(uint32 addr)
{
	addr &= 0xffff;
	return rbank[addr >> 12][addr & 0xfff];
}

void MAIN::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xffe0) {
	case 0xff00:
	case 0xff20:
	case 0xff40:
	case 0xff60:
		slot_sel = (slot_sel & 1) | ((data << 1) & 6);
		break;
	case 0xff80:
		if((intr_mask & 0x80) != (data & 0x80)) {
			intr_mask = (intr_mask & (~0x80)) | (data & 0x80);
			d_sub->write_signal(SIG_SUB_INT2, data, 0x80);
		}
		if((intr_mask & 0x1f) != (data & 0x1f)) {
			intr_mask = (intr_mask & (~0x1f)) | (data & 0x1f);
			update_intr();
		}
		break;
	case 0xffa0:
		if(data & 2) {
			SET_BANK(0x0000, 0x8fff, ram, ram);
		}
		else {
			SET_BANK(0x0000, 0x8fff, ram, rom);
		}
		slot_sel = (slot_sel & 6) | (data & 1);
		break;
	case 0xffc0:
		d_sub->write_signal(SIG_SUB_COMM, data, 0xff);
		break;
	case 0xffe0:
		break;
	default:
		d_slot[slot_sel & 7]->write_io8(addr, data);
		break;
	}
}

uint32 MAIN::read_io8(uint32 addr)
{
	switch(addr & 0xffe0) {
	case 0xff80:
	case 0xffa0:
	case 0xffc0:
	case 0xffe0:
		return comm_data;
	default:
		return d_slot[slot_sel & 7]->read_io8(addr);
	}
}

static const uint8 priority[5] = {
	0x10, 0x01, 0x02, 0x04, 0x08
};
static const uint32 vector[5] = {
	0xf0, 0xf2, 0xf4, 0xf6, 0xf8
};

void MAIN::write_signal(int id, uint32 data, uint32 mask)
{
	switch(id) {
	case SIG_MAIN_INTS:
	case SIG_MAIN_INTA:
	case SIG_MAIN_INTB:
	case SIG_MAIN_INTC:
	case SIG_MAIN_INTD:
		if(data & mask) {
			if(!(intr_req & priority[id])) {
				intr_req |= priority[id];
				update_intr();
			}
		}
		else {
			if(intr_req & priority[id]) {
				intr_req &= ~priority[id];
				update_intr();
			}
		}
		break;
	case SIG_MAIN_COMM:
		comm_data = data & 0xff;
		break;
	}
}

void MAIN::update_intr()
{
	for(int i = 0; i < 5; i++) {
		if((intr_req & priority[i]) && (intr_mask & priority[i])) {
			d_cpu->set_intr_line(true, true, 0);
			return;
		}
	}
	d_cpu->set_intr_line(false, true, 0);
}

uint32 MAIN::intr_ack()
{
	for(int i = 0; i < 5; i++) {
		if((intr_req & priority[i]) && (intr_mask & priority[i])) {
			intr_req &= ~priority[i];
			return vector[i];
		}
	}
	// invalid interrupt status
	return 0xff;
}

void MAIN::intr_reti()
{
}
