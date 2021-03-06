/*
	SEGA SC-3000 Emulator 'eSC-3000'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.17-

	[ virtual machine ]
*/

#ifndef _SC3000_H_
#define _SC3000_H_

#define DEVICE_NAME		"SEGA SC-3000"
#define CONFIG_NAME		"sc3000"
#define CONFIG_VERSION		0x02

// device informations for virtual machine
#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME		262
#define CPU_CLOCKS		3579545
#define SCREEN_WIDTH		256
#define SCREEN_HEIGHT		192
#define TMS9918A_VRAM_SIZE	0x4000
#define TMS9918A_LIMIT_SPRITES
#define MAX_DRIVE		4

// device informations for win32
#define MIN_WINDOW_WIDTH	320
#define USE_CART
#define USE_FD1
#define USE_DATAREC
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		5
#define USE_AUTO_KEY_RELEASE	8
#define USE_ACCESS_LAMP

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class DATAREC;
class I8251;
class I8255;
class IO;
class SN76489AN;
class TMS9918A;
class UPD765A;
class Z80;

class KEYBOARD;
class MEMORY;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	DATAREC* drec;
	I8251* sio;
	I8255* pio_k;
	I8255* pio_f;
	IO* io;
	SN76489AN* psg;
	TMS9918A* vdp;
	UPD765A* fdc;
	Z80* cpu;
	
	KEYBOARD* key;
	MEMORY* memory;
	
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
	int access_lamp();
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// user interface
	void open_cart(_TCHAR* file_path);
	void close_cart();
	void open_disk(int drv, _TCHAR* file_path, int offset);
	void close_disk(int drv);
	bool disk_inserted(int drv);
	void play_datarec(_TCHAR* file_path);
	void rec_datarec(_TCHAR* file_path);
	void close_datarec();
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
