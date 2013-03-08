/*
	NEC PC-8801MA Emulator 'ePC-8801MA'
	NEC PC-8001mkIISR Emulator 'ePC-8001mkIISR'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2012.02.16-

	[ virtual machine ]
*/

#include "pc8801.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../beep.h"
#include "../i8251.h"
#include "../i8255.h"
#include "../pcm1bit.h"
#include "../upd1990a.h"
#include "../ym2203.h"
#include "../z80.h"

#include "../disk.h"
#include "../pc80s31k.h"
#include "../upd765a.h"

#include "pc88.h"

#include "../../config.h"

// ----------------------------------------------------------------------------
// initialize
// ----------------------------------------------------------------------------

VM::VM(EMU* parent_emu) : emu(parent_emu)
{
	// check configs
	boot_mode = config.boot_mode;
	
	// create devices
	first_device = last_device = NULL;
	dummy = new DEVICE(this, emu);	// must be 1st device
	
	pc88event = new EVENT(this, emu);
//	pc88event->set_frames_per_sec(60);
//	pc88event->set_lines_per_frame(260);
	
	pc88 = new PC88(this, emu);
//	pc88->set_context_event_manager(pc88event);
	pc88beep = new BEEP(this, emu);
//	pc88beep->set_context_event_manager(pc88event);
	pc88sio = new I8251(this, emu);
//	pc88sio->set_context_event_manager(pc88event);
	pc88pio = new I8255(this, emu);
//	pc88pio->set_context_event_manager(pc88event);
	pc88pcm = new PCM1BIT(this, emu);
//	pc88pcm->set_context_event_manager(pc88event);
	pc88rtc = new UPD1990A(this, emu);
//	pc88rtc->set_context_event_manager(pc88event);
	pc88opn = new YM2203(this, emu);
//	pc88opn->set_context_event_manager(pc88event);
	pc88cpu = new Z80(this, emu);
//	pc88cpu->set_context_event_manager(pc88event);
	
	pc88sub = new PC80S31K(this, emu);
//	pc88sub->set_context_event_manager(pc88event);
	pc88pio_sub = new I8255(this, emu);
//	pc88pio_sub->set_context_event_manager(pc88event);
	pc88fdc_sub = new UPD765A(this, emu);
//	pc88fdc_sub->set_context_event_manager(pc88event);
	pc88cpu_sub = new Z80(this, emu);
//	pc88cpu_sub->set_context_event_manager(pc88event);
	
#ifdef SUPPORT_PC88_HIGH_CLOCK
	pc88event->set_context_cpu(pc88cpu, config.cpu_clock_low ? 3993600 : 7987200);
#else
	pc88event->set_context_cpu(pc88cpu, 3993600);
#endif
	pc88event->set_context_cpu(pc88cpu_sub, 3993600);
	pc88event->set_context_sound(pc88beep);
	pc88event->set_context_sound(pc88opn);
	pc88event->set_context_sound(pc88pcm);
	
	pc88->set_context_beep(pc88beep);
	pc88->set_context_cpu(pc88cpu);
	pc88->set_context_opn(pc88opn);
	pc88->set_context_pcm(pc88pcm);
	pc88->set_context_pio(pc88pio);
	pc88->set_context_rtc(pc88rtc);
	pc88->set_context_sio(pc88sio);
	pc88cpu->set_context_mem(pc88);
	pc88cpu->set_context_io(pc88);
	pc88cpu->set_context_intr(pc88);
	pc88opn->set_context_irq(pc88, SIG_PC88_SOUND_IRQ, 1);
	pc88sio->set_context_rxrdy(pc88, SIG_PC88_USART_IRQ, 1);
	pc88sio->set_context_out(pc88, SIG_PC88_USART_OUT);
	
	pc88sub->set_context_cpu(pc88cpu_sub);
	pc88sub->set_context_fdc(pc88fdc_sub);
	pc88sub->set_context_pio(pc88pio_sub);
	pc88pio->set_context_port_a(pc88pio_sub, SIG_I8255_PORT_B, 0xff, 0);
	pc88pio->set_context_port_b(pc88pio_sub, SIG_I8255_PORT_A, 0xff, 0);
	pc88pio->set_context_port_c(pc88pio_sub, SIG_I8255_PORT_C, 0x0f, 4);
	pc88pio->set_context_port_c(pc88pio_sub, SIG_I8255_PORT_C, 0xf0, -4);
	pc88pio->clear_ports_by_cmdreg = true;
	pc88pio_sub->set_context_port_a(pc88pio, SIG_I8255_PORT_B, 0xff, 0);
	pc88pio_sub->set_context_port_b(pc88pio, SIG_I8255_PORT_A, 0xff, 0);
	pc88pio_sub->set_context_port_c(pc88pio, SIG_I8255_PORT_C, 0x0f, 4);
	pc88pio_sub->set_context_port_c(pc88pio, SIG_I8255_PORT_C, 0xf0, -4);
	pc88pio_sub->clear_ports_by_cmdreg = true;
	pc88fdc_sub->set_context_irq(pc88cpu_sub, SIG_CPU_IRQ, 1);
#ifdef _FDC_DEBUG_LOG
	pc88fdc_sub->set_context_cpu(pc88cpu_sub);
#endif
	pc88cpu_sub->set_context_mem(pc88sub);
	pc88cpu_sub->set_context_io(pc88sub);
	pc88cpu_sub->set_context_intr(pc88sub);
	
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
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->reset();
	}
	
	// initial device settings
	pc88opn->SetReg(0x29, 3); // for Misty Blue
	pc88pio->write_signal(SIG_I8255_PORT_C, 0, 0xff);
	pc88pio_sub->write_signal(SIG_I8255_PORT_C, 0, 0xff);
}

void VM::run()
{
	pc88event->drive();
}

double VM::frame_rate()
{
	return pc88event->frame_rate();
}

// ----------------------------------------------------------------------------
// draw screen
// ----------------------------------------------------------------------------

void VM::draw_screen()
{
	pc88->draw_screen();
}

int VM::access_lamp()
{
	return pc88fdc_sub->read_signal(0);
}

// ----------------------------------------------------------------------------
// soud manager
// ----------------------------------------------------------------------------

void VM::initialize_sound(int rate, int samples)
{
	// init sound manager
	pc88event->initialize_sound(rate, samples);
	
	// init sound gen
	pc88beep->init(rate, 2400, 8000);
#ifdef HAS_YM2608
	pc88opn->init(rate, 7987248, samples, 0, 0);
#else
	pc88opn->init(rate, 3993624, samples, 0, 0);
#endif
	pc88pcm->init(rate, 8000);
}

uint16* VM::create_sound(int* extra_frames)
{
	return pc88event->create_sound(extra_frames);
}

// ----------------------------------------------------------------------------
// notify key
// ----------------------------------------------------------------------------

void VM::key_down(int code, bool repeat)
{
	pc88->key_down(code, repeat);
}

void VM::key_up(int code)
{
}

// ----------------------------------------------------------------------------
// user interface
// ----------------------------------------------------------------------------

void VM::open_disk(int drv, _TCHAR* file_path, int offset)
{
	pc88fdc_sub->open_disk(drv, file_path, offset);
}

void VM::close_disk(int drv)
{
	pc88fdc_sub->close_disk(drv);
}

bool VM::disk_inserted(int drv)
{
	return pc88fdc_sub->disk_inserted(drv);
}

void VM::play_datarec(_TCHAR* file_path)
{
	pc88->play_datarec(file_path);
}

void VM::rec_datarec(_TCHAR* file_path)
{
	pc88->rec_datarec(file_path);
}

void VM::close_datarec()
{
	pc88->close_datarec();
}

bool VM::now_skip()
{
	return pc88->now_skip();
}

void VM::update_config()
{
	if(boot_mode != config.boot_mode) {
		// boot mode is changed !!!
		boot_mode = config.boot_mode;
		reset();
	}
	else {
		for(DEVICE* device = first_device; device; device = device->next_device) {
			device->update_config();
		}
	}
}

