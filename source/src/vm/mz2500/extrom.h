/*
	SHARP MZ-2500 Emulator 'EmuZ-2500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.12.01 -

	[ extended rom ]
*/

#ifndef _EXTROM_H_
#define _EXTROM_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class EXTROM : public DEVICE
{
private:
	uint8 rom[0x10000];
	uint16 ptr;
	
public:
	EXTROM(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~EXTROM() {}
	
	// common functions
	void initialize();
	void write_io8(uint32 addr, uint32 data);
	uint32 read_io8(uint32 addr);
};

#endif

