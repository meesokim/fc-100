/*
	SHARP MZ-2500 Emulator 'EmuZ-2500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.11.24 -

	[ virtual machine ]
*/

#ifndef _MZ2500_H_
#define _MZ2500_H_

#define DEVICE_NAME		"SHARP MZ-2500"
#define CONFIG_NAME		"mz2500"
#define CONFIG_VERSION		0x02

// device informations for virtual machine
#define FRAMES_PER_SEC		55.4
#define LINES_PER_FRAME 	440
#define CHARS_PER_LINE		108
#define CPU_CLOCKS		6000000
#define SCREEN_WIDTH		640
#define SCREEN_HEIGHT		400
#define MAX_DRIVE		4
#define HAS_MB8876
#define HAS_RP5C15
#define TIMER_FREQ
#define DATAREC_SOUND

// memory wait
#define Z80_MEMORY_WAIT
#define Z80_IO_WAIT
#define VRAM_WAIT

// irq priority
#define IRQ_Z80PIO		0
#define IRQ_Z80SIO		1
#define IRQ_CRTC		2
#define IRQ_I8253		3
#define IRQ_PRINTER		4
#define IRQ_RP5C15		5

// device informations for win32
#define USE_SPECIAL_RESET
#define USE_FD1
#define USE_FD2
#define USE_FD3
#define USE_FD4
#define USE_DATAREC
#define USE_SOCKET
#define USE_SHIFT_NUMPAD_KEY
#define USE_ALT_F10_KEY
#define USE_AUTO_KEY		5
#define USE_AUTO_KEY_RELEASE	6
#define USE_SCANLINE
#define USE_MONITOR_TYPE	4
#define USE_ACCESS_LAMP

#include "../../common.h"

class EMU;
class DEVICE;
class EVENT;

class DATAREC;
class I8253;
class I8255;
class IO;
class MB8877;
class PCM1BIT;
class RP5C01;
class W3100A;
class YM2203;
class Z80;
class Z80PIO;
class Z80SIO;

class CALENDAR;
class CASSETTE;
class CRTC;
class EMM;
class EXTROM;
class FLOPPY;
class INTERRUPT;
class JOYSTICK;
class KANJI;
class KEYBOARD;
class MEMORY;
class MOUSE;
class ROMFILE;
class SASI;
class TIMER;
class VOICE;

class VM
{
protected:
	EMU* emu;
	
	// devices
	EVENT* event;
	
	DATAREC* drec;
	I8253* pit;
	I8255* pio0;
	IO* io;
	MB8877* fdc;
	PCM1BIT* pcm;
	RP5C01* rtc;
	W3100A* w3100a;
	YM2203* opn;
	Z80* cpu;
	Z80PIO* pio1;
	Z80SIO* sio;
	
	CALENDAR* calendar;
	CASSETTE* cassette;
	CRTC* crtc;
	EMM* emm;
	EXTROM* extrom;
	FLOPPY* floppy;
	INTERRUPT* interrupt;
	JOYSTICK* joystick;
	KANJI* kanji;
	KEYBOARD* keyboard;
	MEMORY* memory;
	MOUSE* mouse;
	ROMFILE* romfile;
	SASI* sasi;
	TIMER* timer;
	VOICE* voice;
	
	// monitor type cache
	int monitor_type;
	
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
	void special_reset();
	void run();
	
	// draw screen
	void draw_screen();
	int access_lamp();
	
	// sound generation
	void initialize_sound(int rate, int samples);
	uint16* create_sound(int* extra_frames);
	
	// socket
	void network_connected(int ch);
	void network_disconnected(int ch);
	uint8* get_sendbuffer(int ch, int* size);
	void inc_sendbuffer_ptr(int ch, int size);
	uint8* get_recvbuffer0(int ch, int* size0, int* size1);
	uint8* get_recvbuffer1(int ch);
	void inc_recvbuffer_ptr(int ch, int size);
	
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
