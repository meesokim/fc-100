/*
	NEC PC-9801 Emulator 'ePC-9801'
	NEC PC-9801E/F/M Emulator 'ePC-9801E'
	NEC PC-98DO Emulator 'ePC-98DO'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2012.02.03-

	[ PC-9801-26 ]
*/

#include "fmsound.h"

// PC-98DO+
#define BOARD_ID	0

#ifdef HAS_YM2608
void FMSOUND::reset()
{
	mask = 0;
}
#endif

void FMSOUND::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xffff) {
	case 0x188:
		d_opn->write_io8(0, data);
		break;
	case 0x18a:
		d_opn->write_io8(1, data);
		break;
#ifdef HAS_YM2608
	case 0x18c:
		if(mask & 1) {
			d_opn->write_io8(2, data);
		}
		break;
	case 0x18e:
		if(mask & 1) {
			d_opn->write_io8(3, data);
		}
		break;
	case 0xa460:
		mask = data;
		break;
#endif
	}
}

uint32 FMSOUND::read_io8(uint32 addr)
{
	switch(addr & 0xffff) {
	case 0x188:
		return d_opn->read_io8(0);
	case 0x18a:
		return d_opn->read_io8(1);
#ifdef HAS_YM2608
	case 0x18c:
		if(mask & 1) {
			return d_opn->read_io8(2);
		}
		break;
	case 0x18e:
		if(mask & 1) {
			return d_opn->read_io8(3);
		}
		break;
	case 0xa460:
		return BOARD_ID | (mask & 3);
#endif
	}
	return 0xff;
}

