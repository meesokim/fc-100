/*
	GoldStar FC-100 Emulator
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ memory ]
*/

#ifndef _MEMORY_H_
#define _MEMORY_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

class MEMORY : public DEVICE
{
private:
	uint8 rom[0x6000]; // BASIC 24KB $0000 (8KB x 3)
	uint8 ram[0x4000]; // MAIN DRAM 16KB $C000(16384 x 8bit)
	uint8 pcgram[256 * 8];// SRAM 2KB (6116: 2048 x 8bit, 0x0800)
	uint8 cgrom[512 * 8]; // CGROM 4KB (0x1000)
	uint8 extrom[0x2000]; // EXT ROM 8KB $6000
	uint8 extram[0x4000]; // EXT RAM 16KB $8000
	
	uint8 wdmy[0x800];
	uint8 rdmy[0x800];
	uint8* wbank[32];
	uint8* rbank[32];
	uint8 romsel;
	bool ramsel;

public:
	MEMORY(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~MEMORY() {}
	
	// common functions
	void initialize();
	void reset();
	void read_bios(_TCHAR *file_name, uint8 *buffer, int size, int crc32);
	void readrom(uint32 data);
	void write_data8(uint32 addr, uint32 data);
	uint32 read_data8(uint32 addr);
	void write_data16(uint32 addr, uint32 data) {
		write_data8(addr, data & 0xff); write_data8(addr + 1, data >> 8);
	}
	uint32 read_data16(uint32 addr) {
		return read_data8(addr) | (read_data8(addr + 1) << 8);
	}
	void write_io8(uint32 addr, uint32 data);

	// unique functions
	uint8* get_vram() { return ram; }
	uint8* get_cgrom() { return cgrom; }
	uint8* get_pcgram() { return pcgram; }
};

#endif

