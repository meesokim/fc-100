/*
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2006.09.20 -

	[ HD46505 ]
*/

#include "hd46505.h"

#define EVENT_DISPLAY	0
#define EVENT_HSYNC_S	1
#define EVENT_HSYNC_E	2

void HD46505::initialize()
{
	// initialize
	display = false;
	vblank = vsync = hsync = true;
	
	memset(regs, 0, sizeof(regs));
	ch = 0;
	
	// initial settings for 1st frame
#ifdef CHARS_PER_LINE
	hz_total = (CHARS_PER_LINE > 54) ? CHARS_PER_LINE : 54;
#else
	hz_total = 54;
#endif
	hz_disp = (hz_total > 80) ? 80 : 40;
	hs_start = hz_disp + 4;
	hs_end = hs_start + 4;
	
	vt_total = LINES_PER_FRAME;
	vt_disp = (SCREEN_HEIGHT > LINES_PER_FRAME) ? (SCREEN_HEIGHT >> 1) : SCREEN_HEIGHT;
	vs_start = vt_disp + 16;
	vs_end = vs_start + 16;
	
	timing_changed = false;
	disp_end_clock = 0;
	
#ifdef HD46505_HORIZ_FREQ
	horiz_freq = 0;
	next_horiz_freq = HD46505_HORIZ_FREQ;
#endif
	
	// register events
	register_frame_event(this);
	register_vline_event(this);
}

void HD46505::write_io8(uint32 addr, uint32 data)
{
	if(addr & 1) {
		if(ch < 18) {
			if(ch < 10 && regs[ch] != data) {
				timing_changed = true;
			}
			regs[ch] = data;
		}
	}
	else {
		ch = data;
	}
}

uint32 HD46505::read_io8(uint32 addr)
{
	if(addr & 1) {
		return (12 <= ch && ch < 18) ? regs[ch] : 0xff;
	}
	else {
		return ch;
	}
}

void HD46505::event_pre_frame()
{
	if(timing_changed) {
		int ch_height = (regs[9] & 0x1f) + 1;
		
		hz_total = regs[0] + 1;
		hz_disp = regs[1];
		hs_start = regs[2];
		hs_end = hs_start + (regs[3] & 0x0f);
		
		int new_vt_total = ((regs[4] & 0x7f) + 1) * ch_height + (regs[5] & 0x1f);
		vt_disp = (regs[6] & 0x7f) * ch_height;
		vs_start = ((regs[7] & 0x7f) + 1) * ch_height;
		vs_end = vs_start + ((regs[3] & 0xf0) ? (regs[3] >> 4) : 16);
		
		if(vt_total != new_vt_total) {
			vt_total = new_vt_total;
			set_lines_per_frame(vt_total);
		}
		timing_changed = false;
		disp_end_clock = 0;
#ifdef HD46505_HORIZ_FREQ
		horiz_freq = 0;
#endif
	}
#ifdef HD46505_HORIZ_FREQ
	if(horiz_freq != next_horiz_freq) {
		uint8 r8=regs[8]&3;
		horiz_freq = next_horiz_freq;
		frames_per_sec = (double)horiz_freq / (double)vt_total;
		if(regs[8] & 1) {
			frames_per_sec *= 2; // interlace mode
		}
		set_frames_per_sec(frames_per_sec);
	}
#endif
}

void HD46505::update_timing(int new_clocks, double new_frames_per_sec, int new_lines_per_frame)
{
	cpu_clocks = new_clocks;
#ifndef HD46505_HORIZ_FREQ
	frames_per_sec = new_frames_per_sec;
#endif
	
	// update event clocks
	disp_end_clock = 0;
}

void HD46505::event_frame()
{
	// update envet clocks after update_timing() is called
	if(disp_end_clock == 0 && vt_total != 0) {
		disp_end_clock = (int)((double)cpu_clocks * (double)hz_disp / frames_per_sec / (double)vt_total / (double)hz_total);
		hs_start_clock = (int)((double)cpu_clocks * (double)hs_start / frames_per_sec / (double)vt_total / (double)hz_total);
		hs_end_clock = (int)((double)cpu_clocks * (double)hs_end / frames_per_sec / (double)vt_total / (double)hz_total);
	}
}

void HD46505::event_vline(int v, int clock)
{
	// if vt_disp == 0, raise vblank for one line
	bool new_vblank = ((v < vt_disp) || (v == 0 && vt_disp == 0));
	
	// display
	if(outputs_disp.count) {
		set_display(new_vblank);
		if(new_vblank && hz_disp < hz_total) {
			register_event_by_clock(this, EVENT_DISPLAY, disp_end_clock, false, NULL);
		}
	}
	
	// vblank
	set_vblank(new_vblank);	// active low
	
	// vsync
	set_vsync(vs_start <= v && v < vs_end);
	
	// hsync
	if(outputs_hsync.count && hs_start < hs_end && hs_end < hz_total) {
		set_hsync(false);
		register_event_by_clock(this, EVENT_HSYNC_S, hs_start_clock, false, NULL);
		register_event_by_clock(this, EVENT_HSYNC_E, hs_end_clock, false, NULL);
	}
}

void HD46505::event_callback(int event_id, int err)
{
	if(event_id == EVENT_DISPLAY) {
		set_display(false);
	}
	else if(event_id == EVENT_HSYNC_S) {
		set_hsync(true);
	}
	else if(event_id == EVENT_HSYNC_E) {
		set_hsync(false);
	}
}

void HD46505::set_display(bool val)
{
	if(display != val) {
		write_signals(&outputs_disp, val ? 0xffffffff : 0);
		display = val;
	}
}

void HD46505::set_vblank(bool val)
{
	if(vblank != val) {
		write_signals(&outputs_vblank, val ? 0xffffffff : 0);
		vblank = val;
	}
}

void HD46505::set_vsync(bool val)
{
	if(vsync != val) {
		write_signals(&outputs_vsync, val ? 0xffffffff : 0);
		vsync = val;
	}
}

void HD46505::set_hsync(bool val)
{
	if(hsync != val) {
		write_signals(&outputs_hsync, val ? 0xffffffff : 0);
		hsync = val;
	}
}

