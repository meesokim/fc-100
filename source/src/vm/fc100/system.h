/*
	GoldStar FC-100 emulator
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ system port ]
*/

#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#include "../vm.h"
#include "../../emu.h"
#include "../device.h"

#define SIG_SYSTEM_PORT	0

class SYSTEM : public DEVICE
{
private:
	DEVICE *d_drec, *d_vdp;
	
	uint8 sysport;
	
public:
	SYSTEM(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {}
	~SYSTEM() {}
	
	// common functions
	void initialize();
	void reset();
	void write_io8(uint32 addr, uint32 data);
	uint32 read_io8(uint32 addr);
	void write_signal(int id, uint32 data, uint32 mask);
	
	// unique functions
	void set_context_drec(DEVICE* device) {
		d_drec = device;
	}
	void set_context_vdp(DEVICE* device) {
		d_vdp = device;
	}
};

#endif

