/*
	SHARP MZ-700 Emulator 'EmuZ-700'
	SHARP MZ-800 Emulator 'EmuZ-800'
	SHARP MZ-1500 Emulator 'EmuZ-1500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.09.02 -

	[ ram file ]
*/

#ifndef _RAMFILE_H_
#define _RAMFILE_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class RAMFILE : public DEVICE
{
private:
	uint8 *data_buffer;
	uint32 data_addr;
	
public:
	RAMFILE(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~RAMFILE() {}
	
	// common functions
	void initialize();
	void release();
	void reset();
	void write_io8(uint32 addr, uint32 data);
	uint32 read_io8(uint32 addr);
};

#endif

