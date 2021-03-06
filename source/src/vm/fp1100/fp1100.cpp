/*
	CASIO FP-1100 Emulator 'eFP-1100'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.06.18-

	[ virtual machine ]
*/

#include "fp1100.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../beep.h"
#include "../hd46505.h"
#include "../upd765a.h"
#include "../upd7801.h"
#include "../z80.h"

#include "main.h"
#include "sub.h"
#include "fdcpack.h"
#include "rampack.h"
#include "rompack.h"

// ----------------------------------------------------------------------------
// initialize
// ----------------------------------------------------------------------------

VM::VM(EMU* parent_emu) : emu(parent_emu)
{
	// create devices
	first_device = last_device = NULL;
	dummy = new DEVICE(this, emu);	// must be 1st device
	event = new EVENT(this, emu);	// must be 2nd device
	
	beep = new BEEP(this, emu);
	crtc = new HD46505(this, emu);
	fdc = new UPD765A(this, emu);
	subcpu = new UPD7801(this, emu);
	cpu = new Z80(this, emu);
	
	main = new MAIN(this, emu);
	sub = new SUB(this, emu);
	fdcpack = new FDCPACK(this, emu);
	rampack1 = new RAMPACK(this, emu);
	rampack1->index = 1;
	rampack2 = new RAMPACK(this, emu);
	rampack2->index = 2;
	rampack3 = new RAMPACK(this, emu);
	rampack3->index = 3;
	rampack4 = new RAMPACK(this, emu);
	rampack4->index = 4;
	rampack5 = new RAMPACK(this, emu);
	rampack5->index = 5;
	rampack6 = new RAMPACK(this, emu);
	rampack6->index = 6;
	rompack = new ROMPACK(this, emu);
	
	// set contexts
	event->set_context_cpu(cpu);
	event->set_context_cpu(subcpu, SUB_CPU_CLOCKS);
	event->set_context_sound(beep);
	
	crtc->set_context_hsync(sub, SIG_SUB_HSYNC, 1);
	fdc->set_context_drq(main, SIG_MAIN_INTA, 1);
	fdc->set_context_irq(main, SIG_MAIN_INTB, 1);
#ifdef _FDC_DEBUG_LOG
	fdc->set_context_cpu(cpu);
#endif
	
	main->set_context_cpu(cpu);
	main->set_context_sub(sub);
	main->set_context_slot(0, rampack1);
	main->set_context_slot(1, rampack2);
	main->set_context_slot(2, rampack3);
	main->set_context_slot(3, rampack4);
	main->set_context_slot(4, rampack5);
	main->set_context_slot(5, rampack6);
	main->set_context_slot(6, rompack);
	main->set_context_slot(7, fdcpack);
	
	sub->set_context_cpu(subcpu);
	sub->set_context_main(main);
	sub->set_context_beep(beep);
	sub->set_context_crtc(crtc, crtc->get_regs());
	
	fdcpack->set_context_fdc(fdc);
	
	// cpu bus
	cpu->set_context_mem(main);
	cpu->set_context_io(main);
	cpu->set_context_intr(main);
	subcpu->set_context_mem(sub);
	subcpu->set_context_io(sub);
	
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
}

void VM::run()
{
	event->drive();
}

double VM::frame_rate()
{
	return event->frame_rate();
}

// ----------------------------------------------------------------------------
// draw screen
// ----------------------------------------------------------------------------

void VM::draw_screen()
{
	sub->draw_screen();
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
	beep->init(rate, 2400, 8000);
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
	sub->key_down(code);
}

void VM::key_up(int code)
{
	sub->key_up(code);
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

void VM::play_datarec(_TCHAR* file_path)
{
	sub->play_datarec(file_path);
}

void VM::rec_datarec(_TCHAR* file_path)
{
	sub->rec_datarec(file_path);
}

void VM::close_datarec()
{
	sub->close_datarec();
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

