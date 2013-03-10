/*
	Skelton for retropc emulator
	Origin : Takeda.Toshiya
	
	GOLDSTAR FC-100 Emulator

	Date   : 2013.03

	[ keyboard ]
*/

#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class KEYBOARD : public DEVICE
{
private:
	uint8* key_stat;
	uint8 status[16];
	
public:
	KEYBOARD(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~KEYBOARD() {}
	
	// common functions
	void initialize();
	void reset();
	uint32 read_io8(uint32 addr);
	void set_keyboard();
};

#endif
