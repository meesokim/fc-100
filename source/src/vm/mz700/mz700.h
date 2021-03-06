/*
	SHARP MZ-700 Emulator 'EmuZ-700'
	SHARP MZ-800 Emulator 'EmuZ-800'
	SHARP MZ-1500 Emulator 'EmuZ-1500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2008.06.05 -

	[ virtual machine ]
*/

#ifndef _MZ700_H_
#define _MZ700_H_

#if defined(_MZ700)
#define DEVICE_NAME		"SHARP MZ-700"
#define CONFIG_NAME		"mz700"
#elif defined(_MZ800)
#define DEVICE_NAME		"SHARP MZ-800"
#define CONFIG_NAME		"mz800"
#elif defined(_MZ1500)
#define DEVICE_NAME		"SHARP MZ-1500"
#define CONFIG_NAME		"mz1500"
#endif
#define CONFIG_VERSION		0x04

// device informations for virtual machine
#if defined(_MZ800)
#define FRAMES_PER_SEC		50
#define LINES_PER_FRAME		312
//#define CPU_CLOCKS		3546900
// 228*312*50
#define CPU_CLOCKS		3556800
#define SCREEN_WIDTH		640
#define SCREEN_HEIGHT		400
#else
#define FRAMES_PER_SEC		60
#define LINES_PER_FRAME		262
//#define CPU_CLOCKS		3579545
// 228*262*60
#define CPU_CLOCKS		3584160
#define SCREEN_WIDTH		320
#define SCREEN_HEIGHT		200
#endif
#define IO_ADDR_MAX		0x100
#define PCM1BIT_HIGH_QUALITY
//#define LOW_PASS_FILTER
#define Z80_MEMORY_WAIT
#if defined(_MZ800) || defined(_MZ1500)
#define MAX_DRIVE		4
#define HAS_MB8876
// 1byte=32clock/3.25MHz*8=79usec
#define Z80SIO_DELAY_SEND	100
#define Z80SIO_DELAY_RECV	100
#endif

// device informations for win32
#define USE_DATAREC
#define USE_DATAREC_BUTTON
#define DATAREC_MZT
#if defined(_MZ800) || defined(_MZ1500)
#define USE_QUICKDISK
#define USE_FD1
#define USE_FD2
#endif
#define USE_SHIFT_NUMPAD_KEY
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		5
#define USE_AUTO_KEY_RELEASE	6
#define USE_AUTO_KEY_CAPS
#if defined(_MZ800)
#define USE_SCANLINE
#define USE_BOOT_MODE
#endif
#if defined(_MZ800) || defined(_MZ1500)
#define USE_ACCESS_LAMP
#endif

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class AND;
class DATAREC;
class I8253;
class I8255;
class IO;
class PCM1BIT;
class Z80;

//class CMOS;
class EMM;
class KEYBOARD;
class MEMORY;
class RAMFILE;

#if defined(_MZ800) || defined(_MZ1500)
class MB8877;
#if defined(_MZ800)
class NOT;
#endif
class SN76489AN;
class Z80PIO;
class Z80SIO;
class FLOPPY;
#if defined(_MZ1500)
class PSG;
#endif
class QUICKDISK;
#endif

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	AND* and_int;
	DATAREC* drec;
	I8253* pit;
	I8255* pio;
	IO* io;
	PCM1BIT* pcm;
	Z80* cpu;
	
//	CMOS* cmos;
	EMM* emm;
	KEYBOARD* keyboard;
	MEMORY* memory;
	RAMFILE* ramfile;
	
#if defined(_MZ800) || defined(_MZ1500)
	AND* and_snd;
	MB8877* fdc;
#if defined(_MZ800)
	NOT* not_pit;
	SN76489AN* psg;
#elif defined(_MZ1500)
	SN76489AN* psg_l;
	SN76489AN* psg_r;
#endif
	Z80PIO* pio_int;
	Z80SIO* sio_rs;	// RS-232C
	Z80SIO* sio_qd;	// QD
	
	FLOPPY* floppy;
#if defined(_MZ1500)
	PSG* psg;
#endif
	QUICKDISK* qd;
#endif
	
#if defined(_MZ800)
	int boot_mode;
#endif
	
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
#if defined(_MZ800) || defined(_MZ1500)
	int access_lamp();
#endif
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// user interface
	void play_datarec(_TCHAR* file_path);
	void rec_datarec(_TCHAR* file_path);
	void close_datarec();
	void push_play();
	void push_stop();
#if defined(_MZ800) || defined(_MZ1500)
	void open_quickdisk(_TCHAR* file_path);
	void close_quickdisk();
	void open_disk(int drv, _TCHAR* file_path, int offset);
	void close_disk(int drv);
	bool disk_inserted(int drv);
#endif
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
