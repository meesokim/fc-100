/*
	NEC TK-80BS (COMPO BS/80) Emulator 'eTK-80BS'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2008.08.26 -

	[ display ]
*/

#include "display.h"
#include "../../fileio.h"

static const int dest_x[8] = {
	1, 26, 51, 76, 106, 131, 156, 181
};
static const int pat_led[35][24] = {
	{9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9},
	{9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9},
	{9,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,0,0,9},
	{9,0,0,0,6,0,1,1,1,1,1,1,1,1,1,1,1,1,0,2,2,0,0,9},
	{9,0,0,0,6,6,0,1,1,1,1,1,1,1,1,1,1,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,9},
	{9,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,9},
	{9,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,9},
	{9,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,9},
	{9,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,9},
	{9,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,9},
	{9,0,0,0,6,0,7,7,7,7,7,7,7,7,7,7,7,0,2,0,0,0,0,9},
	{9,0,0,0,0,7,7,7,7,7,7,7,7,7,7,7,7,7,0,0,0,0,0,9},
	{9,0,0,0,5,0,7,7,7,7,7,7,7,7,7,7,7,0,3,0,0,0,0,9},
	{9,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,9},
	{9,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,9},
	{9,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,9},
	{9,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,9},
	{9,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,9},
	{9,0,5,5,0,4,4,4,4,4,4,4,4,4,4,0,3,3,3,0,0,0,0,9},
	{9,0,5,0,4,4,4,4,4,4,4,4,4,4,4,4,0,3,3,0,8,8,0,9},
	{9,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,3,0,8,8,0,9},
	{9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9},
	{9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9},
};
static const int pat_kb[31][42] = {
	{1,1,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0},
	{1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1},
	{1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{2,2,2,2,2,2,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,2,2,2,2,2,0,0},
	{2,2,2,2,2,2,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,2,2,2,2,2,0,0},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,2,2,2,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2,0,0,2,2,2,0,0,0,2,2,2},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,2,2,2,2,2,0,0},
	{0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,0,0,2,2,2,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,2,2,2,2,2,0,0},
};

void DISPLAY::initialize()
{
	// load rom image
	FILEIO* fio = new FILEIO();
	if(fio->Fopen(emu->bios_path(_T("FONT.ROM")), FILEIO_READ_BINARY)) {
		fio->Fread(font, sizeof(font), 1);
		fio->Fclose();
	}
	delete fio;
	
	mode = 2;
	dma = 0x80;
}

void DISPLAY::write_signal(int id, uint32 data, uint32 mask)
{
	if(id == SIG_DISPLAY_MODE) {
		// 8255 PC on TK-80BS
		mode = data & mask;
	}
	else if(id == SIG_DISPLAY_DMA) {
		// 8255 PC on TK-80
		dma = data & mask;
	}
}

void DISPLAY::draw_screen()
{
	// draw screen
	scrntype col_w = (mode & 2) ? RGB_COLOR(255, 255, 255) : 0;
	scrntype col_b = (mode & 2) ? 0 : RGB_COLOR(255, 255, 255);
	int code_ofs = (mode & 1) << 8;
	int ptr = 0;
	
	for(int y = 0; y < 128; y += 8) {
		for(int x = 0; x < 256; x += 8) {
			int code = vram[ptr++] | code_ofs;
			uint8* font_base = &font[code << 3];
			
			for(int l = 0; l < 8; l++) {
				uint8 pat = font_base[l];
				scrntype* dest = &screen[l][x];
				
				dest[0] = (pat & 0x80) ? col_w : col_b;
				dest[1] = (pat & 0x40) ? col_w : col_b;
				dest[2] = (pat & 0x20) ? col_w : col_b;
				dest[3] = (pat & 0x10) ? col_w : col_b;
				dest[4] = (pat & 0x08) ? col_w : col_b;
				dest[5] = (pat & 0x04) ? col_w : col_b;
				dest[6] = (pat & 0x02) ? col_w : col_b;
				dest[7] = (pat & 0x01) ? col_w : col_b;
			}
		}
		for(int l = 0; l < 8; l++) {
			scrntype* dest = emu->screen_buffer(y + l);
			scrntype* src = screen[l];
			memcpy(dest, src, 256 * sizeof(scrntype));
		}
	}
	// draw leds
	scrntype col_red = RGB_COLOR(255, 0, 0);
	scrntype col_on = RGB_COLOR(255, 8, 72);
	scrntype col_off = RGB_COLOR(56, 0, 0);
	scrntype col[10];
	
	memset(screen, 0, sizeof(screen));
	for(int i = 0; i < 8; i++) {
		for(int i = 0; i < 8; i++) {
			uint8 pat = dma ? led[i] : 0;
			col[0] = 0;
			col[1] = pat & 0x01 ? col_on : col_off;
			col[2] = pat & 0x02 ? col_on : col_off;
			col[3] = pat & 0x04 ? col_on : col_off;
			col[4] = pat & 0x08 ? col_on : col_off;
			col[5] = pat & 0x10 ? col_on : col_off;
			col[6] = pat & 0x20 ? col_on : col_off;
			col[7] = pat & 0x40 ? col_on : col_off;
			col[8] = pat & 0x80 ? col_on : col_off;
			col[9] = col_red;
			for(int y = 0; y < 35; y++) {
				scrntype *dest = &screen[y + 1][dest_x[i]];
				for(int x = 0; x < 24; x++) {
					dest[x] = col[pat_led[y][x]];
				}
			}
		}
	}
	// draw kb type
	col[1] = d_key->read_signal(0) & 1 ? col_red : col_off;
	col[2] = d_key->read_signal(0) & 2 ? col_red : col_off;
	
	for(int y = 0; y < 31; y++) {
		scrntype *dest = &screen[y + 3][210];
		for(int x = 0; x < 42; x++) {
			dest[x] = col[pat_kb[y][x]];
		}
	}
	
	// copy to screen
	for(int y = 0; y < 36; y++) {
		scrntype* dest = emu->screen_buffer(y + 128);
		scrntype* src = screen[y];
		memcpy(dest, src, 256 * sizeof(scrntype));
	}
}

