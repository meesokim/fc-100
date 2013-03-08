/*
	SHARP MZ-2500 Emulator 'EmuZ-2500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.11.24 -

	[ virtual machine ]
*/

#include "mz2500.h"
#include "../../emu.h"
#include "../device.h"
#include "../event.h"

#include "../datarec.h"
#include "../i8253.h"
#include "../i8255.h"
#include "../io.h"
#include "../mb8877.h"
#include "../pcm1bit.h"
#include "../rp5c01.h"
#include "../w3100a.h"
#include "../ym2203.h"
#include "../z80.h"
#include "../z80pio.h"
#include "../z80sio.h"

#include "calendar.h"
#include "cassette.h"
#include "crtc.h"
#include "emm.h"
#include "extrom.h"
#include "floppy.h"
#include "interrupt.h"
#include "joystick.h"
#include "kanji.h"
#include "keyboard.h"
#include "memory.h"
#include "mouse.h"
#include "romfile.h"
#include "sasi.h"
#include "timer.h"
#include "voice.h"

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
	
	drec = new DATAREC(this, emu);
	pit = new I8253(this, emu);
	pio0 = new I8255(this, emu);
	io = new IO(this, emu);
	fdc = new MB8877(this, emu);
	pcm = new PCM1BIT(this, emu);
	rtc = new RP5C01(this, emu);	// RP-5C15
	w3100a = new W3100A(this, emu);
	opn = new YM2203(this, emu);
	cpu = new Z80(this, emu);
	pio1 = new Z80PIO(this, emu);
	sio = new Z80SIO(this, emu);
	
	calendar = new CALENDAR(this, emu);
	cassette = new CASSETTE(this, emu);
	crtc = new CRTC(this, emu);
	emm = new EMM(this, emu);
	extrom = new EXTROM(this, emu);
	floppy = new FLOPPY(this, emu);
	interrupt = new INTERRUPT(this, emu);
	joystick = new JOYSTICK(this, emu);
	kanji = new KANJI(this, emu);
	keyboard = new KEYBOARD(this, emu);
	memory = new MEMORY(this, emu);
	mouse = new MOUSE(this, emu);
	romfile = new ROMFILE(this, emu);
	sasi = new SASI(this, emu);
	timer = new TIMER(this, emu);
	voice = new VOICE(this, emu);
	
	// set contexts
	event->set_context_cpu(cpu);
	event->set_context_sound(opn);
	event->set_context_sound(pcm);
	event->set_context_sound(drec);
	
	drec->set_context_out(cassette, SIG_CASSETTE_OUT, 1);
	drec->set_context_remote(cassette, SIG_CASSETTE_REMOTE, 1);
	drec->set_context_end(cassette, SIG_CASSETTE_END, 1);
	drec->set_context_top(cassette, SIG_CASSETTE_TOP, 1);
	
	pit->set_context_ch0(interrupt, SIG_INTERRUPT_I8253, 1);
	pit->set_context_ch0(pit, SIG_I8253_CLOCK_1, 1);
	pit->set_context_ch1(pit, SIG_I8253_CLOCK_2, 1);
#ifdef TIMER_FREQ
	pit->set_constant_clock(0, 31250);
#endif
	pio0->set_context_port_a(cassette, SIG_CASSETTE_PIO_PA, 0xff, 0);
	pio0->set_context_port_c(cassette, SIG_CASSETTE_PIO_PC, 0xff, 0);
	pio0->set_context_port_c(crtc, SIG_CRTC_MASK, 0x01, 0);
	pio0->set_context_port_c(pcm, SIG_PCM1BIT_SIGNAL, 0x04, 0);
#ifdef _FDC_DEBUG_LOG
	fdc->set_context_cpu(cpu);
#endif
	rtc->set_context_alarm(interrupt, SIG_INTERRUPT_RP5C15, 1);
	rtc->set_context_pulse(opn, SIG_YM2203_PORT_B, 8);
	opn->set_context_port_a(floppy, SIG_FLOPPY_REVERSE, 0x02, 0);
	opn->set_context_port_a(crtc, SIG_CRTC_PALLETE, 0x04, 0);
	opn->set_context_port_a(mouse, SIG_MOUSE_SEL, 0x08, 0);
	pio1->set_context_port_a(crtc, SIG_CRTC_COLUMN_SIZE, 0x20, 0);
	pio1->set_context_port_a(keyboard, SIG_KEYBOARD_COLUMN, 0xff, 0);
	sio->set_context_dtr1(mouse, SIG_MOUSE_DTR, 1);
	
	calendar->set_context_rtc(rtc);
	cassette->set_context_pio(pio0);
	cassette->set_context_datarec(drec);
	crtc->set_context_mem(memory);
	crtc->set_context_int(interrupt);
	crtc->set_context_pio(pio0);
	crtc->set_vram_ptr(memory->get_vram());
	crtc->set_tvram_ptr(memory->get_tvram());
	crtc->set_kanji_ptr(memory->get_kanji());
	crtc->set_pcg_ptr(memory->get_pcg());
	floppy->set_context_fdc(fdc);
	keyboard->set_context_pio0(pio0);
	keyboard->set_context_pio1(pio1);
	memory->set_context_cpu(cpu);
	memory->set_context_crtc(crtc);
	mouse->set_context_sio(sio);
	timer->set_context_pit(pit);
	
	// cpu bus
	cpu->set_context_mem(memory);
	cpu->set_context_io(io);
	cpu->set_context_intr(pio1);
	
	// z80 family daisy chain
	pio1->set_context_intr(cpu, 0);
	pio1->set_context_child(sio);
	sio->set_context_intr(cpu, 1);
	sio->set_context_child(interrupt);
	interrupt->set_context_intr(cpu, 2);
	
	// i/o bus
	io->set_iomap_range_rw(0x60, 0x63, w3100a);
	io->set_iomap_range_rw(0xa0, 0xa3, sio);
	io->set_iomap_range_rw(0xa4, 0xa5, sasi);
	io->set_iomap_range_rw(0xa8, 0xa9, romfile);
	io->set_iomap_range_rw(0xac, 0xad, emm);
	io->set_iomap_single_w(0xae, crtc);
	io->set_iomap_range_rw(0xb0, 0xb3, sio);
	io->set_iomap_range_rw(0xb4, 0xb5, memory);
	io->set_iomap_range_rw(0xb8, 0xb9, kanji);
	io->set_iomap_range_rw(0xbc, 0xbf, crtc);
	io->set_iomap_range_w(0xc6, 0xc7, interrupt);
	io->set_iomap_range_rw(0xc8, 0xc9, opn);
	io->set_iomap_single_rw(0xca, voice);
	io->set_iomap_single_rw(0xcc, calendar);
	io->set_iomap_range_w(0xce, 0xcf, memory);
	io->set_iomap_range_rw(0xd8, 0xdb, fdc);
	io->set_iomap_range_w(0xdc, 0xdd, floppy);
	io->set_iomap_single_rw(0xe0, pio0);
	io->set_iomap_single_r(0xe1, pio0);
	io->set_iomap_single_w(0xe1, cassette);	// this is not i8255 port-b
	io->set_iomap_single_rw(0xe2, pio0);
	io->set_iomap_single_w(0xe3, pio0);
	io->set_iomap_range_rw(0xe4, 0xe7, pit);
	io->set_iomap_range_rw(0xe8, 0xeb, pio1);
	io->set_iomap_single_rw(0xef, joystick);
	io->set_iomap_range_w(0xf0, 0xf3, timer);
	io->set_iomap_range_rw(0xf4, 0xf7, crtc);
	io->set_iomap_range_rw(0xf8, 0xf9, extrom);
	
	io->set_iowait_range_rw(0xc8, 0xc9, 1);
	io->set_iowait_single_rw(0xcc, 3);
	io->set_iowait_range_rw(0xd8, 0xdf, 1);
	io->set_iowait_range_rw(0xe8, 0xeb, 1);
	
	// initialize all devices
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->initialize();
	}
	monitor_type = config.monitor_type;
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
	
	// set initial port status
	opn->write_signal(SIG_YM2203_PORT_B, (monitor_type & 2) ? 0x77 : 0x37, 0xff);
}

void VM::special_reset()
{
	// reset all devices
	for(DEVICE* device = first_device; device; device = device->next_device) {
		device->special_reset();
	}
	
	// set initial port status
	opn->write_signal(SIG_YM2203_PORT_B, (monitor_type & 2) ? 0x77 : 0x37, 0xff);
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
	crtc->draw_screen();
}

int VM::access_lamp()
{
	uint32 status = fdc->read_signal(0) | sasi->read_signal(0);
	return (status & 0x30) ? 4 : (status & (1 | 4)) ? 1 : (status & (2 | 8)) ? 2 : 0;
}

// ----------------------------------------------------------------------------
// soud manager
// ----------------------------------------------------------------------------

void VM::initialize_sound(int rate, int samples)
{
	// init sound manager
	event->initialize_sound(rate, samples);
	
	// init sound gen
	opn->init(rate, 2000000, samples, 0, -8);
	pcm->init(rate, 4096);
	drec->initialize_sound(rate, samples);
}

uint16* VM::create_sound(int* extra_frames)
{
	return event->create_sound(extra_frames);
}

// ----------------------------------------------------------------------------
// socket
// ----------------------------------------------------------------------------

void VM::network_connected(int ch)
{
	w3100a->connected(ch);
}

void VM::network_disconnected(int ch)
{
	w3100a->disconnected(ch);
}

uint8* VM::get_sendbuffer(int ch, int* size)
{
	return w3100a->get_sendbuffer(ch, size);
}

void VM::inc_sendbuffer_ptr(int ch, int size)
{
	w3100a->inc_sendbuffer_ptr(ch, size);
}

uint8* VM::get_recvbuffer0(int ch, int* size0, int* size1)
{
	return w3100a->get_recvbuffer0(ch, size0, size1);
}

uint8* VM::get_recvbuffer1(int ch)
{
	return w3100a->get_recvbuffer1(ch);
}

void VM::inc_recvbuffer_ptr(int ch, int size)
{
	w3100a->inc_recvbuffer_ptr(ch, size);
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
	bool value = drec->play_datarec(file_path);
	cassette->close_datarec();
	cassette->play_datarec(value);
}

void VM::rec_datarec(_TCHAR* file_path)
{
	bool value = drec->rec_datarec(file_path);
	cassette->close_datarec();
	cassette->rec_datarec(value);
}

void VM::close_datarec()
{
	drec->close_datarec();
	cassette->close_datarec();
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

