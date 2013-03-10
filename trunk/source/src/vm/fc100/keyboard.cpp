/*
	[ keyboard ]
*/

#include "keyboard.h"
/* FC-100 KEYLAYOUT

					F1		F2		F3		F4		F5					STOP/RUN

			 !    @    #    $    ^    &    %    *    (    )    _    +       
	  ESC    1    2    3    4    5    6    7    8    9    0    =    ~    BS           HOME/CLR INS DEL
                                                                 {    }    |
	  TAB      Q    W    E    R    T    Y    U    I    O    P    [    ]    \
                                                              :    "
    CTRL CAPS    A    S    D    F    G    H    J    K    L    ;    '   RETURN				UP
                                                      <    >    ?
		   SHIFT   Z    X    C    V    B    N    M    ,    .    /   SHIFT            LEFT  DOWN RIGHT                     

			   [GRAP]                 [ SPACE ]              [¹ÌÈ®ÀÎ]  
*/
static const uint8 key_map[16][8] = {//
	{0x4f, 0x50, 0xdd, 0xdb, 0x14, 0x11, 0x10, 0x12},//00:  O     P     ]     [   CAPS  CTRL  SHIFT GRAP
	{0x0d, 0xbb, 0x08, 0xdc, 0x00, 0x00, 0x00, 0x00},//01:  CR     =    BS    \                          
	{0x26, 0x27, 0x28, 0x25, 0x00, 0x00, 0x00, 0x00},//02:  UP  LEFT  DOWN RIGHT
	{0x09, 0xde, 0xba, 0x39, 0x00, 0x00, 0x00, 0x00},//03: TAB     '     ;     9
	{0x38, 0x37, 0x36, 0x35, 0x00, 0x00, 0x00, 0x00},//04:   8     7     6     5
	{0x34, 0x33, 0x32, 0x31, 0x00, 0x00, 0x00, 0x00},//06:   4     3     2     1                         
	{0x30, 0x7b, 0x20, 0x74, 0x00, 0x00, 0x00, 0x00},//07:   0   RUN   SPC    F5
	{0x73, 0x72, 0x71, 0x70, 0x00, 0x00, 0x00, 0x00},//08:  F4    F3    F2    F1                        
	{0xbc, 0xbe, 0xbf, 0xbd, 0x00, 0x00, 0x00, 0x00},//0F:   ,     .     /     -
	{0x1b, 0x2e, 0x2d, 0x24, 0x00, 0x00, 0x00, 0x00},//09: ESC   DEL   INS  HOME                            
	{0x4c, 0x4d, 0x4e, 0x42, 0x00, 0x00, 0x00, 0x00},//0A:   M     L     N     B
	{0x56, 0x43, 0x58, 0x5a, 0x00, 0x00, 0x00, 0x00},//0B:   V     C     X     Z
	{0x4b, 0x4a, 0x48, 0x47, 0x00, 0x00, 0x00, 0x00},//0C:   K     J     H     G
	{0x46, 0x44, 0x53, 0x41, 0x00, 0x00, 0x00, 0x00},//0D:   F     D     S     A
	{0x49, 0x55, 0x59, 0x54, 0x00, 0x00, 0x00, 0x00},//0E:   I     U     Y     T
	{0x52, 0x45, 0x57, 0x51, 0x00, 0x00, 0x00, 0x00},//0F:     
};

void KEYBOARD::initialize()
{
	key_stat = emu->key_buffer();
}

void KEYBOARD::reset()
{
	memset(status, 0xff, sizeof(status));
}

uint32 KEYBOARD::read_io8(uint32 addr)
{
	return status[addr & 0x0f];
}

void KEYBOARD::set_keyboard()
{
	for(int i = 0; i < 16; i++) {
		uint8 val = i ? 0xf0 : 0;
		for(int j = 0; j < (i ? 4 : 8); j++) {
			val |= key_stat[key_map[i][j]] ? 0 : (1 << j);
		}
		status[i] = val;
	}
}
