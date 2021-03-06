/*
	Japan Electronics College MYCOMZ-80A Emulator 'eMYCOMZ-80A'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2009.05.13-

	[ virtual machine ]
*/

#ifndef _MYCOMZ80A_H_
#define _MYCOMZ80A_H_

#define DEVICE_NAME		"Japan Electronics College MYCOMZ-80A"
#define CONFIG_NAME		"mycomz80a"
#define CONFIG_VERSION		0x01

// device informations for virtual machine
#define FRAMES_PER_SEC		60.58
#define LINES_PER_FRAME 	260
#define CHARS_PER_LINE		64
#define HD46505_HORIZ_FREQ	15750
#define CPU_CLOCKS		2500000
#define SCREEN_WIDTH		640
#define SCREEN_HEIGHT		400
#define SUPPORT_VARIABLE_TIMING
#define HAS_MSM5832

// device informations for win32
#define USE_DATAREC
#define NOTIFY_KEY_DOWN
#define USE_SHIFT_NUMPAD_KEY
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		5
#define USE_AUTO_KEY_RELEASE	6
#define USE_AUTO_KEY_CAPS
#define USE_SCANLINE

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class DATAREC;
class HD46505;
class I8255;
class IO;
class MSM58321;
class SN76489AN;
class Z80;

class DISPLAY;
class KEYBOARD;
class MEMORY;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	DATAREC* drec;
	HD46505* crtc;
	I8255* pio1;
	I8255* pio2;
	I8255* pio3;
	IO* io;
	MSM58321* rtc;
	SN76489AN* psg;
	Z80* cpu;
	
	DISPLAY* display;
	KEYBOARD* keyboard;
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
	double frame_rate();
	
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
