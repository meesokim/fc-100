/*
	MITSUBISHI Electric MULTI8 Emulator 'EmuLTI8'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.09.16 -

	[ cmt ]
*/

#ifndef _CMT_H_
#define _CMT_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

#define SIG_CMT_REMOTE	0
#define SIG_CMT_OUT	1

// max 256kbytes
#define BUFFER_SIZE	0x40000

class CMT : public DEVICE
{
private:
	DEVICE* d_sio;
	
	FILEIO* fio;
	int bufcnt;
	uint8 buffer[BUFFER_SIZE];
	bool play, rec, remote;
	
	void release_datarec();
	
public:
	CMT(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~CMT() {}
	
	// common functions
	void initialize();
	void release();
	void reset();
	void write_signal(int id, uint32 data, uint32 mask);
	
	// unique functions
	void play_datarec(_TCHAR* file_path);
	void rec_datarec(_TCHAR* file_path);
	void close_datarec();
	void set_context_sio(DEVICE* device) {
		d_sio = device;
	}
};

#endif

