/*
	IBM Japan Ltd PC/JX Emulator 'eJX'
	Skelton for retropc emulator

	Author : Takeda.Toshiya
	Date   : 2011.05.09-

	[ speaker ]
*/

#include "speaker.h"
#include "../pcm1bit.h"
#include "../sn76489an.h"

void SPEAKER::initialize()
{
	d_pcm->write_signal(SIG_PCM1BIT_MUTE, 1, 1);
	d_psg->write_signal(SIG_SN76489AN_MUTE, 1, 1);
}

void SPEAKER::write_signal(int id, uint32 data, uint32 mask)
{
	if((data & 0x62) == 0x02) {
		d_pcm->write_signal(SIG_PCM1BIT_MUTE, 0, 0);
	}
	else {
		d_pcm->write_signal(SIG_PCM1BIT_MUTE, 1, 1);
	}
	if((data & 0x60) == 0x60) {
		d_psg->write_signal(SIG_SN76489AN_MUTE, 0, 0);
	}
	else {
		d_psg->write_signal(SIG_SN76489AN_MUTE, 1, 1);
	}
}

