/*
	Skelton for retropc emulator

	Origin : MAME TMS9928A Core
	Author : Takeda.Toshiya
	Date   : 2006.08.18 -
	         2007.07.21 -

	[ TMS9918A ]
*/

#include "tms9918a.h"

#define ADDR_MASK (TMS9918A_VRAM_SIZE - 1)

static const scrntype palette_pc[16] = {
	RGB_COLOR(  0,   0,   0), RGB_COLOR(  0,   0,   0), RGB_COLOR( 33, 200,  66), RGB_COLOR( 94, 220, 120),
	RGB_COLOR( 84,  85, 237), RGB_COLOR(125, 118, 252), RGB_COLOR(212,  82,  77), RGB_COLOR( 66, 235, 245),
	RGB_COLOR(252,  85,  84), RGB_COLOR(255, 121, 120), RGB_COLOR(212, 193,  84), RGB_COLOR(230, 206, 128),
	RGB_COLOR( 33, 176,  59), RGB_COLOR(201,  91, 186), RGB_COLOR(204, 204, 204), RGB_COLOR(255, 255, 255)
};

void TMS9918A::initialize()
{
	// register event
	register_vline_event(this);
}

void TMS9918A::reset()
{
	memset(vram, 0, sizeof(vram));
	memset(regs, 0, sizeof(regs));
	status_reg = read_ahead = first_byte = 0;
	vram_addr = 0;
	intstat = latch = false;
	color_table = pattern_table = name_table = 0;
	sprite_pattern = sprite_attrib = 0;
	color_mask = pattern_mask = 0;
}

void TMS9918A::write_io8(uint32 addr, uint32 data)
{
	if(addr & 1) {
		// register
		if(latch) {
			if(data & 0x80) {
				switch(data & 7) {
				case 0:
					regs[0] = first_byte & 3;
					if(regs[0] & 2) {
						color_table = ((regs[3] & 0x80) * 64) & ADDR_MASK;
						color_mask = ((regs[3] & 0x7f) * 8) | 7;
						pattern_table = ((regs[4] & 4) * 2048) & ADDR_MASK;
						pattern_mask = ((regs[4] & 3) * 256) | (color_mask & 0xff);
					}
					else {
						color_table = (regs[3] * 64) & ADDR_MASK;
						pattern_table = (regs[4] * 2048) & ADDR_MASK;
					}
					break;
				case 1:
					regs[1] = first_byte & 0xfb;
					set_intstat((regs[1] & 0x20) && (status_reg & 0x80));
					break;
				case 2:
					regs[2] = first_byte & 0x0f;
					name_table = (regs[2] * 1024) & ADDR_MASK;
					break;
				case 3:
					regs[3] = first_byte;
					if(regs[0] & 2) {
						color_table = ((regs[3] & 0x80) * 64) & ADDR_MASK;
						color_mask = ((regs[3] & 0x7f) * 8) | 7;
					}
					else {
						color_table = (regs[3] * 64) & ADDR_MASK;
					}
					pattern_mask = ((regs[4] & 3) * 256) | (color_mask & 0xff);
					break;
				case 4:
					regs[4] = first_byte & 7;
					if(regs[0] & 2) {
						pattern_table = ((regs[4] & 4) * 2048) & ADDR_MASK;
						pattern_mask = ((regs[4] & 3) * 256) | 255;
					}
					else {
						pattern_table = (regs[4] * 2048) & ADDR_MASK;
					}
					break;
				case 5:
					regs[5] = first_byte & 0x7f;
					sprite_attrib = (regs[5] * 128) & ADDR_MASK;
					break;
				case 6:
					regs[6] = first_byte & 7;
					sprite_pattern = (regs[6] * 2048) & ADDR_MASK;
					break;
				case 7:
					regs[7] = first_byte;
					break;
				}
			}
			else {
				vram_addr = ((data * 256) | first_byte) & ADDR_MASK;
				if(!(data & 0x40)) {
					read_io8(0);	// read ahead
				}
			}
			latch = false;
		}
		else {
			first_byte = data;
			latch = true;
		}
	}
	else {
		// vram
		vram[vram_addr] = data;
		vram_addr = (vram_addr + 1) & ADDR_MASK;
		read_ahead = data;
		latch = false;
	}
}

uint32 TMS9918A::read_io8(uint32 addr)
{
	if(addr & 1) {
		// register
		uint8 val = status_reg;
		status_reg = 0x1f;
		set_intstat(false);
		latch = false;
		return val;
	}
	else {
		// vram
		uint8 val = read_ahead;
		read_ahead = vram[vram_addr];
		vram_addr = (vram_addr + 1) & ADDR_MASK;
		latch = false;
		return val;
	}
}

void TMS9918A::draw_screen()
{
	// update screen buffer
	for(int y = 0; y < 192; y++) {
		scrntype* dest = emu->screen_buffer(y);
		uint8* src = screen[y];
		for(int x = 0; x < 256; x++) {
			dest[x] = palette_pc[src[x] & 0x0f];
		}
	}
}

void TMS9918A::event_vline(int v, int clock)
{
	if(v == 192) {
		// create virtual screen
		if(regs[1] & 0x40) {
			// draw character plane
			int mode = (regs[0] & 2) | ((regs[1] & 0x10) >> 4) | ((regs[1] & 8) >> 1);
			switch(mode) {
			case 0:
				draw_mode0();
				break;
			case 1:
				draw_mode1();
				break;
			case 2:
				draw_mode2();
				break;
			case 3:
				draw_mode12();
				break;
			case 4:
				draw_mode3();
				break;
			case 6:
				draw_mode23();
				break;
			case 5:
			case 7:
				draw_modebogus();
				break;
			}
			// draw sprite plane
			if((regs[1] & 0x50) == 0x40) {
				draw_sprites();
			}
		}
		else {
			memset(screen, 0, sizeof(screen));
		}
		
		// do interrupt
		status_reg |= 0x80;
		set_intstat((regs[1] & 0x20) != 0);
	}
}

void TMS9918A::set_intstat(bool val)
{
	if(val != intstat) {
		write_signals(&outputs_irq, val ? 0xffffffff : 0);
		intstat = val;
	}
}

void TMS9918A::draw_mode0()
{
	for(int y = 0, name = 0; y < 24; y++) {
		for(int x = 0; x < 32; x++) {
			uint16 code = vram[name_table + (name++)];
			uint8* pattern_ptr = vram + pattern_table + code * 8;
			uint8 color = vram[color_table + (code >> 3)];
			uint8 fg = (color & 0xf0) ? (color >> 4) : (regs[7] & 0x0f);
			uint8 bg = (color & 0x0f) ? (color & 0x0f) : (regs[7] & 0x0f);
			for(int yy=0; yy < 8; yy++) {
				uint8 pattern = *pattern_ptr++;
				uint8* buffer = screen[y * 8 + yy] + x * 8;
				buffer[0] = (pattern & 0x80) ? fg : bg;
				buffer[1] = (pattern & 0x40) ? fg : bg;
				buffer[2] = (pattern & 0x20) ? fg : bg;
				buffer[3] = (pattern & 0x10) ? fg : bg;
				buffer[4] = (pattern & 0x08) ? fg : bg;
				buffer[5] = (pattern & 0x04) ? fg : bg;
				buffer[6] = (pattern & 0x02) ? fg : bg;
				buffer[7] = (pattern & 0x01) ? fg : bg;
			}
		}
	}
}

void TMS9918A::draw_mode1()
{
	uint8 fg = regs[7] >> 4;
	uint8 bg = regs[7] & 0x0f;
	for(int y = 0, name = 0; y < 24; y++) {
		for(int x = 0; x < 40; x++) {
			uint16 code = vram[name_table + (name++)];
			uint8* pattern_ptr = vram + pattern_table + code * 8;
			for(int yy = 0; yy < 8; yy++) {
				uint8 pattern = *pattern_ptr++;
				uint8* buffer = screen[y * 8 + yy] + x * 6 + 8;
				buffer[0] = (pattern & 0x80) ? fg : bg;
				buffer[1] = (pattern & 0x40) ? fg : bg;
				buffer[2] = (pattern & 0x20) ? fg : bg;
				buffer[3] = (pattern & 0x10) ? fg : bg;
				buffer[4] = (pattern & 0x08) ? fg : bg;
				buffer[5] = (pattern & 0x04) ? fg : bg;
			}
		}
	}
}

void TMS9918A::draw_mode2()
{
	for(int y = 0, name = 0; y < 24; y++) {
		for(int x = 0; x < 32; x++) {
			uint16 code = vram[name_table + (name++)] + (y & 0xf8) * 32;
			uint8* pattern_ptr = vram + pattern_table + (code & pattern_mask) * 8;
			uint8* color_ptr = vram + color_table + (code & color_mask) * 8;
			for(int yy = 0; yy < 8; yy++) {
				uint8 pattern = *pattern_ptr++;
				uint8 color = *color_ptr++;
				uint8 fg = (color & 0xf0) ? (color >> 4) : (regs[7] & 0x0f);
				uint8 bg = (color & 0x0f) ? (color & 0x0f) : (regs[7] & 0x0f);
				uint8* buffer = screen[y * 8 + yy] + x * 8;
				buffer[0] = (pattern & 0x80) ? fg : bg;
				buffer[1] = (pattern & 0x40) ? fg : bg;
				buffer[2] = (pattern & 0x20) ? fg : bg;
				buffer[3] = (pattern & 0x10) ? fg : bg;
				buffer[4] = (pattern & 0x08) ? fg : bg;
				buffer[5] = (pattern & 0x04) ? fg : bg;
				buffer[6] = (pattern & 0x02) ? fg : bg;
				buffer[7] = (pattern & 0x01) ? fg : bg;
			}
		}
	}
}

void TMS9918A::draw_mode12()
{
	uint8 fg = regs[7] >> 4;
	uint8 bg = regs[7] & 0x0f;
	for(int y = 0, name = 0; y < 24; y++) {
		for(int x = 0; x < 40; x++) {
			uint16 code = vram[name_table + (name++)] + (y & 0xf8) * 32;
			uint8* pattern_ptr = vram + pattern_table + (code & pattern_mask) * 8;
			for(int yy = 0; yy < 8; yy++) {
				uint8 pattern = *pattern_ptr++;
				uint8* buffer = screen[y * 8 + yy] + x * 6 + 8;
				buffer[0] = (pattern & 0x80) ? fg : bg;
				buffer[1] = (pattern & 0x40) ? fg : bg;
				buffer[2] = (pattern & 0x20) ? fg : bg;
				buffer[3] = (pattern & 0x10) ? fg : bg;
				buffer[4] = (pattern & 0x08) ? fg : bg;
				buffer[5] = (pattern & 0x04) ? fg : bg;
			}
		}
	}
}

void TMS9918A::draw_mode3()
{
	for(int y = 0, name = 0; y < 24; y++) {
		for(int x = 0; x < 32; x++) {
			uint16 code = vram[name_table + (name++)];
			uint8* pattern_ptr = vram + pattern_table + code * 8 + (y & 3) * 2;
			for(int yy = 0; yy < 2; yy++) {
				uint8 color = *pattern_ptr++;
				uint8 fg = (color & 0xf0) ? (color >> 4) : (regs[7] & 0x0f);
				uint8 bg = (color & 0x0f) ? (color & 0x0f) : (regs[7] & 0x0f);
				for(int yyy = 0; yyy < 4; yyy++) {
					uint8* buffer = screen[y * 8 + yy * 4 + yyy] + x * 8;
					buffer[0] = buffer[1] = buffer[2] = buffer[3] = fg;
					buffer[4] = buffer[5] = buffer[6] = buffer[7] = bg;
				}
			}
		}
	}
}

void TMS9918A::draw_mode23()
{
	for(int y = 0, name = 0; y < 24;y++) {
		for(int x = 0; x < 32; x++) {
			uint16 code = vram[name_table + (name++)];
			uint8* pattern_ptr = vram + pattern_table + ((code + (y & 3) * 2 + (y & 0xf8) * 32) & pattern_mask) * 8;
			for(int yy = 0; yy < 2; yy++) {
				uint8 color = *pattern_ptr++;
				uint8 fg = (color & 0xf0) ? (color >> 4) : (regs[7] & 0x0f);
				uint8 bg = (color & 0x0f) ? (color & 0x0f) : (regs[7] & 0x0f);
				for(int yyy = 0; yyy < 4; yyy++) {
					uint8* buffer = screen[y * 8 + yy * 4 + yyy] + x * 8;
					buffer[0] = buffer[1] = buffer[2] = buffer[3] = fg;
					buffer[4] = buffer[5] = buffer[6] = buffer[7] = bg;
				}
			}
		}
	}
}

void TMS9918A::draw_modebogus()
{
	uint8 fg = regs[7] >> 4;
	uint8 bg = regs[7] & 0x0f;
	for(int y = 0; y < 192; y++) {
		uint8* buffer = screen[y];
		int x = 0;
		for(int i = 0; i < 8; i++) {
			buffer[x++] = bg;
		}
		for(int i = 0; i < 40; i++) {
			for(int j = 0; j < 4; j++) {
				buffer[x++] = fg;
			}
			for(int j = 0; j < 2; j++) {
				buffer[x++] = bg;
			}
		}
		for(int i = 0; i < 8; i++) {
			buffer[x++] = bg;
		}
	}
}

void TMS9918A::draw_sprites()
{
	uint8* attrib_ptr = vram + sprite_attrib;
	int size = (regs[1] & 2) ? 16 : 8;
	bool large = ((regs[1] & 1) != 0);
	uint8 limit[192], collision[192][256];
	int illegal_sprite = 0, illegal_sprite_line = 255, p;
	memset(limit, 4, sizeof(limit));
	memset(collision, 0, sizeof(collision));
	status_reg = 0x80;
	
	for(p = 0; p < 32; p++) {
		int y = *attrib_ptr++;
		if(y == 208) {
			break;
		}
		if(y > 208) {
			y = -(~y & 0xff);
		}
		else {
			y++;
		}
		int x = *attrib_ptr++;
		uint8* pattern_ptr = vram + sprite_pattern + ((size == 16) ? (*attrib_ptr & 0xfc) : *attrib_ptr) * 8;
		attrib_ptr++;
		uint8 c = *attrib_ptr & 0x0f;
		if(*attrib_ptr & 0x80) {
			x -= 32;
		}
		attrib_ptr++;
		
		if(!large) {
			// draw sprite (not enlarged)
			for(int yy = y; yy < y + size; yy++) {
				if(yy < 0 || 191 < yy) {
					continue;
				}
				if(limit[yy] == 0) {
					// illegal sprite line
					if(yy < illegal_sprite_line) {
						illegal_sprite_line = yy;
						illegal_sprite = p;
					}
					else if(illegal_sprite_line == yy) {
						if(illegal_sprite > p) {
							illegal_sprite = p;
						}
					}
#ifdef TMS9918A_LIMIT_SPRITES
					continue;
#endif
				}
				else {
					limit[yy]--;
				}
				uint16 line = pattern_ptr[yy - y] * 256 + pattern_ptr[yy - y + 16];
				for(int xx = x; xx < x + size; xx++) {
					if(line & 0x8000) {
						if(0 <= xx && xx < 256) {
							if(collision[yy][xx]) {
								status_reg |= 0x20;
							}
							else {
								collision[yy][xx] = 1;
							}
							if(c && !(collision[yy][xx] & 2)) {
								collision[yy][xx] |= 2;
								screen[yy][xx] = c;
							}
						}
					}
					line *= 2;
				}
			}
		}
		else {
			// draw enlarged sprite
			for(int i = 0; i < size; i++) {
				int yy = y + i * 2;
				uint16 line2 = pattern_ptr[i] * 256 + pattern_ptr[i + 16];
				for(int j = 0; j < 2; j++) {
					if(0 <= yy && yy <= 191) {
						if(limit[yy] == 0) {
							// illegal sprite line
							if(yy < illegal_sprite_line) {
								illegal_sprite_line = yy;
								 illegal_sprite = p;
							}
							else if(illegal_sprite_line == yy) {
								if(illegal_sprite > p) {
									illegal_sprite = p;
								}
							}
#ifdef TMS9918A_LIMIT_SPRITES
							continue;
#endif
						}
						else {
							limit[yy]--;
						}
						uint16 line = line2;
						for(int xx = x; xx < x + size * 2; xx += 2) {
							if(line & 0x8000) {
								if(0 <= xx && xx < 256) {
									if(collision[yy][xx]) {
										status_reg |= 0x20;
									}
									else {
										collision[yy][xx] = 1;
									}
									if(c && !(collision[yy][xx] & 2)) {
										collision[yy][xx] |= 2;
										screen[yy][xx] = c;
									}
								}
								if(0 <= xx + 1 && xx + 1 < 256) {
									if(collision[yy][xx + 1]) {
										status_reg |= 0x20;
									}
									else {
										collision[yy][xx + 1] = 1;
									}
									if(c && !(collision[yy][xx + 1] & 2)) {
										collision[yy][xx + 1] |= 2;
										screen[yy][xx + 1] = c;
									}
								}
							}
							line *= 2;
						}
					}
					yy++;
				}
			}
		}
	}
	if(illegal_sprite_line == 255) {
		status_reg |= (p > 31) ? 31 : p;
	}
	else {
		status_reg |= 0x40 + illegal_sprite;
	}
}

