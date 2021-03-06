/*
	NEC-HE PC Engine Emulator 'ePCEngine'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2012.10.31-

	[ virtual machine ]
*/

#ifndef _PCENGINE_H_
#define _PCENGINE_H_

#define DEVICE_NAME		"NEC-HE PC Engine"
#define CONFIG_NAME		"pcengine"
#define CONFIG_VERSION		0x01

#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME 	262
#define CPU_CLOCKS		7159090
#define SCREEN_WIDTH		352
#define SCREEN_HEIGHT		238

#define SUPPORT_SUPER_GFX
#define SUPPORT_BACKUP_RAM

// device informations for win32
#define USE_CART

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class HUC6280;
class PCE;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* pceevent;
	
	HUC6280* pcecpu;
	PCE* pce;
	
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
	
	// user interface
	void open_cart(_TCHAR* file_path);
	void close_cart();
	bool now_skip() {
		return false;
	}
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
