/*
	SHARP MZ-700 Emulator 'EmuZ-700'
	SHARP MZ-1500 Emulator 'EmuZ-1500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.09.02 -

	[ psg*2 ]
*/

#ifndef _PSG_H_
#define _PSG_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class PSG : public DEVICE
{
private:
	DEVICE *d_psg_l, *d_psg_r;
	
public:
	PSG(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~PSG() {}
	
	// common function
	void write_io8(uint32 addr, uint32 data);
	
	// unitque functions
	void set_context_psg_l(DEVICE* device) {
		d_psg_l = device;
	}
	void set_context_psg_r(DEVICE* device) {
		d_psg_r = device;
	}
};

#endif

