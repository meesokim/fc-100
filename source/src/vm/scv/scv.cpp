/*
	EPOCH Super Cassette Vision Emulator 'eSCV'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.08.21 -

	[ virtual machine ]
*/

#include "scv.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../upd7801.h"

#include "io.h"
#include "memory.h"
#include "sound.h"
#include "vdp.h"

// ----------------------------------------------------------------------------
// initialize
// ----------------------------------------------------------------------------

VM::VM(EMU* parent_emu) : emu(parent_emu)
{
	// create devices
	first_device = last_device = NULL;
	dummy = new DEVICE(this, emu);	// must be 1st device
	event = new EVENT(this, emu);	// must be 2nd device
	
	cpu = new UPD7801(this, emu);
	
	io = new IO(this, emu);
	memory = new MEMORY(this, emu);
	sound = new SOUND(this, emu);
	vdp = new VDP(this, emu);
	
	// set contexts
	event->set_context_cpu(cpu);
	event->set_context_sound(sound);
	
	io->set_context_mem(memory);
	io->set_context_sound(sound);
	memory->set_context_sound(sound);
	sound->set_context_cpu(cpu);
	vdp->set_context_cpu(cpu);
	vdp->set_font_ptr(memory->get_font());
	vdp->set_vram_ptr(memory->get_vram());
	
	// cpu bus
	cpu->set_context_mem(memory);
	cpu->set_context_io(io);
	
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
	sound->init(rate);
}

uint16* VM::create_sound(int* extra_frames)
{
	return event->create_sound(extra_frames);
}

// ----------------------------------------------------------------------------
// user interface
// ----------------------------------------------------------------------------

void VM::open_cart(_TCHAR* file_path)
{
	memory->open_cart(file_path);
	reset();
}

void VM::close_cart()
{
	memory->close_cart();
	reset();
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

