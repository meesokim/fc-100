/*
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ memory ]
*/

#include "memory.h"
#include "../../config.h"
#include "../../fileio.h"

#define SET_BANK(s, e, w, r) { \
	int sb = (s) >> 11, eb = (e) >> 11; \
	for(int i = sb; i <= eb; i++) { \
		if((w) == wdmy) { \
			wbank[i] = wdmy; \
		} \
		else { \
			wbank[i] = (w) + 0x800 * (i - sb); \
		} \
		if((r) == rdmy) { \
			rbank[i] = rdmy; \
		} \
		else { \
			rbank[i] = (r) + 0x800 * (i - sb); \
		} \
	} \
}

void MEMORY::initialize()
{
	memset(rdmy, 0xff, sizeof(rdmy));
	// set memory map
	SET_BANK(0x0000, 0x5fff, wdmy,rom); // 32KB
	SET_BANK(0x6000, 0x7fff, wdmy,extrom); // 8KB
	SET_BANK(0x8000, 0xbfff, extram, extram); // 32KB
	SET_BANK(0xc000, 0xffff, ram, ram); // 32KB
}

void MEMORY::readrom(uint32 data)
{
	ramsel = (data & 1) != 0; // ext ram: 1, ext rom : 2
	// load rom image
	FILEIO* fio = new FILEIO();
#ifdef _IO_DEBUG_LOG
	emu->out_debug(_T("Loading...\n"));
#endif
	if(fio->Fopen(emu->bios_path(_T("FC100U48.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(rom, 0x2000, 1);
		fio->Fclose();
		if (getcrc32(rom, 0x2000) != 0x24E78E75) memset(rom, 0xff, 0x2000);
	}
#ifdef _IO_DEBUG_LOG
	else emu->out_debug(_T("FC100U48.ROM Fail.\n"));
#endif

	if(fio->Fopen(emu->bios_path(_T("FC100U49.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(&rom[0x2000], 0x2000, 1);
		fio->Fclose();
		if (getcrc32(rom + 0x2000, 0x2000) != 0xE14FC7E9) memset(rom + 0x2000, 0xff, 0x2000);
	}
#ifdef _IO_DEBUG_LOG
	else emu->out_debug(_T("FC100U49.ROM Fail.\n"));
#endif

	if(fio->Fopen(emu->bios_path(_T("FC100U50.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(&rom[0x4000], 0x2000, 1);
		fio->Fclose();
		if (getcrc32(rom + 0x4000, 0x2000) != 0xD783C84E) memset(rom + 0x4000, 0xff, 0x2000);
	}
#ifdef _IO_DEBUG_LOG
	else emu->out_debug(_T("FC100U50.ROM Fail.\n"));
#endif

	if (data & 2) {// extrom on : type = 2
#ifdef _IO_DEBUG_LOG
		emu->out_debug(_T("Checking...\n"));
#endif
		if(fio->Fopen(emu->bios_path(_T("FC100EXT.ROM")), FILEIO_READ_BINARY)) {
			fio->Fread(extrom, 0x2000, 1);
			fio->Fclose();
#ifdef _IO_DEBUG_LOG
			if (extrom[0] != 0x47 && extrom[1] != 0x53) {
				emu->out_debug(_T("GS-ROM OK."));
			}
			else if (extrom[0x8c2] != 0xd8) {
				emu->out_debug(_T("EXTROM OK."));
			}
			else{
				emu->out_debug(_T("Fail. (Unknown ROM)"));
				memset(extrom, 0xff, 0x2000);
			}
#endif
		}
#ifdef _IO_DEBUG_LOG
		else emu->out_debug(_T("FC100EXT.ROM Fail.\n"));
#endif
	}

	if(fio->Fopen(emu->bios_path(_T("FC100U53.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(cgrom, 0x1000, 1);
		fio->Fclose();
		if (getcrc32(cgrom, 0x1000) != 0x2DE75B7F) {
			memset(cgrom, 0xff, 0x1000);
		}
	}
	else{
#ifdef _IO_DEBUG_LOG
		emu->out_debug(_T("FC100U53.ROM Fail.\n"));
#endif
		memset(cgrom, 0xff, sizeof(cgrom));
	}
	delete fio;
}

void MEMORY::write_io8(uint32 addr, uint32 data)
{
	// warning : this part is not real circuit emulation

	addr &= 0xff;
	switch (addr) {
	case 0x70:
		if (~romsel & 0x10)
		{
			SET_BANK(0x6000, 0x7fff, wdmy, extrom);
			romsel = 0x70;
#ifdef _IO_DEBUG_LOG
			emu->out_debug(_T("Working EXTROM\n"));
#endif
		}
		break;
	case 0x71:
		romsel = 0x71;
		break;
	case 0x60:
		if (romsel == 0x71) {
			SET_BANK(0x6000, 0x6fff, wdmy, cgrom);
			SET_BANK(0x7000, 0x7fff, wdmy, cgrom);
			romsel = 0x60;
#ifdef _IO_DEBUG_LOG
			emu->out_debug(_T("Working CGROM\n"));
#endif
		}
		break;
	case 0x61:
		if (romsel == 0x71) {
			SET_BANK(0x6000, 0x77ff, pcgram, pcgram);
			SET_BANK(0x6800, 0x7fff, pcgram, pcgram);
			SET_BANK(0x7000, 0x77ff, pcgram, pcgram);
			SET_BANK(0x7800, 0x7fff, pcgram, pcgram);
			romsel = 0x61;
#ifdef _IO_DEBUG_LOG
			emu->out_debug(_T("Working PCGRAM\n"));
#endif
		}
		break;
	}
}

void MEMORY::reset()
{
#ifdef _IO_DEBUG_LOG
	emu->out_debug(_T("Start!\n"));
#endif
	if (ramsel) {
		SET_BANK(0x8000, 0xbfff, extram, extram);
	}
	else{
		SET_BANK(0x8000, 0xbfff, wdmy, rdmy);
	}
	SET_BANK(0x6000, 0x7fff, rdmy, extrom);
	romsel = 0x70;
}

void MEMORY::write_data8(uint32 addr, uint32 data)
{
	addr &= 0xffff;
	wbank[addr >> 11][addr & 0x7ff] = data;
}

uint32 MEMORY::read_data8(uint32 addr)
{
	addr &= 0xffff;
	return rbank[addr >> 11][addr & 0x7ff];
}

