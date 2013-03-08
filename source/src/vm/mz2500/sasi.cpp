/*
	SHARP MZ-2500 Emulator 'EmuZ-2500'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2004.09.10 -

	[ sasi hdd ]
*/

#include "sasi.h"
#include "../../fileio.h"

#define PHASE_FREE	0
#define PHASE_SELECT	1
#define PHASE_COMMAND	2
#define PHASE_C2	3
#define PHASE_SENSE	4
#define PHASE_READ	5
#define PHASE_WRITE	6
#define PHASE_STATUS	7
#define PHASE_MESSAGE	8

#define STATUS_IXD	0x04
#define STATUS_CXD	0x08
#define STATUS_MSG	0x10
#define STATUS_BSY	0x20
#define STATUS_REQ	0x80

#define STATUS_IRQ	0
#define STATUS_DRQ	0

void SASI::initialize()
{
	// open hard drive images
	for(int i = 0; i < 2; i++) {
		_TCHAR file_name[_MAX_PATH];
		_stprintf(file_name, _T("HDD%d.DAT"), i + 1);
		
		drive[i].fio = new FILEIO();
		if(!drive[i].fio->Fopen(emu->bios_path(file_name), FILEIO_READ_WRITE_BINARY)) {
			delete drive[i].fio;
			drive[i].fio = NULL;
		}
		drive[i].access = false;
	}
	
	// initialize sasi interface
	memset(buffer, 0, sizeof(buffer));
	memset(cmd, 0, sizeof(cmd));
	memset(status_buf, 0, sizeof(status_buf));
	
	phase = PHASE_FREE;
	sector = 0;
	blocks = 0;
	cmd_ptr = 0;
	unit = 0;
	buffer_ptr = 0;
	status = 0;
	status_irq_drq = 0;
	error = 0;
	status_ptr = 0;
}

void SASI::release()
{
	for(int i = 0; i < 2; i++) {
		if(drive[i].fio != NULL) {
			drive[i].fio->Fclose();
			delete drive[i].fio;
			drive[i].fio = NULL;
		}
	}
}

void SASI::write_io8(uint32 addr, uint32 data)
{
	switch(addr & 0xff) {
	case 0xa4:
		// data
		if(phase == PHASE_COMMAND) {
			cmd[cmd_ptr++] = data;
			if(cmd_ptr == 6) {
				check_cmd();
			}
		}
		else if(phase == PHASE_C2) {
			if(++status_ptr == 10) {
				set_status(0);
			}
		}
		else if(phase == PHASE_WRITE) {
			buffer[buffer_ptr++] = data;
			if(buffer_ptr == 256) {
				flush(unit);
				if(--blocks) {
					sector++;
					buffer_ptr = 0;
					if(!seek(unit)) {
						set_status(0x0f);
						set_drq(false);
					}
				}
				else {
					set_status(0);
					set_drq(false);
				}
			}
		}
		datareg = data;
		break;
	case 0xa5:
		// cmd
		if(data == 0x00) {
			if(phase == PHASE_SELECT) {
				phase = PHASE_COMMAND;
				cmd_ptr = 0;
			}
		}
		else if(data == 0x20) {
			if(datareg & 1) {
				phase = PHASE_SELECT;
			}
			else {
				phase = PHASE_FREE;
			}
		}
		break;
	}
}

uint32 SASI::read_io8(uint32 addr)
{
	uint32 val = 0;
	
	switch(addr & 0xff) {
	case 0xa4:
		// data
		if(phase == PHASE_READ) {
			val = buffer[buffer_ptr++];
			if(buffer_ptr == 256) {
				if(--blocks) {
					sector++;
					buffer_ptr = 0;
					if(!seek(unit)) {
						set_status(0x0f);
						set_drq(false);
					}
				}
				else {
					set_status(0);
					set_drq(false);
				}
			}
		}
		else if(phase == PHASE_SENSE) {
			val = status_buf[status_ptr++];
			if(status_ptr == 4) {
				set_status(0);
			}
		}
		else if(phase == PHASE_STATUS) {
			val = error ? 0x02 : status;
			phase = PHASE_MESSAGE;
		}
		else if(phase == PHASE_MESSAGE) {
			phase = PHASE_FREE;
		}
		return val;
	case 0xa5:
		// status
		val = status_irq_drq;
		status_irq_drq &= ~STATUS_IRQ;
		if(phase != PHASE_FREE) {
			val |= STATUS_BSY;
		}
		if(phase > PHASE_SELECT) {
			val |= STATUS_REQ;
		}
		if(phase == PHASE_COMMAND) {
			val |= STATUS_CXD;
		}
		if(phase == PHASE_SENSE) {
			val |= STATUS_IXD;
		}
		if(phase == PHASE_READ) {
			val |= STATUS_IXD;
		}
		if(phase == PHASE_STATUS) {
			val |= STATUS_IXD | STATUS_CXD;
		}
		if(phase == PHASE_MESSAGE) {
			val |= STATUS_IXD | STATUS_CXD | STATUS_MSG;
		}
		return val;
	}
	return 0xff;
}

void SASI::write_dma_io8(uint32 addr, uint32 data)
{
	write_io8(0xa4, data);
}

uint32 SASI::read_dma_io8(uint32 addr)
{
	return read_io8(0xa4);
}

uint32 SASI::read_signal(int ch)
{
	// get access status
	uint32 stat = (drive[0].access ? 0x10 : 0) | (drive[1].access ? 0x20 : 0);
	drive[0].access = drive[1].access = false;
	return stat;
}

void SASI::check_cmd()
{
	unit = (cmd[1] >> 5) & 1;
	
	switch(cmd[0]) {
	case 0x00:
		// test drive ready
		if(drive[unit].fio != NULL) {
			status = 0x00;
			set_status(0x00);
		}
		else {
			status = 0x02;
			set_status(0x7f);
		}
		break;
	case 0x01:
		// recalib
		if(drive[unit].fio != NULL) {
			sector = 0;
			status = 0x00;
			set_status(0x00);
		}
		else {
			status = 0x02;
			set_status(0x7f);
		}
		break;
	case 0x03:
		// request sense status
		phase = PHASE_SENSE;
		status_buf[0] = error;
		status_buf[1] = (uint8)((unit << 5) | ((sector >> 16) & 0x1f));
		status_buf[2] = (uint8)(sector >> 8);
		status_buf[3] = (uint8)sector;
		error = 0;
		status = 0x00;
		status_ptr = 0;
		break;
	case 0x04:
		// format drive
		sector = 0;
		status = 0x00;
		set_status(0x0f);
		break;
	case 0x06:
		// format track
		sector = cmd[1] & 0x1f;
		sector = (sector << 8) | cmd[2];
		sector = (sector << 8) | cmd[3];
		blocks = cmd[4];
		status = 0;
		if(format(unit)) {
			set_status(0);
		}
		else {
			set_status(0x0f);
		}
		break;
	case 0x08:
		// read data
		sector = cmd[1] & 0x1f;
		sector = (sector << 8) | cmd[2];
		sector = (sector << 8) | cmd[3];
		blocks = cmd[4];
		status = 0;
		if(blocks != 0 && seek(unit)) {
			phase = PHASE_READ;
			buffer_ptr = 0;
			set_drq(true);
		}
		else {
			set_status(0x0f);
		}
		break;
	case 0x0a:
		sector = cmd[1] & 0x1f;
		sector = (sector << 8) | cmd[2];
		sector = (sector << 8) | cmd[3];
		blocks = cmd[4];
		status = 0;
		if(blocks != 0 && seek(unit)) {
			phase = PHASE_WRITE;
			buffer_ptr = 0;
			memset(buffer, 0, sizeof(buffer));
			set_drq(true);
		}
		else {
			set_status(0x0f);
		}
		break;
	case 0x0b:
		sector = cmd[1] & 0x1f;
		sector = (sector << 8) | cmd[2];
		sector = (sector << 8) | cmd[3];
		blocks = cmd[4];
		status = 0;
		set_status(0);
		break;
	case 0xc2:
		phase = PHASE_C2;
		status_ptr = 0;
		status = 0;
//		error = 0;
		break;
	default:
		// unknown
		set_status(0);
		break;
	}
}

void SASI::set_status(uint8 err)
{
	error = err;
#if 1
	phase = PHASE_STATUS;
	// raise irq
	status_irq_drq |= STATUS_IRQ;
#else
	vm->register_event(this, 0, 10, false, NULL);
#endif
}

void SASI::event_callback(int event_id, int err)
{
#if 0
	phase = PHASE_STATUS;
	// raise irq
	status_irq_drq |= STATUS_IRQ;
#endif
}

void SASI::set_drq(bool flag)
{
	if(flag) {
		status_irq_drq |= STATUS_DRQ;
	}
	else {
		status_irq_drq &= ~STATUS_DRQ;
	}
}

bool SASI::seek(int drv)
{
	memset(buffer, 0, sizeof(buffer));
	
	if(drive[drv & 1].fio == NULL) {
		return false;
	}
	if(drive[drv & 1].fio->Fseek(sector * 256, FILEIO_SEEK_SET) != 0) {
		return false;
	}
	if(drive[drv & 1].fio->Fread(buffer, 256, 1) != 1) {
		return false;
	}
	drive[drv & 1].access = true;
	return true;
}

bool SASI::flush(int drv)
{
	if(drive[drv & 1].fio == NULL) {
		return false;
	}
	if(drive[drv & 1].fio->Fseek(sector * 256, FILEIO_SEEK_SET) != 0) {
		return false;
	}
	if(drive[drv & 1].fio->Fwrite(buffer, 256, 1) != 1) {
		return false;
	}
	drive[drv & 1].access = true;
	return true;
}

bool SASI::format(int drv)
{
	if(drive[drv & 1].fio == NULL) {
		return false;
	}
	if(drive[drv & 1].fio->Fseek(sector * 256, FILEIO_SEEK_SET) != 0) {
		return false;
	}
	// format 33 blocks
	memset(buffer, 0, sizeof(buffer));
	for(int i = 0; i < 33; i++) {
		if(drive[drv & 1].fio->Fwrite(buffer, 256, 1) != 1) {
			return false;
		}
		drive[drv & 1].access = true;
	}
	return true;
}

