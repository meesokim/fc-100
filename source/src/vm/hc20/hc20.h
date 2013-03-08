/*
	EPSON HC-20 Emulator 'eHC-20'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2011.05.23-

	[ virtual machine ]
*/

#ifndef _HC20_H_
#define _HC20_H_

#define DEVICE_NAME		"EPSON HC-20"
#define CONFIG_NAME		"hc20"
#define CONFIG_VERSION		0x01

// device informations for virtual machine
#define FRAMES_PER_SEC		72
#define LINES_PER_FRAME		64
#define CPU_CLOCKS		614400
#define SCREEN_WIDTH		120
#define SCREEN_HEIGHT		32
#define MAX_DRIVE		2
#define HAS_HD6301

// device informations for win32
#define WINDOW_WIDTH		(SCREEN_WIDTH * 3)
#define WINDOW_HEIGHT		(SCREEN_HEIGHT * 3)

#define USE_DIPSWITCH
#define DIPSWITCH_DEFAULT	0x08
#define USE_FD1
#define USE_FD2
#define USE_DATAREC
#define DATAREC_BINARY_ONLY
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		6
#define USE_AUTO_KEY_RELEASE	10
#define DONT_KEEEP_KEY_PRESSED
#define USE_POWER_OFF
#define USE_ACCESS_LAMP

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class BEEP;
class HD146818P;
class MC6800;
class TF20;

class MEMORY;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	BEEP* beep;
	HD146818P* rtc;
	MC6800* cpu;
	TF20* tf20;
	
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
	void notify_power_off();
	void run();
	
	// draw screen
	void draw_screen();
	int access_lamp();
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// user interface
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
