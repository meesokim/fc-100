/*
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2010.08.03-

	[ mc6847 ]
*/

#include "mc6847.h"
#include "../fileio.h"

#ifndef MC6847_VRAM_OFS
#define MC6847_VRAM_OFS	0
#endif

#define GREEN		0
#define YELLOW		1
#define BLUE		2
#define RED			3
#define WHITE		4
#define CYAN		5
#define MAGENTA		6
#define ORANGE		7
#define BLACK		8
// text
#define TXTGREEN	9
#define TXTRED		10
#define TXTORANGE	11
 
void MC6847::initialize()
{
	memset(intfont, 0, sizeof(intfont));

	// semigraphics pattern
	for(int i = 0; i < 16; i++) {
		for(int j = 0; j < 6; j++) {
			sg4[i * 12 + j] = ((i & 0x08) ? 0xf0 : 0) | ((i & 0x04) ? 0x0f : 0);
		}
		for(int j = 6; j < 12; j++) {
			sg4[i * 12 + j] = ((i & 0x02) ? 0xf0 : 0) | ((i & 0x01) ? 0x0f : 0);
		}
	}
	for(int i = 0; i < 64; i++) {
		for(int j = 0; j < 4; j++) {
			sg6[i * 12 + j] = ((i & 0x20) ? 0xf0 : 0) | ((i & 0x10) ? 0x0f : 0);
		}
		for(int j = 4; j < 8; j++) {
			sg6[i * 12 + j] = ((i & 0x08) ? 0xf0 : 0) | ((i & 0x04) ? 0x0f : 0);
		}
		for(int j = 8; j < 12; j++) {
			sg6[i * 12 + j] = ((i & 0x02) ? 0xf0 : 0) | ((i & 0x01) ? 0x0f : 0);
		}
	}
	// pc pallete
	palette_pc[GREEN     ] = RGB_COLOR(  4,255,  0);
	palette_pc[YELLOW    ] = RGB_COLOR(255,255,  0);
	palette_pc[BLUE      ] = RGB_COLOR(  8,  0,255);
	palette_pc[RED       ] = RGB_COLOR(255,  0,  0);
	palette_pc[WHITE     ] = RGB_COLOR(255,255,255);
	palette_pc[CYAN      ] = RGB_COLOR(  0,255,128);
	palette_pc[MAGENTA   ] = RGB_COLOR(251,  0,255);
	palette_pc[ORANGE    ] = RGB_COLOR(255,128,  0);
	palette_pc[BLACK     ] = RGB_COLOR(  0,  0,  0);
	palette_pc[TXTGREEN  ] = RGB_COLOR(  0, 64,  0);
	palette_pc[TXTRED    ] = RGB_COLOR( 64, 16,  0);
	palette_pc[TXTORANGE ] = RGB_COLOR(255,196, 24);
	
	// register event
	register_vline_event(this);
}

void MC6847::reset()
{
	// internal font
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T(vdg_type ? (vdg_type & 1 ? "M5C6847.ROM" : "MC6847.ROM") : "S68047.ROM")), FILEIO_READ_BINARY)) {
		for (int i = 0; i < 64; i++) {
			fio->Fread(&intfont[i*12+2], 8, 1);
		}
		fio->Fclose();
	}
	delete fio;

	vsync = hsync = true;
}

void MC6847::write_signal(int id, uint32 data, uint32 mask)
{
	switch(id) {
	case SIG_MC6847_AG:
		ag = ((data & mask) != 0);
		break;
	case SIG_MC6847_AS:
		as = ((data & mask) != 0);
		break;
	case SIG_MC6847_INTEXT:
		intext = ((data & mask) != 0);
		break;
	case SIG_MC6847_GM:
		gm = (gm & ~mask) | (data & mask);
		break;
	case SIG_MC6847_CSS:
		css = ((data & mask) != 0);
		break;
	case SIG_MC6847_INV:
		inv = ((data & mask) != 0);
		break;
	}
	if (ag) { // border ground
		if (css) {
			bg = WHITE;
		}
		else{
			bg = GREEN;
		}
	}
	else{
		bg = BLACK;
	}

}

void MC6847::update_timing(int new_clocks, double new_frames_per_sec, int new_lines_per_frame)
{
	// this should be called before vline event
	tWHS = (int)((double)new_clocks / new_frames_per_sec / (double)new_lines_per_frame * 16.5 / 227.5 + 0.5);
}

void MC6847::event_vline(int v, int clock)
{
	// vsync
	set_vsync(v > 32);	// 32/262
	
	// hsync
	if(outputs_hsync.count) {
		set_hsync(false);
		register_event_by_clock(this, 0, tWHS, false, NULL);
	}
}

void MC6847::event_callback(int event_id, int err)
{
	set_hsync(true);
}

void MC6847::set_vsync(bool val)
{
	if(vsync != val) {
		write_signals(&outputs_vsync, val ? 0xffffffff : 0);
		vsync = val;
	}
}

void MC6847::set_hsync(bool val)
{
	if(hsync != val) {
		write_signals(&outputs_hsync, val ? 0xffffffff : 0);
		hsync = val;
	}
}

void MC6847::draw_screen()
{
	// render screen
	if(ag) {
		// graphics mode
		switch(gm) {
		case 0: draw_cg(4, 3); break;	//  64x 64
		case 1: draw_rg(2, 3); break;	// 128x 64
		case 2: draw_cg(2, 3); break;	// 128x 64
		case 3: draw_rg(2, 2); break;	// 128x 96
		case 4: draw_cg(2, 2); break;	// 128x 96
		case 5: draw_rg(2, 1); break;	// 128x192
		case 6: draw_cg(2, 1); break;	// 128x192
		case 7: draw_rg(1, 1); break;	// 256x192
		}
	} else {
		// alphanumerics / semigraphics
		draw_alpha();
	}
	
	for(int y = 0; y < 192; y++) {
		scrntype* dest = emu->screen_buffer(y);
		for(int x = 0; x < 256; x++) {
			dest[x] = palette_pc[screen[y][x]];
		}
	}
}

void MC6847::draw_cg(int xofs, int yofs)
{
	uint8 color = css ? 4 : 0;
	int ofs = 0;
	
	for(int y = 0; y < 192; y += yofs) {
		for(int x = 0; x < 256; x += xofs * 4) {
			uint8 data = vram_ptr[ofs];
			if(++ofs >= vram_size) {
				ofs = 0;
			}
			uint8* dest = &screen[y][x];
			
			if(xofs == 4) {
				dest[ 0] = dest[ 1] = dest[ 2] = dest[ 3] = color | ((data >> 6) & 3);
				dest[ 4] = dest[ 5] = dest[ 6] = dest[ 7] = color | ((data >> 4) & 3);
				dest[ 8] = dest[ 9] = dest[10] = dest[11] = color | ((data >> 2) & 3);
				dest[12] = dest[13] = dest[14] = dest[15] = color | ((data >> 0) & 3);
			} else {
				dest[0] = dest[1] = color | ((data >> 6) & 3);
				dest[2] = dest[3] = color | ((data >> 4) & 3);
				dest[4] = dest[5] = color | ((data >> 2) & 3);
				dest[6] = dest[7] = color | ((data >> 0) & 3);
			}
		}
		if(yofs >= 2) {
			memcpy(screen[y + 1], screen[y], 256);
			if(yofs >= 3) {
				memcpy(screen[y + 2], screen[y], 256);
			}
		}
	}
}

void MC6847::draw_rg(int xofs, int yofs)
{
	static const uint8 color_table[4] = {
		TXTGREEN, GREEN, BLACK, WHITE
	};
	uint8 color = css ? 2 : 0;
	int ofs = 0;
	
	for(int y = 0; y < 192; y += yofs) {
		for(int x = 0; x < 256; x += xofs * 8) {
			uint8 data = vram_ptr[ofs];
			if(++ofs >= vram_size) {
				ofs = 0;
			}
			uint8* dest = &screen[y][x];
			
			if(xofs == 2) {
				for(int i = 0; i < 8; i++) {
					dest[i << 1] = dest[i << 1 | 1] = color_table[color | (data >> (7-i) & 1)];
				}
			} else {
				for(int i = 0; i < 8; i++) {
					dest[i] = color_table[color | (data >> (7-i) & 1)];
				}
			}
		}
		if(yofs >= 2) {
			memcpy(screen[y + 1], screen[y], 256);
			if(yofs >= 3) {
				memcpy(screen[y + 2], screen[y], 256);
			}
		}
	}
}

void MC6847::draw_alpha()
{
	
	int ofs = 0;
	for(int y = 0; y < 192; y += 12) {
		for(int x = 0; x < 256; x += 8) {
			uint8 data = vram_ptr[ofs + MC6847_VRAM_OFS];
			uint8 attr = vram_ptr[ofs + MC6847_ATTR_OFS];
			if(++ofs >= vram_size) {
				ofs = 0;
			}
			// vram data bits may be connected to mode signals
			bool as2 = as;
			bool intext2 = intext;
			bool css2 = css;
			bool inv2 = inv;
#ifdef MC6847_VRAM_AS
			as2 = ((data & MC6847_VRAM_AS) != 0);
#endif
#ifdef MC6847_VRAM_INTEXT
			intext2 = ((data & MC6847_VRAM_INTEXT) != 0);
#endif
#ifdef MC6847_VRAM_CSS
			css2 = ((data & MC6847_VRAM_CSS) != 0);
#endif
#ifdef MC6847_VRAM_INV
			inv2 = ((data & MC6847_VRAM_INV) != 0);
#endif
#ifdef MC6847_ATTR_OFS
#ifdef MC6847_ATTR_AS
			as2 = ((attr & MC6847_ATTR_AS) != 0);
#endif
#ifdef MC6847_ATTR_INTEXT
			intext2 = ((attr & MC6847_ATTR_INTEXT) != 0);
#endif
#ifdef MC6847_ATTR_CSS
			css2 = ((attr & MC6847_ATTR_CSS) != 0);
#endif
#ifdef MC6847_ATTR_INV
			inv2 = ((attr & MC6847_ATTR_INV) != 0);
#endif
#endif
			uint8 *pattern;
			uint8 col_fore, col_back;
			if(!as2) {
				if(intext2) {
					if (data & 0x80) {
						// programerble character
						pattern = &pcgfont_ptr[16 * (data & 0x7f)];
					}
					else{
						// external alphanumerics
						pattern = &extfont_ptr[16 * data];
					}
				} else {
					// internal alphanumerics
					pattern = (uint8 *)(&intfont[12 * (data & 0x3f)]);
				}
				// note: we need to overwrite the color table by each driver
				static const uint8 color_table[6] = {
					GREEN, TXTGREEN, TXTORANGE, TXTRED, GREEN, BLACK
				};
				int col = (css2 ? 2 : 0) | (inv2 ? 1 : 0);
				col_fore = color_table[col];
				col_back = color_table[col ^ 1];
			}
			else {
				if(intext2) {
					// semiggraphics 6
					pattern = &sg6[12 * (data & 0x3f)];
					col_fore = (css2 ? 4 : 0) | ((data >> 6) & 3);
				} else {
					// semiggraphics 4
					pattern = &sg4[12 * (data & 0x0f)];
					col_fore = (data >> 4) & 7;
				}
				col_back = BLACK;
			}
			for(int l = 0; l < 12; l++) {
				uint8 pat = pattern[l];
				uint8* dest = &screen[y + l][x];
				for(int i = 0; i < 8; i++) {
					dest[i] = (0x80 >> i & pat) ? col_fore : col_back;
				}
			}
		}
	}
}

