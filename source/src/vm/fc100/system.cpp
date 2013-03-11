/*
	GoldStar FC-100 Emulator
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ system port ]
*/

#include "system.h"
#include "../datarec.h"
#include "../mc6847.h"

void SYSTEM::initialize()
{
	sysport = 0;
}

void SYSTEM::reset()
{
}

void SYSTEM::write_io8(uint32 addr, uint32 data)
{
	// this part is not real circuit, just logic emulate for test
	addr &= 0xff;
	if (addr == 0x31) {
		d_drec->write_signal(SIG_DATAREC_TRIG, ~data, 8);
	}
	if (addr == 0x33) {
		d_drec->write_signal(SIG_DATAREC_REMOTE, 0, 0);
	}
	if (addr < 0x20) d_vdp->write_signal(SIG_MC6847_AS, data, 1);
}

uint32 SYSTEM::read_io8(uint32 addr)
{
	return sysport;
}

void SYSTEM::write_signal(int id, uint32 data, uint32 mask)
{
	sysport = (sysport & ~mask) | (data & mask);
}
