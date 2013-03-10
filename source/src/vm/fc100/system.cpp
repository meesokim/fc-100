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

	switch(addr & 0xf0) {
	case 0x10:
		if ((addr & 0xf) == 0) d_vdp->write_signal(SIG_MC6847_AS,	data, 1);
		if (addr & 1) d_vdp->write_signal(SIG_MC6847_AS,	data, 1);
		break;
	}
}

uint32 SYSTEM::read_io8(uint32 addr)
{
	return sysport;
}

void SYSTEM::write_signal(int id, uint32 data, uint32 mask)
{
	sysport = (sysport & ~mask) | (data & mask);
}
