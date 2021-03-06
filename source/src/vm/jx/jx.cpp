/*
	IBM Japan Ltd PC/JX Emulator 'eJX'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2011.05.09-

	[ virtual machine ]
*/

#include "jx.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../hd46505.h"
#include "../i8251.h"
#include "../i8253.h"
#include "../i8255.h"
#include "../i8259.h"
#include "../i86.h"
#include "../io.h"
#include "../memory.h"
#include "../pcm1bit.h"
#include "../sn76489an.h"
#include "../upd765a.h"

#include "display.h"
#include "floppy.h"
#include "keyboard.h"
#include "speaker.h"

// ----------------------------------------------------------------------------
// initialize
// ----------------------------------------------------------------------------

VM::VM(EMU* parent_emu) : emu(parent_emu)
{
	// create devices
	first_device = last_device = NULL;
	dummy = new DEVICE(this, emu);	// must be 1st device
	event = new EVENT(this, emu);	// must be 2nd device
	
	crtc = new HD46505(this, emu);
	sio = new I8251(this, emu);
	pit = new I8253(this, emu);
	pio = new I8255(this, emu);
	pic = new I8259(this, emu);
	cpu = new I86(this, emu);	// 8088
	io = new IO(this, emu);
	mem = new MEMORY(this, emu);
	pcm = new PCM1BIT(this, emu);
	psg = new SN76489AN(this, emu);	// SN76496N
	fdc = new UPD765A(this, emu);
	
	display = new DISPLAY(this, emu);
	floppy = new FLOPPY(this, emu);
	keyboard = new KEYBOARD(this, emu);
	speaker = new SPEAKER(this, emu);
	
	/* IRQ	0 Timer Clock Interrupt
		1 I/O Channel (Reserved)
		2 I/O Channel
		3 Asynchronous Port Interrupt (RS-232C)
		4 Modem Interrupt
		5 Vertical Retrace Interrupt (Display)
		6 Diskette Interrupt (WDT)
		7 I/O Channel (Parallel Printer)
	*/
	
	// set contexts
	event->set_context_cpu(cpu);
	event->set_context_sound(pcm);
	
	// cpu bus
	cpu->set_context_mem(mem);
	cpu->set_context_io(io);
	cpu->set_context_intr(pic);
	
	crtc->set_context_disp(display, SIG_DISPLAY_ENABLE, 1);
	crtc->set_context_vblank(display, SIG_DISPLAY_VBLANK, 1);
	crtc->set_context_vblank(pic, SIG_I8259_IR5, 1);
	
	/* PIT	0 Interrupt
		2 Speaker
	*/
	pit->set_constant_clock(0, CPU_CLOCKS / 4);
#ifdef TIMER_HACK
	pit->set_constant_clock(1, CPU_CLOCKS / 4);
#endif
	pit->set_constant_clock(2, CPU_CLOCKS / 4);
	pit->set_context_ch0(pic, SIG_I8259_IR0, 1);			// to IRQ0
#ifndef TIMER_HACK
	pit->set_context_ch0(keyboard, SIG_KEYBOARD_TIMER, 1);		// to clock of timer1
#endif
	pit->set_context_ch2(pio, SIG_I8255_PORT_C, 0x20);		// to PC5
	pit->set_context_ch2(pcm, SIG_PCM1BIT_SIGNAL, 0x20);		// to speaker
	pio->set_context_port_b(pit, SIG_I8253_GATE_2, 0x01, 0);	// PB0
	pio->set_context_port_b(speaker, SIG_SPEAKER_PIO, 0x62, 0);	// PB1+5+6
	pio->set_context_port_b(display, SIG_DISPLAY_PIO, 0x04, 0);	// PB2
	pic->set_context_cpu(cpu);
	
	display->set_context_mem(mem);
	display->set_regs_ptr(crtc->get_regs());
	floppy->set_context_fdc(fdc);
	floppy->set_context_pic(pic);
	keyboard->set_context_cpu(cpu);
	keyboard->set_context_pio(pio);
	keyboard->set_context_pit(pit);
	speaker->set_context_pcm(pcm);
	speaker->set_context_psg(psg);
	
	// memory bus
	//	00000-7FFFF	RAM
	//	80000-B7FFF	KANJI ROM ???
	//	A0000-A7FFF	EXT-VRAM
	//	B8000-BFFFF	VRAM
	//	D0000-FFFFF	CART+IPL
	
	memset(font, 0xff, sizeof(font));
	memset(kanji, 0xff, sizeof(kanji));
	memset(ram, 0, sizeof(ram));
	memset(ipl, 0xff, sizeof(ipl));
	
	mem->read_bios(_T("FONT.ROM"), font, sizeof(font));
	mem->read_bios(_T("KANJI.ROM"), kanji, sizeof(kanji));
	int length = mem->read_bios(_T("IPL.ROM"), ipl, sizeof(ipl));
	int offset = 0x30000 - length;
	memmove(ipl + offset, ipl, length);
	memset(ipl, 0xff, offset);
	
	mem->set_memory_rw(0x00000, 0x7ffff, ram);
//	mem->set_memory_r(0x80000, 0xb7fff, kanji);
	mem->set_memory_r(0xd0000, 0xfffff, ipl);
	
	display->set_font_ptr(font);
	display->set_kanji_ptr(kanji);
	
	// i/o bus
	for(int i = 0x20; i <= 0x27; i++) {
		io->set_iomap_alias_rw(i, pic, i & 1);
	}
	io->set_iomap_range_rw(0x40, 0x43, pit);
	io->set_iomap_range_rw(0x60, 0x67, pio);
	io->set_iomap_range_rw(0xa0, 0xa7, keyboard);
	io->set_iomap_range_w(0xc0, 0xc7, psg);
	
	io->set_iomap_single_w(0xf2, floppy);
	io->set_iomap_range_rw(0xf4, 0xf5, fdc);
	
	io->set_iomap_single_rw(0x1ff, display);
	
///	io->set_iovalue_range_r(0x200, 0x207, 0);
	
	io->set_iomap_range_rw(0x3d0, 0x3d1, crtc);
	io->set_iomap_range_rw(0x3d4, 0x3d5, crtc);
	io->set_iomap_range_rw(0x3d8, 0x3df, display);
	
	// initialize all devices
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->initialize();
	}
}

VM::~VM()
{
	// delete all devices
	for(DEVICE* device = first_device; device;) {
		DEVICE *next_device = device->next_device;
		device->release();
		delete device;
		device = next_device;
	}
}

DEVICE* VM::get_device(int id)
{
	for(DEVICE* device = first_device; device; device = device->next_device) {
		if(device->this_device_id == id) {
			return device;
		}
	}
	return NULL;
}

// ----------------------------------------------------------------------------
// drive virtual machine
// ----------------------------------------------------------------------------

void VM::reset()
{
	// reset all devices
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->reset();
	}
	
	// initial device settings
	pio->write_signal(SIG_I8255_PORT_C, 0x02, 0x02);	// PC1=1: Modem card is not installed
	pio->write_signal(SIG_I8255_PORT_C, 0x00, 0x04);	// PC2=0: Diskette card is installed
//	pio->write_signal(SIG_I8255_PORT_C, 0x04, 0x04);	// PC2=0: Diskette card is no installed
	pio->write_signal(SIG_I8255_PORT_C, 0x00, 0x08);	// PC3=0: 64KB Memory and Display Expansion is installed
	pio->write_signal(SIG_I8255_PORT_C, 0x00, 0x80);	// PC7=0: Keyboard cable is connected
}

void VM::run()
{
	event->drive();
}

// ----------------------------------------------------------------------------
// draw screen
// ----------------------------------------------------------------------------

void VM::draw_screen()
{
	display->draw_screen();
}

int VM::access_lamp()
{
	uint32 status = fdc->read_signal(0);
	return (status & (1 | 4)) ? 1 : (status & (2 | 8)) ? 2 : 0;
}

// ----------------------------------------------------------------------------
// soud manager
// ----------------------------------------------------------------------------

void VM::initialize_sound(int rate, int samples)
{
	// init sound manager
	event->initialize_sound(rate, samples);
	
	// init sound gen
	pcm->init(rate, 8000);
	psg->init(rate, 3579545, 8000);
}

uint16* VM::create_sound(int* extra_frames)
{
	return event->create_sound(extra_frames);
}

// ----------------------------------------------------------------------------
// notify key
// ----------------------------------------------------------------------------

void VM::key_down(int code, bool repeat)
{
	keyboard->key_down(code);
}

void VM::key_up(int code)
{
	keyboard->key_up(code);
}

// ----------------------------------------------------------------------------
// user interface
// ----------------------------------------------------------------------------

void VM::open_disk(int drv, _TCHAR* file_path, int offset)
{
	fdc->open_disk(drv, file_path, offset);
}

void VM::close_disk(int drv)
{
	fdc->close_disk(drv);
}

bool VM::disk_inserted(int drv)
{
	return fdc->disk_inserted(drv);
}

bool VM::now_skip()
{
	return false;
}

void VM::update_config()
{
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->update_config();
	}
}

