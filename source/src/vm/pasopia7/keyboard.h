/*
	TOSHIBA PASOPIA 7 Emulator 'EmuPIA7'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.09.20 -

	[ keyboard ]
*/

#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

#define SIG_KEYBOARD_Z80PIO_A	0

class KEYBOARD : public DEVICE
{
private:
	DEVICE* d_pio;
	
	uint8* key_stat;
	void create_key();
	uint8 sel, keys[12];
	
public:
	KEYBOARD(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~KEYBOARD() {}
	
	// common functions
	void initialize();
	void write_signal(int id, uint32 data, uint32 mask);
	void event_frame();
	
	// unique functions
	void set_context_pio(DEVICE* device) {
		d_pio = device;
	}
};

#endif

