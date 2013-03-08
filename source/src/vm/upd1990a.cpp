/*
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2008.04.19-

	[ uPD1990A / uPD4990A ]
*/

#include "upd1990a.h"

#define EVENT_1SEC	0
#define EVENT_TP	1

void UPD1990A::initialize()
{
	// initialize rtc
	emu->get_host_time(&cur_time);
	
	// register events
	register_event(this, EVENT_1SEC, 1000000.0, true, &register_id_1sec);
	register_id_tp = -1;
}

void UPD1990A::write_signal(int id, uint32 data, uint32 mask)
{
	if(id == SIG_UPD1990A_CLK) {
		bool next = ((data & mask) != 0);
		if(!clk && next) {
			if((mode & 0x0f) == 1) {
				uint64 bit = 1;
#ifdef HAS_UPD4990A
				if(mode & 0x80) {
					bit <<= (52 - 1);
				} else {
#endif
					bit <<= (40 - 1);
#ifdef HAS_UPD4990A
				}
#endif
				shift_data >>= 1;
				if(din) {
					shift_data |= bit;
				} else {
					shift_data &= ~bit;
				}
				// output LSB
				write_signals(&outputs_dout, (shift_data & 1) ? 0xffffffff : 0);
			}
#ifdef HAS_UPD4990A
			shift_cmd = (shift_cmd >> 1) | (din ? 8 : 0);
#endif
		}
		clk = next;
	}
	else if(id == SIG_UPD1990A_STB) {
		bool next = ((data & mask) != 0);
		if(!stb && next && !clk) {
#ifdef HAS_UPD4990A
			if(cmd == 7) {
				mode = shift_cmd | 0x80;
			} else {
#endif
				mode = cmd;
#ifdef HAS_UPD4990A
			}
#endif
			switch(mode & 0x0f) {
			case 0x02:
				{
					uint64 tmp = shift_data;
					cur_time.second = FROM_BCD(tmp);
					tmp >>= 8;
					cur_time.minute = FROM_BCD(tmp);
					tmp >>= 8;
					cur_time.hour = FROM_BCD(tmp);
					tmp >>= 8;
					cur_time.day = FROM_BCD(tmp);
					tmp >>= 8;
					cur_time.day_of_week = tmp & 0x0f;
					tmp >>= 4;
					cur_time.month = tmp & 0x0f;
#ifdef HAS_UPD4990A
					if(mode & 0x80) {
						tmp >>= 4;
						cur_time.year = FROM_BCD(tmp);
						cur_time.update_year();
						cur_time.update_day_of_week();
					}
#endif
				}
				hold = true;
				break;
			case 0x03:
				shift_data = 0;
#ifdef HAS_UPD4990A
				if(mode & 0x80) {
					shift_data |= TO_BCD(cur_time.year);
					shift_data <<= 4;
				}
#endif
				shift_data |= cur_time.month;
				shift_data <<= 4;
				shift_data |= cur_time.day_of_week;
				shift_data <<= 8;
				shift_data |= TO_BCD(cur_time.day);
				shift_data <<= 8;
				shift_data |= TO_BCD(cur_time.hour);
				shift_data <<= 8;
				shift_data |= TO_BCD(cur_time.minute);
				shift_data <<= 8;
				shift_data |= TO_BCD(cur_time.second);
				// output LSB
				write_signals(&outputs_dout, (shift_data & 1) ? 0xffffffff : 0);
				break;
			case 0x04:
			case 0x05:
			case 0x06:
#ifdef HAS_UPD4990A
			case 0x07:
			case 0x08:
			case 0x09:
			case 0x0a:
			case 0x0b:
#endif
				if(tpmode != (mode & 0x0f)) {
					if(outputs_tp.count != 0) {
						static const double tbl[] = {
							1000000.0 / 128.0,	// 64Hz
							1000000.0 / 512.0,	// 256Hz
							1000000.0 / 2048.0,	// 2048Hz
#ifdef HAS_UPD4990A
							1000000.0 / 4098.0,	// 4096Hz
							1000000.0,		// 1sec
							1000000.0 * 10,		// 10sec
							1000000.0 * 30,		// 30sec
							1000000.0 * 60		// 60sec
#endif
						};
						if(register_id_tp != -1) {
							cancel_event(register_id_tp);
							register_id_tp = -1;
						}
						register_event(this, EVENT_TP, tbl[(mode & 0x0f) - 4], true, &register_id_tp);
					}
					tpmode = mode & 0x0f;
				}
				break;
			}
			// reset counter hold
			switch(mode & 0x0f) {
			case 0x00:
			case 0x01:
			case 0x03:
				if(hold) {
					// restart event
					cancel_event(register_id_1sec);
					register_event(this, EVENT_1SEC, 1000000.0, true, &register_id_1sec);
					hold = false;
				}
				break;
			}
		}
		stb = next;
	}
	else if(id == SIG_UPD1990A_CMD) {
		cmd = (cmd & ~mask) | (data & mask);
		cmd &= 7;
	}
	else if(id == SIG_UPD1990A_C0) {
		cmd = (cmd & ~1) | (data & mask ? 1 : 0);
		cmd &= 7;
	}
	else if(id == SIG_UPD1990A_C1) {
		cmd = (cmd & ~2) | (data & mask ? 2 : 0);
		cmd &= 7;
	}
	else if(id == SIG_UPD1990A_C2) {
		cmd = (cmd & ~4) | (data & mask ? 4 : 0);
		cmd &= 7;
	}
	else if(id == SIG_UPD1990A_DIN) {
		din = ((data & mask) != 0);
	}
}

void UPD1990A::event_callback(int event_id, int err)
{
	if(event_id == EVENT_1SEC) {
		if(cur_time.initialized) {
			if(!hold) {
				cur_time.increment();
			}
		} else {
			emu->get_host_time(&cur_time);	// resync
			cur_time.initialized = true;
		}
	}
	else if(event_id == EVENT_TP) {
		write_signals(&outputs_tp, tp ? 0xffffffff : 0);
		tp = !tp;
	}
}
