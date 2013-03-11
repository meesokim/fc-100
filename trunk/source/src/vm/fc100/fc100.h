#ifndef _FC100_H_
#define _FC100_H_

#define DEVICE_NAME		"GoldStar FC-100 by zanny for beta test only"
#define CONFIG_NAME		"fc100"
#define CONFIG_VERSION		0x01

// device informations for virtual machine
#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME		262
#define XTAL			7159090
#define CPU_CLOCKS		XTAL / 2
#define SCREEN_WIDTH		256
#define SCREEN_HEIGHT		192
#define WINDOW_WIDTH		320
#define WINDOW_HEIGHT		242
// VDG
#define MC6847_TYPE			M5C6847
#define MC6847_VRAM_OFS		(as ? 0x2000 : 0)
#define MC6847_ATTR_OFS		(as ? 0x3800 : 0x200)
#define MC6847_ATTR_INV		0x01
#define MC6847_ATTR_CSS		0x02
#define MC6847_ATTR_INTEXT	0x20 // maybe
#define MC6847_ATTR_AS		0x40 // maybe
#define MC6847_ATTR_AG		0x80 // maybe
#define HAS_AY_3_8912

// device informations for win32
#define USE_SCANLINE
#define USE_DATAREC
#define DATAREC_SOUND
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY			8
#define USE_AUTO_KEY_RELEASE	9
#define NOTIFY_KEY_DOWN

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class I8251;
class DATAREC;
class IO;
class MC6847;
class NOT;
class YM2203;
class Z80;

class JOYSTICK;
class KEYBOARD;
class MEMORY;
class SYSTEM;
class CMT;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	I8251* sio;
	DATAREC* drec;
	IO* io;
	MC6847* vdp;
	NOT* not;
	YM2203* psg;
	Z80* cpu;
	
	JOYSTICK* joystick;
	KEYBOARD* keyboard;
	MEMORY* memory;
	SYSTEM* system;
	CMT* cmt;

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
	void play_datarec(_TCHAR* file_path);
	void rec_datarec(_TCHAR* file_path);
	void close_datarec();
	bool now_skip();
	
	void key_down(int code, bool repeat);
	void key_up(int code);
	void update_config();
	void initialize_screen(); // for scanline by zanny
	
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
