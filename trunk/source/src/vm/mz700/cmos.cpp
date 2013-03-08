/*
	SHARP MZ-700 Emulator 'EmuZ-700'
	SHARP MZ-800 Emulator 'EmuZ-800'
	SHARP MZ-1500 Emulator 'EmuZ-1500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.09.02 -

	[ cmos memory ]
*/

#include "cmos.h"
#include "../../fileio.h"

#define DATA_SIZE	0x8000
#define ADDR_MASK	(DATA_SIZE - 1)

void CMOS::initialize()
{
	// init memory
	data_buffer = (uint8 *)malloc(DATA_SIZE);
	memset(data_buffer, 0, DATA_SIZE);
	
	// load cmos image
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T("CMOS.BIN")), FILEIO_READ_BINARY)) {
		fio->Fread(data_buffer, DATA_SIZE, 1);
		fio->Fclose();
	}
	delete fio;
}

void CMOS::release()
{
	// save cmos image
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T("CMOS.BIN")), FILEIO_WRITE_BINARY)) {
		fio->Fwrite(data_buffer, DATA_SIZE, 1);
		fio->Fclose();
	}
	delete fio;
	
	// release memory
	free(data_buffer);
}

void CMOS::reset()
{
	data_addr = 0;
}

void CMOS::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xff) {
	case 0xf8:
		data_addr = (data_addr & 0x00ff) | (data << 8);
		break;
	case 0xf9:
		data_addr = (data_addr & 0xff00) | data;
		break;
	case 0xfa:
		data_buffer[(data_addr++) & ADDR_MASK] = data;
		break;
	}
}

uint32 CMOS::read_io8(uint32 addr)
{
	switch(addr & 0xff) {
	case 0xf8:
		data_addr = 0;
		return 0xff;
	case 0xf9:
		return data_buffer[(data_addr++) & ADDR_MASK];
	}
	return 0xff;
}

