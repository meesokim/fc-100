/*
	NEC PC-8201 Emulator 'ePC-8201'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2009.03.31-

	[ virtual machine ]
*/

#ifndef _PC8201_H_
#define _PC8201_H_

#ifdef _PC8201A
#define DEVICE_NAME		"NEC PC-8201A"
#define CONFIG_NAME		"pc8201a"
#else
#define DEVICE_NAME		"NEC PC-8201"
#define CONFIG_NAME		"pc8201"
#endif
#define CONFIG_VERSION		0x01

// device informations for virtual machine
#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME		64
#define CPU_CLOCKS		2400000
#define SCREEN_WIDTH		240
#define SCREEN_HEIGHT		64
#define HAS_I8085

// device informations for win32
//#define USE_DATAREC
#define NOTIFY_KEY_DOWN
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		5
#define USE_AUTO_KEY_RELEASE	6
#define USE_AUTO_KEY_CAPS

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class DATAREC;
class I8080;
class I8155;
class IO;
class PCM1BIT;
class UPD1990A;

class KEYBOARD;
class LCD;
class MEMORY;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	DATAREC* cmt;
	I8080* cpu;
	I8155* pio;
	IO* io;
	PCM1BIT* buzzer;
	UPD1990A* rtc;
	
	KEYBOARD* keyboard;
	LCD* lcd;
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
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// notify key
	void key_down(int code, bool repeat);
	void key_up(int code);
	
	// user interface
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
