/*
	SHARP MZ-2500 Emulator 'EmuZ-2500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.12.01 -

	[ kanji rom ]
*/

#include "kanji.h"
#include "../../fileio.h"

void KANJI::initialize()
{
	// init image
	memset(rom, 0, sizeof(rom));
	
	// load rom image
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T("KANJI2.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(rom, sizeof(rom), 1);
		fio->Fclose();
	}
	delete fio;
	
	ptr = 0;
}

void KANJI::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xff) {
	case 0xb8:
		ptr = (ptr & 0xff00) | data;
		break;
	case 0xb9:
		ptr = (ptr & 0x00ff) | (data << 8);
		break;
	}
}

uint32 KANJI::read_io8(uint32 addr)
{
	switch(addr & 0xff) {
	case 0xb8:
		return rom[(ptr << 1) | 0];
	case 0xb9:
		return rom[(ptr << 1) | 1];
	}
	return 0xff;
}

