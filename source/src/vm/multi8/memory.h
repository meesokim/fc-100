/*
	MITSUBISHI Electric MULTI8 Emulator 'EmuLTI8'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.09.15 -

	[ memory ]
*/

#ifndef _MEMORY_H_
#define _MEMORY_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

#define SIG_MEMORY_I8255_C	0

class MEMORY : public DEVICE
{
private:
	DEVICE* d_pio;
	
	// memory
	uint8 rom[0x8000];
	uint8 fdc[0x1000];
	uint8 ram0[0x8000];
	uint8 ram1[0x8000];
	uint8 vram[0x10000];
	uint8 wdmy[0x1000];
	uint8 rdmy[0x1000];
	uint8* wbank[16];
	uint8* rbank[16];
	
	void update_map();
	uint8 map1, map2;
	
public:
	MEMORY(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~MEMORY() {}
	
	// common functions
	void initialize();
	void reset();
	void write_data8(uint32 addr, uint32 data);
	uint32 read_data8(uint32 addr);
	void write_data16(uint32 addr, uint32 data) {
		write_data8(addr, data & 0xff); write_data8(addr + 1, data >> 8);
	}
	uint32 read_data16(uint32 addr) {
		return read_data8(addr) | (read_data8(addr + 1) << 8);
	}
	void write_io8(uint32 addr, uint32 data);
	void write_signal(int id, uint32 data, uint32 mask);
	
	// unique functions
	void set_context_pio(DEVICE* device) {
		d_pio = device;
	}
	uint8* get_vram() {
		return vram;
	}
};

#endif

