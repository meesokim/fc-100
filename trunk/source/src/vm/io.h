/*
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2008.12.29 -

	[ i/o bus ]
*/

#ifndef _IO_H_
#define _IO_H_

#include "vm.h"
#include "../emu.h"
#include "device.h"

#ifndef IO_ADDR_MAX
#define IO_ADDR_MAX 0x100
#endif
#define IO_ADDR_MASK (IO_ADDR_MAX - 1)

class IO : public DEVICE
{
private:
	// i/o map
	typedef struct {
		DEVICE* dev;
		uint32 addr;
		int wait;
		bool is_flipflop;
	} write_t;
	
	typedef struct {
		DEVICE* dev;
		uint32 addr;
		int wait;
		bool value_registered;
		uint32 value;
	} read_t;
	
	write_t wr_table[IO_ADDR_MAX];
	read_t rd_table[IO_ADDR_MAX];
	
	// for debug
	uint32 prv_waddr, prv_wdata;
	uint32 prv_raddr, prv_rdata;
	
	void write_port8(uint32 addr, uint32 data, bool is_dma);
	uint32 read_port8(uint32 addr, bool is_dma);
	void write_port16(uint32 addr, uint32 data, bool is_dma);
	uint32 read_port16(uint32 addr, bool is_dma);
	void write_port32(uint32 addr, uint32 data, bool is_dma);
	uint32 read_port32(uint32 addr, bool is_dma);
	
public:
	IO(VM* parent_vm, EMU* parent_emu) : DEVICE(parent_vm, parent_emu) {
		memset(wr_table, 0, sizeof(wr_table));
		memset(rd_table, 0, sizeof(rd_table));
		
		// vm->dummy must be generated first !
		for(int i = 0; i < IO_ADDR_MAX; i++) {
			wr_table[i].dev = rd_table[i].dev = vm->dummy;
			wr_table[i].addr = rd_table[i].addr = i;
		}
		prv_waddr = prv_raddr = -1;
	}
	~IO() {}
	
	// common functions
	void write_io8(uint32 addr, uint32 data);
	uint32 read_io8(uint32 addr);
	void write_io16(uint32 addr, uint32 data);
	uint32 read_io16(uint32 addr);
	void write_io32(uint32 addr, uint32 data);
	uint32 read_io32(uint32 addr);
	void write_io8w(uint32 addr, uint32 data, int* wait);
	uint32 read_io8w(uint32 addr, int* wait);
	void write_io16w(uint32 addr, uint32 data, int* wait);
	uint32 read_io16w(uint32 addr, int* wait);
	void write_io32w(uint32 addr, uint32 data, int* wait);
	uint32 read_io32w(uint32 addr, int* wait);
	void write_dma_io8(uint32 addr, uint32 data);
	uint32 read_dma_io8(uint32 addr);
	void write_dma_io16(uint32 addr, uint32 data);
	uint32 read_dma_io16(uint32 addr);
	void write_dma_io32(uint32 addr, uint32 data);
	uint32 read_dma_io32(uint32 addr);
	
	// unique functions
	void set_iomap_single_r(uint32 addr, DEVICE* device);
	void set_iomap_single_w(uint32 addr, DEVICE* device);
	void set_iomap_single_rw(uint32 addr, DEVICE* device);
	void set_iomap_alias_r(uint32 addr, DEVICE* device, uint32 alias);
	void set_iomap_alias_w(uint32 addr, DEVICE* device, uint32 alias);
	void set_iomap_alias_rw(uint32 addr, DEVICE* device, uint32 alias);
	void set_iomap_range_r(uint32 s, uint32 e, DEVICE* device);
	void set_iomap_range_w(uint32 s, uint32 e, DEVICE* device);
	void set_iomap_range_rw(uint32 s, uint32 e, DEVICE* device);
	
	void set_iovalue_single_r(uint32 addr, uint32 value);
	void set_iovalue_range_r(uint32 s, uint32 e, uint32 value);
	void set_flipflop_single_r(uint32 addr, uint32 value);
	void set_flipflop_range_r(uint32 s, uint32 e, uint32 value);
	
	void set_iowait_single_r(uint32 addr, int wait);
	void set_iowait_single_w(uint32 addr, int wait);
	void set_iowait_single_rw(uint32 addr, int wait);
	void set_iowait_range_r(uint32 s, uint32 e, int wait);
	void set_iowait_range_w(uint32 s, uint32 e, int wait);
	void set_iowait_range_rw(uint32 s, uint32 e, int wait);
};

#endif

