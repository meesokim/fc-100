/*
	CASIO PV-2000 Emulator 'EmuGaki'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.08.18 -

	[ cmt ]
*/

#include "cmt.h"
#include "../../fileio.h"

void CMT::initialize()
{
	fio = new FILEIO();
	memset(buffer, 0, sizeof(buffer));
	bufcnt = 0;
	bit = 1;
	start = 0;
	play = rec = false;
}

void CMT::release()
{
	close_datarec();
	delete fio;
}

void CMT::reset()
{
	close_datarec();
}

void CMT::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xff) {
	case 0x00:
		// bit0 = motor, bit1 = rec, bit3 = play
		if(start == 0 && data == 3 && rec) {
			for(int i = 0; i < 60; i++) {
				buffer[bufcnt] |= bit;
				if(!(bit & 0x80)) {
					bit <<= 1;
				}
				else {
					if(++bufcnt == BUFFER_SIZE) {
						fio->Fwrite(buffer, sizeof(buffer), 1);
						memset(buffer, 0, sizeof(buffer));
						bufcnt = 0;
					}
					bit = 1;
				}
			}
		}
		start = data;
		break;
	case 0x60:
		// bit0 = signal
		if((start & 0x3) == 0x3 && rec) {
			buffer[bufcnt] |= (data & 1) ? bit : 0;
			if(!(bit & 0x80)) {
				bit <<= 1;
			}
			else {
				if(++bufcnt == BUFFER_SIZE) {
					fio->Fwrite(buffer, sizeof(buffer), 1);
					memset(buffer, 0, sizeof(buffer));
					bufcnt = 0;
				}
				bit = 1;
			}
		}
		break;
	}
}

uint32 CMT::read_io8(uint32 addr)
{
	// bit0 = signal
	uint32 val = 2;
	if((start & 0x9) == 0x9 && play) {
		val |= (buffer[bufcnt] & bit ? 1 : 0);
		if(!(bit & 0x80)) {
			bit <<= 1;
		}
		else {
			if(++bufcnt == BUFFER_SIZE) {
				memset(buffer, 0, sizeof(buffer));
				fio->Fread(buffer, sizeof(buffer), 1);
				bufcnt = 0;
			}
			bit = 1;
		}
	}
	return val;
}

void CMT::play_datarec(_TCHAR* file_path)
{
	close_datarec();
	
	if(fio->Fopen(file_path, FILEIO_READ_BINARY)) {
		// open for play
		fio->Fread(buffer, sizeof(buffer), 1);
		bufcnt = 0;
		bit = 1;
		play = true;
	}
}

void CMT::rec_datarec(_TCHAR* file_path)
{
	close_datarec();
	
	if(fio->Fopen(file_path, FILEIO_WRITE_BINARY)) {
		// open for rec
		memset(buffer, 0, sizeof(buffer));
		bufcnt = 0;
		bit = 1;
		rec = true;
	}
}

void CMT::close_datarec()
{
	// close file
	if(rec && bufcnt) {
		fio->Fwrite(buffer, bufcnt, 1);
	}
	if(play || rec) {
		fio->Fclose();
	}
	play = rec = false;
}

