/*
	GoldStar FC-100 Emulator
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ virtual machine ]
*/

#include "fc100.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../i8251.h"
#include "../datarec.h"
#include "../io.h"
#include "../mc6847.h"
#include "../not.h"
#include "../ym2203.h"
#include "../z80.h"

#include "joystick.h"
#include "keyboard.h"
#include "memory.h"
#include "system.h"
#include "../../config.h"


// ----------------------------------------------------------------------------
// initialize
// ----------------------------------------------------------------------------

VM::VM(EMU* parent_emu) : emu(parent_emu)
{
	// create devices
	first_device = last_device = NULL;
	dummy = new DEVICE(this, emu);	// must be 1st device
	event = new EVENT(this, emu);	// must be 2nd device
	
	sio = new I8251(this, emu);
	drec = new DATAREC(this, emu);
	io = new IO(this, emu);
	vdp = new MC6847(this, emu);
	not = new NOT(this, emu);
	psg = new YM2203(this, emu);
	cpu = new Z80(this, emu);
	
	joystick = new JOYSTICK(this, emu);
	keyboard = new KEYBOARD(this, emu);
	memory = new MEMORY(this, emu);
	system = new SYSTEM(this, emu);
	
	// set contexts
	event->set_context_cpu(cpu);
	event->set_context_sound(psg);

	vdp->set_vram_ptr(memory->get_vram(), 0x1800);
	vdp->set_font_ptr(memory->get_cgrom(), memory->get_pcgram());
	vdp->set_context_vsync(not, SIG_NOT_INPUT, 1);
	not->set_context_out(cpu, SIG_CPU_IRQ, 1);

	joystick->set_context_psg(psg);
	system->set_context_drec(drec);
	system->set_context_vdp(vdp);
	
	// cpu bus
	cpu->set_context_mem(memory);
	cpu->set_context_io(io);
	cpu->set_context_intr(dummy);
	
	sio->set_context_out(drec, SIG_DATAREC_OUT);
	drec->set_context_out(sio, SIG_I8251_RECV, 1);

	// i/o bus
	io->set_iomap_range_r(0x00, 0x0f, keyboard);
	io->set_iomap_range_w(0x10, 0x1f, system);
	io->set_iomap_range_w(0x30, 0x3f, system);
	for(int i = 0x20; i < 0x30; i += 4) {
		io->set_iomap_alias_w(i+1, psg, 1);
		io->set_iomap_alias_r(i+2, psg, 1);
		io->set_iomap_alias_w(i+3, psg, 0);
	}
	io->set_iomap_range_w(0x60, 0x7f, memory);
	io->set_iomap_alias_rw(0xb0, sio, 0);
	io->set_iomap_alias_rw(0xb8, sio, 1);

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
	memory->readrom(config.device_type);
	// reset all devices
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->reset();
	}
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
	vdp->draw_screen();
}

// ----------------------------------------------------------------------------
// soud manager
// ----------------------------------------------------------------------------

void VM::initialize_sound(int rate, int samples)
{
	// init sound manager
	event->initialize_sound(rate, samples);
	
	// init sound gen
	psg->init(rate, CPU_CLOCKS / 2, samples, 0, 0);
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
	keyboard->set_keyboard();
}

void VM::key_up(int code)
{
	keyboard->set_keyboard();
}

// ----------------------------------------------------------------------------
// user interface
// ----------------------------------------------------------------------------

void VM::play_datarec(_TCHAR* file_path)
{
	drec->play_datarec(file_path);
}

void VM::rec_datarec(_TCHAR* file_path)
{
	drec->rec_datarec(file_path);
}

void VM::close_datarec()
{
	drec->close_datarec();
}

bool VM::now_skip()
{
	return drec->skip();
}

void VM::update_config()
{
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->update_config();
	}
}
