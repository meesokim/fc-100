/*
	MITSUBISHI Electric MULTI8 Emulator 'EmuLTI8'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.09.15 -

	[ kanji rom ]
*/

#ifndef _KANJI_H_
#define _KANJI_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class KANJI : public DEVICE
{
private:
	DEVICE* d_pio;
	
	uint8 rom[0x20000];
	uint32 ptr;
	
public:
	KANJI(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~KANJI() {}
	
	// common functions
	void initialize();
	void reset();
	void write_io8(uint32 addr, uint32 data);
	uint32 read_io8(uint32 addr);
	
	// unique functions
	void set_context_pio(DEVICE* device) {
		d_pio = device;
	}
};

#endif

