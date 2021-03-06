/*
	CASIO FP-1100 Emulator 'eFP-1100'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.06.18-

	[ ram pack ]
*/

#include "rampack.h"

void RAMPACK::initialize()
{
	memset(ram, 0, sizeof(ram));
	modified = false;
	
	_TCHAR file_name[_MAX_PATH];
	_stprintf(file_name, _T("RAMPACK%d.BIN"), index);
	
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(file_name), FILEIO_READ_BINARY)) {
		fio->Fread(ram, sizeof(ram), 1);
		fio->Fclose();
	}
	delete fio;
}

void RAMPACK::release()
{
	if(modified) {
		_TCHAR file_name[_MAX_PATH];
		_stprintf(file_name, _T("RAMPACK%d.BIN"), index);
		
		FILEIO* fio = new FILEIO();
		if(fio->Fopen(emu->bios_path(file_name), FILEIO_WRITE_BINARY)) {
			fio->Fwrite(ram, sizeof(ram), 1);
			fio->Fclose();
		}
		delete fio;
	}
}

void RAMPACK::write_io8(uint32 addr, uint32 data)
{
	if(addr < 0x4000) {
		if(ram[addr] != data) {
			ram[addr] = data;
			modified = true;
		}
	}
}

uint32 RAMPACK::read_io8(uint32 addr)
{
	if(addr < 0x4000) {
		return ram[addr];
	}
	else if(0xff00 <= addr && addr < 0xff80) {
		return 0x01; // device id
	}
	return 0xff;
}
