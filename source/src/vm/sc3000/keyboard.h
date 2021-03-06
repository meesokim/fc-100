/*
	SEGA SC-3000 Emulator 'eSC-3000'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.17-

	[ keyboard ]
*/

#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

#define SIG_KEYBOARD_COLUMN	0

class KEYBOARD : public DEVICE
{
private:
	DEVICE *d_cpu, *d_pio;
	
	uint8* key_stat;
	uint32* joy_stat;
	uint8 column;
	bool break_pressed;
	
	void update_keyboard();
	
public:
	KEYBOARD(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~KEYBOARD() {}
	
	// common functions
	void initialize();
	void event_frame();
	void write_signal(int id, uint32 data, uint32 mask);
	
	// unique functions
	void set_context_cpu(DEVICE* device) {
		d_cpu = device;
	}
	void set_context_pio(DEVICE* device) {
		d_pio = device;
	}
};

#endif
