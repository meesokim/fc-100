/*
	CASIO PV-1000 Emulator 'ePV-1000'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.11.16 -

	[ virtual machine ]
*/

#ifndef _PV1000_H_
#define _PV1000_H_

#define DEVICE_NAME		"CASIO PV-1000"
#define CONFIG_NAME		"pv1000"
#define CONFIG_VERSION		0x01

// device informations for virtual machine
#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME		67
#define CPU_CLOCKS		3579545
#define SCREEN_WIDTH		256
#define SCREEN_HEIGHT		192
#define LINES_PER_HBLANK 	51
#define CLOCKS_PER_HBLANK	800
#define MEMORY_ADDR_MAX		0x10000
#define MEMORY_BANK_SIZE	0x800

// device informations for win32
#define USE_CART
#define USE_KEY_TO_JOY

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class IO;
class MEMORY;
class Z80;

class JOYSTICK;
class PSG;
class VDP;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	IO* io;
	MEMORY* memory;
	Z80* cpu;
	
	JOYSTICK* joystick;
	PSG* psg;
	VDP* vdp;
	
	// memory
	uint8 mem[0x10000];
	
public:
	// ----------------------------------------
	// initialize
	// ----------------------------------------
	
	VM(EMU* parent_emu);
	~VM();
	
	// ----------------------------------------
	// for emulation class
	// ----------------------------------------
	
	// drive virtual machine
	void reset();
	void run();
	
	// draw screen
	void draw_screen();
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// user interface
	void open_cart(_TCHAR* file_path);
	void close_cart();
	bool now_skip();
	
	void update_config();
	
	// ----------------------------------------
	// for each device
	// ----------------------------------------
	
	// devices
	DEVICE* get_device(int id);
	DEVICE* dummy;
	DEVICE* first_device;
	DEVICE* last_device;
};

#endif
