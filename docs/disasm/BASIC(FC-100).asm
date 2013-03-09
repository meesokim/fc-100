; Disassembly of the file "*\BASIC(FC-100).ROM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Sunday, 27 of January 2013 at 08:16 AM
; 
0000 F3        DI      
0001 C38919    JP      1989H
0004 A9        XOR     C
0005 4E        LD      C,(HL)
0006 C44E7E    CALL    NZ,7E4EH
0009 E3        EX      (SP),HL
000a BE        CP      (HL)
000b 23        INC     HL
000c E3        EX      (SP),HL
000d C25F05    JP      NZ,055FH
0010 23        INC     HL
0011 7E        LD      A,(HL)
0012 FE3A      CP      3AH
0014 D0        RET     NC

0015 C3950A    JP      0A95H
0018 F5        PUSH    AF
0019 C30A32    JP      320AH
001c 00        NOP     
001d 00        NOP     
001e 00        NOP     
001f 00        NOP     
0020 7C        LD      A,H
0021 92        SUB     D
0022 C0        RET     NZ

0023 7D        LD      A,L
0024 93        SUB     E
0025 C9        RET     

0026 00        NOP     
0027 00        NOP     
0028 3AAAFF    LD      A,(0FFAAH)
002b B7        OR      A
002c C28C4D    JP      NZ,4D8CH
002f C9        RET     

0030 3A42FE    LD      A,(0FE42H)
0033 FE08      CP      08H
0035 C39813    JP      1398H
0038 CD05FB    CALL    0FB05H
003b C3BA1C    JP      1CBAH
003e 21AF04    LD      HL,04AFH
0041 11A0FB    LD      DE,0FBA0H
0044 015E00    LD      BC,005EH
0047 EDB0      LDIR    
0049 21FEFB    LD      HL,0FBFEH
004c 363A      LD      (HL),3AH
004e 21BFFE    LD      HL,0FEBFH
0051 2227FF    LD      (0FF27H),HL
0054 CD5947    CALL    4759H
0057 210060    LD      HL,6000H
005a 3E47      LD      A,47H
005c BE        CP      (HL)
005d 200E      JR      NZ,006DH         ; (+0eH)
005f 23        INC     HL
0060 3E53      LD      A,53H
0062 BE        CP      (HL)
0063 2008      JR      NZ,006DH         ; (+08H)
0065 216D00    LD      HL,006DH
0068 E5        PUSH    HL
0069 2A0260    LD      HL,(6002H)
006c E9        JP      (HL)
006d AF        XOR     A
006e 3240FE    LD      (0FE40H),A
0071 323CC7    LD      (0C73CH),A
0074 21FB00    LD      HL,00FBH
0077 CD3541    CALL    4135H
007a 2AEEFA    LD      HL,(0FAEEH)
007d 22FAFB    LD      (0FBFAH),HL
0080 7C        LD      A,H
0081 E640      AND     40H
0083 21FEBF    LD      HL,0BFFEH
0086 2827      JR      Z,00AFH          ; (+27H)
0088 21E000    LD      HL,00E0H
008b CD3541    CALL    4135H
008e CD9738    CALL    3897H
0091 D7        RST     10H
0092 B7        OR      A
0093 280E      JR      Z,00A3H          ; (+0eH)
0095 D631      SUB     31H
0097 DA8800    JP      C,0088H
009a FE02      CP      02H
009c D28800    JP      NC,0088H
009f 3C        INC     A
00a0 3292C6    LD      (0C692H),A
00a3 3A92C6    LD      A,(0C692H)
00a6 21FEDF    LD      HL,0DFFEH
00a9 3D        DEC     A
00aa 2003      JR      NZ,00AFH         ; (+03H)
00ac 21FEF9    LD      HL,0F9FEH
00af 11D4FE    LD      DE,0FED4H
00b2 2251FE    LD      (0FE51H),HL
00b5 19        ADD     HL,DE
00b6 22F6FB    LD      (0FBF6H),HL
00b9 CD0F47    CALL    470FH
00bc 2AF6FB    LD      HL,(0FBF6H)
00bf 11EFFF    LD      DE,0FFEFH
00c2 19        ADD     HL,DE
00c3 ED5BFAFB  LD      DE,(0FBFAH)
00c7 7D        LD      A,L
00c8 93        SUB     E
00c9 6F        LD      L,A
00ca 7C        LD      A,H
00cb 9A        SBC     A,D
00cc 67        LD      H,A
00cd 23        INC     HL
00ce CD5654    CALL    5456H
00d1 21E600    LD      HL,00E6H
00d4 CD3541    CALL    4135H
00d7 3143FD    LD      SP,0FD43H
00da CD5947    CALL    4759H
00dd C31F06    JP      061FH
00e0 50        LD      D,B
00e1 61        LD      H,C
00e2 67        LD      H,A
00e3 65        LD      H,L
00e4 73        LD      (HL),E
00e5 00        NOP     
00e6 2042      JR      NZ,012AH         ; (+42H)
00e8 79        LD      A,C
00e9 74        LD      (HL),H
00ea 65        LD      H,L
00eb 73        LD      (HL),E
00ec 2075      JR      NZ,0163H         ; (+75H)
00ee 73        LD      (HL),E
00ef 65        LD      H,L
00f0 72        LD      (HL),D
00f1 206D      JR      NZ,0160H         ; (+6dH)
00f3 65        LD      H,L
00f4 6D        LD      L,L
00f5 6F        LD      L,A
00f6 72        LD      (HL),D
00f7 79        LD      A,C
00f8 0D        DEC     C
00f9 0A        LD      A,(BC)
00fa 00        NOP     
00fb 47        LD      B,A
00fc 53        LD      D,E
00fd 2D        DEC     L
00fe 42        LD      B,D
00ff 41        LD      B,C
0100 53        LD      D,E
0101 49        LD      C,C
0102 43        LD      B,E
0103 2056      JR      NZ,015BH         ; (+56H)
0105 312E30    LD      SP,302EH
0108 2042      JR      NZ,014CH         ; (+42H)
010a 79        LD      A,C
010b 204D      JR      NZ,015AH         ; (+4dH)
010d 69        LD      L,C
010e 63        LD      H,E
010f 72        LD      (HL),D
0110 6F        LD      L,A
0111 73        LD      (HL),E
0112 6F        LD      L,A
0113 66        LD      H,(HL)
0114 74        LD      (HL),H
0115 2863      JR      Z,017AH          ; (+63H)
0117 29        ADD     HL,HL
0118 0D        DEC     C
0119 0A        LD      A,(BC)
011a 00        NOP     
011b A7        AND     A
011c 47        LD      B,A
011d 9D        SBC     A,L
011e 09        ADD     HL,BC
011f CC484B    CALL    Z,4B48H
0122 0C        INC     C
0123 260F      LD      H,0FH
0125 C9        RET     

0126 44        LD      B,H
0127 9E        SBC     A,(HL)
0128 0F        RRCA    
0129 70        LD      (HL),B
012a 0C        INC     C
012b F7        RST     30H
012c 0B        DEC     BC
012d CC0B9F    CALL    Z,9F0BH
0130 0D        DEC     C
0131 89        ADC     A,C
0132 47        LD      B,A
0133 E0        RET     PO

0134 0B        DEC     BC
0135 300C      JR      NC,0143H         ; (+0cH)
0137 4D        LD      C,L
0138 0C        INC     C
0139 A3        AND     E
013a 47        LD      B,A
013b DB0D      IN      A,(0DH)
013d 88        ADC     A,B
013e 48        LD      C,B
013f 49        LD      C,C
0140 160E      LD      D,0EH
0142 47        LD      B,A
0143 D40C0F    CALL    NC,0F0CH
0146 1654      LD      D,54H
0148 14        INC     D
0149 37        SCF     
014a 18ED      JR      0139H            ; (-13H)
014c 47        LD      B,A
014d CD33F3    CALL    0F333H
0150 33        INC     SP
0151 09        ADD     HL,BC
0152 16D7      LD      D,0D7H
0154 0D        DEC     C
0155 44        LD      B,H
0156 164D      LD      D,4DH
0158 0C        INC     C
0159 014802    LD      BC,0248H
015c 48        LD      C,B
015d 0F        RRCA    
015e 48        LD      C,B
015f C5        PUSH    BC
0160 3C        INC     A
0161 64        LD      H,H
0162 0D        DEC     C
0163 17        RLA     
0164 0D        DEC     C
0165 F617      OR      17H
0167 6F        LD      L,A
0168 0D        DEC     C
0169 67        LD      H,A
016a 18F9      JR      0165H            ; (-07H)
016c 2A6B3D    LD      HL,(3D6BH)
016f 66        LD      H,(HL)
0170 3D        DEC     A
0171 382C      JR      C,019FH          ; (+2cH)
0173 C22B44    JP      NZ,442BH
0176 2C        INC     L
0177 DA303A    JP      C,3A30H
017a 3F        CCF     
017b F1        POP     AF
017c 2C        INC     L
017d 1D        DEC     E
017e 2B        DEC     HL
017f 5C        LD      E,H
0180 5C        LD      E,H
0181 D9        EXX     
0182 2C        INC     L
0183 D1        POP     DE
0184 29        ADD     HL,HL
0185 9D        SBC     A,L
0186 31DC31    LD      SP,31DCH
0189 E631      AND     31H
018b EB        EX      DE,HL
018c 31F031    LD      SP,31F0H
018f F5        PUSH    AF
0190 31460B    LD      SP,0B46H
0193 49        LD      C,C
0194 0B        DEC     BC
0195 4C        LD      C,H
0196 0B        DEC     BC
0197 4F        LD      C,A
0198 0B        DEC     BC
0199 DB0E      IN      A,(0EH)
019b 04        INC     B
019c 321D43    LD      (431DH),A
019f 4D        LD      C,L
01a0 43        LD      B,E
01a1 56        LD      D,(HL)
01a2 43        LD      B,E
01a3 BC        CP      H
01a4 4D        LD      C,L
01a5 5C        LD      E,H
01a6 4F        LD      C,A
01a7 A9        XOR     C
01a8 4D        LD      C,L
01a9 1C        INC     E
01aa 59        LD      E,C
01ab B3        OR      E
01ac 5A        LD      E,D
01ad 2A5B1F    LD      HL,(1F5BH)
01b0 4C        LD      C,H
01b1 CC5924    CALL    Z,2459H
01b4 5B        LD      E,E
01b5 C5        PUSH    BC
01b6 5B        LD      E,E
01b7 DA5BA8    JP      C,0A85BH
01ba 44        LD      B,H
01bb F41502    CALL    P,0215H
01be 14        INC     D
01bf BB        CP      E
01c0 42        LD      B,D
01c1 C1        POP     BC
01c2 40        LD      B,B
01c3 77        LD      (HL),A
01c4 43        LD      B,E
01c5 C7        RST     00H
01c6 42        LD      B,D
01c7 D7        RST     10H
01c8 42        LD      B,D
01c9 3018      JR      NC,01E3H         ; (+18H)
01cb 04        INC     B
01cc 43        LD      B,E
01cd B7        OR      A
01ce 40        LD      B,B
01cf BC        CP      H
01d0 40        LD      B,B
01d1 F21370    JP      P,7013H
01d4 3090      JR      NC,0166H         ; (-70H)
01d6 30FF      JR      NC,01D7H         ; (-01H)
01d8 31FA31    LD      SP,31FAH
01db A9        XOR     C
01dc 4E        LD      C,(HL)
01dd DB4E      IN      A,(4EH)
01df 05        DEC     B
01e0 4F        LD      C,A
01e1 4D        LD      C,L
01e2 4F        LD      C,A
01e3 17        RLA     
01e4 02        LD      (BC),A
01e5 2802      JR      Z,01E9H          ; (+02H)
01e7 2D        DEC     L
01e8 02        LD      (BC),A
01e9 6F        LD      L,A
01ea 02        LD      (BC),A
01eb 9D        SBC     A,L
01ec 02        LD      (BC),A
01ed C302CF    JP      0CF02H
01f0 02        LD      (BC),A
01f1 E1        POP     HL
01f2 02        LD      (BC),A
01f3 E602      AND     02H
01f5 02        LD      (BC),A
01f6 03        INC     BC
01f7 03        INC     BC
01f8 03        INC     BC
01f9 07        RLCA    
01fa 03        INC     BC
01fb 3803      JR      C,0200H          ; (+03H)
01fd 48        LD      C,B
01fe 03        INC     BC
01ff 53        LD      D,E
0200 03        INC     BC
0201 5F        LD      E,A
0202 03        INC     BC
0203 94        SUB     H
0204 03        INC     BC
0205 95        SUB     L
0206 03        INC     BC
0207 C1        POP     BC
0208 03        INC     BC
0209 FD03      INC     BC
020b 14        INC     D
020c 04        INC     B
020d 1D        DEC     E
020e 04        INC     B
020f 27        DAA     
0210 04        INC     B
0211 2C        INC     L
0212 04        INC     B
0213 3004      JR      NC,0219H         ; (+04H)
0215 310455    LD      SP,5504H
0218 54        LD      D,H
0219 CF        RST     08H
021a A7        AND     A
021b 4E        LD      C,(HL)
021c C4EE42    CALL    NZ,42EEH
021f D306      OUT     (06H),A
0221 54        LD      D,H
0222 CE0E      ADC     A,0EH
0224 53        LD      D,E
0225 C31500    JP      0015H
0228 45        LD      B,L
0229 45        LD      B,L
022a D0        RET     NC

022b B5        OR      L
022c 00        NOP     
022d 4F        LD      C,A
022e 4E        LD      C,(HL)
022f D4994C    CALL    NC,4C99H
0232 45        LD      B,L
0233 41        LD      B,C
0234 D2924C    JP      NC,4C92H
0237 4F        LD      C,A
0238 41        LD      B,C
0239 C49B53    CALL    NZ,539BH
023c 41        LD      B,C
023d 56        LD      D,(HL)
023e C5        PUSH    BC
023f 9A        SBC     A,D
0240 4C        LD      C,H
0241 D3AC      OUT     (0ACH),A
0243 4F        LD      C,A
0244 4C        LD      C,H
0245 4F        LD      C,A
0246 D2AD4F    JP      NC,4FADH
0249 4E        LD      C,(HL)
024a 53        LD      D,E
024b 4F        LD      C,A
024c 4C        LD      C,H
024d C5        PUSH    BC
024e B2        OR      D
024f 49        LD      C,C
0250 52        LD      D,D
0251 43        LD      B,E
0252 4C        LD      C,H
0253 C5        PUSH    BC
0254 B8        CP      B
0255 49        LD      C,C
0256 4E        LD      C,(HL)
0257 D42053    CALL    NC,5320H
025a 4E        LD      C,(HL)
025b C7        RST     00H
025c 214442    LD      HL,4244H
025f CC224F    CALL    Z,4F22H
0262 D30C      OUT     (0CH),A
0264 48        LD      C,B
0265 52        LD      D,D
0266 A4        AND     H
0267 1653      LD      D,53H
0269 52        LD      D,D
026a 4C        LD      C,H
026b 49        LD      C,C
026c CED3      ADC     A,0D3H
026e 00        NOP     
026f 45        LD      B,L
0270 4C        LD      C,H
0271 45        LD      B,L
0272 54        LD      D,H
0273 C5        PUSH    BC
0274 A6        AND     (HL)
0275 41        LD      B,C
0276 54        LD      D,H
0277 C1        POP     BC
0278 84        ADD     A,H
0279 41        LD      B,C
027a 54        LD      D,H
027b 45        LD      B,L
027c A4        AND     H
027d C1        POP     BC
027e 49        LD      C,C
027f CD8645    CALL    4586H
0282 46        LD      B,(HL)
0283 53        LD      D,E
0284 54        LD      D,H
0285 D2BC45    JP      NC,45BCH
0288 46        LD      B,(HL)
0289 49        LD      C,C
028a 4E        LD      C,(HL)
028b D4BD45    CALL    NC,45BDH
028e 46        LD      B,(HL)
028f 53        LD      D,E
0290 4E        LD      C,(HL)
0291 C7        RST     00H
0292 BE        CP      (HL)
0293 45        LD      B,L
0294 46        LD      B,(HL)
0295 44        LD      B,H
0296 42        LD      B,D
0297 CCBF45    CALL    Z,45BFH
029a C697      ADD     A,97H
029c 00        NOP     
029d 4C        LD      C,H
029e 53        LD      D,E
029f C5        PUSH    BC
02a0 9F        SBC     A,A
02a1 4E        LD      C,(HL)
02a2 C48152    CALL    NZ,5281H
02a5 41        LD      B,C
02a6 53        LD      D,E
02a7 C5        PUSH    BC
02a8 A2        AND     D
02a9 44        LD      B,H
02aa 49        LD      C,C
02ab D4A352    CALL    NC,52A3H
02ae 52        LD      D,D
02af 4F        LD      C,A
02b0 D2A458    JP      NC,58A4H
02b3 45        LD      B,L
02b4 C3B752    JP      52B7H
02b7 CCCB52    CALL    Z,52CBH
02ba D2CC58    JP      NC,58CCH
02bd D0        RET     NC

02be 0B        DEC     BC
02bf 51        LD      D,C
02c0 D6F1      SUB     0F1H
02c2 00        NOP     
02c3 4F        LD      C,A
02c4 D282CE    JP      NC,0CE82H
02c7 C8        RET     Z

02c8 52        LD      D,D
02c9 C5        PUSH    BC
02ca 0F        RRCA    
02cb 49        LD      C,C
02cc D8        RET     C

02cd 23        INC     HL
02ce 00        NOP     
02cf 4F        LD      C,A
02d0 54        LD      D,H
02d1 CF        RST     08H
02d2 89        ADC     A,C
02d3 4F        LD      C,A
02d4 2054      JR      NZ,032AH         ; (+54H)
02d6 CF        RST     08H
02d7 89        ADC     A,C
02d8 4F        LD      C,A
02d9 53        LD      D,E
02da 55        LD      D,L
02db C28D45    JP      NZ,458DH
02de D4B900    CALL    NC,00B9H
02e1 45        LD      B,L
02e2 58        LD      E,B
02e3 A4        AND     H
02e4 1A        LD      A,(DE)
02e5 00        NOP     
02e6 4E        LD      C,(HL)
02e7 50        LD      D,B
02e8 55        LD      D,L
02e9 D485C6    CALL    NC,0C685H
02ec 8B        ADC     A,E
02ed 4E        LD      C,(HL)
02ee 53        LD      D,E
02ef 54        LD      D,H
02f0 D2CF4E    JP      NC,4ECFH
02f3 D4054E    CALL    NC,4E05H
02f6 D0        RET     NC

02f7 104D      DJNZ    0346H            ; (+4dH)
02f9 D0        RET     NC

02fa F24E4B    JP      P,4B4EH
02fd 45        LD      B,L
02fe 59        LD      E,C
02ff A4        AND     H
0300 D20000    JP      NC,0000H
0303 45        LD      B,L
0304 D9        EXX     
0305 B6        OR      (HL)
0306 00        NOP     
0307 4F        LD      C,A
0308 43        LD      B,E
0309 41        LD      B,C
030a 54        LD      D,H
030b C5        PUSH    BC
030c A9        XOR     C
030d 43        LD      B,E
030e 4F        LD      C,A
030f 50        LD      D,B
0310 D9        EXX     
0311 AF        XOR     A
0312 50        LD      D,B
0313 52        LD      D,D
0314 49        LD      C,C
0315 4E        LD      C,(HL)
0316 D49D4C    CALL    NC,4C9DH
0319 49        LD      C,C
031a 53        LD      D,E
031b D49E50    CALL    NC,509EH
031e 4F        LD      C,A
031f D31B      OUT     (1BH),A
0321 45        LD      B,L
0322 D48849    CALL    NC,4988H
0325 4E        LD      C,(HL)
0326 C5        PUSH    BC
0327 C0        RET     NZ

0328 49        LD      C,C
0329 53        LD      D,E
032a D4934F    CALL    NC,4F93H
032d C7        RST     00H
032e 0A        LD      A,(BC)
032f 45        LD      B,L
0330 CE12      ADC     A,12H
0332 45        LD      B,L
0333 46        LD      B,(HL)
0334 54        LD      D,H
0335 A4        AND     H
0336 010045    LD      BC,4500H
0339 52        LD      D,D
033a 47        LD      B,A
033b C5        PUSH    BC
033c BB        CP      E
033d 4F        LD      C,A
033e CEB3      ADC     A,0B3H
0340 4F        LD      C,A
0341 C4F349    CALL    NZ,49F3H
0344 44        LD      B,H
0345 A4        AND     H
0346 03        INC     BC
0347 00        NOP     
0348 45        LD      B,L
0349 58        LD      E,B
034a D48345    CALL    NC,4583H
034d D7        RST     10H
034e 94        SUB     H
034f 4F        LD      C,A
0350 D4CA00    CALL    NC,00CAH
0353 55        LD      D,L
0354 D49CCE    CALL    NC,0CE9CH
0357 95        SUB     L
0358 D2EF43    JP      NC,43EFH
035b 54        LD      D,H
035c A4        AND     H
035d 19        ADD     HL,DE
035e 00        NOP     
035f 52        LD      D,D
0360 49        LD      C,C
0361 4E        LD      C,(HL)
0362 D49155    CALL    NC,5591H
0365 D4BA4F    CALL    NC,4FBAH
0368 4B        LD      C,E
0369 C5        PUSH    BC
036a 98        SBC     A,B
036b 52        LD      D,D
036c 45        LD      B,L
036d 53        LD      D,E
036e 45        LD      B,L
036f D4AB53    CALL    NC,53ABH
0372 45        LD      B,L
0373 D4AA41    CALL    NC,41AAH
0376 49        LD      C,C
0377 4E        LD      C,(HL)
0378 D4B04C    CALL    NC,4CB0H
037b 41        LD      B,C
037c D9        EXX     
037d B1        OR      C
037e 4F        LD      C,A
037f 49        LD      C,C
0380 4E        LD      C,(HL)
0381 D4D44F    CALL    NC,4FD4H
0384 D311      OUT     (11H),A
0386 45        LD      B,L
0387 45        LD      B,L
0388 CB17      RL      A
038a 44        LD      B,H
038b 4C        LD      C,H
038c 54        LD      D,H
038d 52        LD      D,D
038e C7        RST     00H
038f 1E44      LD      E,44H
0391 CC1F00    CALL    Z,001FH
0394 00        NOP     
0395 45        LD      B,L
0396 54        LD      D,H
0397 55        LD      D,L
0398 52        LD      D,D
0399 CE8E      ADC     A,8EH
039b 45        LD      B,L
039c 41        LD      B,C
039d C48755    CALL    NZ,5587H
03a0 CE8A      ADC     A,8AH
03a2 45        LD      B,L
03a3 53        LD      D,E
03a4 54        LD      D,H
03a5 4F        LD      C,A
03a6 52        LD      D,D
03a7 C5        PUSH    BC
03a8 8C        ADC     A,H
03a9 45        LD      B,L
03aa CD8F45    CALL    458FH
03ad 53        LD      D,E
03ae 55        LD      D,L
03af 4D        LD      C,L
03b0 C5        PUSH    BC
03b1 A5        AND     L
03b2 49        LD      C,C
03b3 47        LD      B,A
03b4 48        LD      C,B
03b5 54        LD      D,H
03b6 A4        AND     H
03b7 02        LD      (BC),A
03b8 4E        LD      C,(HL)
03b9 C40845    CALL    NZ,4508H
03bc 4E        LD      C,(HL)
03bd 55        LD      D,L
03be CDA800    CALL    00A8H
03c1 54        LD      D,H
03c2 4F        LD      C,A
03c3 D0        RET     NC

03c4 90        SUB     B
03c5 50        LD      D,B
03c6 43        LD      B,E
03c7 A8        XOR     B
03c8 C9        RET     

03c9 54        LD      D,H
03ca 45        LD      B,L
03cb D0        RET     NC

03cc C643      ADD     A,43H
03ce 52        LD      D,D
03cf 45        LD      B,L
03d0 45        LD      B,L
03d1 CEAE      ADC     A,0AEH
03d3 4F        LD      C,A
03d4 55        LD      D,L
03d5 4E        LD      C,(HL)
03d6 C4B447    CALL    NZ,47B4H
03d9 CE04      ADC     A,04H
03db 51        LD      D,C
03dc D20749    JP      NC,4907H
03df CE09      ADC     A,09H
03e1 54        LD      D,H
03e2 52        LD      D,D
03e3 A4        AND     H
03e4 13        INC     DE
03e5 54        LD      D,H
03e6 52        LD      D,D
03e7 49        LD      C,C
03e8 4E        LD      C,(HL)
03e9 47        LD      B,A
03ea A4        AND     H
03eb CD5041    CALL    4150H
03ee 43        LD      B,E
03ef 45        LD      B,L
03f0 A4        AND     H
03f1 1854      JR      0447H            ; (+54H)
03f3 49        LD      C,C
03f4 43        LD      B,E
03f5 CB1C      RR      H
03f7 54        LD      D,H
03f8 52        LD      D,D
03f9 49        LD      C,C
03fa C7        RST     00H
03fb 1D        DEC     E
03fc 00        NOP     
03fd 48        LD      C,B
03fe 45        LD      B,L
03ff CEC4      ADC     A,0C4H
0401 52        LD      D,D
0402 4F        LD      C,A
0403 CEA0      ADC     A,0A0H
0405 52        LD      D,D
0406 4F        LD      C,A
0407 46        LD      B,(HL)
0408 C6A1      ADD     A,0A1H
040a 41        LD      B,C
040b 42        LD      B,D
040c A8        XOR     B
040d C5        PUSH    BC
040e CF        RST     08H
040f C341CE    JP      0CE41H
0412 0D        DEC     C
0413 00        NOP     
0414 53        LD      D,E
0415 49        LD      C,C
0416 4E        LD      C,(HL)
0417 C7        RST     00H
0418 CE53      ADC     A,53H
041a D2C700    JP      NC,00C7H
041d 41        LD      B,C
041e CC1441    CALL    Z,4114H
0421 52        LD      D,D
0422 50        LD      D,B
0423 54        LD      D,H
0424 D2D100    JP      NC,00D1H
0427 41        LD      B,C
0428 49        LD      C,C
0429 D49600    CALL    NC,0096H
042c 4F        LD      C,A
042d D2F000    JP      NC,00F0H
0430 00        NOP     
0431 00        NOP     
0432 AB        XOR     E
0433 E9        JP      (HL)
0434 AD        XOR     L
0435 EAAAEB    JP      PE,0EBAAH
0438 AF        XOR     A
0439 ECDEED    CALL    PE,0EDDEH
043c DCF4A7    CALL    C,0A7F4H
043f D0        RET     NC

0440 BE        CP      (HL)
0441 E6BD      AND     0BDH
0443 E7        RST     20H
0444 BC        CP      H
0445 E8        RET     PE

0446 00        NOP     
0447 79        LD      A,C
0448 79        LD      A,C
0449 7C        LD      A,H
044a 7C        LD      A,H
044b 7F        LD      A,A
044c 50        LD      D,B
044d 46        LD      B,(HL)
044e 3C        INC     A
044f 32287A    LD      (7A28H),A
0452 7B        LD      A,E
0453 05        DEC     B
0454 4F        LD      C,A
0455 00        NOP     
0456 00        NOP     
0457 A9        XOR     C
0458 4E        LD      C,(HL)
0459 1D        DEC     E
045a 4F        LD      C,A
045b DB4E      IN      A,(4EH)
045d EB        EX      DE,HL
045e 50        LD      D,B
045f E45017    CALL    PO,1750H
0462 52        LD      D,D
0463 69        LD      L,C
0464 52        LD      D,D
0465 A2        AND     D
0466 4E        LD      C,(HL)
0467 FB        EI      
0468 4A        LD      C,D
0469 F8        RET     M

046a 4A        LD      C,D
046b 62        LD      H,D
046c 4C        LD      C,H
046d C34C3D    JP      3D4CH
0470 4E        LD      C,(HL)
0471 0150F6    LD      BC,0F650H
0474 4F        LD      C,A
0475 2150FF    LD      HL,0FF50H
0478 11684E    LD      DE,4E68H
047b 4E        LD      C,(HL)
047c 46        LD      B,(HL)
047d 53        LD      D,E
047e 4E        LD      C,(HL)
047f 52        LD      D,D
0480 47        LD      B,A
0481 4F        LD      C,A
0482 44        LD      B,H
0483 46        LD      B,(HL)
0484 43        LD      B,E
0485 4F        LD      C,A
0486 56        LD      D,(HL)
0487 4F        LD      C,A
0488 4D        LD      C,L
0489 55        LD      D,L
048a 4C        LD      C,H
048b 42        LD      B,D
048c 53        LD      D,E
048d 44        LD      B,H
048e 44        LD      B,H
048f 2F        CPL     
0490 3049      JR      NC,04DBH         ; (+49H)
0492 44        LD      B,H
0493 54        LD      D,H
0494 4D        LD      C,L
0495 4F        LD      C,A
0496 53        LD      D,E
0497 4C        LD      C,H
0498 53        LD      D,E
0499 53        LD      D,E
049a 54        LD      D,H
049b 43        LD      B,E
049c 4E        LD      C,(HL)
049d 55        LD      D,L
049e 46        LD      B,(HL)
049f 4E        LD      C,(HL)
04a0 52        LD      D,D
04a1 52        LD      D,D
04a2 57        LD      D,A
04a3 55        LD      D,L
04a4 45        LD      B,L
04a5 4D        LD      C,L
04a6 4F        LD      C,A
04a7 42        LD      B,D
04a8 4F        LD      C,A
04a9 54        LD      D,H
04aa 52        LD      D,D
04ab 3F        CCF     
04ac 3F        CCF     
04ad 3F        CCF     
04ae 3F        CCF     
04af D600      SUB     00H
04b1 6F        LD      L,A
04b2 7C        LD      A,H
04b3 DE00      SBC     A,00H
04b5 67        LD      H,A
04b6 78        LD      A,B
04b7 DE00      SBC     A,00H
04b9 47        LD      B,A
04ba 3E00      LD      A,00H
04bc C9        RET     

04bd 00        NOP     
04be 00        NOP     
04bf 00        NOP     
04c0 35        DEC     (HL)
04c1 4A        LD      C,D
04c2 CA9939    JP      Z,3999H
04c5 1C        INC     E
04c6 76        HALT    
04c7 98        SBC     A,B
04c8 2295B3    LD      (0B395H),HL
04cb 98        SBC     A,B
04cc 0A        LD      A,(BC)
04cd DD47      LD      B,A
04cf 98        SBC     A,B
04d0 53        LD      D,E
04d1 D1        POP     DE
04d2 99        SBC     A,C
04d3 99        SBC     A,C
04d4 0A        LD      A,(BC)
04d5 1A        LD      A,(DE)
04d6 9F        SBC     A,A
04d7 98        SBC     A,B
04d8 65        LD      H,L
04d9 BC        CP      H
04da CD98D6    CALL    0D698H
04dd 77        LD      (HL),A
04de 3E98      LD      A,98H
04e0 52        LD      D,D
04e1 C7        RST     00H
04e2 4F        LD      C,A
04e3 80        ADD     A,B
04e4 3A0000    LD      A,(0000H)
04e7 00        NOP     
04e8 00        NOP     
04e9 88        ADC     A,B
04ea 0B        DEC     BC
04eb 88        ADC     A,B
04ec 0B        DEC     BC
04ed 88        ADC     A,B
04ee 0B        DEC     BC
04ef 88        ADC     A,B
04f0 0B        DEC     BC
04f1 88        ADC     A,B
04f2 0B        DEC     BC
04f3 88        ADC     A,B
04f4 0B        DEC     BC
04f5 88        ADC     A,B
04f6 0B        DEC     BC
04f7 88        ADC     A,B
04f8 0B        DEC     BC
04f9 88        ADC     A,B
04fa 0B        DEC     BC
04fb 88        ADC     A,B
04fc 0B        DEC     BC
04fd 00        NOP     
04fe 00        NOP     
04ff 00        NOP     
0500 00        NOP     
0501 200E      JR      NZ,0511H         ; (+0eH)
0503 00        NOP     
0504 00        NOP     
0505 A0        AND     B
0506 C7        RST     00H
0507 FEFF      CP      0FFH
0509 3D        DEC     A
050a C7        RST     00H
050b 00        NOP     
050c 00        NOP     
050d 2045      JR      NZ,0554H         ; (+45H)
050f 72        LD      (HL),D
0510 72        LD      (HL),D
0511 6F        LD      L,A
0512 72        LD      (HL),D
0513 00        NOP     
0514 2069      JR      NZ,057FH         ; (+69H)
0516 6E        LD      L,(HL)
0517 2000      JR      NZ,0519H         ; (+00H)
0519 52        LD      D,D
051a 65        LD      H,L
051b 61        LD      H,C
051c 64        LD      H,H
051d 79        LD      A,C
051e 0D        DEC     C
051f 0A        LD      A,(BC)
0520 00        NOP     
0521 42        LD      B,D
0522 72        LD      (HL),D
0523 65        LD      H,L
0524 61        LD      H,C
0525 6B        LD      L,E
0526 00        NOP     
0527 210400    LD      HL,0004H
052a 39        ADD     HL,SP
052b 7E        LD      A,(HL)
052c 23        INC     HL
052d FE82      CP      82H
052f C0        RET     NZ

0530 4E        LD      C,(HL)
0531 23        INC     HL
0532 46        LD      B,(HL)
0533 23        INC     HL
0534 E5        PUSH    HL
0535 60        LD      H,B
0536 69        LD      L,C
0537 7A        LD      A,D
0538 B3        OR      E
0539 EB        EX      DE,HL
053a 2802      JR      Z,053EH          ; (+02H)
053c EB        EX      DE,HL
053d E7        RST     20H
053e 010E00    LD      BC,000EH
0541 E1        POP     HL
0542 C8        RET     Z

0543 09        ADD     HL,BC
0544 18E5      JR      052BH            ; (-1bH)
0546 2AF8FB    LD      HL,(0FBF8H)
0549 7C        LD      A,H
054a A5        AND     L
054b 3C        INC     A
054c 2808      JR      Z,0556H          ; (+08H)
054e 3A96FE    LD      A,(0FE96H)
0551 B7        OR      A
0552 1E13      LD      E,13H
0554 2023      JR      NZ,0579H         ; (+23H)
0556 C3B947    JP      47B9H
0559 2A7EFE    LD      HL,(0FE7EH)
055c 22F8FB    LD      (0FBF8H),HL
055f 1E02      LD      E,02H
0561 011E0B    LD      BC,0B1EH
0564 011E01    LD      BC,011EH
0567 011E0A    LD      BC,0A1EH
056a 011E12    LD      BC,121EH
056d 011E14    LD      BC,141EH
0570 011E06    LD      BC,061EH
0573 011E16    LD      BC,161EH
0576 011E0D    LD      BC,0D1EH
0579 2AFCFB    LD      HL,(0FBFCH)
057c 7C        LD      A,H
057d B5        OR      L
057e 280A      JR      Z,058AH          ; (+0aH)
0580 3A97FF    LD      A,(0FF97H)
0583 77        LD      (HL),A
0584 210000    LD      HL,0000H
0587 22FCFB    LD      (0FBFCH),HL
058a 2AF8FB    LD      HL,(0FBF8H)
058d 228EFE    LD      (0FE8EH),HL
0590 7C        LD      A,H
0591 A5        AND     L
0592 3C        INC     A
0593 2803      JR      Z,0598H          ; (+03H)
0595 2290FE    LD      (0FE90H),HL
0598 01A105    LD      BC,05A1H
059b 2A8CFE    LD      HL,(0FE8CH)
059e C36447    JP      4764H
05a1 C1        POP     BC
05a2 7B        LD      A,E
05a3 4B        LD      C,E
05a4 32EEFB    LD      (0FBEEH),A
05a7 2A8AFE    LD      HL,(0FE8AH)
05aa 2292FE    LD      (0FE92H),HL
05ad EB        EX      DE,HL
05ae 2A8EFE    LD      HL,(0FE8EH)
05b1 7C        LD      A,H
05b2 A5        AND     L
05b3 3C        INC     A
05b4 2807      JR      Z,05BDH          ; (+07H)
05b6 2299FE    LD      (0FE99H),HL
05b9 EB        EX      DE,HL
05ba 229BFE    LD      (0FE9BH),HL
05bd 2A94FE    LD      HL,(0FE94H)
05c0 7C        LD      A,H
05c1 B5        OR      L
05c2 EB        EX      DE,HL
05c3 2196FE    LD      HL,0FE96H
05c6 2808      JR      Z,05D0H          ; (+08H)
05c8 A6        AND     (HL)
05c9 2005      JR      NZ,05D0H         ; (+05H)
05cb 35        DEC     (HL)
05cc EB        EX      DE,HL
05cd C34E0A    JP      0A4EH
05d0 AF        XOR     A
05d1 77        LD      (HL),A
05d2 59        LD      E,C
05d3 D5        PUSH    DE
05d4 CDE420    CALL    20E4H
05d7 CDD129    CALL    29D1H
05da D1        POP     DE
05db CD7032    CALL    3270H
05de 217B04    LD      HL,047BH
05e1 7B        LD      A,E
05e2 FE1B      CP      1BH
05e4 3802      JR      C,05E8H          ; (+02H)
05e6 1E15      LD      E,15H
05e8 1600      LD      D,00H
05ea 217904    LD      HL,0479H
05ed 19        ADD     HL,DE
05ee 19        ADD     HL,DE
05ef 3E3F      LD      A,3FH
05f1 CD1800    CALL    0018H
05f4 7E        LD      A,(HL)
05f5 CD1800    CALL    0018H
05f8 D7        RST     10H
05f9 CD1800    CALL    0018H
05fc 210D05    LD      HL,050DH
05ff E5        PUSH    HL
0600 2A8EFE    LD      HL,(0FE8EH)
0603 E3        EX      (SP),HL
0604 CDE420    CALL    20E4H
0607 CD3541    CALL    4135H
060a E1        POP     HL
060b 11FEFF    LD      DE,0FFFEH
060e E7        RST     20H
060f 2006      JR      NZ,0617H         ; (+06H)
0611 CD7C32    CALL    327CH
0614 C33E00    JP      003EH
0617 7C        LD      A,H
0618 A5        AND     L
0619 3C        INC     A
061a C44E54    CALL    NZ,544EH
061d 3EC1      LD      A,0C1H
061f CDE420    CALL    20E4H
0622 97        SUB     A
0623 CD971D    CALL    1D97H
0626 CD4432    CALL    3244H
0629 CD7032    CALL    3270H
062c 211905    LD      HL,0519H
062f CD3541    CALL    4135H
0632 3AEEFB    LD      A,(0FBEEH)
0635 D602      SUB     02H
0637 CCAE3C    CALL    Z,3CAEH
063a 21FFFF    LD      HL,0FFFFH
063d 22F8FB    LD      (0FBF8H),HL
0640 21D5FB    LD      HL,0FBD5H
0643 228AFE    LD      (0FE8AH),HL
0646 3A85FE    LD      A,(0FE85H)
0649 B7        OR      A
064a 2818      JR      Z,0664H          ; (+18H)
064c 2A86FE    LD      HL,(0FE86H)
064f E5        PUSH    HL
0650 CD5654    CALL    5456H
0653 D1        POP     DE
0654 D5        PUSH    DE
0655 CD7D07    CALL    077DH
0658 3E2A      LD      A,2AH
065a 3802      JR      C,065EH          ; (+02H)
065c 3E20      LD      A,20H
065e CD1800    CALL    0018H
0661 3285FE    LD      (0FE85H),A
0664 CD8338    CALL    3883H
0667 3007      JR      NC,0670H         ; (+07H)
0669 AF        XOR     A
066a 3285FE    LD      (0FE85H),A
066d C33A06    JP      063AH
0670 97        SUB     A
0671 32D7FA    LD      (0FAD7H),A
0674 D7        RST     10H
0675 3C        INC     A
0676 3D        DEC     A
0677 28C1      JR      Z,063AH          ; (-3fH)
0679 F5        PUSH    AF
067a CD970B    CALL    0B97H
067d CD8D09    CALL    098DH
0680 3A85FE    LD      A,(0FE85H)
0683 B7        OR      A
0684 2808      JR      Z,068EH          ; (+08H)
0686 FE2A      CP      2AH
0688 2004      JR      NZ,068EH         ; (+04H)
068a BE        CP      (HL)
068b CCFB4D    CALL    Z,4DFBH
068e 7A        LD      A,D
068f B3        OR      E
0690 CA9906    JP      Z,0699H
0693 7E        LD      A,(HL)
0694 FE20      CP      20H
0696 CCFB4D    CALL    Z,4DFBH
0699 D5        PUSH    DE
069a CD9A07    CALL    079AH
069d D1        POP     DE
069e F1        POP     AF
069f 228AFE    LD      (0FE8AH),HL
06a2 D2720A    JP      NC,0A72H
06a5 D5        PUSH    DE
06a6 C5        PUSH    BC
06a7 D7        RST     10H
06a8 B7        OR      A
06a9 F5        PUSH    AF
06aa ED5390FE  LD      (0FE90H),DE
06ae 2A88FE    LD      HL,(0FE88H)
06b1 19        ADD     HL,DE
06b2 380D      JR      C,06C1H          ; (+0dH)
06b4 D5        PUSH    DE
06b5 11FAFF    LD      DE,0FFFAH
06b8 E7        RST     20H
06b9 D1        POP     DE
06ba 3005      JR      NC,06C1H         ; (+05H)
06bc 2286FE    LD      (0FE86H),HL
06bf 1804      JR      06C5H            ; (+04H)
06c1 AF        XOR     A
06c2 3285FE    LD      (0FE85H),A
06c5 CD7D07    CALL    077DH
06c8 3813      JR      C,06DDH          ; (+13H)
06ca F1        POP     AF
06cb F5        PUSH    AF
06cc C2DA06    JP      NZ,06DAH
06cf 3A85FE    LD      A,(0FE85H)
06d2 B7        OR      A
06d3 CA2B0C    JP      Z,0C2BH
06d6 C5        PUSH    BC
06d7 C33107    JP      0731H
06da B7        OR      A
06db 1811      JR      06EEH            ; (+11H)
06dd F1        POP     AF
06de F5        PUSH    AF
06df C2ED06    JP      NZ,06EDH
06e2 3A85FE    LD      A,(0FE85H)
06e5 B7        OR      A
06e6 CAED06    JP      Z,06EDH
06e9 C5        PUSH    BC
06ea C33107    JP      0731H
06ed 37        SCF     
06ee C5        PUSH    BC
06ef F5        PUSH    AF
06f0 E5        PUSH    HL
06f1 CD8119    CALL    1981H
06f4 E1        POP     HL
06f5 F1        POP     AF
06f6 C1        POP     BC
06f7 C5        PUSH    BC
06f8 DC1918    CALL    C,1819H
06fb D1        POP     DE
06fc F1        POP     AF
06fd D5        PUSH    DE
06fe 2831      JR      Z,0731H          ; (+31H)
0700 D1        POP     DE
0701 210000    LD      HL,0000H
0704 2294FE    LD      (0FE94H),HL
0707 2A9DFE    LD      HL,(0FE9DH)
070a E3        EX      (SP),HL
070b C1        POP     BC
070c E5        PUSH    HL
070d C3C83C    JP      3CC8H
0710 00        NOP     
0711 00        NOP     
0712 E1        POP     HL
0713 229DFE    LD      (0FE9DH),HL
0716 EB        EX      DE,HL
0717 74        LD      (HL),H
0718 C1        POP     BC
0719 D1        POP     DE
071a E5        PUSH    HL
071b 23        INC     HL
071c 23        INC     HL
071d 73        LD      (HL),E
071e 23        INC     HL
071f 72        LD      (HL),D
0720 23        INC     HL
0721 11FFFB    LD      DE,0FBFFH
0724 0B        DEC     BC
0725 0B        DEC     BC
0726 0B        DEC     BC
0727 0B        DEC     BC
0728 C3AF3C    JP      3CAFH
072b 13        INC     DE
072c 0B        DEC     BC
072d 79        LD      A,C
072e B0        OR      B
072f 20F7      JR      NZ,0728H         ; (-09H)
0731 D1        POP     DE
0732 CD3F07    CALL    073FH
0735 CD2247    CALL    4722H
0738 C33A06    JP      063AH
073b 2AFAFB    LD      HL,(0FBFAH)
073e EB        EX      DE,HL
073f 62        LD      H,D
0740 6B        LD      L,E
0741 7E        LD      A,(HL)
0742 23        INC     HL
0743 B6        OR      (HL)
0744 C8        RET     Z

0745 23        INC     HL
0746 23        INC     HL
0747 23        INC     HL
0748 7E        LD      A,(HL)
0749 B7        OR      A
074a 280E      JR      Z,075AH          ; (+0eH)
074c FE20      CP      20H
074e 30F7      JR      NC,0747H         ; (-09H)
0750 FE0B      CP      0BH
0752 38F3      JR      C,0747H          ; (-0dH)
0754 CD910A    CALL    0A91H
0757 D7        RST     10H
0758 18EF      JR      0749H            ; (-11H)
075a 23        INC     HL
075b EB        EX      DE,HL
075c 73        LD      (HL),E
075d 23        INC     HL
075e 72        LD      (HL),D
075f 18DE      JR      073FH            ; (-22H)
0761 110000    LD      DE,0000H
0764 D5        PUSH    DE
0765 2809      JR      Z,0770H          ; (+09H)
0767 D1        POP     DE
0768 CD8D0B    CALL    0B8DH
076b D5        PUSH    DE
076c 280B      JR      Z,0779H          ; (+0bH)
076e CF        RST     08H
076f EA11FA    JP      PE,0FA11H
0772 FF        RST     38H
0773 C48D0B    CALL    NZ,0B8DH
0776 C25F05    JP      NZ,055FH
0779 EB        EX      DE,HL
077a D1        POP     DE
077b E3        EX      (SP),HL
077c E5        PUSH    HL
077d 2AFAFB    LD      HL,(0FBFAH)
0780 44        LD      B,H
0781 4D        LD      C,L
0782 7E        LD      A,(HL)
0783 23        INC     HL
0784 B6        OR      (HL)
0785 2B        DEC     HL
0786 C8        RET     Z

0787 23        INC     HL
0788 23        INC     HL
0789 7E        LD      A,(HL)
078a 23        INC     HL
078b 66        LD      H,(HL)
078c 6F        LD      L,A
078d E7        RST     20H
078e 60        LD      H,B
078f 69        LD      L,C
0790 7E        LD      A,(HL)
0791 23        INC     HL
0792 66        LD      H,(HL)
0793 6F        LD      L,A
0794 3F        CCF     
0795 C8        RET     Z

0796 3F        CCF     
0797 D0        RET     NC

0798 18E6      JR      0780H            ; (-1aH)
079a AF        XOR     A
079b 3244FE    LD      (0FE44H),A
079e 3243FE    LD      (0FE43H),A
07a1 013B01    LD      BC,013BH
07a4 11FFFB    LD      DE,0FBFFH
07a7 7E        LD      A,(HL)
07a8 B7        OR      A
07a9 2013      JR      NZ,07BEH         ; (+13H)
07ab 214001    LD      HL,0140H
07ae 7D        LD      A,L
07af 91        SUB     C
07b0 4F        LD      C,A
07b1 7C        LD      A,H
07b2 98        SBC     A,B
07b3 47        LD      B,A
07b4 21FEFB    LD      HL,0FBFEH
07b7 AF        XOR     A
07b8 12        LD      (DE),A
07b9 13        INC     DE
07ba 12        LD      (DE),A
07bb 13        INC     DE
07bc 12        LD      (DE),A
07bd C9        RET     

07be FE22      CP      22H
07c0 CAF307    JP      Z,07F3H
07c3 FE20      CP      20H
07c5 2807      JR      Z,07CEH          ; (+07H)
07c7 3A43FE    LD      A,(0FE43H)
07ca B7        OR      A
07cb 7E        LD      A,(HL)
07cc 282D      JR      Z,07FBH          ; (+2dH)
07ce 23        INC     HL
07cf F5        PUSH    AF
07d0 CD5C09    CALL    095CH
07d3 F1        POP     AF
07d4 D63A      SUB     3AH
07d6 2806      JR      Z,07DEH          ; (+06H)
07d8 FE4A      CP      4AH
07da 2008      JR      NZ,07E4H         ; (+08H)
07dc 3E01      LD      A,01H
07de 3243FE    LD      (0FE43H),A
07e1 3244FE    LD      (0FE44H),A
07e4 D655      SUB     55H
07e6 20BF      JR      NZ,07A7H         ; (-41H)
07e8 F5        PUSH    AF
07e9 7E        LD      A,(HL)
07ea B7        OR      A
07eb E3        EX      (SP),HL
07ec 7C        LD      A,H
07ed E1        POP     HL
07ee 28BB      JR      Z,07ABH          ; (-45H)
07f0 BE        CP      (HL)
07f1 28DB      JR      Z,07CEH          ; (-25H)
07f3 F5        PUSH    AF
07f4 7E        LD      A,(HL)
07f5 23        INC     HL
07f6 CD5C09    CALL    095CH
07f9 18EE      JR      07E9H            ; (-12H)
07fb 23        INC     HL
07fc B7        OR      A
07fd FAA707    JP      M,07A7H
0800 2B        DEC     HL
0801 FE3F      CP      3FH
0803 3E91      LD      A,91H
0805 D5        PUSH    DE
0806 C5        PUSH    BC
0807 CA6208    JP      Z,0862H
080a 113204    LD      DE,0432H
080d CDBB12    CALL    12BBH
0810 CD8148    CALL    4881H
0813 DAA808    JP      C,08A8H
0816 E5        PUSH    HL
0817 21E301    LD      HL,01E3H
081a D641      SUB     41H
081c 87        ADD     A,A
081d 4F        LD      C,A
081e 0600      LD      B,00H
0820 09        ADD     HL,BC
0821 5E        LD      E,(HL)
0822 23        INC     HL
0823 56        LD      D,(HL)
0824 E1        POP     HL
0825 23        INC     HL
0826 E5        PUSH    HL
0827 CDBB12    CALL    12BBH
082a 4F        LD      C,A
082b 1A        LD      A,(DE)
082c E67F      AND     7FH
082e CA6709    JP      Z,0967H
0831 23        INC     HL
0832 B9        CP      C
0833 2021      JR      NZ,0856H         ; (+21H)
0835 1A        LD      A,(DE)
0836 13        INC     DE
0837 B7        OR      A
0838 F22708    JP      P,0827H
083b F1        POP     AF
083c 1A        LD      A,(DE)
083d B7        OR      A
083e FA6108    JP      M,0861H
0841 C1        POP     BC
0842 D1        POP     DE
0843 F680      OR      80H
0845 F5        PUSH    AF
0846 3EFF      LD      A,0FFH
0848 CD5C09    CALL    095CH
084b AF        XOR     A
084c 3244FE    LD      (0FE44H),A
084f F1        POP     AF
0850 CD5C09    CALL    095CH
0853 C3A707    JP      07A7H
0856 E1        POP     HL
0857 1A        LD      A,(DE)
0858 13        INC     DE
0859 B7        OR      A
085a F25708    JP      P,0857H
085d 13        INC     DE
085e C32608    JP      0826H
0861 2B        DEC     HL
0862 F5        PUSH    AF
0863 117108    LD      DE,0871H
0866 4F        LD      C,A
0867 1A        LD      A,(DE)
0868 B7        OR      A
0869 2815      JR      Z,0880H          ; (+15H)
086b 13        INC     DE
086c B9        CP      C
086d 20F8      JR      NZ,0867H         ; (-08H)
086f 1811      JR      0882H            ; (+11H)
0871 8C        ADC     A,H
0872 A7        AND     A
0873 A8        XOR     B
0874 A6        AND     (HL)
0875 A3        AND     E
0876 A5        AND     L
0877 CB9F      RES     3,A
0879 8A        ADC     A,D
087a 93        SUB     E
087b 9E        SBC     A,(HL)
087c 89        ADC     A,C
087d C48D00    CALL    NZ,008DH
0880 AF        XOR     A
0881 C23E01    JP      NZ,013EH
0884 3244FE    LD      (0FE44H),A
0887 F1        POP     AF
0888 C1        POP     BC
0889 D1        POP     DE
088a FE9F      CP      9FH
088c F5        PUSH    AF
088d CC5A09    CALL    Z,095AH
0890 F1        POP     AF
0891 FED0      CP      0D0H
0893 C23B09    JP      NZ,093BH
0896 F5        PUSH    AF
0897 CD5A09    CALL    095AH
089a 3E8F      LD      A,8FH
089c CD5C09    CALL    095CH
089f F1        POP     AF
08a0 E5        PUSH    HL
08a1 210000    LD      HL,0000H
08a4 E3        EX      (SP),HL
08a5 C3F507    JP      07F5H
08a8 7E        LD      A,(HL)
08a9 FE2E      CP      2EH
08ab 280A      JR      Z,08B7H          ; (+0aH)
08ad FE3A      CP      3AH
08af D22909    JP      NC,0929H
08b2 FE30      CP      30H
08b4 DA2909    JP      C,0929H
08b7 3A44FE    LD      A,(0FE44H)
08ba B7        OR      A
08bb 7E        LD      A,(HL)
08bc C1        POP     BC
08bd D1        POP     DE
08be FACE07    JP      M,07CEH
08c1 281F      JR      Z,08E2H          ; (+1fH)
08c3 FE2E      CP      2EH
08c5 CACE07    JP      Z,07CEH
08c8 3E0E      LD      A,0EH
08ca CD5C09    CALL    095CH
08cd D5        PUSH    DE
08ce CD970B    CALL    0B97H
08d1 CD8D09    CALL    098DH
08d4 E3        EX      (SP),HL
08d5 EB        EX      DE,HL
08d6 7D        LD      A,L
08d7 CD5C09    CALL    095CH
08da 7C        LD      A,H
08db E1        POP     HL
08dc CD5C09    CALL    095CH
08df C3A707    JP      07A7H
08e2 D5        PUSH    DE
08e3 C5        PUSH    BC
08e4 7E        LD      A,(HL)
08e5 CDF952    CALL    52F9H
08e8 CD8D09    CALL    098DH
08eb C1        POP     BC
08ec D1        POP     DE
08ed E5        PUSH    HL
08ee 3A42FE    LD      A,(0FE42H)
08f1 FE02      CP      02H
08f3 2015      JR      NZ,090AH         ; (+15H)
08f5 2AA7FF    LD      HL,(0FFA7H)
08f8 7C        LD      A,H
08f9 B7        OR      A
08fa 3E02      LD      A,02H
08fc 200C      JR      NZ,090AH         ; (+0cH)
08fe 7D        LD      A,L
08ff 65        LD      H,L
0900 2E0F      LD      L,0FH
0902 FE0A      CP      0AH
0904 30D0      JR      NC,08D6H         ; (-30H)
0906 C611      ADD     A,11H
0908 18D1      JR      08DBH            ; (-2fH)
090a F5        PUSH    AF
090b 0F        RRCA    
090c C61B      ADD     A,1BH
090e CD5C09    CALL    095CH
0911 21A7FF    LD      HL,0FFA7H
0914 F7        RST     30H
0915 3803      JR      C,091AH          ; (+03H)
0917 21A3FF    LD      HL,0FFA3H
091a F1        POP     AF
091b F5        PUSH    AF
091c 7E        LD      A,(HL)
091d CD5C09    CALL    095CH
0920 F1        POP     AF
0921 23        INC     HL
0922 3D        DEC     A
0923 20F6      JR      NZ,091BH         ; (-0aH)
0925 E1        POP     HL
0926 C3A707    JP      07A7H
0929 113104    LD      DE,0431H
092c 13        INC     DE
092d 1A        LD      A,(DE)
092e E67F      AND     7FH
0930 CA7309    JP      Z,0973H
0933 13        INC     DE
0934 BE        CP      (HL)
0935 1A        LD      A,(DE)
0936 20F4      JR      NZ,092CH         ; (-0cH)
0938 C38209    JP      0982H
093b FE26      CP      26H
093d C2CE07    JP      NZ,07CEH
0940 E5        PUSH    HL
0941 D7        RST     10H
0942 E1        POP     HL
0943 CDBC12    CALL    12BCH
0946 FE48      CP      48H
0948 3E0B      LD      A,0BH
094a 2002      JR      NZ,094EH         ; (+02H)
094c 3E0C      LD      A,0CH
094e CD5C09    CALL    095CH
0951 D5        PUSH    DE
0952 C5        PUSH    BC
0953 CDCA12    CALL    12CAH
0956 C1        POP     BC
0957 C3D408    JP      08D4H
095a 3E3A      LD      A,3AH
095c 12        LD      (DE),A
095d 13        INC     DE
095e 0B        DEC     BC
095f 79        LD      A,C
0960 B0        OR      B
0961 C0        RET     NZ

0962 1E17      LD      E,17H
0964 C37905    JP      0579H
0967 E1        POP     HL
0968 2B        DEC     HL
0969 3D        DEC     A
096a 3244FE    LD      (0FE44H),A
096d CDBB12    CALL    12BBH
0970 C38808    JP      0888H
0973 7E        LD      A,(HL)
0974 FE20      CP      20H
0976 300A      JR      NC,0982H         ; (+0aH)
0978 FE09      CP      09H
097a 2806      JR      Z,0982H          ; (+06H)
097c FE0A      CP      0AH
097e 2802      JR      Z,0982H          ; (+02H)
0980 3E20      LD      A,20H
0982 F5        PUSH    AF
0983 3A44FE    LD      A,(0FE44H)
0986 3C        INC     A
0987 2801      JR      Z,098AH          ; (+01H)
0989 3D        DEC     A
098a C38408    JP      0884H
098d 2B        DEC     HL
098e 7E        LD      A,(HL)
098f FE20      CP      20H
0991 28FA      JR      Z,098DH          ; (-06H)
0993 FE09      CP      09H
0995 28F6      JR      Z,098DH          ; (-0aH)
0997 FE0A      CP      0AH
0999 28F2      JR      Z,098DH          ; (-0eH)
099b 23        INC     HL
099c C9        RET     

099d 3E64      LD      A,64H
099f 3280FE    LD      (0FE80H),A
09a2 CD700C    CALL    0C70H
09a5 C1        POP     BC
09a6 E5        PUSH    HL
09a7 CD4B0C    CALL    0C4BH
09aa 227CFE    LD      (0FE7CH),HL
09ad 210200    LD      HL,0002H
09b0 39        ADD     HL,SP
09b1 CD2B05    CALL    052BH
09b4 2017      JR      NZ,09CDH         ; (+17H)
09b6 09        ADD     HL,BC
09b7 D5        PUSH    DE
09b8 2B        DEC     HL
09b9 56        LD      D,(HL)
09ba 2B        DEC     HL
09bb 5E        LD      E,(HL)
09bc 23        INC     HL
09bd 23        INC     HL
09be E5        PUSH    HL
09bf 2A7CFE    LD      HL,(0FE7CH)
09c2 E7        RST     20H
09c3 E1        POP     HL
09c4 D1        POP     DE
09c5 20EA      JR      NZ,09B1H         ; (-16H)
09c7 D1        POP     DE
09c8 F9        LD      SP,HL
09c9 228CFE    LD      (0FE8CH),HL
09cc 0ED1      LD      C,0D1H
09ce EB        EX      DE,HL
09cf 0E08      LD      C,08H
09d1 CDE646    CALL    46E6H
09d4 E5        PUSH    HL
09d5 2A7CFE    LD      HL,(0FE7CH)
09d8 E3        EX      (SP),HL
09d9 E5        PUSH    HL
09da 2AF8FB    LD      HL,(0FBF8H)
09dd E3        EX      (SP),HL
09de CF        RST     08H
09df C3F7CA    JP      0CAF7H
09e2 77        LD      (HL),A
09e3 05        DEC     B
09e4 D27705    JP      NC,0577H
09e7 F5        PUSH    AF
09e8 CD9B10    CALL    109BH
09eb F1        POP     AF
09ec E5        PUSH    HL
09ed F2050A    JP      P,0A05H
09f0 CDA94E    CALL    4EA9H
09f3 E3        EX      (SP),HL
09f4 110100    LD      DE,0001H
09f7 7E        LD      A,(HL)
09f8 FEC6      CP      0C6H
09fa CC2916    CALL    Z,1629H
09fd D5        PUSH    DE
09fe E5        PUSH    HL
09ff EB        EX      DE,HL
0a00 CDD04D    CALL    4DD0H
0a03 1820      JR      0A25H            ; (+20H)
0a05 CDDB4E    CALL    4EDBH
0a08 CDF14D    CALL    4DF1H
0a0b E1        POP     HL
0a0c C5        PUSH    BC
0a0d D5        PUSH    DE
0a0e 010081    LD      BC,8100H
0a11 51        LD      D,C
0a12 5A        LD      E,D
0a13 7E        LD      A,(HL)
0a14 FEC6      CP      0C6H
0a16 3E01      LD      A,01H
0a18 200C      JR      NZ,0A26H         ; (+0cH)
0a1a CD9C10    CALL    109CH
0a1d E5        PUSH    HL
0a1e CDDB4E    CALL    4EDBH
0a21 CDF14D    CALL    4DF1H
0a24 EF        RST     28H
0a25 E1        POP     HL
0a26 C5        PUSH    BC
0a27 D5        PUSH    DE
0a28 B7        OR      A
0a29 2002      JR      NZ,0A2DH         ; (+02H)
0a2b 3E02      LD      A,02H
0a2d 4F        LD      C,A
0a2e F7        RST     30H
0a2f 47        LD      B,A
0a30 C5        PUSH    BC
0a31 E5        PUSH    HL
0a32 2A82FE    LD      HL,(0FE82H)
0a35 E3        EX      (SP),HL
0a36 0682      LD      B,82H
0a38 C5        PUSH    BC
0a39 33        INC     SP
0a3a CD571D    CALL    1D57H
0a3d 228AFE    LD      (0FE8AH),HL
0a40 ED738CFE  LD      (0FE8CH),SP
0a44 7E        LD      A,(HL)
0a45 FE3A      CP      3AH
0a47 2829      JR      Z,0A72H          ; (+29H)
0a49 B7        OR      A
0a4a C25F05    JP      NZ,055FH
0a4d 23        INC     HL
0a4e 7E        LD      A,(HL)
0a4f 23        INC     HL
0a50 B6        OR      (HL)
0a51 CA4605    JP      Z,0546H
0a54 23        INC     HL
0a55 5E        LD      E,(HL)
0a56 23        INC     HL
0a57 56        LD      D,(HL)
0a58 EB        EX      DE,HL
0a59 22F8FB    LD      (0FBF8H),HL
0a5c 3A98FF    LD      A,(0FF98H)
0a5f B7        OR      A
0a60 280F      JR      Z,0A71H          ; (+0fH)
0a62 D5        PUSH    DE
0a63 3E7B      LD      A,7BH
0a65 CD1800    CALL    0018H
0a68 CD5654    CALL    5456H
0a6b 3E7D      LD      A,7DH
0a6d CD1800    CALL    0018H
0a70 D1        POP     DE
0a71 EB        EX      DE,HL
0a72 D7        RST     10H
0a73 113A0A    LD      DE,0A3AH
0a76 D5        PUSH    DE
0a77 C8        RET     Z

0a78 D681      SUB     81H
0a7a DA700C    JP      C,0C70H
0a7d FE41      CP      41H
0a7f D2E415    JP      NC,15E4H
0a82 07        RLCA    
0a83 4F        LD      C,A
0a84 0600      LD      B,00H
0a86 EB        EX      DE,HL
0a87 211B01    LD      HL,011BH
0a8a 09        ADD     HL,BC
0a8b 4E        LD      C,(HL)
0a8c 23        INC     HL
0a8d 46        LD      B,(HL)
0a8e C5        PUSH    BC
0a8f EB        EX      DE,HL
0a90 23        INC     HL
0a91 7E        LD      A,(HL)
0a92 FE3A      CP      3AH
0a94 D0        RET     NC

0a95 FE20      CP      20H
0a97 28F7      JR      Z,0A90H          ; (-09H)
0a99 306C      JR      NC,0B07H         ; (+6cH)
0a9b B7        OR      A
0a9c C8        RET     Z

0a9d FE0B      CP      0BH
0a9f 3861      JR      C,0B02H          ; (+61H)
0aa1 FE1E      CP      1EH
0aa3 2005      JR      NZ,0AAAH         ; (+05H)
0aa5 3A47FE    LD      A,(0FE47H)
0aa8 B7        OR      A
0aa9 C9        RET     

0aaa FE10      CP      10H
0aac 2834      JR      Z,0AE2H          ; (+34H)
0aae F5        PUSH    AF
0aaf 23        INC     HL
0ab0 3247FE    LD      (0FE47H),A
0ab3 D61C      SUB     1CH
0ab5 3030      JR      NC,0AE7H         ; (+30H)
0ab7 D6F5      SUB     0F5H
0ab9 3006      JR      NC,0AC1H         ; (+06H)
0abb FEFE      CP      0FEH
0abd 2016      JR      NZ,0AD5H         ; (+16H)
0abf 7E        LD      A,(HL)
0ac0 23        INC     HL
0ac1 2245FE    LD      (0FE45H),HL
0ac4 2600      LD      H,00H
0ac6 6F        LD      L,A
0ac7 2249FE    LD      (0FE49H),HL
0aca 3E02      LD      A,02H
0acc 3248FE    LD      (0FE48H),A
0acf 210D0B    LD      HL,0B0DH
0ad2 F1        POP     AF
0ad3 B7        OR      A
0ad4 C9        RET     

0ad5 7E        LD      A,(HL)
0ad6 23        INC     HL
0ad7 23        INC     HL
0ad8 2245FE    LD      (0FE45H),HL
0adb 2B        DEC     HL
0adc 66        LD      H,(HL)
0add 18E7      JR      0AC6H            ; (-19H)
0adf CD0F0B    CALL    0B0FH
0ae2 2A45FE    LD      HL,(0FE45H)
0ae5 18AA      JR      0A91H            ; (-56H)
0ae7 3C        INC     A
0ae8 07        RLCA    
0ae9 3248FE    LD      (0FE48H),A
0aec D5        PUSH    DE
0aed C5        PUSH    BC
0aee 1149FE    LD      DE,0FE49H
0af1 EB        EX      DE,HL
0af2 47        LD      B,A
0af3 CD094E    CALL    4E09H
0af6 EB        EX      DE,HL
0af7 C1        POP     BC
0af8 D1        POP     DE
0af9 2245FE    LD      (0FE45H),HL
0afc F1        POP     AF
0afd 210D0B    LD      HL,0B0DH
0b00 B7        OR      A
0b01 C9        RET     

0b02 FE09      CP      09H
0b04 D2900A    JP      NC,0A90H
0b07 FE30      CP      30H
0b09 3F        CCF     
0b0a 3C        INC     A
0b0b 3D        DEC     A
0b0c C9        RET     

0b0d 1E10      LD      E,10H
0b0f 3A47FE    LD      A,(0FE47H)
0b12 FE0F      CP      0FH
0b14 3013      JR      NC,0B29H         ; (+13H)
0b16 FE0D      CP      0DH
0b18 380F      JR      C,0B29H          ; (+0fH)
0b1a 2A49FE    LD      HL,(0FE49H)
0b1d 2007      JR      NZ,0B26H         ; (+07H)
0b1f 23        INC     HL
0b20 23        INC     HL
0b21 23        INC     HL
0b22 5E        LD      E,(HL)
0b23 23        INC     HL
0b24 56        LD      D,(HL)
0b25 EB        EX      DE,HL
0b26 C3C950    JP      50C9H
0b29 3A48FE    LD      A,(0FE48H)
0b2c 3242FE    LD      (0FE42H),A
0b2f FE08      CP      08H
0b31 280D      JR      Z,0B40H          ; (+0dH)
0b33 2A49FE    LD      HL,(0FE49H)
0b36 22A7FF    LD      (0FFA7H),HL
0b39 2A4BFE    LD      HL,(0FE4BH)
0b3c 22A9FF    LD      (0FFA9H),HL
0b3f C9        RET     

0b40 2149FE    LD      HL,0FE49H
0b43 C3284E    JP      4E28H
0b46 1E03      LD      E,03H
0b48 011E02    LD      BC,021EH
0b4b 011E04    LD      BC,041EH
0b4e 011E08    LD      BC,081EH
0b51 CD8048    CALL    4880H
0b54 015F05    LD      BC,055FH
0b57 C5        PUSH    BC
0b58 D8        RET     C

0b59 D641      SUB     41H
0b5b 4F        LD      C,A
0b5c 47        LD      B,A
0b5d D7        RST     10H
0b5e FEEA      CP      0EAH
0b60 2009      JR      NZ,0B6BH         ; (+09H)
0b62 D7        RST     10H
0b63 CD8048    CALL    4880H
0b66 D8        RET     C

0b67 D641      SUB     41H
0b69 47        LD      B,A
0b6a D7        RST     10H
0b6b 78        LD      A,B
0b6c 91        SUB     C
0b6d D8        RET     C

0b6e 3C        INC     A
0b6f E3        EX      (SP),HL
0b70 21A5FE    LD      HL,0FEA5H
0b73 0600      LD      B,00H
0b75 09        ADD     HL,BC
0b76 73        LD      (HL),E
0b77 23        INC     HL
0b78 3D        DEC     A
0b79 20FB      JR      NZ,0B76H         ; (-05H)
0b7b E1        POP     HL
0b7c 7E        LD      A,(HL)
0b7d FE2C      CP      2CH
0b7f C0        RET     NZ

0b80 D7        RST     10H
0b81 18CE      JR      0B51H            ; (-32H)
0b83 D7        RST     10H
0b84 CD2A16    CALL    162AH
0b87 F0        RET     P

0b88 1E05      LD      E,05H
0b8a C37905    JP      0579H
0b8d 7E        LD      A,(HL)
0b8e FE2E      CP      2EH
0b90 ED5B90FE  LD      DE,(0FE90H)
0b94 CA900A    JP      Z,0A90H
0b97 2B        DEC     HL
0b98 D7        RST     10H
0b99 FE0E      CP      0EH
0b9b 2802      JR      Z,0B9FH          ; (+02H)
0b9d FE0D      CP      0DH
0b9f ED5B49FE  LD      DE,(0FE49H)
0ba3 CA900A    JP      Z,0A90H
0ba6 AF        XOR     A
0ba7 3247FE    LD      (0FE47H),A
0baa 110000    LD      DE,0000H
0bad 2B        DEC     HL
0bae D7        RST     10H
0baf D0        RET     NC

0bb0 E5        PUSH    HL
0bb1 F5        PUSH    AF
0bb2 219819    LD      HL,1998H
0bb5 E7        RST     20H
0bb6 3811      JR      C,0BC9H          ; (+11H)
0bb8 62        LD      H,D
0bb9 6B        LD      L,E
0bba 19        ADD     HL,DE
0bbb 29        ADD     HL,HL
0bbc 19        ADD     HL,DE
0bbd 29        ADD     HL,HL
0bbe F1        POP     AF
0bbf D630      SUB     30H
0bc1 5F        LD      E,A
0bc2 1600      LD      D,00H
0bc4 19        ADD     HL,DE
0bc5 EB        EX      DE,HL
0bc6 E1        POP     HL
0bc7 18E5      JR      0BAEH            ; (-1bH)
0bc9 F1        POP     AF
0bca E1        POP     HL
0bcb C9        RET     

0bcc CA2247    JP      Z,4722H
0bcf FE0E      CP      0EH
0bd1 2805      JR      Z,0BD8H          ; (+05H)
0bd3 FE0D      CP      0DH
0bd5 C25F05    JP      NZ,055FH
0bd8 CD2E47    CALL    472EH
0bdb 013A0A    LD      BC,0A3AH
0bde 1816      JR      0BF6H            ; (+16H)
0be0 0E03      LD      C,03H
0be2 CDE646    CALL    46E6H
0be5 CD970B    CALL    0B97H
0be8 C1        POP     BC
0be9 E5        PUSH    HL
0bea E5        PUSH    HL
0beb 2AF8FB    LD      HL,(0FBF8H)
0bee E3        EX      (SP),HL
0bef 3E8D      LD      A,8DH
0bf1 F5        PUSH    AF
0bf2 33        INC     SP
0bf3 C5        PUSH    BC
0bf4 1804      JR      0BFAH            ; (+04H)
0bf6 C5        PUSH    BC
0bf7 CD970B    CALL    0B97H
0bfa 3A47FE    LD      A,(0FE47H)
0bfd FE0D      CP      0DH
0bff EB        EX      DE,HL
0c00 C8        RET     Z

0c01 FE0E      CP      0EH
0c03 C25F05    JP      NZ,055FH
0c06 EB        EX      DE,HL
0c07 E5        PUSH    HL
0c08 2A45FE    LD      HL,(0FE45H)
0c0b E3        EX      (SP),HL
0c0c CD4D0C    CALL    0C4DH
0c0f 23        INC     HL
0c10 E5        PUSH    HL
0c11 2AF8FB    LD      HL,(0FBF8H)
0c14 E7        RST     20H
0c15 E1        POP     HL
0c16 DC8007    CALL    C,0780H
0c19 D47D07    CALL    NC,077DH
0c1c 300D      JR      NC,0C2BH         ; (+0dH)
0c1e 0B        DEC     BC
0c1f 3E0D      LD      A,0DH
0c21 3284FE    LD      (0FE84H),A
0c24 E1        POP     HL
0c25 CD7819    CALL    1978H
0c28 60        LD      H,B
0c29 69        LD      L,C
0c2a C9        RET     

0c2b 1E08      LD      E,08H
0c2d C37905    JP      0579H
0c30 C0        RET     NZ

0c31 16FF      LD      D,0FFH
0c33 CD2705    CALL    0527H
0c36 F9        LD      SP,HL
0c37 228CFE    LD      (0FE8CH),HL
0c3a FE8D      CP      8DH
0c3c 1E03      LD      E,03H
0c3e C27905    JP      NZ,0579H
0c41 E1        POP     HL
0c42 22F8FB    LD      (0FBF8H),HL
0c45 213A0A    LD      HL,0A3AH
0c48 E3        EX      (SP),HL
0c49 3EE1      LD      A,0E1H
0c4b 013A0E    LD      BC,0E3AH
0c4e 00        NOP     
0c4f 0600      LD      B,00H
0c51 79        LD      A,C
0c52 48        LD      C,B
0c53 47        LD      B,A
0c54 2B        DEC     HL
0c55 D7        RST     10H
0c56 B7        OR      A
0c57 C8        RET     Z

0c58 B8        CP      B
0c59 C8        RET     Z

0c5a 23        INC     HL
0c5b FE22      CP      22H
0c5d 28F2      JR      Z,0C51H          ; (-0eH)
0c5f 3C        INC     A
0c60 28F3      JR      Z,0C55H          ; (-0dH)
0c62 D68C      SUB     8CH
0c64 20EE      JR      NZ,0C54H         ; (-12H)
0c66 B8        CP      B
0c67 8A        ADC     A,D
0c68 57        LD      D,A
0c69 18E9      JR      0C54H            ; (-17H)
0c6b F1        POP     AF
0c6c C603      ADD     A,03H
0c6e 1812      JR      0C82H            ; (+12H)
0c70 CDCE44    CALL    44CEH
0c73 CF        RST     08H
0c74 E7        RST     20H
0c75 ED5382FE  LD      (0FE82H),DE
0c79 D5        PUSH    DE
0c7a 3A42FE    LD      A,(0FE42H)
0c7d F5        PUSH    AF
0c7e CD9B10    CALL    109BH
0c81 F1        POP     AF
0c82 E3        EX      (SP),HL
0c83 47        LD      B,A
0c84 3A42FE    LD      A,(0FE42H)
0c87 B8        CP      B
0c88 78        LD      A,B
0c89 2806      JR      Z,0C91H          ; (+06H)
0c8b CDB115    CALL    15B1H
0c8e 3A42FE    LD      A,(0FE42H)
0c91 11A7FF    LD      DE,0FFA7H
0c94 FE05      CP      05H
0c96 3803      JR      C,0C9BH          ; (+03H)
0c98 11A3FF    LD      DE,0FFA3H
0c9b E5        PUSH    HL
0c9c FE03      CP      03H
0c9e 202E      JR      NZ,0CCEH         ; (+2eH)
0ca0 2AA7FF    LD      HL,(0FFA7H)
0ca3 E5        PUSH    HL
0ca4 23        INC     HL
0ca5 5E        LD      E,(HL)
0ca6 23        INC     HL
0ca7 56        LD      D,(HL)
0ca8 21FEFB    LD      HL,0FBFEH
0cab E7        RST     20H
0cac 3814      JR      C,0CC2H          ; (+14H)
0cae 2AA1FE    LD      HL,(0FEA1H)
0cb1 E7        RST     20H
0cb2 D1        POP     DE
0cb3 3015      JR      NC,0CCAH         ; (+15H)
0cb5 2172FE    LD      HL,0FE72H
0cb8 E7        RST     20H
0cb9 3806      JR      C,0CC1H          ; (+06H)
0cbb 2154FE    LD      HL,0FE54H
0cbe E7        RST     20H
0cbf 3809      JR      C,0CCAH          ; (+09H)
0cc1 3ED1      LD      A,0D1H
0cc3 CDAD42    CALL    42ADH
0cc6 EB        EX      DE,HL
0cc7 CDCE40    CALL    40CEH
0cca CDAD42    CALL    42ADH
0ccd E3        EX      (SP),HL
0cce CD054E    CALL    4E05H
0cd1 D1        POP     DE
0cd2 E1        POP     HL
0cd3 C9        RET     

0cd4 FEA4      CP      0A4H
0cd6 2025      JR      NZ,0CFDH         ; (+25H)
0cd8 D7        RST     10H
0cd9 CF        RST     08H
0cda 89        ADC     A,C
0cdb CD970B    CALL    0B97H
0cde 7A        LD      A,D
0cdf B3        OR      E
0ce0 2809      JR      Z,0CEBH          ; (+09H)
0ce2 CD7B07    CALL    077BH
0ce5 50        LD      D,B
0ce6 59        LD      E,C
0ce7 E1        POP     HL
0ce8 D22B0C    JP      NC,0C2BH
0ceb ED5394FE  LD      (0FE94H),DE
0cef D8        RET     C

0cf0 3A96FE    LD      A,(0FE96H)
0cf3 B7        OR      A
0cf4 7B        LD      A,E
0cf5 C8        RET     Z

0cf6 3AEEFB    LD      A,(0FBEEH)
0cf9 5F        LD      E,A
0cfa C39805    JP      0598H
0cfd CD3716    CALL    1637H
0d00 7E        LD      A,(HL)
0d01 47        LD      B,A
0d02 FE8D      CP      8DH
0d04 2803      JR      Z,0D09H          ; (+03H)
0d06 CF        RST     08H
0d07 89        ADC     A,C
0d08 2B        DEC     HL
0d09 4B        LD      C,E
0d0a 0D        DEC     C
0d0b 78        LD      A,B
0d0c CA780A    JP      Z,0A78H
0d0f CD980B    CALL    0B98H
0d12 FE2C      CP      2CH
0d14 C0        RET     NZ

0d15 18F3      JR      0D0AH            ; (-0dH)
0d17 E5        PUSH    HL
0d18 2A56FE    LD      HL,(0FE56H)
0d1b 7E        LD      A,(HL)
0d1c FEFE      CP      0FEH
0d1e 283C      JR      Z,0D5CH          ; (+3cH)
0d20 E1        POP     HL
0d21 7E        LD      A,(HL)
0d22 23        INC     HL
0d23 E5        PUSH    HL
0d24 C3D140    JP      40D1H
0d27 00        NOP     
0d28 00        NOP     
0d29 7E        LD      A,(HL)
0d2a FE0D      CP      0DH
0d2c 2805      JR      Z,0D33H          ; (+05H)
0d2e FEFE      CP      0FEH
0d30 C3E81A    JP      1AE8H
0d33 D370      OUT     (70H),A
0d35 3AC268    LD      A,(68C2H)
0d38 FED8      CP      0D8H
0d3a 2016      JR      NZ,0D52H         ; (+16H)
0d3c E5        PUSH    HL
0d3d 21FFC7    LD      HL,0C7FFH
0d40 7E        LD      A,(HL)
0d41 B7        OR      A
0d42 2012      JR      NZ,0D56H         ; (+12H)
0d44 2AECCC    LD      HL,(0CCECH)
0d47 22F1CC    LD      (0CCF1H),HL
0d4a 00        NOP     
0d4b 2110CD    LD      HL,0CD10H
0d4e 22ECCC    LD      (0CCECH),HL
0d51 E1        POP     HL
0d52 3E0D      LD      A,0DH
0d54 18D8      JR      0D2EH            ; (-28H)
0d56 E1        POP     HL
0d57 3EFE      LD      A,0FEH
0d59 C32E0D    JP      0D2EH
0d5c 00        NOP     
0d5d C3D0C7    JP      0C7D0H
0d60 00        NOP     
0d61 00        NOP     
0d62 00        NOP     
0d63 00        NOP     
0d64 CD3716    CALL    1637H
0d67 C0        RET     NZ

0d68 B7        OR      A
0d69 CA880B    JP      Z,0B88H
0d6c C37905    JP      0579H
0d6f 110A00    LD      DE,000AH
0d72 D5        PUSH    DE
0d73 2816      JR      Z,0D8BH          ; (+16H)
0d75 CD8D0B    CALL    0B8DH
0d78 EB        EX      DE,HL
0d79 E3        EX      (SP),HL
0d7a 2810      JR      Z,0D8CH          ; (+10H)
0d7c EB        EX      DE,HL
0d7d CF        RST     08H
0d7e 2C        INC     L
0d7f ED5B88FE  LD      DE,(0FE88H)
0d83 2806      JR      Z,0D8BH          ; (+06H)
0d85 CD970B    CALL    0B97H
0d88 C25F05    JP      NZ,055FH
0d8b EB        EX      DE,HL
0d8c 7C        LD      A,H
0d8d B5        OR      L
0d8e CA880B    JP      Z,0B88H
0d91 2288FE    LD      (0FE88H),HL
0d94 3285FE    LD      (0FE85H),A
0d97 E1        POP     HL
0d98 2286FE    LD      (0FE86H),HL
0d9b C1        POP     BC
0d9c C33A06    JP      063AH
0d9f CD9B10    CALL    109BH
0da2 7E        LD      A,(HL)
0da3 FE2C      CP      2CH
0da5 CC900A    CALL    Z,0A90H
0da8 FE89      CP      89H
0daa 2803      JR      Z,0DAFH          ; (+03H)
0dac CF        RST     08H
0dad C42BE5    CALL    NZ,0E52BH
0db0 CDC64D    CALL    4DC6H
0db3 E1        POP     HL
0db4 2810      JR      Z,0DC6H          ; (+10H)
0db6 D7        RST     10H
0db7 C8        RET     Z

0db8 FE0E      CP      0EH
0dba CAF70B    JP      Z,0BF7H
0dbd FE0D      CP      0DH
0dbf C2780A    JP      NZ,0A78H
0dc2 2A49FE    LD      HL,(0FE49H)
0dc5 C9        RET     

0dc6 1601      LD      D,01H
0dc8 CD4B0C    CALL    0C4BH
0dcb B7        OR      A
0dcc C8        RET     Z

0dcd D7        RST     10H
0dce FE9F      CP      9FH
0dd0 20F6      JR      NZ,0DC8H         ; (-0aH)
0dd2 15        DEC     D
0dd3 20F3      JR      NZ,0DC8H         ; (-0dH)
0dd5 18DF      JR      0DB6H            ; (-21H)
0dd7 3E01      LD      A,01H
0dd9 1821      JR      0DFCH            ; (+21H)
0ddb CDF0FA    CALL    0FAF0H
0dde FE23      CP      23H
0de0 201D      JR      NZ,0DFFH         ; (+1dH)
0de2 CDCD0E    CALL    0ECDH
0de5 2818      JR      Z,0DFFH          ; (+18H)
0de7 3C        INC     A
0de8 280D      JR      Z,0DF7H          ; (+0dH)
0dea 3C        INC     A
0deb 2806      JR      Z,0DF3H          ; (+06H)
0ded 3C        INC     A
0dee 28E7      JR      Z,0DD7H          ; (-19H)
0df0 C3880B    JP      0B88H
0df3 3E02      LD      A,02H
0df5 1805      JR      0DFCH            ; (+05H)
0df7 CD2C35    CALL    352CH
0dfa 3E80      LD      A,80H
0dfc 32F1FB    LD      (0FBF1H),A
0dff 2B        DEC     HL
0e00 D7        RST     10H
0e01 CC7C32    CALL    Z,327CH
0e04 CABE0E    JP      Z,0EBEH
0e07 FECE      CP      0CEH
0e09 CA4949    JP      Z,4949H
0e0c FEC5      CP      0C5H
0e0e CA900E    JP      Z,0E90H
0e11 FEC9      CP      0C9H
0e13 CA900E    JP      Z,0E90H
0e16 E5        PUSH    HL
0e17 FE2C      CP      2CH
0e19 284E      JR      Z,0E69H          ; (+4eH)
0e1b FE3B      CP      3BH
0e1d CAB90E    JP      Z,0EB9H
0e20 C1        POP     BC
0e21 CD9B10    CALL    109BH
0e24 E5        PUSH    HL
0e25 F7        RST     30H
0e26 283A      JR      Z,0E62H          ; (+3aH)
0e28 CD6454    CALL    5464H
0e2b CDF240    CALL    40F2H
0e2e 3620      LD      (HL),20H
0e30 2AA7FF    LD      HL,(0FFA7H)
0e33 34        INC     (HL)
0e34 2AA7FF    LD      HL,(0FFA7H)
0e37 3AF1FB    LD      A,(0FBF1H)
0e3a B7        OR      A
0e3b 280C      JR      Z,0E49H          ; (+0cH)
0e3d FE01      CP      01H
0e3f 201D      JR      NZ,0E5EH         ; (+1dH)
0e41 3AF0FB    LD      A,(0FBF0H)
0e44 86        ADD     A,(HL)
0e45 FEFF      CP      0FFH
0e47 180D      JR      0E56H            ; (+0dH)
0e49 3AF2FB    LD      A,(0FBF2H)
0e4c 47        LD      B,A
0e4d 3C        INC     A
0e4e 280E      JR      Z,0E5EH          ; (+0eH)
0e50 3AAFC6    LD      A,(0C6AFH)
0e53 86        ADD     A,(HL)
0e54 3D        DEC     A
0e55 B8        CP      B
0e56 3806      JR      C,0E5EH          ; (+06H)
0e58 CC8632    CALL    Z,3286H
0e5b C47C32    CALL    NZ,327CH
0e5e CD3841    CALL    4138H
0e61 B7        OR      A
0e62 CC3841    CALL    Z,4138H
0e65 E1        POP     HL
0e66 C3FF0D    JP      0DFFH
0e69 3AF1FB    LD      A,(0FBF1H)
0e6c B7        OR      A
0e6d 2808      JR      Z,0E77H          ; (+08H)
0e6f 3AF0FB    LD      A,(0FBF0H)
0e72 FEEE      CP      0EEH
0e74 C3830E    JP      0E83H
0e77 3AF3FB    LD      A,(0FBF3H)
0e7a 47        LD      B,A
0e7b 3AAFC6    LD      A,(0C6AFH)
0e7e FEFF      CP      0FFH
0e80 2807      JR      Z,0E89H          ; (+07H)
0e82 B8        CP      B
0e83 D47C32    CALL    NC,327CH
0e86 D2B90E    JP      NC,0EB9H
0e89 D60E      SUB     0EH
0e8b 30FC      JR      NC,0E89H         ; (-04H)
0e8d 2F        CPL     
0e8e 1820      JR      0EB0H            ; (+20H)
0e90 F5        PUSH    AF
0e91 CD3616    CALL    1636H
0e94 CF        RST     08H
0e95 29        ADD     HL,HL
0e96 2B        DEC     HL
0e97 F1        POP     AF
0e98 D6C9      SUB     0C9H
0e9a E5        PUSH    HL
0e9b 280F      JR      Z,0EACH          ; (+0fH)
0e9d 3AF1FB    LD      A,(0FBF1H)
0ea0 B7        OR      A
0ea1 CAA90E    JP      Z,0EA9H
0ea4 3AF0FB    LD      A,(0FBF0H)
0ea7 1803      JR      0EACH            ; (+03H)
0ea9 3AAFC6    LD      A,(0C6AFH)
0eac 2F        CPL     
0ead 83        ADD     A,E
0eae 3009      JR      NC,0EB9H         ; (+09H)
0eb0 3C        INC     A
0eb1 47        LD      B,A
0eb2 3E20      LD      A,20H
0eb4 CD1800    CALL    0018H
0eb7 10FB      DJNZ    0EB4H            ; (-05H)
0eb9 E1        POP     HL
0eba D7        RST     10H
0ebb C3040E    JP      0E04H
0ebe 3AF1FB    LD      A,(0FBF1H)
0ec1 07        RLCA    
0ec2 DC0C29    CALL    C,290CH
0ec5 AF        XOR     A
0ec6 32F1FB    LD      (0FBF1H),A
0ec9 3271FA    LD      (0FA71H),A
0ecc C9        RET     

0ecd D7        RST     10H
0ece CD4318    CALL    1843H
0ed1 CF        RST     08H
0ed2 2C        INC     L
0ed3 7B        LD      A,E
0ed4 1B        DEC     DE
0ed5 14        INC     D
0ed6 C2880B    JP      NZ,0B88H
0ed9 B7        OR      A
0eda C9        RET     

0edb FE85      CP      85H
0edd C2253E    JP      NZ,3E25H
0ee0 D7        RST     10H
0ee1 CD770F    CALL    0F77H
0ee4 CDCE44    CALL    44CEH
0ee7 CD1D4F    CALL    4F1DH
0eea D5        PUSH    DE
0eeb E5        PUSH    HL
0eec CDA438    CALL    38A4H
0eef D1        POP     DE
0ef0 C1        POP     BC
0ef1 DAB647    JP      C,47B6H
0ef4 C5        PUSH    BC
0ef5 D5        PUSH    DE
0ef6 0600      LD      B,00H
0ef8 CDF540    CALL    40F5H
0efb E1        POP     HL
0efc 3E03      LD      A,03H
0efe C3820C    JP      0C82H
0f01 3F        CCF     
0f02 52        LD      D,D
0f03 65        LD      H,L
0f04 64        LD      H,H
0f05 6F        LD      L,A
0f06 2066      JR      NZ,0F6EH         ; (+66H)
0f08 72        LD      (HL),D
0f09 6F        LD      L,A
0f0a 6D        LD      L,L
0f0b 2073      JR      NZ,0F80H         ; (+73H)
0f0d 74        LD      (HL),H
0f0e 61        LD      H,C
0f0f 72        LD      (HL),D
0f10 74        LD      (HL),H
0f11 0D        DEC     C
0f12 0A        LD      A,(BC)
0f13 00        NOP     
0f14 3A81FE    LD      A,(0FE81H)
0f17 B7        OR      A
0f18 C25905    JP      NZ,0559H
0f1b C1        POP     BC
0f1c 21010F    LD      HL,0F01H
0f1f CD3541    CALL    4135H
0f22 2A8AFE    LD      HL,(0FE8AH)
0f25 C9        RET     

0f26 FE23      CP      23H
0f28 CDF3FA    CALL    0FAF3H
0f2b 2045      JR      NZ,0F72H         ; (+45H)
0f2d CDCD0E    CALL    0ECDH
0f30 2840      JR      Z,0F72H          ; (+40H)
0f32 3C        INC     A
0f33 2815      JR      Z,0F4AH          ; (+15H)
0f35 3C        INC     A
0f36 2806      JR      Z,0F3EH          ; (+06H)
0f38 3C        INC     A
0f39 2828      JR      Z,0F63H          ; (+28H)
0f3b C3880B    JP      0B88H
0f3e F3        DI      
0f3f 3E02      LD      A,02H
0f41 3271FA    LD      (0FA71H),A
0f44 E5        PUSH    HL
0f45 CD2910    CALL    1029H
0f48 1850      JR      0F9AH            ; (+50H)
0f4a F3        DI      
0f4b 3E80      LD      A,80H
0f4d 3271FA    LD      (0FA71H),A
0f50 E5        PUSH    HL
0f51 CD0C35    CALL    350CH
0f54 CD2910    CALL    1029H
0f57 CDBD28    CALL    28BDH
0f5a 0633      LD      B,33H
0f5c CD2029    CALL    2920H
0f5f D333      OUT     (33H),A
0f61 1837      JR      0F9AH            ; (+37H)
0f63 3E01      LD      A,01H
0f65 3271FA    LD      (0FA71H),A
0f68 E5        PUSH    HL
0f69 3E01      LD      A,01H
0f6b D342      OUT     (42H),A
0f6d CD2910    CALL    1029H
0f70 1828      JR      0F9AH            ; (+28H)
0f72 7E        LD      A,(HL)
0f73 018A0F    LD      BC,0F8AH
0f76 C5        PUSH    BC
0f77 FE22      CP      22H
0f79 3E00      LD      A,00H
0f7b C0        RET     NZ

0f7c CDF340    CALL    40F3H
0f7f CF        RST     08H
0f80 3B        DEC     SP
0f81 E5        PUSH    HL
0f82 CDE420    CALL    20E4H
0f85 CD3841    CALL    4138H
0f88 E1        POP     HL
0f89 C9        RET     

0f8a E5        PUSH    HL
0f8b CD9738    CALL    3897H
0f8e C1        POP     BC
0f8f DAB647    JP      C,47B6H
0f92 23        INC     HL
0f93 7E        LD      A,(HL)
0f94 B7        OR      A
0f95 2B        DEC     HL
0f96 C5        PUSH    BC
0f97 CA4A0C    JP      Z,0C4AH
0f9a C3C55F    JP      5FC5H
0f9d 00        NOP     
0f9e E5        PUSH    HL
0f9f 2AA3FE    LD      HL,(0FEA3H)
0fa2 F6AF      OR      0AFH
0fa4 3281FE    LD      (0FE81H),A
0fa7 E3        EX      (SP),HL
0fa8 01CF2C    LD      BC,2CCFH
0fab CDCE44    CALL    44CEH
0fae E3        EX      (SP),HL
0faf D5        PUSH    DE
0fb0 7E        LD      A,(HL)
0fb1 FE2C      CP      2CH
0fb3 281D      JR      Z,0FD2H          ; (+1dH)
0fb5 3A81FE    LD      A,(0FE81H)
0fb8 B7        OR      A
0fb9 C27710    JP      NZ,1077H
0fbc 3E3F      LD      A,3FH
0fbe CD1800    CALL    0018H
0fc1 CD9738    CALL    3897H
0fc4 D1        POP     DE
0fc5 C1        POP     BC
0fc6 DAB647    JP      C,47B6H
0fc9 23        INC     HL
0fca 7E        LD      A,(HL)
0fcb 2B        DEC     HL
0fcc B7        OR      A
0fcd C5        PUSH    BC
0fce CA4A0C    JP      Z,0C4AH
0fd1 D5        PUSH    DE
0fd2 F7        RST     30H
0fd3 F5        PUSH    AF
0fd4 2022      JR      NZ,0FF8H         ; (+22H)
0fd6 D7        RST     10H
0fd7 57        LD      D,A
0fd8 47        LD      B,A
0fd9 FE22      CP      22H
0fdb 280C      JR      Z,0FE9H          ; (+0cH)
0fdd 3A81FE    LD      A,(0FE81H)
0fe0 B7        OR      A
0fe1 57        LD      D,A
0fe2 2802      JR      Z,0FE6H          ; (+02H)
0fe4 163A      LD      D,3AH
0fe6 062C      LD      B,2CH
0fe8 2B        DEC     HL
0fe9 CDF640    CALL    40F6H
0fec F1        POP     AF
0fed C603      ADD     A,03H
0fef EB        EX      DE,HL
0ff0 210510    LD      HL,1005H
0ff3 E3        EX      (SP),HL
0ff4 D5        PUSH    DE
0ff5 C3830C    JP      0C83H
0ff8 D7        RST     10H
0ff9 F1        POP     AF
0ffa F5        PUSH    AF
0ffb 01EC0F    LD      BC,0FECH
0ffe C5        PUSH    BC
0fff DAF952    JP      C,52F9H
1002 C3F252    JP      52F2H
1005 2B        DEC     HL
1006 D7        RST     10H
1007 2805      JR      Z,100EH          ; (+05H)
1009 FE2C      CP      2CH
100b C2140F    JP      NZ,0F14H
100e E3        EX      (SP),HL
100f 2B        DEC     HL
1010 D7        RST     10H
1011 C2A90F    JP      NZ,0FA9H
1014 D1        POP     DE
1015 3A81FE    LD      A,(0FE81H)
1018 B7        OR      A
1019 EB        EX      DE,HL
101a C29E47    JP      NZ,479EH
101d D5        PUSH    DE
101e B6        OR      (HL)
101f 216610    LD      HL,1066H
1022 C43541    CALL    NZ,4135H
1025 E1        POP     HL
1026 C3BE0E    JP      0EBEH
1029 213EFD    LD      HL,0FD3EH
102c 06FF      LD      B,0FFH
102e 3A71FA    LD      A,(0FA71H)
1031 FE01      CP      01H
1033 2808      JR      Z,103DH          ; (+08H)
1035 07        RLCA    
1036 3814      JR      C,104CH          ; (+14H)
1038 CDD827    CALL    27D8H
103b 1812      JR      104FH            ; (+12H)
103d DB44      IN      A,(44H)
103f E620      AND     20H
1041 2805      JR      Z,1048H          ; (+05H)
1043 CD571D    CALL    1D57H
1046 18F5      JR      103DH            ; (-0bH)
1048 DB41      IN      A,(41H)
104a 1803      JR      104FH            ; (+03H)
104c CD7128    CALL    2871H
104f 77        LD      (HL),A
1050 23        INC     HL
1051 FE0D      CP      0DH
1053 2802      JR      Z,1057H          ; (+02H)
1055 10D7      DJNZ    102EH            ; (-29H)
1057 2B        DEC     HL
1058 3600      LD      (HL),00H
105a 213EFD    LD      HL,0FD3EH
105d 2B        DEC     HL
105e 0637      LD      B,37H
1060 CD2029    CALL    2920H
1063 D333      OUT     (33H),A
1065 C9        RET     

1066 3F        CCF     
1067 45        LD      B,L
1068 78        LD      A,B
1069 74        LD      (HL),H
106a 72        LD      (HL),D
106b 61        LD      H,C
106c 2069      JR      NZ,10D7H         ; (+69H)
106e 67        LD      H,A
106f 6E        LD      L,(HL)
1070 6F        LD      L,A
1071 72        LD      (HL),D
1072 65        LD      H,L
1073 64        LD      H,H
1074 0D        DEC     C
1075 0A        LD      A,(BC)
1076 00        NOP     
1077 CD4B0C    CALL    0C4BH
107a B7        OR      A
107b 2011      JR      NZ,108EH         ; (+11H)
107d 23        INC     HL
107e 7E        LD      A,(HL)
107f 23        INC     HL
1080 B6        OR      (HL)
1081 1E04      LD      E,04H
1083 CA7905    JP      Z,0579H
1086 23        INC     HL
1087 5E        LD      E,(HL)
1088 23        INC     HL
1089 56        LD      D,(HL)
108a ED537EFE  LD      (0FE7EH),DE
108e D7        RST     10H
108f FE84      CP      84H
1091 20E4      JR      NZ,1077H         ; (-1cH)
1093 C3D20F    JP      0FD2H
1096 CF        RST     08H
1097 E7        RST     20H
1098 01CF28    LD      BC,28CFH
109b 2B        DEC     HL
109c 1600      LD      D,00H
109e D5        PUSH    DE
109f 0E01      LD      C,01H
10a1 CDE646    CALL    46E6H
10a4 CD0E12    CALL    120EH
10a7 2297FE    LD      (0FE97H),HL
10aa 2A97FE    LD      HL,(0FE97H)
10ad C1        POP     BC
10ae 7E        LD      A,(HL)
10af 2278FE    LD      (0FE78H),HL
10b2 FEE6      CP      0E6H
10b4 D8        RET     C

10b5 FEE9      CP      0E9H
10b7 3865      JR      C,111EH          ; (+65H)
10b9 D6E9      SUB     0E9H
10bb 5F        LD      E,A
10bc 2009      JR      NZ,10C7H         ; (+09H)
10be 3A42FE    LD      A,(0FE42H)
10c1 FE03      CP      03H
10c3 7B        LD      A,E
10c4 CA4642    JP      Z,4246H
10c7 FE0C      CP      0CH
10c9 D0        RET     NC

10ca 214704    LD      HL,0447H
10cd 1600      LD      D,00H
10cf 19        ADD     HL,DE
10d0 78        LD      A,B
10d1 56        LD      D,(HL)
10d2 BA        CP      D
10d3 D0        RET     NC

10d4 C5        PUSH    BC
10d5 01AA10    LD      BC,10AAH
10d8 C5        PUSH    BC
10d9 7A        LD      A,D
10da FE7F      CP      7FH
10dc 2859      JR      Z,1137H          ; (+59H)
10de FE51      CP      51H
10e0 3862      JR      C,1144H          ; (+62H)
10e2 E6FE      AND     0FEH
10e4 FE7A      CP      7AH
10e6 285C      JR      Z,1144H          ; (+5cH)
10e8 21A7FF    LD      HL,0FFA7H
10eb 3A42FE    LD      A,(0FE42H)
10ee D603      SUB     03H
10f0 CA7705    JP      Z,0577H
10f3 B7        OR      A
10f4 4E        LD      C,(HL)
10f5 23        INC     HL
10f6 46        LD      B,(HL)
10f7 C5        PUSH    BC
10f8 FA0F11    JP      M,110FH
10fb 23        INC     HL
10fc 4E        LD      C,(HL)
10fd 23        INC     HL
10fe 46        LD      B,(HL)
10ff C5        PUSH    BC
1100 E20F11    JP      PO,110FH
1103 21A3FF    LD      HL,0FFA3H
1106 4E        LD      C,(HL)
1107 23        INC     HL
1108 46        LD      B,(HL)
1109 23        INC     HL
110a C5        PUSH    BC
110b 4E        LD      C,(HL)
110c 23        INC     HL
110d 46        LD      B,(HL)
110e C5        PUSH    BC
110f C603      ADD     A,03H
1111 4B        LD      C,E
1112 47        LD      B,A
1113 C5        PUSH    BC
1114 016911    LD      BC,1169H
1117 C5        PUSH    BC
1118 2A78FE    LD      HL,(0FE78H)
111b C39E10    JP      109EH
111e 1600      LD      D,00H
1120 D6E6      SUB     0E6H
1122 382B      JR      C,114FH          ; (+2bH)
1124 FE03      CP      03H
1126 3027      JR      NC,114FH         ; (+27H)
1128 FE01      CP      01H
112a 17        RLA     
112b AA        XOR     D
112c BA        CP      D
112d 57        LD      D,A
112e DA5F05    JP      C,055FH
1131 2278FE    LD      (0FE78H),HL
1134 D7        RST     10H
1135 18E9      JR      1120H            ; (-17H)
1137 CDDB4E    CALL    4EDBH
113a CDD64D    CALL    4DD6H
113d 012759    LD      BC,5927H
1140 167F      LD      D,7FH
1142 18D3      JR      1117H            ; (-2dH)
1144 D5        PUSH    DE
1145 CDA94E    CALL    4EA9H
1148 D1        POP     DE
1149 E5        PUSH    HL
114a 01A313    LD      BC,13A3H
114d 18C8      JR      1117H            ; (-38H)
114f 78        LD      A,B
1150 FE64      CP      64H
1152 D0        RET     NC

1153 C5        PUSH    BC
1154 D5        PUSH    DE
1155 110464    LD      DE,6404H
1158 217713    LD      HL,1377H
115b E5        PUSH    HL
115c F7        RST     30H
115d C2E810    JP      NZ,10E8H
1160 2AA7FF    LD      HL,(0FFA7H)
1163 E5        PUSH    HL
1164 018A40    LD      BC,408AH
1167 18AE      JR      1117H            ; (-52H)
1169 C1        POP     BC
116a 79        LD      A,C
116b 3243FE    LD      (0FE43H),A
116e 3A42FE    LD      A,(0FE42H)
1171 B8        CP      B
1172 200B      JR      NZ,117FH         ; (+0bH)
1174 FE02      CP      02H
1176 281F      JR      Z,1197H          ; (+1fH)
1178 FE04      CP      04H
117a CAE411    JP      Z,11E4H
117d 302B      JR      NC,11AAH         ; (+2bH)
117f 57        LD      D,A
1180 78        LD      A,B
1181 FE08      CP      08H
1183 2822      JR      Z,11A7H          ; (+22H)
1185 7A        LD      A,D
1186 FE08      CP      08H
1188 2844      JR      Z,11CEH          ; (+44H)
118a 78        LD      A,B
118b FE04      CP      04H
118d 2852      JR      Z,11E1H          ; (+52H)
118f 7A        LD      A,D
1190 FE03      CP      03H
1192 CA7705    JP      Z,0577H
1195 3054      JR      NC,11EBH         ; (+54H)
1197 217104    LD      HL,0471H
119a 0600      LD      B,00H
119c 09        ADD     HL,BC
119d 09        ADD     HL,BC
119e 4E        LD      C,(HL)
119f 23        INC     HL
11a0 46        LD      B,(HL)
11a1 D1        POP     DE
11a2 2AA7FF    LD      HL,(0FFA7H)
11a5 C5        PUSH    BC
11a6 C9        RET     

11a7 CD054F    CALL    4F05H
11aa CD2D4E    CALL    4E2DH
11ad E1        POP     HL
11ae 22A5FF    LD      (0FFA5H),HL
11b1 E1        POP     HL
11b2 22A3FF    LD      (0FFA3H),HL
11b5 C1        POP     BC
11b6 D1        POP     DE
11b7 CDE64D    CALL    4DE6H
11ba CD054F    CALL    4F05H
11bd 215D04    LD      HL,045DH
11c0 3A43FE    LD      A,(0FE43H)
11c3 07        RLCA    
11c4 85        ADD     A,L
11c5 6F        LD      L,A
11c6 8C        ADC     A,H
11c7 95        SUB     L
11c8 67        LD      H,A
11c9 7E        LD      A,(HL)
11ca 23        INC     HL
11cb 66        LD      H,(HL)
11cc 6F        LD      L,A
11cd E9        JP      (HL)
11ce 78        LD      A,B
11cf F5        PUSH    AF
11d0 CD2D4E    CALL    4E2DH
11d3 F1        POP     AF
11d4 3242FE    LD      (0FE42H),A
11d7 FE04      CP      04H
11d9 28DA      JR      Z,11B5H          ; (-26H)
11db E1        POP     HL
11dc 22A7FF    LD      (0FFA7H),HL
11df 18D9      JR      11BAH            ; (-27H)
11e1 CDDB4E    CALL    4EDBH
11e4 C1        POP     BC
11e5 D1        POP     DE
11e6 216704    LD      HL,0467H
11e9 18D5      JR      11C0H            ; (-2bH)
11eb E1        POP     HL
11ec CDD64D    CALL    4DD6H
11ef CDF94E    CALL    4EF9H
11f2 CDF14D    CALL    4DF1H
11f5 E1        POP     HL
11f6 22A9FF    LD      (0FFA9H),HL
11f9 E1        POP     HL
11fa 22A7FF    LD      (0FFA7H),HL
11fd 18E7      JR      11E6H            ; (-19H)
11ff E5        PUSH    HL
1200 EB        EX      DE,HL
1201 CDF94E    CALL    4EF9H
1204 E1        POP     HL
1205 CDD64D    CALL    4DD6H
1208 CDF94E    CALL    4EF9H
120b C3C14C    JP      4CC1H
120e D7        RST     10H
120f CA7405    JP      Z,0574H
1212 DAF952    JP      C,52F9H
1215 CD8148    CALL    4881H
1218 D2AD12    JP      NC,12ADH
121b FE20      CP      20H
121d DADF0A    JP      C,0ADFH
1220 3C        INC     A
1221 CA2513    JP      Z,1325H
1224 3D        DEC     A
1225 FEE9      CP      0E9H
1227 28E5      JR      Z,120EH          ; (-1bH)
1229 FEEA      CP      0EAH
122b CA9F12    JP      Z,129FH
122e FE22      CP      22H
1230 CAF340    JP      Z,40F3H
1233 FECA      CP      0CAH
1235 CA8313    JP      Z,1383H
1238 FE26      CP      26H
123a CACA12    JP      Z,12CAH
123d FECC      CP      0CCH
123f 200A      JR      NZ,124BH         ; (+0aH)
1241 D7        RST     10H
1242 3AEEFB    LD      A,(0FBEEH)
1245 E5        PUSH    HL
1246 CD0614    CALL    1406H
1249 E1        POP     HL
124a C9        RET     

124b FECB      CP      0CBH
124d 200A      JR      NZ,1259H         ; (+0aH)
124f D7        RST     10H
1250 E5        PUSH    HL
1251 2A8EFE    LD      HL,(0FE8EH)
1254 CDC950    CALL    50C9H
1257 E1        POP     HL
1258 C9        RET     

1259 FED1      CP      0D1H
125b 2014      JR      NZ,1271H         ; (+14H)
125d D7        RST     10H
125e CF        RST     08H
125f 28CD      JR      Z,122EH          ; (-33H)
1261 84        ADD     A,H
1262 45        LD      B,L
1263 CF        RST     08H
1264 29        ADD     HL,HL
1265 E5        PUSH    HL
1266 EB        EX      DE,HL
1267 7C        LD      A,H
1268 B5        OR      L
1269 CA880B    JP      Z,0B88H
126c CDC44E    CALL    4EC4H
126f E1        POP     HL
1270 C9        RET     

1271 FEC7      CP      0C7H
1273 CA0C14    JP      Z,140CH
1276 FECF      CP      0CFH
1278 CAA743    JP      Z,43A7H
127b FED3      CP      0D3H
127d CAF713    JP      Z,13F7H
1280 FED4      CP      0D4H
1282 CA843D    JP      Z,3D84H
1285 FED2      CP      0D2H
1287 CA9032    JP      Z,3290H
128a FECD      CP      0CDH
128c CAE542    JP      Z,42E5H
128f FE85      CP      85H
1291 CAAD32    JP      Z,32ADH
1294 FEC8      CP      0C8H
1296 CA7714    JP      Z,1477H
1299 CD9910    CALL    1099H
129c CF        RST     08H
129d 29        ADD     HL,HL
129e C9        RET     

129f 167D      LD      D,7DH
12a1 CD9E10    CALL    109EH
12a4 2A97FE    LD      HL,(0FE97H)
12a7 E5        PUSH    HL
12a8 CDAD4D    CALL    4DADH
12ab E1        POP     HL
12ac C9        RET     

12ad CDCE44    CALL    44CEH
12b0 E5        PUSH    HL
12b1 EB        EX      DE,HL
12b2 22A7FF    LD      (0FFA7H),HL
12b5 F7        RST     30H
12b6 C4284E    CALL    NZ,4E28H
12b9 E1        POP     HL
12ba C9        RET     

12bb 7E        LD      A,(HL)
12bc FE61      CP      61H
12be D8        RET     C

12bf FE7B      CP      7BH
12c1 D0        RET     NC

12c2 E65F      AND     5FH
12c4 C9        RET     

12c5 FE26      CP      26H
12c7 C2970B    JP      NZ,0B97H
12ca 110000    LD      DE,0000H
12cd D7        RST     10H
12ce CDBC12    CALL    12BCH
12d1 FE4F      CP      4FH
12d3 282E      JR      Z,1303H          ; (+2eH)
12d5 FE48      CP      48H
12d7 2029      JR      NZ,1302H         ; (+29H)
12d9 0605      LD      B,05H
12db 23        INC     HL
12dc 7E        LD      A,(HL)
12dd CDBC12    CALL    12BCH
12e0 CD8148    CALL    4881H
12e3 EB        EX      DE,HL
12e4 300A      JR      NC,12F0H         ; (+0aH)
12e6 FE3A      CP      3AH
12e8 3036      JR      NC,1320H         ; (+36H)
12ea D630      SUB     30H
12ec 3832      JR      C,1320H          ; (+32H)
12ee 1806      JR      12F6H            ; (+06H)
12f0 FE47      CP      47H
12f2 302C      JR      NC,1320H         ; (+2cH)
12f4 D637      SUB     37H
12f6 29        ADD     HL,HL
12f7 29        ADD     HL,HL
12f8 29        ADD     HL,HL
12f9 29        ADD     HL,HL
12fa B5        OR      L
12fb 6F        LD      L,A
12fc EB        EX      DE,HL
12fd 10DC      DJNZ    12DBH            ; (-24H)
12ff C37105    JP      0571H
1302 2B        DEC     HL
1303 D7        RST     10H
1304 EB        EX      DE,HL
1305 3019      JR      NC,1320H         ; (+19H)
1307 FE38      CP      38H
1309 D25F05    JP      NC,055FH
130c 017105    LD      BC,0571H
130f C5        PUSH    BC
1310 29        ADD     HL,HL
1311 D8        RET     C

1312 29        ADD     HL,HL
1313 D8        RET     C

1314 29        ADD     HL,HL
1315 D8        RET     C

1316 C1        POP     BC
1317 0600      LD      B,00H
1319 D630      SUB     30H
131b 4F        LD      C,A
131c 09        ADD     HL,BC
131d EB        EX      DE,HL
131e 18E3      JR      1303H            ; (-1dH)
1320 CDC44E    CALL    4EC4H
1323 EB        EX      DE,HL
1324 C9        RET     

1325 23        INC     HL
1326 7E        LD      A,(HL)
1327 D681      SUB     81H
1329 0600      LD      B,00H
132b 07        RLCA    
132c 4F        LD      C,A
132d C5        PUSH    BC
132e D7        RST     10H
132f 79        LD      A,C
1330 FE05      CP      05H
1332 3016      JR      NC,134AH         ; (+16H)
1334 CD9910    CALL    1099H
1337 CF        RST     08H
1338 2C        INC     L
1339 CD1D4F    CALL    4F1DH
133c EB        EX      DE,HL
133d 2AA7FF    LD      HL,(0FFA7H)
1340 E3        EX      (SP),HL
1341 E5        PUSH    HL
1342 EB        EX      DE,HL
1343 CD3716    CALL    1637H
1346 EB        EX      DE,HL
1347 E3        EX      (SP),HL
1348 1814      JR      135EH            ; (+14H)
134a CD9912    CALL    1299H
134d E3        EX      (SP),HL
134e 7D        LD      A,L
134f FE0C      CP      0CH
1351 3807      JR      C,135AH          ; (+07H)
1353 FE1B      CP      1BH
1355 E5        PUSH    HL
1356 DCDB4E    CALL    C,4EDBH
1359 E1        POP     HL
135a 11AB12    LD      DE,12ABH
135d D5        PUSH    DE
135e 019D01    LD      BC,019DH
1361 09        ADD     HL,BC
1362 4E        LD      C,(HL)
1363 23        INC     HL
1364 66        LD      H,(HL)
1365 69        LD      L,C
1366 E9        JP      (HL)
1367 15        DEC     D
1368 FEEA      CP      0EAH
136a C8        RET     Z

136b FE2D      CP      2DH
136d C8        RET     Z

136e 14        INC     D
136f FE2B      CP      2BH
1371 C8        RET     Z

1372 FEE9      CP      0E9H
1374 C8        RET     Z

1375 2B        DEC     HL
1376 C9        RET     

1377 3C        INC     A
1378 8F        ADC     A,A
1379 C1        POP     BC
137a A0        AND     B
137b C6FF      ADD     A,0FFH
137d 9F        SBC     A,A
137e CDBF4D    CALL    4DBFH
1381 1812      JR      1395H            ; (+12H)
1383 165A      LD      D,5AH
1385 CD9E10    CALL    109EH
1388 CDA94E    CALL    4EA9H
138b 7D        LD      A,L
138c 2F        CPL     
138d 6F        LD      L,A
138e 7C        LD      A,H
138f 2F        CPL     
1390 67        LD      H,A
1391 22A7FF    LD      (0FFA7H),HL
1394 C1        POP     BC
1395 C3AA10    JP      10AAH
1398 3005      JR      NC,139FH         ; (+05H)
139a D603      SUB     03H
139c B7        OR      A
139d 37        SCF     
139e C9        RET     

139f D603      SUB     03H
13a1 B7        OR      A
13a2 C9        RET     

13a3 78        LD      A,B
13a4 F5        PUSH    AF
13a5 CDA94E    CALL    4EA9H
13a8 F1        POP     AF
13a9 D1        POP     DE
13aa FE7A      CP      7AH
13ac CAD350    JP      Z,50D3H
13af FE7B      CP      7BH
13b1 CA7250    JP      Z,5072H
13b4 010814    LD      BC,1408H
13b7 C5        PUSH    BC
13b8 FE46      CP      46H
13ba 2006      JR      NZ,13C2H         ; (+06H)
13bc 7B        LD      A,E
13bd B5        OR      L
13be 6F        LD      L,A
13bf 7C        LD      A,H
13c0 B2        OR      D
13c1 C9        RET     

13c2 FE50      CP      50H
13c4 2006      JR      NZ,13CCH         ; (+06H)
13c6 7B        LD      A,E
13c7 A5        AND     L
13c8 6F        LD      L,A
13c9 7C        LD      A,H
13ca A2        AND     D
13cb C9        RET     

13cc FE3C      CP      3CH
13ce 2006      JR      NZ,13D6H         ; (+06H)
13d0 7B        LD      A,E
13d1 AD        XOR     L
13d2 6F        LD      L,A
13d3 7C        LD      A,H
13d4 AA        XOR     D
13d5 C9        RET     

13d6 FE32      CP      32H
13d8 2008      JR      NZ,13E2H         ; (+08H)
13da 7B        LD      A,E
13db AD        XOR     L
13dc 2F        CPL     
13dd 6F        LD      L,A
13de 7C        LD      A,H
13df AA        XOR     D
13e0 2F        CPL     
13e1 C9        RET     

13e2 7D        LD      A,L
13e3 2F        CPL     
13e4 A3        AND     E
13e5 2F        CPL     
13e6 6F        LD      L,A
13e7 7C        LD      A,H
13e8 2F        CPL     
13e9 A2        AND     D
13ea 2F        CPL     
13eb C9        RET     

13ec B7        OR      A
13ed ED52      SBC     HL,DE
13ef C3C950    JP      50C9H
13f2 3AF0FB    LD      A,(0FBF0H)
13f5 180F      JR      1406H            ; (+0fH)
13f7 D7        RST     10H
13f8 E5        PUSH    HL
13f9 3AAEC6    LD      A,(0C6AEH)
13fc 3D        DEC     A
13fd CD0614    CALL    1406H
1400 E1        POP     HL
1401 C9        RET     

1402 3AAFC6    LD      A,(0C6AFH)
1405 3D        DEC     A
1406 6F        LD      L,A
1407 AF        XOR     A
1408 67        LD      H,A
1409 C3C44E    JP      4EC4H
140c CD2B14    CALL    142BH
140f D5        PUSH    DE
1410 CD9912    CALL    1299H
1413 E3        EX      (SP),HL
1414 5E        LD      E,(HL)
1415 23        INC     HL
1416 56        LD      D,(HL)
1417 21B14C    LD      HL,4CB1H
141a E5        PUSH    HL
141b D5        PUSH    DE
141c 3A42FE    LD      A,(0FE42H)
141f F5        PUSH    AF
1420 FE03      CP      03H
1422 CC9242    CALL    Z,4292H
1425 F1        POP     AF
1426 EB        EX      DE,HL
1427 21A7FF    LD      HL,0FFA7H
142a C9        RET     

142b D7        RST     10H
142c 010000    LD      BC,0000H
142f FE1B      CP      1BH
1431 300B      JR      NC,143EH         ; (+0bH)
1433 FE11      CP      11H
1435 3807      JR      C,143EH          ; (+07H)
1437 D7        RST     10H
1438 3A49FE    LD      A,(0FE49H)
143b B7        OR      A
143c 17        RLA     
143d 4F        LD      C,A
143e EB        EX      DE,HL
143f 21DAFB    LD      HL,0FBDAH
1442 09        ADD     HL,BC
1443 EB        EX      DE,HL
1444 C9        RET     

1445 CD2B14    CALL    142BH
1448 D5        PUSH    DE
1449 CF        RST     08H
144a E7        RST     20H
144b CD4318    CALL    1843H
144e E3        EX      (SP),HL
144f 73        LD      (HL),E
1450 23        INC     HL
1451 72        LD      (HL),D
1452 E1        POP     HL
1453 C9        RET     

1454 FEC7      CP      0C7H
1456 28ED      JR      Z,1445H          ; (-13H)
1458 CDD815    CALL    15D8H
145b CDCA15    CALL    15CAH
145e EB        EX      DE,HL
145f 73        LD      (HL),E
1460 23        INC     HL
1461 72        LD      (HL),D
1462 EB        EX      DE,HL
1463 7E        LD      A,(HL)
1464 FE28      CP      28H
1466 C24B0C    JP      NZ,0C4BH
1469 D7        RST     10H
146a CDCE44    CALL    44CEH
146d 7E        LD      A,(HL)
146e FE29      CP      29H
1470 CA4B0C    JP      Z,0C4BH
1473 CF        RST     08H
1474 2C        INC     L
1475 18F3      JR      146AH            ; (-0dH)
1477 CDD815    CALL    15D8H
147a 3A42FE    LD      A,(0FE42H)
147d B7        OR      A
147e F5        PUSH    AF
147f 2297FE    LD      (0FE97H),HL
1482 EB        EX      DE,HL
1483 7E        LD      A,(HL)
1484 23        INC     HL
1485 66        LD      H,(HL)
1486 6F        LD      L,A
1487 7C        LD      A,H
1488 B5        OR      L
1489 CA6B05    JP      Z,056BH
148c 7E        LD      A,(HL)
148d FE28      CP      28H
148f C22B15    JP      NZ,152BH
1492 D7        RST     10H
1493 2278FE    LD      (0FE78H),HL
1496 EB        EX      DE,HL
1497 2A97FE    LD      HL,(0FE97H)
149a CF        RST     08H
149b 28AF      JR      Z,144CH          ; (-51H)
149d F5        PUSH    AF
149e E5        PUSH    HL
149f EB        EX      DE,HL
14a0 3E80      LD      A,80H
14a2 3280FE    LD      (0FE80H),A
14a5 CDCE44    CALL    44CEH
14a8 EB        EX      DE,HL
14a9 E3        EX      (SP),HL
14aa 3A42FE    LD      A,(0FE42H)
14ad F5        PUSH    AF
14ae D5        PUSH    DE
14af CD9B10    CALL    109BH
14b2 2297FE    LD      (0FE97H),HL
14b5 E1        POP     HL
14b6 2278FE    LD      (0FE78H),HL
14b9 F1        POP     AF
14ba CDB115    CALL    15B1H
14bd 0E04      LD      C,04H
14bf CDE646    CALL    46E6H
14c2 21F8FF    LD      HL,0FFF8H
14c5 39        ADD     HL,SP
14c6 F9        LD      SP,HL
14c7 CD304E    CALL    4E30H
14ca 3A42FE    LD      A,(0FE42H)
14cd F5        PUSH    AF
14ce 2A97FE    LD      HL,(0FE97H)
14d1 7E        LD      A,(HL)
14d2 FE29      CP      29H
14d4 280E      JR      Z,14E4H          ; (+0eH)
14d6 CF        RST     08H
14d7 2C        INC     L
14d8 E5        PUSH    HL
14d9 2A78FE    LD      HL,(0FE78H)
14dc CF        RST     08H
14dd 2C        INC     L
14de 18C0      JR      14A0H            ; (-40H)
14e0 F1        POP     AF
14e1 3229FF    LD      (0FF29H),A
14e4 F1        POP     AF
14e5 B7        OR      A
14e6 2838      JR      Z,1520H          ; (+38H)
14e8 3242FE    LD      (0FE42H),A
14eb 210000    LD      HL,0000H
14ee 39        ADD     HL,SP
14ef CD284E    CALL    4E28H
14f2 210800    LD      HL,0008H
14f5 39        ADD     HL,SP
14f6 F9        LD      SP,HL
14f7 D1        POP     DE
14f8 2E03      LD      L,03H
14fa 1B        DEC     DE
14fb 1B        DEC     DE
14fc 1B        DEC     DE
14fd 3A42FE    LD      A,(0FE42H)
1500 85        ADD     A,L
1501 47        LD      B,A
1502 3A29FF    LD      A,(0FF29H)
1505 4F        LD      C,A
1506 80        ADD     A,B
1507 FE64      CP      64H
1509 D2880B    JP      NC,0B88H
150c F5        PUSH    AF
150d 7D        LD      A,L
150e 0600      LD      B,00H
1510 212BFF    LD      HL,0FF2BH
1513 09        ADD     HL,BC
1514 4F        LD      C,A
1515 CDC515    CALL    15C5H
1518 01E014    LD      BC,14E0H
151b C5        PUSH    BC
151c C5        PUSH    BC
151d C38E0C    JP      0C8EH
1520 2A97FE    LD      HL,(0FE97H)
1523 D7        RST     10H
1524 E5        PUSH    HL
1525 2A78FE    LD      HL,(0FE78H)
1528 CF        RST     08H
1529 29        ADD     HL,HL
152a 3ED5      LD      A,0D5H
152c 2278FE    LD      (0FE78H),HL
152f 3AC1FE    LD      A,(0FEC1H)
1532 C604      ADD     A,04H
1534 F5        PUSH    AF
1535 0F        RRCA    
1536 4F        LD      C,A
1537 CDE646    CALL    46E6H
153a F1        POP     AF
153b 4F        LD      C,A
153c 2F        CPL     
153d 3C        INC     A
153e 6F        LD      L,A
153f 26FF      LD      H,0FFH
1541 39        ADD     HL,SP
1542 F9        LD      SP,HL
1543 E5        PUSH    HL
1544 11BFFE    LD      DE,0FEBFH
1547 CDC515    CALL    15C5H
154a E1        POP     HL
154b 22BFFE    LD      (0FEBFH),HL
154e 2A29FF    LD      HL,(0FF29H)
1551 22C1FE    LD      (0FEC1H),HL
1554 44        LD      B,H
1555 4D        LD      C,L
1556 21C3FE    LD      HL,0FEC3H
1559 112BFF    LD      DE,0FF2BH
155c CDC515    CALL    15C5H
155f 67        LD      H,A
1560 6F        LD      L,A
1561 2229FF    LD      (0FF29H),HL
1564 2A95FF    LD      HL,(0FF95H)
1567 23        INC     HL
1568 2295FF    LD      (0FF95H),HL
156b 7C        LD      A,H
156c B5        OR      L
156d 3292FF    LD      (0FF92H),A
1570 2A78FE    LD      HL,(0FE78H)
1573 CD9610    CALL    1096H
1576 2B        DEC     HL
1577 D7        RST     10H
1578 C25F05    JP      NZ,055FH
157b F7        RST     30H
157c 200F      JR      NZ,158DH         ; (+0fH)
157e 1173FE    LD      DE,0FE73H
1581 2AA7FF    LD      HL,(0FFA7H)
1584 E7        RST     20H
1585 3806      JR      C,158DH          ; (+06H)
1587 CDCE40    CALL    40CEH
158a CD1541    CALL    4115H
158d 2ABFFE    LD      HL,(0FEBFH)
1590 54        LD      D,H
1591 5D        LD      E,L
1592 23        INC     HL
1593 23        INC     HL
1594 4E        LD      C,(HL)
1595 23        INC     HL
1596 46        LD      B,(HL)
1597 03        INC     BC
1598 03        INC     BC
1599 03        INC     BC
159a 03        INC     BC
159b 21BFFE    LD      HL,0FEBFH
159e CDC515    CALL    15C5H
15a1 EB        EX      DE,HL
15a2 F9        LD      SP,HL
15a3 2A95FF    LD      HL,(0FF95H)
15a6 2B        DEC     HL
15a7 2295FF    LD      (0FF95H),HL
15aa 7C        LD      A,H
15ab B5        OR      L
15ac 3292FF    LD      (0FF92H),A
15af E1        POP     HL
15b0 F1        POP     AF
15b1 E5        PUSH    HL
15b2 E607      AND     07H
15b4 215304    LD      HL,0453H
15b7 4F        LD      C,A
15b8 0600      LD      B,00H
15ba 09        ADD     HL,BC
15bb CD6113    CALL    1361H
15be E1        POP     HL
15bf C9        RET     

15c0 1A        LD      A,(DE)
15c1 77        LD      (HL),A
15c2 23        INC     HL
15c3 13        INC     DE
15c4 0B        DEC     BC
15c5 78        LD      A,B
15c6 B1        OR      C
15c7 20F7      JR      NZ,15C0H         ; (-09H)
15c9 C9        RET     

15ca E5        PUSH    HL
15cb 2AF8FB    LD      HL,(0FBF8H)
15ce 23        INC     HL
15cf 7C        LD      A,H
15d0 B5        OR      L
15d1 E1        POP     HL
15d2 C0        RET     NZ

15d3 1E0C      LD      E,0CH
15d5 C37905    JP      0579H
15d8 CF        RST     08H
15d9 C8        RET     Z

15da 3E80      LD      A,80H
15dc 3280FE    LD      (0FE80H),A
15df B6        OR      (HL)
15e0 4F        LD      C,A
15e1 C3D344    JP      44D3H
15e4 FE7E      CP      7EH
15e6 C25F05    JP      NZ,055FH
15e9 23        INC     HL
15ea 7E        LD      A,(HL)
15eb 23        INC     HL
15ec FE83      CP      83H
15ee CA2A44    JP      Z,442AH
15f1 C35F05    JP      055FH
15f4 CD4D18    CALL    184DH
15f7 44        LD      B,H
15f8 4D        LD      C,L
15f9 ED78      IN      A,(C)
15fb C30614    JP      1406H
15fe CD4318    CALL    1843H
1601 D5        PUSH    DE
1602 CF        RST     08H
1603 2C        INC     L
1604 CD3716    CALL    1637H
1607 C1        POP     BC
1608 C9        RET     

1609 CDFE15    CALL    15FEH
160c ED79      OUT     (C),A
160e C9        RET     

160f CDFE15    CALL    15FEH
1612 C5        PUSH    BC
1613 F5        PUSH    AF
1614 1E00      LD      E,00H
1616 2B        DEC     HL
1617 D7        RST     10H
1618 2805      JR      Z,161FH          ; (+05H)
161a CF        RST     08H
161b 2C        INC     L
161c CD3716    CALL    1637H
161f F1        POP     AF
1620 57        LD      D,A
1621 C1        POP     BC
1622 ED78      IN      A,(C)
1624 AB        XOR     E
1625 A2        AND     D
1626 28FA      JR      Z,1622H          ; (-06H)
1628 C9        RET     

1629 D7        RST     10H
162a CD9B10    CALL    109BH
162d E5        PUSH    HL
162e CDA94E    CALL    4EA9H
1631 EB        EX      DE,HL
1632 E1        POP     HL
1633 7A        LD      A,D
1634 B7        OR      A
1635 C9        RET     

1636 D7        RST     10H
1637 CD9B10    CALL    109BH
163a CD2D16    CALL    162DH
163d C2880B    JP      NZ,0B88H
1640 2B        DEC     HL
1641 D7        RST     10H
1642 7B        LD      A,E
1643 C9        RET     

1644 3E01      LD      A,01H
1646 32F1FB    LD      (0FBF1H),A
1649 C1        POP     BC
164a CD6107    CALL    0761H
164d C5        PUSH    BC
164e 21FFFF    LD      HL,0FFFFH
1651 22F8FB    LD      (0FBF8H),HL
1654 E1        POP     HL
1655 D1        POP     DE
1656 4E        LD      C,(HL)
1657 23        INC     HL
1658 46        LD      B,(HL)
1659 23        INC     HL
165a 78        LD      A,B
165b B1        OR      C
165c CA1F06    JP      Z,061FH
165f CD571D    CALL    1D57H
1662 C5        PUSH    BC
1663 4E        LD      C,(HL)
1664 23        INC     HL
1665 46        LD      B,(HL)
1666 23        INC     HL
1667 C5        PUSH    BC
1668 E3        EX      (SP),HL
1669 EB        EX      DE,HL
166a E7        RST     20H
166b C1        POP     BC
166c DA1E06    JP      C,061EH
166f E3        EX      (SP),HL
1670 E5        PUSH    HL
1671 C5        PUSH    BC
1672 EB        EX      DE,HL
1673 2290FE    LD      (0FE90H),HL
1676 CD5654    CALL    5456H
1679 E1        POP     HL
167a 7E        LD      A,(HL)
167b FE09      CP      09H
167d 2805      JR      Z,1684H          ; (+05H)
167f 3E20      LD      A,20H
1681 CD1800    CALL    0018H
1684 CD9B16    CALL    169BH
1687 213EFD    LD      HL,0FD3EH
168a CD9216    CALL    1692H
168d CD7C32    CALL    327CH
1690 18BC      JR      164EH            ; (-44H)
1692 7E        LD      A,(HL)
1693 B7        OR      A
1694 C8        RET     Z

1695 CD0D3D    CALL    3D0DH
1698 23        INC     HL
1699 18F7      JR      1692H            ; (-09H)
169b 013EFD    LD      BC,0FD3EH
169e 16FF      LD      D,0FFH
16a0 AF        XOR     A
16a1 3243FE    LD      (0FE43H),A
16a4 1804      JR      16AAH            ; (+04H)
16a6 03        INC     BC
16a7 23        INC     HL
16a8 15        DEC     D
16a9 C8        RET     Z

16aa 7E        LD      A,(HL)
16ab B7        OR      A
16ac 02        LD      (BC),A
16ad C8        RET     Z

16ae FE0B      CP      0BH
16b0 3825      JR      C,16D7H          ; (+25H)
16b2 FE20      CP      20H
16b4 DA7517    JP      C,1775H
16b7 FE22      CP      22H
16b9 200A      JR      NZ,16C5H         ; (+0aH)
16bb 3A43FE    LD      A,(0FE43H)
16be EE01      XOR     01H
16c0 3243FE    LD      (0FE43H),A
16c3 3E22      LD      A,22H
16c5 FE3A      CP      3AH
16c7 200E      JR      NZ,16D7H         ; (+0eH)
16c9 3A43FE    LD      A,(0FE43H)
16cc 1F        RRA     
16cd 3806      JR      C,16D5H          ; (+06H)
16cf 17        RLA     
16d0 E6FD      AND     0FDH
16d2 3243FE    LD      (0FE43H),A
16d5 3E3A      LD      A,3AH
16d7 B7        OR      A
16d8 F2A616    JP      P,16A6H
16db 3A43FE    LD      A,(0FE43H)
16de 1F        RRA     
16df 382E      JR      C,170FH          ; (+2eH)
16e1 1F        RRA     
16e2 1F        RRA     
16e3 303E      JR      NC,1723H         ; (+3eH)
16e5 7E        LD      A,(HL)
16e6 FED0      CP      0D0H
16e8 E5        PUSH    HL
16e9 C5        PUSH    BC
16ea 210C17    LD      HL,170CH
16ed E5        PUSH    HL
16ee C0        RET     NZ

16ef 0B        DEC     BC
16f0 0A        LD      A,(BC)
16f1 FE4D      CP      4DH
16f3 C0        RET     NZ

16f4 0B        DEC     BC
16f5 0A        LD      A,(BC)
16f6 FE45      CP      45H
16f8 C0        RET     NZ

16f9 0B        DEC     BC
16fa 0A        LD      A,(BC)
16fb FE52      CP      52H
16fd C0        RET     NZ

16fe 0B        DEC     BC
16ff 0A        LD      A,(BC)
1700 FE3A      CP      3AH
1702 C0        RET     NZ

1703 F1        POP     AF
1704 F1        POP     AF
1705 E1        POP     HL
1706 14        INC     D
1707 14        INC     D
1708 14        INC     D
1709 14        INC     D
170a 1825      JR      1731H            ; (+25H)
170c C1        POP     BC
170d E1        POP     HL
170e 7E        LD      A,(HL)
170f C3A616    JP      16A6H
1712 3A43FE    LD      A,(0FE43H)
1715 F602      OR      02H
1717 3243FE    LD      (0FE43H),A
171a AF        XOR     A
171b C9        RET     

171c 3A43FE    LD      A,(0FE43H)
171f F604      OR      04H
1721 18F4      JR      1717H            ; (-0cH)
1723 17        RLA     
1724 38E9      JR      C,170FH          ; (-17H)
1726 7E        LD      A,(HL)
1727 FE84      CP      84H
1729 CC1217    CALL    Z,1712H
172c FE8F      CP      8FH
172e CC1C17    CALL    Z,171CH
1731 7E        LD      A,(HL)
1732 3C        INC     A
1733 7E        LD      A,(HL)
1734 2004      JR      NZ,173AH         ; (+04H)
1736 23        INC     HL
1737 7E        LD      A,(HL)
1738 E67F      AND     7FH
173a 23        INC     HL
173b FE9F      CP      9FH
173d 2002      JR      NZ,1741H         ; (+02H)
173f 0B        DEC     BC
1740 14        INC     D
1741 E5        PUSH    HL
1742 C5        PUSH    BC
1743 D5        PUSH    DE
1744 211602    LD      HL,0216H
1747 47        LD      B,A
1748 0E40      LD      C,40H
174a 0C        INC     C
174b 23        INC     HL
174c 54        LD      D,H
174d 5D        LD      E,L
174e 7E        LD      A,(HL)
174f B7        OR      A
1750 28F8      JR      Z,174AH          ; (-08H)
1752 23        INC     HL
1753 F24E17    JP      P,174EH
1756 7E        LD      A,(HL)
1757 B8        CP      B
1758 20F1      JR      NZ,174BH         ; (-0fH)
175a EB        EX      DE,HL
175b 79        LD      A,C
175c D1        POP     DE
175d C1        POP     BC
175e FE5B      CP      5BH
1760 2002      JR      NZ,1764H         ; (+02H)
1762 7E        LD      A,(HL)
1763 23        INC     HL
1764 5F        LD      E,A
1765 E67F      AND     7FH
1767 02        LD      (BC),A
1768 03        INC     BC
1769 15        DEC     D
176a CA6641    JP      Z,4166H
176d B3        OR      E
176e F26217    JP      P,1762H
1771 E1        POP     HL
1772 C3AA16    JP      16AAH
1775 2B        DEC     HL
1776 D7        RST     10H
1777 D5        PUSH    DE
1778 C5        PUSH    BC
1779 F5        PUSH    AF
177a CD0F0B    CALL    0B0FH
177d F1        POP     AF
177e 019217    LD      BC,1792H
1781 C5        PUSH    BC
1782 FE0B      CP      0BH
1784 CAD358    JP      Z,58D3H
1787 FE0C      CP      0CH
1789 CAD658    JP      Z,58D6H
178c 2A49FE    LD      HL,(0FE49H)
178f C36454    JP      5464H
1792 C1        POP     BC
1793 D1        POP     DE
1794 3A47FE    LD      A,(0FE47H)
1797 1E4F      LD      E,4FH
1799 FE0B      CP      0BH
179b 2806      JR      Z,17A3H          ; (+06H)
179d FE0C      CP      0CH
179f 1E48      LD      E,48H
17a1 200B      JR      NZ,17AEH         ; (+0bH)
17a3 3E26      LD      A,26H
17a5 02        LD      (BC),A
17a6 03        INC     BC
17a7 15        DEC     D
17a8 C8        RET     Z

17a9 7B        LD      A,E
17aa 02        LD      (BC),A
17ab 03        INC     BC
17ac 15        DEC     D
17ad C8        RET     Z

17ae 3A48FE    LD      A,(0FE48H)
17b1 FE04      CP      04H
17b3 1E00      LD      E,00H
17b5 3806      JR      C,17BDH          ; (+06H)
17b7 1E21      LD      E,21H
17b9 2802      JR      Z,17BDH          ; (+02H)
17bb 1E23      LD      E,23H
17bd 7E        LD      A,(HL)
17be FE20      CP      20H
17c0 CCFB4D    CALL    Z,4DFBH
17c3 7E        LD      A,(HL)
17c4 23        INC     HL
17c5 B7        OR      A
17c6 2820      JR      Z,17E8H          ; (+20H)
17c8 02        LD      (BC),A
17c9 03        INC     BC
17ca 15        DEC     D
17cb C8        RET     Z

17cc 3A48FE    LD      A,(0FE48H)
17cf FE04      CP      04H
17d1 38F0      JR      C,17C3H          ; (-10H)
17d3 0B        DEC     BC
17d4 0A        LD      A,(BC)
17d5 03        INC     BC
17d6 2004      JR      NZ,17DCH         ; (+04H)
17d8 FE2E      CP      2EH
17da 2808      JR      Z,17E4H          ; (+08H)
17dc FE44      CP      44H
17de 2804      JR      Z,17E4H          ; (+04H)
17e0 FE45      CP      45H
17e2 20DF      JR      NZ,17C3H         ; (-21H)
17e4 1E00      LD      E,00H
17e6 18DB      JR      17C3H            ; (-25H)
17e8 7B        LD      A,E
17e9 B7        OR      A
17ea 2804      JR      Z,17F0H          ; (+04H)
17ec 02        LD      (BC),A
17ed 03        INC     BC
17ee 15        DEC     D
17ef C8        RET     Z

17f0 2A45FE    LD      HL,(0FE45H)
17f3 C3AA16    JP      16AAH
17f6 C9        RET     

17f7 F5        PUSH    AF
17f8 D370      OUT     (70H),A
17fa 3AC268    LD      A,(68C2H)
17fd FED8      CP      0D8H
17ff 2007      JR      NZ,1808H         ; (+07H)
1801 F1        POP     AF
1802 CD50D4    CALL    0D450H
1805 C38132    JP      3281H
1808 F1        POP     AF
1809 3E0D      LD      A,0DH
180b CD1800    CALL    0018H
180e C38132    JP      3281H
1811 00        NOP     
1812 00        NOP     
1813 00        NOP     
1814 00        NOP     
1815 00        NOP     
1816 00        NOP     
1817 07        RLCA    
1818 E3        EX      (SP),HL
1819 EB        EX      DE,HL
181a 2A9DFE    LD      HL,(0FE9DH)
181d 1A        LD      A,(DE)
181e 02        LD      (BC),A
181f 03        INC     BC
1820 13        INC     DE
1821 E7        RST     20H
1822 20F9      JR      NZ,181DH         ; (-07H)
1824 60        LD      H,B
1825 69        LD      L,C
1826 229DFE    LD      (0FE9DH),HL
1829 229FFE    LD      (0FE9FH),HL
182c 22A1FE    LD      (0FEA1H),HL
182f C9        RET     

1830 CD4D18    CALL    184DH
1833 7E        LD      A,(HL)
1834 C30614    JP      1406H
1837 CD4318    CALL    1843H
183a D5        PUSH    DE
183b CF        RST     08H
183c 2C        INC     L
183d CD3716    CALL    1637H
1840 D1        POP     DE
1841 12        LD      (DE),A
1842 C9        RET     

1843 CD9B10    CALL    109BH
1846 E5        PUSH    HL
1847 CD4D18    CALL    184DH
184a EB        EX      DE,HL
184b E1        POP     HL
184c C9        RET     

184d 01A94E    LD      BC,4EA9H
1850 C5        PUSH    BC
1851 F7        RST     30H
1852 F8        RET     M

1853 3AAAFF    LD      A,(0FFAAH)
1856 FE90      CP      90H
1858 C0        RET     NZ

1859 EF        RST     28H
185a F8        RET     M

185b CDDB4E    CALL    4EDBH
185e 018091    LD      BC,9180H
1861 110000    LD      DE,0000H
1864 C3FB4A    JP      4AFBH
1867 010A00    LD      BC,000AH
186a C5        PUSH    BC
186b 50        LD      D,B
186c 58        LD      E,B
186d 2826      JR      Z,1895H          ; (+26H)
186f FE2C      CP      2CH
1871 2809      JR      Z,187CH          ; (+09H)
1873 D5        PUSH    DE
1874 CD8D0B    CALL    0B8DH
1877 42        LD      B,D
1878 4B        LD      C,E
1879 D1        POP     DE
187a 2819      JR      Z,1895H          ; (+19H)
187c CF        RST     08H
187d 2C        INC     L
187e CD8D0B    CALL    0B8DH
1881 2812      JR      Z,1895H          ; (+12H)
1883 F1        POP     AF
1884 CF        RST     08H
1885 2C        INC     L
1886 D5        PUSH    DE
1887 CD970B    CALL    0B97H
188a C25F05    JP      NZ,055FH
188d 7A        LD      A,D
188e B3        OR      E
188f CA880B    JP      Z,0B88H
1892 EB        EX      DE,HL
1893 E3        EX      (SP),HL
1894 EB        EX      DE,HL
1895 C5        PUSH    BC
1896 CD7D07    CALL    077DH
1899 D1        POP     DE
189a D5        PUSH    DE
189b C5        PUSH    BC
189c CD7D07    CALL    077DH
189f 60        LD      H,B
18a0 69        LD      L,C
18a1 D1        POP     DE
18a2 E7        RST     20H
18a3 EB        EX      DE,HL
18a4 DA880B    JP      C,0B88H
18a7 D1        POP     DE
18a8 C1        POP     BC
18a9 F1        POP     AF
18aa E5        PUSH    HL
18ab D5        PUSH    DE
18ac 180E      JR      18BCH            ; (+0eH)
18ae 09        ADD     HL,BC
18af DA880B    JP      C,0B88H
18b2 EB        EX      DE,HL
18b3 E5        PUSH    HL
18b4 21F9FF    LD      HL,0FFF9H
18b7 E7        RST     20H
18b8 E1        POP     HL
18b9 DA880B    JP      C,0B88H
18bc D5        PUSH    DE
18bd 5E        LD      E,(HL)
18be 23        INC     HL
18bf 56        LD      D,(HL)
18c0 7A        LD      A,D
18c1 B3        OR      E
18c2 EB        EX      DE,HL
18c3 D1        POP     DE
18c4 2807      JR      Z,18CDH          ; (+07H)
18c6 7E        LD      A,(HL)
18c7 23        INC     HL
18c8 B6        OR      (HL)
18c9 2B        DEC     HL
18ca EB        EX      DE,HL
18cb 20E1      JR      NZ,18AEH         ; (-1fH)
18cd C5        PUSH    BC
18ce CDEE18    CALL    18EEH
18d1 C1        POP     BC
18d2 D1        POP     DE
18d3 E1        POP     HL
18d4 D5        PUSH    DE
18d5 5E        LD      E,(HL)
18d6 23        INC     HL
18d7 56        LD      D,(HL)
18d8 7A        LD      A,D
18d9 B3        OR      E
18da 280D      JR      Z,18E9H          ; (+0dH)
18dc EB        EX      DE,HL
18dd E3        EX      (SP),HL
18de EB        EX      DE,HL
18df 23        INC     HL
18e0 73        LD      (HL),E
18e1 23        INC     HL
18e2 72        LD      (HL),D
18e3 EB        EX      DE,HL
18e4 09        ADD     HL,BC
18e5 EB        EX      DE,HL
18e6 E1        POP     HL
18e7 18EB      JR      18D4H            ; (-15H)
18e9 011E06    LD      BC,061EH
18ec C5        PUSH    BC
18ed FEF6      CP      0F6H
18ef AF        XOR     A
18f0 3284FE    LD      (0FE84H),A
18f3 2AFAFB    LD      HL,(0FBFAH)
18f6 2B        DEC     HL
18f7 23        INC     HL
18f8 7E        LD      A,(HL)
18f9 23        INC     HL
18fa B6        OR      (HL)
18fb C8        RET     Z

18fc 23        INC     HL
18fd 5E        LD      E,(HL)
18fe 23        INC     HL
18ff 56        LD      D,(HL)
1900 D7        RST     10H
1901 B7        OR      A
1902 28F3      JR      Z,18F7H          ; (-0dH)
1904 4F        LD      C,A
1905 3A84FE    LD      A,(0FE84H)
1908 B7        OR      A
1909 79        LD      A,C
190a 2853      JR      Z,195FH          ; (+53H)
190c FEA4      CP      0A4H
190e 2014      JR      NZ,1924H         ; (+14H)
1910 D7        RST     10H
1911 FE89      CP      89H
1913 20EC      JR      NZ,1901H         ; (-14H)
1915 D7        RST     10H
1916 FE0E      CP      0EH
1918 20E7      JR      NZ,1901H         ; (-19H)
191a D5        PUSH    DE
191b CD9F0B    CALL    0B9FH
191e 7A        LD      A,D
191f B3        OR      E
1920 200A      JR      NZ,192CH         ; (+0aH)
1922 1827      JR      194BH            ; (+27H)
1924 FE0E      CP      0EH
1926 20D8      JR      NZ,1900H         ; (-28H)
1928 D5        PUSH    DE
1929 CD9F0B    CALL    0B9FH
192c E5        PUSH    HL
192d CD7D07    CALL    077DH
1930 0B        DEC     BC
1931 3E0D      LD      A,0DH
1933 383C      JR      C,1971H          ; (+3cH)
1935 CD7032    CALL    3270H
1938 214F19    LD      HL,194FH
193b D5        PUSH    DE
193c CD3541    CALL    4135H
193f E1        POP     HL
1940 CD5654    CALL    5456H
1943 C1        POP     BC
1944 E1        POP     HL
1945 E5        PUSH    HL
1946 C5        PUSH    BC
1947 CD4E54    CALL    544EH
194a E1        POP     HL
194b D1        POP     DE
194c 2B        DEC     HL
194d 18B1      JR      1900H            ; (-4fH)
194f 55        LD      D,L
1950 6E        LD      L,(HL)
1951 64        LD      H,H
1952 65        LD      H,L
1953 66        LD      H,(HL)
1954 69        LD      L,C
1955 6E        LD      L,(HL)
1956 65        LD      H,L
1957 64        LD      H,H
1958 206C      JR      NZ,19C6H         ; (+6cH)
195a 69        LD      L,C
195b 6E        LD      L,(HL)
195c 65        LD      H,L
195d 2000      JR      NZ,195FH         ; (+00H)
195f FE0D      CP      0DH
1961 20EA      JR      NZ,194DH         ; (-16H)
1963 D5        PUSH    DE
1964 CD9F0B    CALL    0B9FH
1967 E5        PUSH    HL
1968 EB        EX      DE,HL
1969 23        INC     HL
196a 23        INC     HL
196b 23        INC     HL
196c 4E        LD      C,(HL)
196d 23        INC     HL
196e 46        LD      B,(HL)
196f 3E0E      LD      A,0EH
1971 214A19    LD      HL,194AH
1974 E5        PUSH    HL
1975 2A45FE    LD      HL,(0FE45H)
1978 E5        PUSH    HL
1979 2B        DEC     HL
197a 70        LD      (HL),B
197b 2B        DEC     HL
197c 71        LD      (HL),C
197d 2B        DEC     HL
197e 77        LD      (HL),A
197f E1        POP     HL
1980 C9        RET     

1981 3A84FE    LD      A,(0FE84H)
1984 B7        OR      A
1985 C8        RET     Z

1986 C3EF18    JP      18EFH
1989 F3        DI      
198a 3100E0    LD      SP,0E000H
198d ED56      IM      1
198f D371      OUT     (71H),A
1991 D360      OUT     (60H),A
1993 210078    LD      HL,7800H
1996 1100E0    LD      DE,0E000H
1999 010008    LD      BC,0800H
199c D5        PUSH    DE
199d E5        PUSH    HL
199e C5        PUSH    BC
199f EDB0      LDIR    
19a1 C1        POP     BC
19a2 D1        POP     DE
19a3 E1        POP     HL
19a4 D371      OUT     (71H),A
19a6 D361      OUT     (61H),A
19a8 EDB0      LDIR    
19aa D370      OUT     (70H),A
19ac 2100FA    LD      HL,0FA00H
19af 1101FA    LD      DE,0FA01H
19b2 01A201    LD      BC,01A2H
19b5 3600      LD      (HL),00H
19b7 EDB0      LDIR    
19b9 210080    LD      HL,8000H
19bc 7E        LD      A,(HL)
19bd 2F        CPL     
19be 77        LD      (HL),A
19bf BE        CP      (HL)
19c0 210080    LD      HL,8000H
19c3 2803      JR      Z,19C8H          ; (+03H)
19c5 2100C4    LD      HL,0C400H
19c8 2200C4    LD      (0C400H),HL
19cb 013D03    LD      BC,033DH
19ce 09        ADD     HL,BC
19cf 22EEFA    LD      (0FAEEH),HL
19d2 22FAFB    LD      (0FBFAH),HL
19d5 54        LD      D,H
19d6 5D        LD      E,L
19d7 1B        DEC     DE
19d8 013D03    LD      BC,033DH
19db 3600      LD      (HL),00H
19dd EDB8      LDDR    
19df 1100FA    LD      DE,0FA00H
19e2 21475F    LD      HL,5F47H
19e5 017100    LD      BC,0071H
19e8 EDB0      LDIR    
19ea 21F0FA    LD      HL,0FAF0H
19ed 0611      LD      B,11H
19ef 36C9      LD      (HL),0C9H
19f1 23        INC     HL
19f2 23        INC     HL
19f3 23        INC     HL
19f4 10F9      DJNZ    19EFH            ; (-07H)
19f6 210000    LD      HL,0000H
19f9 22B0C6    LD      (0C6B0H),HL
19fc CD1E29    CALL    291EH
19ff DBB0      IN      A,(0B0H)
1a01 D333      OUT     (33H),A
1a03 C3DF3C    JP      3CDFH
1a06 CD161E    CALL    1E16H
1a09 CD5628    CALL    2856H
1a0c CD9A1D    CALL    1D9AH
1a0f CDB729    CALL    29B7H
1a12 C33E00    JP      003EH
1a15 211BFA    LD      HL,0FA1BH
1a18 35        DEC     (HL)
1a19 C0        RET     NZ

1a1a 3605      LD      (HL),05H
1a1c CD651A    CALL    1A65H
1a1f 2831      JR      Z,1A52H          ; (+31H)
1a21 381D      JR      C,1A40H          ; (+1dH)
1a23 211CFA    LD      HL,0FA1CH
1a26 35        DEC     (HL)
1a27 C0        RET     NZ

1a28 3EFF      LD      A,0FFH
1a2a 3274FA    LD      (0FA74H),A
1a2d ED4B77FA  LD      BC,(0FA77H)
1a31 78        LD      A,B
1a32 0600      LD      B,00H
1a34 210BFA    LD      HL,0FA0BH
1a37 09        ADD     HL,BC
1a38 B6        OR      (HL)
1a39 77        LD      (HL),A
1a3a 211CFA    LD      HL,0FA1CH
1a3d 3601      LD      (HL),01H
1a3f C9        RET     

1a40 2175FA    LD      HL,0FA75H
1a43 7E        LD      A,(HL)
1a44 23        INC     HL
1a45 BE        CP      (HL)
1a46 C8        RET     Z

1a47 77        LD      (HL),A
1a48 AF        XOR     A
1a49 3274FA    LD      (0FA74H),A
1a4c 3E32      LD      A,32H
1a4e 321CFA    LD      (0FA1CH),A
1a51 C9        RET     

1a52 3EFF      LD      A,0FFH
1a54 3275FA    LD      (0FA75H),A
1a57 CD4C1A    CALL    1A4CH
1a5a 2174FA    LD      HL,0FA74H
1a5d 7E        LD      A,(HL)
1a5e 3600      LD      (HL),00H
1a60 A7        AND     A
1a61 C8        RET     Z

1a62 C39A1D    JP      1D9AH
1a65 DB00      IN      A,(00H)
1a67 2F        CPL     
1a68 E6F0      AND     0F0H
1a6a 217AFA    LD      HL,0FA7AH
1a6d 77        LD      (HL),A
1a6e 3A74FA    LD      A,(0FA74H)
1a71 A7        AND     A
1a72 2817      JR      Z,1A8BH          ; (+17H)
1a74 3A79FA    LD      A,(0FA79H)
1a77 BE        CP      (HL)
1a78 2811      JR      Z,1A8BH          ; (+11H)
1a7a ED4B77FA  LD      BC,(0FA77H)
1a7e 78        LD      A,B
1a7f 0600      LD      B,00H
1a81 210BFA    LD      HL,0FA0BH
1a84 09        ADD     HL,BC
1a85 AE        XOR     (HL)
1a86 77        LD      (HL),A
1a87 AF        XOR     A
1a88 3278FA    LD      (0FA78H),A
1a8b 211AFA    LD      HL,0FA1AH
1a8e 0E0F      LD      C,0FH
1a90 06FF      LD      B,0FFH
1a92 ED78      IN      A,(C)
1a94 F6F0      OR      0F0H
1a96 57        LD      D,A
1a97 A0        AND     B
1a98 47        LD      B,A
1a99 7E        LD      A,(HL)
1a9a B2        OR      D
1a9b AA        XOR     D
1a9c 72        LD      (HL),D
1a9d 2B        DEC     HL
1a9e 2006      JR      NZ,1AA6H         ; (+06H)
1aa0 0D        DEC     C
1aa1 F2921A    JP      P,1A92H
1aa4 04        INC     B
1aa5 C9        RET     

1aa6 47        LD      B,A
1aa7 3A7AFA    LD      A,(0FA7AH)
1aaa 3279FA    LD      (0FA79H),A
1aad 11FA1B    LD      DE,1BFAH
1ab0 CB6F      BIT     5,A
1ab2 2011      JR      NZ,1AC5H         ; (+11H)
1ab4 113A1C    LD      DE,1C3AH
1ab7 CB77      BIT     6,A
1ab9 200A      JR      NZ,1AC5H         ; (+0aH)
1abb 11FA1B    LD      DE,1BFAH
1abe 00        NOP     
1abf 00        NOP     
1ac0 00        NOP     
1ac1 00        NOP     
1ac2 00        NOP     
1ac3 00        NOP     
1ac4 00        NOP     
1ac5 3E10      LD      A,10H
1ac7 91        SUB     C
1ac8 6F        LD      L,A
1ac9 2600      LD      H,00H
1acb 29        ADD     HL,HL
1acc 29        ADD     HL,HL
1acd 2B        DEC     HL
1ace 19        ADD     HL,DE
1acf 3E80      LD      A,80H
1ad1 07        RLCA    
1ad2 CB38      SRL     B
1ad4 DCE21A    CALL    C,1AE2H
1ad7 2B        DEC     HL
1ad8 20F7      JR      NZ,1AD1H         ; (-09H)
1ada 47        LD      B,A
1adb ED4377FA  LD      (0FA77H),BC
1adf A7        AND     A
1ae0 37        SCF     
1ae1 C9        RET     

1ae2 C5        PUSH    BC
1ae3 E5        PUSH    HL
1ae4 F5        PUSH    AF
1ae5 C3290D    JP      0D29H
1ae8 2805      JR      Z,1AEFH          ; (+05H)
1aea 41        LD      B,C
1aeb 4F        LD      C,A
1aec CDF31A    CALL    1AF3H
1aef F1        POP     AF
1af0 E1        POP     HL
1af1 C1        POP     BC
1af2 C9        RET     

1af3 CD871B    CALL    1B87H
1af6 3A7AFA    LD      A,(0FA7AH)
1af9 CB6F      BIT     5,A
1afb 2011      JR      NZ,1B0EH         ; (+11H)
1afd CB77      BIT     6,A
1aff 2017      JR      NZ,1B18H         ; (+17H)
1b01 79        LD      A,C
1b02 FE41      CP      41H
1b04 3812      JR      C,1B18H          ; (+12H)
1b06 FE5B      CP      5BH
1b08 300E      JR      NC,1B18H         ; (+0eH)
1b0a C620      ADD     A,20H
1b0c 1809      JR      1B17H            ; (+09H)
1b0e 79        LD      A,C
1b0f D640      SUB     40H
1b11 3805      JR      C,1B18H          ; (+05H)
1b13 FE20      CP      20H
1b15 3001      JR      NC,1B18H         ; (+01H)
1b17 4F        LD      C,A
1b18 79        LD      A,C
1b19 FEFF      CP      0FFH
1b1b 202A      JR      NZ,1B47H         ; (+2aH)
1b1d 011A1C    LD      BC,1C1AH
1b20 1121FA    LD      DE,0FA21H
1b23 3A7AFA    LD      A,(0FA7AH)
1b26 E640      AND     40H
1b28 2807      JR      Z,1B31H          ; (+07H)
1b2a 11C1FF    LD      DE,0FFC1H
1b2d 19        ADD     HL,DE
1b2e 1149FA    LD      DE,0FA49H
1b31 ED42      SBC     HL,BC
1b33 29        ADD     HL,HL
1b34 29        ADD     HL,HL
1b35 29        ADD     HL,HL
1b36 19        ADD     HL,DE
1b37 0608      LD      B,08H
1b39 7E        LD      A,(HL)
1b3a A7        AND     A
1b3b C8        RET     Z

1b3c E5        PUSH    HL
1b3d C5        PUSH    BC
1b3e CDDB5F    CALL    5FDBH
1b41 C1        POP     BC
1b42 E1        POP     HL
1b43 23        INC     HL
1b44 10F3      DJNZ    1B39H            ; (-0dH)
1b46 C9        RET     

1b47 FE01      CP      01H
1b49 200F      JR      NZ,1B5AH         ; (+0fH)
1b4b 2AF8FB    LD      HL,(0FBF8H)
1b4e 23        INC     HL
1b4f 7C        LD      A,H
1b50 B5        OR      L
1b51 3E03      LD      A,03H
1b53 2020      JR      NZ,1B75H         ; (+20H)
1b55 21B85F    LD      HL,5FB8H
1b58 18DD      JR      1B37H            ; (-23H)
1b5a 3A7AFA    LD      A,(0FA7AH)
1b5d E610      AND     10H
1b5f 2813      JR      Z,1B74H          ; (+13H)
1b61 79        LD      A,C
1b62 FE41      CP      41H
1b64 380E      JR      C,1B74H          ; (+0eH)
1b66 E69F      AND     9FH
1b68 FA741B    JP      M,1B74H
1b6b FE1B      CP      1BH
1b6d 3005      JR      NC,1B74H         ; (+05H)
1b6f 79        LD      A,C
1b70 EE20      XOR     20H
1b72 1801      JR      1B75H            ; (+01H)
1b74 79        LD      A,C
1b75 C3D05F    JP      5FD0H
1b78 FE03      CP      03H
1b7a CC971D    CALL    Z,1D97H
1b7d FE1B      CP      1BH
1b7f CC971D    CALL    Z,1D97H
1b82 5F        LD      E,A
1b83 AF        XOR     A
1b84 C39B36    JP      369BH
1b87 C5        PUSH    BC
1b88 D5        PUSH    DE
1b89 E5        PUSH    HL
1b8a F5        PUSH    AF
1b8b 3A01FA    LD      A,(0FA01H)
1b8e B7        OR      A
1b8f 281A      JR      Z,1BABH          ; (+1aH)
1b91 3E07      LD      A,07H
1b93 1E37      LD      E,37H
1b95 CDC229    CALL    29C2H
1b98 6A        LD      L,D
1b99 3C        INC     A
1b9a 1E0F      LD      E,0FH
1b9c CDC229    CALL    29C2H
1b9f 62        LD      H,D
1ba0 5D        LD      E,L
1ba1 3E07      LD      A,07H
1ba3 CDC929    CALL    29C9H
1ba6 5C        LD      E,H
1ba7 3C        INC     A
1ba8 CDC929    CALL    29C9H
1bab C3521D    JP      1D52H
1bae C5        PUSH    BC
1baf D5        PUSH    DE
1bb0 97        SUB     A
1bb1 4F        LD      C,A
1bb2 DB00      IN      A,(00H)
1bb4 2F        CPL     
1bb5 E640      AND     40H
1bb7 2801      JR      Z,1BBAH          ; (+01H)
1bb9 0C        INC     C
1bba DB06      IN      A,(06H)
1bbc 2F        CPL     
1bbd E602      AND     02H
1bbf 2802      JR      Z,1BC3H          ; (+02H)
1bc1 CBC9      SET     1,C
1bc3 DB02      IN      A,(02H)
1bc5 2F        CPL     
1bc6 57        LD      D,A
1bc7 E609      AND     09H
1bc9 5F        LD      E,A
1bca 7A        LD      A,D
1bcb E604      AND     04H
1bcd 0F        RRCA    
1bce B3        OR      E
1bcf 5F        LD      E,A
1bd0 7A        LD      A,D
1bd1 E602      AND     02H
1bd3 07        RLCA    
1bd4 B3        OR      E
1bd5 07        RLCA    
1bd6 07        RLCA    
1bd7 B1        OR      C
1bd8 4F        LD      C,A
1bd9 DB06      IN      A,(06H)
1bdb 2F        CPL     
1bdc E604      AND     04H
1bde 2802      JR      Z,1BE2H          ; (+02H)
1be0 CBF9      SET     7,C
1be2 79        LD      A,C
1be3 D1        POP     DE
1be4 C1        POP     BC
1be5 C9        RET     

1be6 7C        LD      A,H
1be7 D602      SUB     02H
1be9 67        LD      H,A
1bea C9        RET     

1beb 3AB1C6    LD      A,(0C6B1H)
1bee 1801      JR      1BF1H            ; (+01H)
1bf0 7C        LD      A,H
1bf1 E620      AND     20H
1bf3 2802      JR      Z,1BF7H          ; (+02H)
1bf5 3E16      LD      A,16H
1bf7 84        ADD     A,H
1bf8 67        LD      H,A
1bf9 C9        RET     

1bfa 51        LD      D,C
1bfb 57        LD      D,A
1bfc 45        LD      B,L
1bfd 52        LD      D,D
1bfe 54        LD      D,H
1bff 59        LD      E,C
1c00 55        LD      D,L
1c01 49        LD      C,C
1c02 41        LD      B,C
1c03 53        LD      D,E
1c04 44        LD      B,H
1c05 46        LD      B,(HL)
1c06 47        LD      B,A
1c07 48        LD      C,B
1c08 4A        LD      C,D
1c09 4B        LD      C,E
1c0a 5A        LD      E,D
1c0b 58        LD      E,B
1c0c 43        LD      B,E
1c0d 56        LD      D,(HL)
1c0e 42        LD      B,D
1c0f 4E        LD      C,(HL)
1c10 4D        LD      C,L
1c11 4C        LD      C,H
1c12 0C        INC     C
1c13 12        LD      (DE),A
1c14 7F        LD      A,A
1c15 1B        DEC     DE
1c16 2D        DEC     L
1c17 2F        CPL     
1c18 2E2C      LD      L,2CH
1c1a FF        RST     38H
1c1b FF        RST     38H
1c1c FF        RST     38H
1c1d FF        RST     38H
1c1e FF        RST     38H
1c1f 2001      JR      NZ,1C22H         ; (+01H)
1c21 3031      JR      NC,1C54H         ; (+31H)
1c23 323334    LD      (3433H),A
1c26 35        DEC     (HL)
1c27 3637      LD      (HL),37H
1c29 3839      JR      C,1C64H          ; (+39H)
1c2b 3B        DEC     SP
1c2c 27        DAA     
1c2d 09        ADD     HL,BC
1c2e 1D        DEC     E
1c2f 1F        RRA     
1c30 1C        INC     E
1c31 1E5C      LD      E,5CH
1c33 08        EX      AF,AF'
1c34 3D        DEC     A
1c35 0D        DEC     C
1c36 5B        LD      E,E
1c37 5D        LD      E,L
1c38 50        LD      D,B
1c39 4F        LD      C,A
1c3a 51        LD      D,C
1c3b 57        LD      D,A
1c3c 45        LD      B,L
1c3d 52        LD      D,D
1c3e 54        LD      D,H
1c3f 59        LD      E,C
1c40 55        LD      D,L
1c41 49        LD      C,C
1c42 41        LD      B,C
1c43 53        LD      D,E
1c44 44        LD      B,H
1c45 46        LD      B,(HL)
1c46 47        LD      B,A
1c47 48        LD      C,B
1c48 4A        LD      C,D
1c49 4B        LD      C,E
1c4a 5A        LD      E,D
1c4b 58        LD      E,B
1c4c 43        LD      B,E
1c4d 56        LD      D,(HL)
1c4e 42        LD      B,D
1c4f 4E        LD      C,(HL)
1c50 4D        LD      C,L
1c51 4C        LD      C,H
1c52 0B        DEC     BC
1c53 12        LD      (DE),A
1c54 7F        LD      A,A
1c55 1B        DEC     DE
1c56 5F        LD      E,A
1c57 3F        CCF     
1c58 3E3C      LD      A,3CH
1c5a FF        RST     38H
1c5b FF        RST     38H
1c5c FF        RST     38H
1c5d FF        RST     38H
1c5e FF        RST     38H
1c5f 2001      JR      NZ,1C62H         ; (+01H)
1c61 29        ADD     HL,HL
1c62 214023    LD      HL,2340H
1c65 24        INC     H
1c66 5E        LD      E,(HL)
1c67 2625      LD      H,25H
1c69 2A283A    LD      HL,(3A28H)
1c6c 22091D    LD      (1D09H),HL
1c6f 1F        RRA     
1c70 1C        INC     E
1c71 1E7C      LD      E,7CH
1c73 08        EX      AF,AF'
1c74 2B        DEC     HL
1c75 0D        DEC     C
1c76 7B        LD      A,E
1c77 7D        LD      A,L
1c78 50        LD      D,B
1c79 4F        LD      C,A
1c7a 80        ADD     A,B
1c7b 81        ADD     A,C
1c7c 82        ADD     A,D
1c7d 83        ADD     A,E
1c7e 84        ADD     A,H
1c7f 85        ADD     A,L
1c80 86        ADD     A,(HL)
1c81 87        ADD     A,A
1c82 88        ADC     A,B
1c83 89        ADC     A,C
1c84 8A        ADC     A,D
1c85 8B        ADC     A,E
1c86 8C        ADC     A,H
1c87 8D        ADC     A,L
1c88 8E        ADC     A,(HL)
1c89 8F        ADC     A,A
1c8a 90        SUB     B
1c8b 91        SUB     C
1c8c 92        SUB     D
1c8d 93        SUB     E
1c8e 94        SUB     H
1c8f 95        SUB     L
1c90 96        SUB     (HL)
1c91 97        SUB     A
1c92 98        SBC     A,B
1c93 99        SBC     A,C
1c94 9A        SBC     A,D
1c95 9B        SBC     A,E
1c96 9C        SBC     A,H
1c97 9D        SBC     A,L
1c98 9E        SBC     A,(HL)
1c99 9F        SBC     A,A
1c9a A0        AND     B
1c9b A1        AND     C
1c9c A2        AND     D
1c9d A3        AND     E
1c9e A4        AND     H
1c9f A5        AND     L
1ca0 A6        AND     (HL)
1ca1 A7        AND     A
1ca2 A8        XOR     B
1ca3 A9        XOR     C
1ca4 AA        XOR     D
1ca5 AB        XOR     E
1ca6 AC        XOR     H
1ca7 AD        XOR     L
1ca8 AE        XOR     (HL)
1ca9 AF        XOR     A
1caa B0        OR      B
1cab B1        OR      C
1cac B2        OR      D
1cad B3        OR      E
1cae B4        OR      H
1caf B5        OR      L
1cb0 B6        OR      (HL)
1cb1 B7        OR      A
1cb2 B8        CP      B
1cb3 B9        CP      C
1cb4 BA        CP      D
1cb5 BB        CP      E
1cb6 BC        CP      H
1cb7 BD        CP      L
1cb8 BE        CP      (HL)
1cb9 BF        CP      A
1cba C5        PUSH    BC
1cbb F5        PUSH    AF
1cbc D5        PUSH    DE
1cbd E5        PUSH    HL
1cbe DBB8      IN      A,(0B8H)
1cc0 E602      AND     02H
1cc2 200C      JR      NZ,1CD0H         ; (+0cH)
1cc4 CD151A    CALL    1A15H
1cc7 CDF11C    CALL    1CF1H
1cca E1        POP     HL
1ccb D1        POP     DE
1ccc F1        POP     AF
1ccd C1        POP     BC
1cce FB        EI      
1ccf C9        RET     

1cd0 3E17      LD      A,17H
1cd2 D3B8      OUT     (0B8H),A
1cd4 DBB0      IN      A,(0B0H)
1cd6 5F        LD      E,A
1cd7 3E01      LD      A,01H
1cd9 CD9B36    CALL    369BH
1cdc CDE11C    CALL    1CE1H
1cdf 18E9      JR      1CCAH            ; (-17H)
1ce1 3E01      LD      A,01H
1ce3 CDF136    CALL    36F1H
1ce6 FE02      CP      02H
1ce8 3E37      LD      A,37H
1cea 3002      JR      NC,1CEEH         ; (+02H)
1cec 3E17      LD      A,17H
1cee D3B8      OUT     (0B8H),A
1cf0 C9        RET     

1cf1 3AAFFA    LD      A,(0FAAFH)
1cf4 0603      LD      B,03H
1cf6 4F        LD      C,A
1cf7 CB19      RR      C
1cf9 78        LD      A,B
1cfa C5        PUSH    BC
1cfb DCF529    CALL    C,29F5H
1cfe C1        POP     BC
1cff 10F6      DJNZ    1CF7H            ; (-0aH)
1d01 C9        RET     

1d02 C5        PUSH    BC
1d03 D5        PUSH    DE
1d04 E5        PUSH    HL
1d05 AF        XOR     A
1d06 CD0037    CALL    3700H
1d09 2848      JR      Z,1D53H          ; (+48H)
1d0b AF        XOR     A
1d0c F3        DI      
1d0d CDB836    CALL    36B8H
1d10 FB        EI      
1d11 1840      JR      1D53H            ; (+40H)
1d13 C5        PUSH    BC
1d14 D5        PUSH    DE
1d15 E5        PUSH    HL
1d16 CDBD1E    CALL    1EBDH
1d19 01DC05    LD      BC,05DCH
1d1c C5        PUSH    BC
1d1d CD1E20    CALL    201EH
1d20 C1        POP     BC
1d21 CD021D    CALL    1D02H
1d24 200A      JR      NZ,1D30H         ; (+0aH)
1d26 0B        DEC     BC
1d27 78        LD      A,B
1d28 B1        OR      C
1d29 20F6      JR      NZ,1D21H         ; (-0aH)
1d2b CDD11E    CALL    1ED1H
1d2e 18E9      JR      1D19H            ; (-17H)
1d30 CDC71E    CALL    1EC7H
1d33 FE10      CP      10H
1d35 2017      JR      NZ,1D4EH         ; (+17H)
1d37 3A92C6    LD      A,(0C692H)
1d3a 3D        DEC     A
1d3b 28DC      JR      Z,1D19H          ; (-24H)
1d3d 3A96C6    LD      A,(0C696H)
1d40 B7        OR      A
1d41 2802      JR      Z,1D45H          ; (+02H)
1d43 3EFF      LD      A,0FFH
1d45 3C        INC     A
1d46 CD9721    CALL    2197H
1d49 CD6421    CALL    2164H
1d4c 18CB      JR      1D19H            ; (-35H)
1d4e F5        PUSH    AF
1d4f CDE420    CALL    20E4H
1d52 F1        POP     AF
1d53 E1        POP     HL
1d54 D1        POP     DE
1d55 C1        POP     BC
1d56 C9        RET     

1d57 CDAE1B    CALL    1BAEH
1d5a E602      AND     02H
1d5c 2012      JR      NZ,1D70H         ; (+12H)
1d5e 3AD7FA    LD      A,(0FAD7H)
1d61 B7        OR      A
1d62 C8        RET     Z

1d63 AF        XOR     A
1d64 32D7FA    LD      (0FAD7H),A
1d67 CD021D    CALL    1D02H
1d6a 28F7      JR      Z,1D63H          ; (-09H)
1d6c FE03      CP      03H
1d6e 2010      JR      NZ,1D80H         ; (+10H)
1d70 3A23FB    LD      A,(0FB23H)
1d73 B7        OR      A
1d74 C2485C    JP      NZ,5C48H
1d77 CDD129    CALL    29D1H
1d7a CD5628    CALL    2856H
1d7d C3FC5F    JP      5FFCH
1d80 FE1B      CP      1BH
1d82 C0        RET     NZ

1d83 AF        XOR     A
1d84 32D7FA    LD      (0FAD7H),A
1d87 CD021D    CALL    1D02H
1d8a FE03      CP      03H
1d8c 28E2      JR      Z,1D70H          ; (-1eH)
1d8e FE1B      CP      1BH
1d90 20F1      JR      NZ,1D83H         ; (-0fH)
1d92 AF        XOR     A
1d93 32D7FA    LD      (0FAD7H),A
1d96 C9        RET     

1d97 32D7FA    LD      (0FAD7H),A
1d9a D5        PUSH    DE
1d9b C5        PUSH    BC
1d9c F5        PUSH    AF
1d9d 1123C4    LD      DE,0C423H
1da0 AF        XOR     A
1da1 063F      LD      B,3FH
1da3 CDE036    CALL    36E0H
1da6 F1        POP     AF
1da7 C1        POP     BC
1da8 D1        POP     DE
1da9 C9        RET     

1daa C5        PUSH    BC
1dab D5        PUSH    DE
1dac E5        PUSH    HL
1dad F5        PUSH    AF
1dae CDC71E    CALL    1EC7H
1db1 CDC31D    CALL    1DC3H
1db4 380A      JR      C,1DC0H          ; (+0aH)
1db6 05        DEC     B
1db7 2804      JR      Z,1DBDH          ; (+04H)
1db9 FE20      CP      20H
1dbb 382E      JR      C,1DEBH          ; (+2eH)
1dbd CDE21D    CALL    1DE2H
1dc0 C3521D    JP      1D52H
1dc3 E5        PUSH    HL
1dc4 47        LD      B,A
1dc5 217CFA    LD      HL,0FA7CH
1dc8 7E        LD      A,(HL)
1dc9 3600      LD      (HL),00H
1dcb B7        OR      A
1dcc 78        LD      A,B
1dcd 2806      JR      Z,1DD5H          ; (+06H)
1dcf D630      SUB     30H
1dd1 0601      LD      B,01H
1dd3 180A      JR      1DDFH            ; (+0aH)
1dd5 FE14      CP      14H
1dd7 0600      LD      B,00H
1dd9 2004      JR      NZ,1DDFH         ; (+04H)
1ddb 77        LD      (HL),A
1ddc 37        SCF     
1ddd E1        POP     HL
1dde C9        RET     

1ddf B7        OR      A
1de0 E1        POP     HL
1de1 C9        RET     

1de2 2AB0C6    LD      HL,(0C6B0H)
1de5 CD4A22    CALL    224AH
1de8 C32637    JP      3726H
1deb FE1C      CP      1CH
1ded 300E      JR      NC,1DFDH         ; (+0eH)
1def FE07      CP      07H
1df1 281E      JR      Z,1E11H          ; (+1eH)
1df3 FE0A      CP      0AH
1df5 38C9      JR      C,1DC0H          ; (-37H)
1df7 FE0E      CP      0EH
1df9 30C5      JR      NC,1DC0H         ; (-3bH)
1dfb C60E      ADD     A,0EH
1dfd 21E636    LD      HL,36E6H
1e00 87        ADD     A,A
1e01 4F        LD      C,A
1e02 0600      LD      B,00H
1e04 09        ADD     HL,BC
1e05 5E        LD      E,(HL)
1e06 23        INC     HL
1e07 56        LD      D,(HL)
1e08 01C01D    LD      BC,1DC0H
1e0b C5        PUSH    BC
1e0c D5        PUSH    DE
1e0d 2AAEC6    LD      HL,(0C6AEH)
1e10 C9        RET     

1e11 CDD129    CALL    29D1H
1e14 18AA      JR      1DC0H            ; (-56H)
1e16 2100C0    LD      HL,0C000H
1e19 3620      LD      (HL),20H
1e1b 1101C0    LD      DE,0C001H
1e1e 010002    LD      BC,0200H
1e21 E5        PUSH    HL
1e22 C5        PUSH    BC
1e23 EDB0      LDIR    
1e25 C1        POP     BC
1e26 C5        PUSH    BC
1e27 EDB0      LDIR    
1e29 C1        POP     BC
1e2a E1        POP     HL
1e2b 1100E0    LD      DE,0E000H
1e2e C5        PUSH    BC
1e2f E5        PUSH    HL
1e30 EDB0      LDIR    
1e32 E1        POP     HL
1e33 C1        POP     BC
1e34 1100F8    LD      DE,0F800H
1e37 EDB0      LDIR    
1e39 01C002    LD      BC,02C0H
1e3c 78        LD      A,B
1e3d 3292C6    LD      (0C692H),A
1e40 79        LD      A,C
1e41 3297C6    LD      (0C697H),A
1e44 C604      ADD     A,04H
1e46 67        LD      H,A
1e47 3E20      LD      A,20H
1e49 32B3C6    LD      (0C6B3H),A
1e4c AF        XOR     A
1e4d 6F        LD      L,A
1e4e 3295C6    LD      (0C695H),A
1e51 32B5FA    LD      (0FAB5H),A
1e54 329AC6    LD      (0C69AH),A
1e57 329BC6    LD      (0C69BH),A
1e5a 32ACC6    LD      (0C6ACH),A
1e5d 32ADC6    LD      (0C6ADH),A
1e60 3C        INC     A
1e61 C5        PUSH    BC
1e62 21BDC6    LD      HL,0C6BDH
1e65 0611      LD      B,11H
1e67 77        LD      (HL),A
1e68 23        INC     HL
1e69 10FC      DJNZ    1E67H            ; (-04H)
1e6b C1        POP     BC
1e6c 32ACC6    LD      (0C6ACH),A
1e6f 210110    LD      HL,1001H
1e72 22A8C6    LD      (0C6A8H),HL
1e75 25        DEC     H
1e76 22AAC6    LD      (0C6AAH),HL
1e79 0EE0      LD      C,0E0H
1e7b 3E04      LD      A,04H
1e7d 3D        DEC     A
1e7e 3299C6    LD      (0C699H),A
1e81 3298C6    LD      (0C698H),A
1e84 CDD421    CALL    21D4H
1e87 20F4      JR      NZ,1E7DH         ; (-0cH)
1e89 AF        XOR     A
1e8a CDFA20    CALL    20FAH
1e8d 210101    LD      HL,0101H
1e90 CD111F    CALL    1F11H
1e93 22B0C6    LD      (0C6B0H),HL
1e96 CDB521    CALL    21B5H
1e99 79        LD      A,C
1e9a 3297C6    LD      (0C697H),A
1e9d D620      SUB     20H
1e9f 4F        LD      C,A
1ea0 2195C6    LD      HL,0C695H
1ea3 34        INC     (HL)
1ea4 10D5      DJNZ    1E7BH            ; (-2bH)
1ea6 AF        XOR     A
1ea7 CDAD21    CALL    21ADH
1eaa CD6421    CALL    2164H
1ead C9        RET     

1eae 2AAEC6    LD      HL,(0C6AEH)
1eb1 22AEC6    LD      (0C6AEH),HL
1eb4 E5        PUSH    HL
1eb5 CD111F    CALL    1F11H
1eb8 22B0C6    LD      (0C6B0H),HL
1ebb E1        POP     HL
1ebc C9        RET     

1ebd F5        PUSH    AF
1ebe 3A72FA    LD      A,(0FA72H)
1ec1 B7        OR      A
1ec2 CCD11E    CALL    Z,1ED1H
1ec5 F1        POP     AF
1ec6 C9        RET     

1ec7 F5        PUSH    AF
1ec8 3A72FA    LD      A,(0FA72H)
1ecb B7        OR      A
1ecc C4D11E    CALL    NZ,1ED1H
1ecf F1        POP     AF
1ed0 C9        RET     

1ed1 F5        PUSH    AF
1ed2 CDF420    CALL    20F4H
1ed5 3023      JR      NC,1EFAH         ; (+23H)
1ed7 3A72FA    LD      A,(0FA72H)
1eda 2F        CPL     
1edb 3272FA    LD      (0FA72H),A
1ede 2AB0C6    LD      HL,(0C6B0H)
1ee1 E5        PUSH    HL
1ee2 CDEB1B    CALL    1BEBH
1ee5 7E        LD      A,(HL)
1ee6 E640      AND     40H
1ee8 280B      JR      Z,1EF5H          ; (+0bH)
1eea E1        POP     HL
1eeb E5        PUSH    HL
1eec CDE61B    CALL    1BE6H
1eef 7E        LD      A,(HL)
1ef0 2F        CPL     
1ef1 77        LD      (HL),A
1ef2 E1        POP     HL
1ef3 1805      JR      1EFAH            ; (+05H)
1ef5 3E01      LD      A,01H
1ef7 AE        XOR     (HL)
1ef8 77        LD      (HL),A
1ef9 E1        POP     HL
1efa F1        POP     AF
1efb C9        RET     

1efc E5        PUSH    HL
1efd F5        PUSH    AF
1efe 2D        DEC     L
1eff 2600      LD      H,00H
1f01 29        ADD     HL,HL
1f02 29        ADD     HL,HL
1f03 29        ADD     HL,HL
1f04 29        ADD     HL,HL
1f05 29        ADD     HL,HL
1f06 3A97C6    LD      A,(0C697H)
1f09 B4        OR      H
1f0a C602      ADD     A,02H
1f0c 57        LD      D,A
1f0d 5D        LD      E,L
1f0e F1        POP     AF
1f0f E1        POP     HL
1f10 C9        RET     

1f11 D5        PUSH    DE
1f12 F5        PUSH    AF
1f13 CDFC1E    CALL    1EFCH
1f16 6C        LD      L,H
1f17 2600      LD      H,00H
1f19 2D        DEC     L
1f1a 19        ADD     HL,DE
1f1b F1        POP     AF
1f1c D1        POP     DE
1f1d C9        RET     

1f1e E5        PUSH    HL
1f1f D5        PUSH    DE
1f20 C5        PUSH    BC
1f21 F5        PUSH    AF
1f22 EB        EX      DE,HL
1f23 CDF420    CALL    20F4H
1f26 3035      JR      NC,1F5DH         ; (+35H)
1f28 3A99C6    LD      A,(0C699H)
1f2b CD8223    CALL    2382H
1f2e 4F        LD      C,A
1f2f 0620      LD      B,20H
1f31 3A98C6    LD      A,(0C698H)
1f34 B7        OR      A
1f35 2806      JR      Z,1F3DH          ; (+06H)
1f37 3A9AC6    LD      A,(0C69AH)
1f3a CDD324    CALL    24D3H
1f3d C5        PUSH    BC
1f3e E5        PUSH    HL
1f3f CDEB1B    CALL    1BEBH
1f42 71        LD      (HL),C
1f43 54        LD      D,H
1f44 5D        LD      E,L
1f45 13        INC     DE
1f46 011E00    LD      BC,001EH
1f49 0C        INC     C
1f4a CDFC22    CALL    22FCH
1f4d E1        POP     HL
1f4e CDE61B    CALL    1BE6H
1f51 C1        POP     BC
1f52 70        LD      (HL),B
1f53 54        LD      D,H
1f54 5D        LD      E,L
1f55 13        INC     DE
1f56 011F00    LD      BC,001FH
1f59 EDB0      LDIR    
1f5b 1822      JR      1F7FH            ; (+22H)
1f5d 2006      JR      NZ,1F65H         ; (+06H)
1f5f 3EC0      LD      A,0C0H
1f61 1606      LD      D,06H
1f63 1804      JR      1F69H            ; (+04H)
1f65 3E80      LD      A,80H
1f67 160C      LD      D,0CH
1f69 32B8C6    LD      (0C6B8H),A
1f6c 1E00      LD      E,00H
1f6e D5        PUSH    DE
1f6f CD0322    CALL    2203H
1f72 22B9C6    LD      (0C6B9H),HL
1f75 E1        POP     HL
1f76 3A9AC6    LD      A,(0C69AH)
1f79 CD8223    CALL    2382H
1f7c CD4A25    CALL    254AH
1f7f F1        POP     AF
1f80 C1        POP     BC
1f81 D1        POP     DE
1f82 E1        POP     HL
1f83 C9        RET     

1f84 E5        PUSH    HL
1f85 CDE61B    CALL    1BE6H
1f88 7E        LD      A,(HL)
1f89 E1        POP     HL
1f8a B7        OR      A
1f8b C9        RET     

1f8c E5        PUSH    HL
1f8d CD111F    CALL    1F11H
1f90 CD841F    CALL    1F84H
1f93 47        LD      B,A
1f94 CDEB1B    CALL    1BEBH
1f97 7E        LD      A,(HL)
1f98 E640      AND     40H
1f9a 78        LD      A,B
1f9b E1        POP     HL
1f9c C8        RET     Z

1f9d 3E20      LD      A,20H
1f9f 47        LD      B,A
1fa0 C9        RET     

1fa1 E5        PUSH    HL
1fa2 CD111F    CALL    1F11H
1fa5 CD4A22    CALL    224AH
1fa8 E1        POP     HL
1fa9 C9        RET     

1faa E5        PUSH    HL
1fab D5        PUSH    DE
1fac C5        PUSH    BC
1fad AF        XOR     A
1fae 3D        DEC     A
1faf F5        PUSH    AF
1fb0 7D        LD      A,L
1fb1 94        SUB     H
1fb2 54        LD      D,H
1fb3 6F        LD      L,A
1fb4 2600      LD      H,00H
1fb6 29        ADD     HL,HL
1fb7 29        ADD     HL,HL
1fb8 29        ADD     HL,HL
1fb9 29        ADD     HL,HL
1fba 29        ADD     HL,HL
1fbb 44        LD      B,H
1fbc 4D        LD      C,L
1fbd 6A        LD      L,D
1fbe CDFC1E    CALL    1EFCH
1fc1 EB        EX      DE,HL
1fc2 CDE61B    CALL    1BE6H
1fc5 EB        EX      DE,HL
1fc6 F1        POP     AF
1fc7 C5        PUSH    BC
1fc8 F5        PUSH    AF
1fc9 2002      JR      NZ,1FCDH         ; (+02H)
1fcb 2D        DEC     L
1fcc 2D        DEC     L
1fcd 2C        INC     L
1fce D5        PUSH    DE
1fcf CDFC1E    CALL    1EFCH
1fd2 EB        EX      DE,HL
1fd3 CDE61B    CALL    1BE6H
1fd6 D1        POP     DE
1fd7 F1        POP     AF
1fd8 F5        PUSH    AF
1fd9 D5        PUSH    DE
1fda E5        PUSH    HL
1fdb CDFC22    CALL    22FCH
1fde 010002    LD      BC,0200H
1fe1 D1        POP     DE
1fe2 E1        POP     HL
1fe3 09        ADD     HL,BC
1fe4 EB        EX      DE,HL
1fe5 09        ADD     HL,BC
1fe6 3AB1C6    LD      A,(0C6B1H)
1fe9 E620      AND     20H
1feb CAF01F    JP      Z,1FF0H
1fee 3E16      LD      A,16H
1ff0 4F        LD      C,A
1ff1 84        ADD     A,H
1ff2 67        LD      H,A
1ff3 79        LD      A,C
1ff4 82        ADD     A,D
1ff5 57        LD      D,A
1ff6 F1        POP     AF
1ff7 C1        POP     BC
1ff8 F5        PUSH    AF
1ff9 CDF420    CALL    20F4H
1ffc D27F1F    JP      NC,1F7FH
1fff F1        POP     AF
2000 F5        PUSH    AF
2001 2805      JR      Z,2008H          ; (+05H)
2003 EDB0      LDIR    
2005 C37F1F    JP      1F7FH
2008 CD2B23    CALL    232BH
200b C37F1F    JP      1F7FH
200e E5        PUSH    HL
200f D5        PUSH    DE
2010 C5        PUSH    BC
2011 AF        XOR     A
2012 F5        PUSH    AF
2013 7C        LD      A,H
2014 3C        INC     A
2015 67        LD      H,A
2016 95        SUB     L
2017 3D        DEC     A
2018 1898      JR      1FB2H            ; (-68H)
201a AF        XOR     A
201b 32ADC6    LD      (0C6ADH),A
201e CDF420    CALL    20F4H
2021 D0        RET     NC

2022 3AACC6    LD      A,(0C6ACH)
2025 47        LD      B,A
2026 3AADC6    LD      A,(0C6ADH)
2029 4F        LD      C,A
202a E601      AND     01H
202c B0        OR      B
202d C8        RET     Z

202e 3A7AFA    LD      A,(0FA7AH)
2031 E640      AND     40H
2033 3E01      LD      A,01H
2035 2001      JR      NZ,2038H         ; (+01H)
2037 AF        XOR     A
2038 87        ADD     A,A
2039 80        ADD     A,B
203a B9        CP      C
203b C8        RET     Z

203c 32ADC6    LD      (0C6ADH),A
203f E5        PUSH    HL
2040 0F        RRCA    
2041 3810      JR      C,2053H          ; (+10H)
2043 3A00FA    LD      A,(0FA00H)
2046 6F        LD      L,A
2047 CDFC1E    CALL    1EFCH
204a CD1E1F    CALL    1F1EH
204d AF        XOR     A
204e 32ADC6    LD      (0C6ADH),A
2051 E1        POP     HL
2052 C9        RET     

2053 0F        RRCA    
2054 3E05      LD      A,05H
2056 32D6FA    LD      (0FAD6H),A
2059 3801      JR      C,205CH          ; (+01H)
205b AF        XOR     A
205c 32D5FA    LD      (0FAD5H),A
205f 3A00FA    LD      A,(0FA00H)
2062 6F        LD      L,A
2063 CDFC1E    CALL    1EFCH
2066 EB        EX      DE,HL
2067 CDD220    CALL    20D2H
206a 3A95C6    LD      A,(0C695H)
206d C631      ADD     A,31H
206f CD4A22    CALL    224AH
2072 CDD220    CALL    20D2H
2075 23        INC     HL
2076 3E05      LD      A,05H
2078 32D4FA    LD      (0FAD4H),A
207b 3E20      LD      A,20H
207d CD4A22    CALL    224AH
2080 23        INC     HL
2081 E5        PUSH    HL
2082 CDD220    CALL    20D2H
2085 2600      LD      H,00H
2087 3AD5FA    LD      A,(0FAD5H)
208a 6F        LD      L,A
208b 29        ADD     HL,HL
208c 29        ADD     HL,HL
208d 29        ADD     HL,HL
208e 0121FA    LD      BC,0FA21H
2091 09        ADD     HL,BC
2092 3AD4FA    LD      A,(0FAD4H)
2095 47        LD      B,A
2096 7E        LD      A,(HL)
2097 23        INC     HL
2098 B7        OR      A
2099 E3        EX      (SP),HL
209a 280F      JR      Z,20ABH          ; (+0fH)
209c FE20      CP      20H
209e 380B      JR      C,20ABH          ; (+0bH)
20a0 C5        PUSH    BC
20a1 CD4A22    CALL    224AH
20a4 23        INC     HL
20a5 C1        POP     BC
20a6 E3        EX      (SP),HL
20a7 10ED      DJNZ    2096H            ; (-13H)
20a9 180C      JR      20B7H            ; (+0cH)
20ab D1        POP     DE
20ac C5        PUSH    BC
20ad 3E20      LD      A,20H
20af CD4A22    CALL    224AH
20b2 C1        POP     BC
20b3 23        INC     HL
20b4 10F6      DJNZ    20ACH            ; (-0aH)
20b6 E5        PUSH    HL
20b7 CDD220    CALL    20D2H
20ba E1        POP     HL
20bb 3AD5FA    LD      A,(0FAD5H)
20be 3C        INC     A
20bf 32D5FA    LD      (0FAD5H),A
20c2 3AD6FA    LD      A,(0FAD6H)
20c5 3D        DEC     A
20c6 32D6FA    LD      (0FAD6H),A
20c9 20AB      JR      NZ,2076H         ; (-55H)
20cb 3E20      LD      A,20H
20cd CD4A22    CALL    224AH
20d0 E1        POP     HL
20d1 C9        RET     

20d2 3A99C6    LD      A,(0C699H)
20d5 CD8A23    CALL    238AH
20d8 EE07      XOR     07H
20da FE05      CP      05H
20dc 3802      JR      C,20E0H          ; (+02H)
20de E603      AND     03H
20e0 3299C6    LD      (0C699H),A
20e3 C9        RET     

20e4 3A96C6    LD      A,(0C696H)
20e7 CD9721    CALL    2197H
20ea CDF420    CALL    20F4H
20ed D8        RET     C

20ee AF        XOR     A
20ef CD6421    CALL    2164H
20f2 18F0      JR      20E4H            ; (-10H)
20f4 3A98C6    LD      A,(0C698H)
20f7 FE02      CP      02H
20f9 C9        RET     

20fa E5        PUSH    HL
20fb C5        PUSH    BC
20fc 47        LD      B,A
20fd FE02      CP      02H
20ff 3807      JR      C,2108H          ; (+07H)
2101 3A95C6    LD      A,(0C695H)
2104 B7        OR      A
2105 CA880B    JP      Z,0B88H
2108 78        LD      A,B
2109 CDBE21    CALL    21BEH
210c 2AA8C6    LD      HL,(0C6A8H)
210f EB        EX      DE,HL
2110 F5        PUSH    AF
2111 CD9A2B    CALL    2B9AH
2114 F1        POP     AF
2115 CD5221    CALL    2152H
2118 2A96C6    LD      HL,(0C696H)
211b F5        PUSH    AF
211c 7C        LD      A,H
211d C602      ADD     A,02H
211f 67        LD      H,A
2120 FEE2      CP      0E2H
2122 2003      JR      NZ,2127H         ; (+03H)
2124 C616      ADD     A,16H
2126 67        LD      H,A
2127 F1        POP     AF
2128 2E00      LD      L,00H
212a 77        LD      (HL),A
212b 54        LD      D,H
212c 5D        LD      E,L
212d 13        INC     DE
212e 01FF01    LD      BC,01FFH
2131 EDB0      LDIR    
2133 CDF420    CALL    20F4H
2136 3E10      LD      A,10H
2138 2801      JR      Z,213BH          ; (+01H)
213a 87        ADD     A,A
213b 32B2C6    LD      (0C6B2H),A
213e 2AAAC6    LD      HL,(0C6AAH)
2141 E5        PUSH    HL
2142 210110    LD      HL,1001H
2145 22AAC6    LD      (0C6AAH),HL
2148 CD3B2C    CALL    2C3BH
214b E1        POP     HL
214c 22AAC6    LD      (0C6AAH),HL
214f C1        POP     BC
2150 E1        POP     HL
2151 C9        RET     

2152 E5        PUSH    HL
2153 5F        LD      E,A
2154 1600      LD      D,00H
2156 216021    LD      HL,2160H
2159 19        ADD     HL,DE
215a 3A9BC6    LD      A,(0C69BH)
215d 86        ADD     A,(HL)
215e E1        POP     HL
215f C9        RET     

2160 2060      JR      NZ,21C2H         ; (+60H)
2162 8C        ADC     A,H
2163 DCE5D5    CALL    C,0D5E5H
2166 C5        PUSH    BC
2167 3296C6    LD      (0C696H),A
216a 0680      LD      B,80H
216c CDDD21    CALL    21DDH
216f 7E        LD      A,(HL)
2170 C640      ADD     A,40H
2172 E660      AND     60H
2174 0F        RRCA    
2175 0F        RRCA    
2176 0F        RRCA    
2177 0F        RRCA    
2178 CD1E20    CALL    201EH
217b 3A96C6    LD      A,(0C696H)
217e C610      ADD     A,10H
2180 FE10      CP      10H
2182 4F        LD      C,A
2183 280D      JR      Z,2192H          ; (+0dH)
2185 3A06C7    LD      A,(0C706H)
2188 FE02      CP      02H
218a 3806      JR      C,2192H          ; (+06H)
218c 0E12      LD      C,12H
218e 2802      JR      Z,2192H          ; (+02H)
2190 0E16      LD      C,16H
2192 ED79      OUT     (C),A
2194 C3801F    JP      1F80H
2197 C5        PUSH    BC
2198 F5        PUSH    AF
2199 D5        PUSH    DE
219a 47        LD      B,A
219b 3A95C6    LD      A,(0C695H)
219e B8        CP      B
219f 282F      JR      Z,21D0H          ; (+2fH)
21a1 78        LD      A,B
21a2 CDAA21    CALL    21AAH
21a5 CD1A20    CALL    201AH
21a8 1826      JR      21D0H            ; (+26H)
21aa CDB521    CALL    21B5H
21ad 3295C6    LD      (0C695H),A
21b0 C5        PUSH    BC
21b1 0680      LD      B,80H
21b3 1812      JR      21C7H            ; (+12H)
21b5 C5        PUSH    BC
21b6 F5        PUSH    AF
21b7 0681      LD      B,81H
21b9 3A95C6    LD      A,(0C695H)
21bc 180A      JR      21C8H            ; (+0aH)
21be CDD421    CALL    21D4H
21c1 3298C6    LD      (0C698H),A
21c4 C5        PUSH    BC
21c5 0600      LD      B,00H
21c7 F5        PUSH    AF
21c8 D5        PUSH    DE
21c9 E5        PUSH    HL
21ca CDDD21    CALL    21DDH
21cd EDB0      LDIR    
21cf E1        POP     HL
21d0 D1        POP     DE
21d1 F1        POP     AF
21d2 C1        POP     BC
21d3 C9        RET     

21d4 C5        PUSH    BC
21d5 F5        PUSH    AF
21d6 0601      LD      B,01H
21d8 3A98C6    LD      A,(0C698H)
21db 18EB      JR      21C8H            ; (-15H)
21dd 1199C6    LD      DE,0C699H
21e0 219CC6    LD      HL,0C69CH
21e3 0E03      LD      C,03H
21e5 CB78      BIT     7,B
21e7 2808      JR      Z,21F1H          ; (+08H)
21e9 1197C6    LD      DE,0C697H
21ec 21CEC6    LD      HL,0C6CEH
21ef 0E37      LD      C,37H
21f1 C5        PUSH    BC
21f2 0600      LD      B,00H
21f4 B7        OR      A
21f5 1802      JR      21F9H            ; (+02H)
21f7 09        ADD     HL,BC
21f8 3D        DEC     A
21f9 20FC      JR      NZ,21F7H         ; (-04H)
21fb C1        POP     BC
21fc CB40      BIT     0,B
21fe 0600      LD      B,00H
2200 C8        RET     Z

2201 EB        EX      DE,HL
2202 C9        RET     

2203 D5        PUSH    DE
2204 C5        PUSH    BC
2205 F5        PUSH    AF
2206 3A97C6    LD      A,(0C697H)
2209 C602      ADD     A,02H
220b 47        LD      B,A
220c 7C        LD      A,H
220d 90        SUB     B
220e 67        LD      H,A
220f 7D        LD      A,L
2210 E61F      AND     1FH
2212 4F        LD      C,A
2213 AD        XOR     L
2214 6F        LD      L,A
2215 29        ADD     HL,HL
2216 29        ADD     HL,HL
2217 54        LD      D,H
2218 5D        LD      E,L
2219 19        ADD     HL,DE
221a 19        ADD     HL,DE
221b 7C        LD      A,H
221c 80        ADD     A,B
221d 67        LD      H,A
221e 0600      LD      B,00H
2220 09        ADD     HL,BC
2221 CDF420    CALL    20F4H
2224 2001      JR      NZ,2227H         ; (+01H)
2226 09        ADD     HL,BC
2227 F1        POP     AF
2228 C1        POP     BC
2229 D1        POP     DE
222a C9        RET     

222b E5        PUSH    HL
222c C5        PUSH    BC
222d F5        PUSH    AF
222e D371      OUT     (71H),A
2230 D361      OUT     (61H),A
2232 4F        LD      C,A
2233 D680      SUB     80H
2235 3003      JR      NC,223AH         ; (+03H)
2237 D360      OUT     (60H),A
2239 79        LD      A,C
223a 6F        LD      L,A
223b 2600      LD      H,00H
223d 29        ADD     HL,HL
223e 29        ADD     HL,HL
223f 29        ADD     HL,HL
2240 29        ADD     HL,HL
2241 110070    LD      DE,7000H
2244 19        ADD     HL,DE
2245 EB        EX      DE,HL
2246 F1        POP     AF
2247 C1        POP     BC
2248 E1        POP     HL
2249 C9        RET     

224a C5        PUSH    BC
224b F5        PUSH    AF
224c 47        LD      B,A
224d 3A98C6    LD      A,(0C698H)
2250 4F        LD      C,A
2251 FE01      CP      01H
2253 2004      JR      NZ,2259H         ; (+04H)
2255 AF        XOR     A
2256 3298C6    LD      (0C698H),A
2259 78        LD      A,B
225a CD6422    CALL    2264H
225d 79        LD      A,C
225e 3298C6    LD      (0C698H),A
2261 F1        POP     AF
2262 C1        POP     BC
2263 C9        RET     

2264 F5        PUSH    AF
2265 3A99C6    LD      A,(0C699H)
2268 CD8223    CALL    2382H
226b CDF420    CALL    20F4H
226e 3013      JR      NC,2283H         ; (+13H)
2270 F1        POP     AF
2271 E5        PUSH    HL
2272 F5        PUSH    AF
2273 C3F73C    JP      3CF7H
2276 F1        POP     AF
2277 77        LD      (HL),A
2278 E1        POP     HL
2279 E5        PUSH    HL
227a CDEB1B    CALL    1BEBH
227d 3AB9FA    LD      A,(0FAB9H)
2280 77        LD      (HL),A
2281 E1        POP     HL
2282 C9        RET     

2283 F1        POP     AF
2284 E5        PUSH    HL
2285 D5        PUSH    DE
2286 C5        PUSH    BC
2287 F5        PUSH    AF
2288 CD0322    CALL    2203H
228b CD2B22    CALL    222BH
228e 012000    LD      BC,0020H
2291 3E0C      LD      A,0CH
2293 F5        PUSH    AF
2294 C5        PUSH    BC
2295 D5        PUSH    DE
2296 CDF420    CALL    20F4H
2299 1A        LD      A,(DE)
229a 2036      JR      NZ,22D2H         ; (+36H)
229c 47        LD      B,A
229d E6F0      AND     0F0H
229f 16FE      LD      D,0FEH
22a1 CB21      SLA     C
22a3 17        RLA     
22a4 CB11      RL      C
22a6 CB21      SLA     C
22a8 17        RLA     
22a9 CB11      RL      C
22ab CB21      SLA     C
22ad 17        RLA     
22ae CB11      RL      C
22b0 CB21      SLA     C
22b2 17        RLA     
22b3 CB11      RL      C
22b5 79        LD      A,C
22b6 CB21      SLA     C
22b8 81        ADD     A,C
22b9 E5        PUSH    HL
22ba F5        PUSH    AF
22bb CDE61B    CALL    1BE6H
22be F1        POP     AF
22bf CDF122    CALL    22F1H
22c2 E1        POP     HL
22c3 14        INC     D
22c4 2B        DEC     HL
22c5 2815      JR      Z,22DCH          ; (+15H)
22c7 23        INC     HL
22c8 23        INC     HL
22c9 78        LD      A,B
22ca E60F      AND     0FH
22cc 07        RLCA    
22cd 07        RLCA    
22ce 07        RLCA    
22cf 07        RLCA    
22d0 18CF      JR      22A1H            ; (-31H)
22d2 E5        PUSH    HL
22d3 F5        PUSH    AF
22d4 CDE61B    CALL    1BE6H
22d7 F1        POP     AF
22d8 CDF122    CALL    22F1H
22db E1        POP     HL
22dc D1        POP     DE
22dd 13        INC     DE
22de C1        POP     BC
22df 09        ADD     HL,BC
22e0 F1        POP     AF
22e1 3D        DEC     A
22e2 20AF      JR      NZ,2293H         ; (-51H)
22e4 D370      OUT     (70H),A
22e6 C37F1F    JP      1F7FH
22e9 E5        PUSH    HL
22ea F5        PUSH    AF
22eb CDEB1B    CALL    1BEBH
22ee F1        POP     AF
22ef 1801      JR      22F2H            ; (+01H)
22f1 E5        PUSH    HL
22f2 4F        LD      C,A
22f3 3AB9FA    LD      A,(0FAB9H)
22f6 AE        XOR     (HL)
22f7 A1        AND     C
22f8 AE        XOR     (HL)
22f9 77        LD      (HL),A
22fa E1        POP     HL
22fb C9        RET     

22fc F5        PUSH    AF
22fd CDF420    CALL    20F4H
2300 3823      JR      C,2325H          ; (+23H)
2302 C5        PUSH    BC
2303 010002    LD      BC,0200H
2306 09        ADD     HL,BC
2307 EB        EX      DE,HL
2308 09        ADD     HL,BC
2309 EB        EX      DE,HL
230a C1        POP     BC
230b CD0322    CALL    2203H
230e CDE61B    CALL    1BE6H
2311 EB        EX      DE,HL
2312 CD0322    CALL    2203H
2315 CDE61B    CALL    1BE6H
2318 EB        EX      DE,HL
2319 E5        PUSH    HL
231a 60        LD      H,B
231b 69        LD      L,C
231c 29        ADD     HL,HL
231d 29        ADD     HL,HL
231e 44        LD      B,H
231f 4D        LD      C,L
2320 09        ADD     HL,BC
2321 09        ADD     HL,BC
2322 44        LD      B,H
2323 4D        LD      C,L
2324 E1        POP     HL
2325 F1        POP     AF
2326 2803      JR      Z,232BH          ; (+03H)
2328 EDB0      LDIR    
232a C9        RET     

232b 1B        DEC     DE
232c 2B        DEC     HL
232d EDB8      LDDR    
232f C9        RET     

2330 47        LD      B,A
2331 79        LD      A,C
2332 0EFF      LD      C,0FFH
2334 0C        INC     C
2335 90        SUB     B
2336 30FC      JR      NC,2334H         ; (-04H)
2338 80        ADD     A,B
2339 C9        RET     

233a E5        PUSH    HL
233b 78        LD      A,B
233c B2        OR      D
233d FA880B    JP      M,0B88H
2340 21BF00    LD      HL,00BFH
2343 CDF420    CALL    20F4H
2346 3009      JR      NC,2351H         ; (+09H)
2348 3AACC6    LD      A,(0C6ACH)
234b B7        OR      A
234c 2803      JR      Z,2351H          ; (+03H)
234e 21B300    LD      HL,00B3H
2351 E7        RST     20H
2352 78        LD      A,B
2353 3805      JR      C,235AH          ; (+05H)
2355 B7        OR      A
2356 2006      JR      NZ,235EH         ; (+06H)
2358 1807      JR      2361H            ; (+07H)
235a EB        EX      DE,HL
235b B7        OR      A
235c 2803      JR      Z,2361H          ; (+03H)
235e 01FF00    LD      BC,00FFH
2361 37        SCF     
2362 E1        POP     HL
2363 F5        PUSH    AF
2364 AF        XOR     A
2365 E5        PUSH    HL
2366 07        RLCA    
2367 07        RLCA    
2368 6F        LD      L,A
2369 3A98C6    LD      A,(0C698H)
236c 85        ADD     A,L
236d 87        ADD     A,A
236e 217027    LD      HL,2770H
2371 85        ADD     A,L
2372 6F        LD      L,A
2373 8C        ADC     A,H
2374 95        SUB     L
2375 67        LD      H,A
2376 7E        LD      A,(HL)
2377 23        INC     HL
2378 66        LD      H,(HL)
2379 6F        LD      L,A
237a E3        EX      (SP),HL
237b C9        RET     

237c C5        PUSH    BC
237d D5        PUSH    DE
237e 3E01      LD      A,01H
2380 18E3      JR      2365H            ; (-1dH)
2382 CD8A23    CALL    238AH
2385 F5        PUSH    AF
2386 3E09      LD      A,09H
2388 18DB      JR      2365H            ; (-25H)
238a D5        PUSH    DE
238b 110401    LD      DE,0104H
238e F5        PUSH    AF
238f 3E02      LD      A,02H
2391 18D2      JR      2365H            ; (-2eH)
2393 3E03      LD      A,03H
2395 18CE      JR      2365H            ; (-32H)
2397 3E04      LD      A,04H
2399 18CA      JR      2365H            ; (-36H)
239b 3E05      LD      A,05H
239d 18C6      JR      2365H            ; (-3aH)
239f 3E06      LD      A,06H
23a1 18C2      JR      2365H            ; (-3eH)
23a3 3E07      LD      A,07H
23a5 18BE      JR      2365H            ; (-42H)
23a7 3E08      LD      A,08H
23a9 18BA      JR      2365H            ; (-46H)
23ab 79        LD      A,C
23ac 0F        RRCA    
23ad 0F        RRCA    
23ae 0F        RRCA    
23af E61F      AND     1FH
23b1 4F        LD      C,A
23b2 C5        PUSH    BC
23b3 3E0C      LD      A,0CH
23b5 4B        LD      C,E
23b6 CD3023    CALL    2330H
23b9 59        LD      E,C
23ba C1        POP     BC
23bb F1        POP     AF
23bc C9        RET     

23bd 79        LD      A,C
23be B7        OR      A
23bf 1F        RRA     
23c0 B7        OR      A
23c1 1F        RRA     
23c2 4F        LD      C,A
23c3 7B        LD      A,E
23c4 B7        OR      A
23c5 1F        RRA     
23c6 B7        OR      A
23c7 1F        RRA     
23c8 5F        LD      E,A
23c9 F1        POP     AF
23ca C9        RET     

23cb 79        LD      A,C
23cc B7        OR      A
23cd 1F        RRA     
23ce 4F        LD      C,A
23cf F1        POP     AF
23d0 C9        RET     

23d1 61        LD      H,C
23d2 6B        LD      L,E
23d3 CD0324    CALL    2403H
23d6 CDE61B    CALL    1BE6H
23d9 3E03      LD      A,03H
23db 32B8C6    LD      (0C6B8H),A
23de 181D      JR      23FDH            ; (+1dH)
23e0 3E02      LD      A,02H
23e2 CD3023    CALL    2330H
23e5 61        LD      H,C
23e6 57        LD      D,A
23e7 4B        LD      C,E
23e8 3E03      LD      A,03H
23ea CD3023    CALL    2330H
23ed 69        LD      L,C
23ee 07        RLCA    
23ef 82        ADD     A,D
23f0 3C        INC     A
23f1 47        LD      B,A
23f2 3E40      LD      A,40H
23f4 0F        RRCA    
23f5 10FD      DJNZ    23F4H            ; (-03H)
23f7 32B8C6    LD      (0C6B8H),A
23fa CD0324    CALL    2403H
23fd 22B9C6    LD      (0C6B9H),HL
2400 D1        POP     DE
2401 C1        POP     BC
2402 C9        RET     

2403 24        INC     H
2404 2C        INC     L
2405 C3111F    JP      1F11H
2408 3E04      LD      A,04H
240a CD3023    CALL    2330H
240d 61        LD      H,C
240e 3C        INC     A
240f 47        LD      B,A
2410 6B        LD      L,E
2411 3E03      LD      A,03H
2413 0F        RRCA    
2414 0F        RRCA    
2415 10FC      DJNZ    2413H            ; (-04H)
2417 18DE      JR      23F7H            ; (-22H)
2419 3E08      LD      A,08H
241b CD3023    CALL    2330H
241e 61        LD      H,C
241f 6B        LD      L,E
2420 3C        INC     A
2421 47        LD      B,A
2422 3E01      LD      A,01H
2424 0F        RRCA    
2425 10FD      DJNZ    2424H            ; (-03H)
2427 18CE      JR      23F7H            ; (-32H)
2429 F1        POP     AF
242a 3D        DEC     A
242b C5        PUSH    BC
242c 47        LD      B,A
242d 3A9BC6    LD      A,(0C69BH)
2430 A8        XOR     B
2431 F620      OR      20H
2433 C1        POP     BC
2434 32B9FA    LD      (0FAB9H),A
2437 B7        OR      A
2438 C9        RET     

2439 F1        POP     AF
243a 18F8      JR      2434H            ; (-08H)
243c F1        POP     AF
243d 3D        DEC     A
243e C5        PUSH    BC
243f 47        LD      B,A
2440 07        RLCA    
2441 07        RLCA    
2442 B0        OR      B
2443 47        LD      B,A
2444 07        RLCA    
2445 07        RLCA    
2446 07        RLCA    
2447 07        RLCA    
2448 B0        OR      B
2449 18E8      JR      2433H            ; (-18H)
244b F1        POP     AF
244c 2F        CPL     
244d 3C        INC     A
244e 18E4      JR      2434H            ; (-1cH)
2450 F1        POP     AF
2451 CD6624    CALL    2466H
2454 D1        POP     DE
2455 C9        RET     

2456 F1        POP     AF
2457 D1        POP     DE
2458 FE09      CP      09H
245a D8        RET     C

245b 3E08      LD      A,08H
245d C9        RET     

245e F1        POP     AF
245f D1        POP     DE
2460 FE02      CP      02H
2462 D8        RET     C

2463 3E01      LD      A,01H
2465 C9        RET     

2466 BA        CP      D
2467 3001      JR      NC,246AH         ; (+01H)
2469 7A        LD      A,D
246a BB        CP      E
246b D8        RET     C

246c 7B        LD      A,E
246d C9        RET     

246e C5        PUSH    BC
246f CD4325    CALL    2543H
2472 47        LD      B,A
2473 3AB9FA    LD      A,(0FAB9H)
2476 E5        PUSH    HL
2477 F5        PUSH    AF
2478 CDE61B    CALL    1BE6H
247b F1        POP     AF
247c AE        XOR     (HL)
247d A0        AND     B
247e AE        XOR     (HL)
247f 77        LD      (HL),A
2480 E1        POP     HL
2481 C1        POP     BC
2482 C9        RET     

2483 E5        PUSH    HL
2484 2AB9C6    LD      HL,(0C6B9H)
2487 3ABAC6    LD      A,(0C6BAH)
248a CDF01B    CALL    1BF0H
248d 7E        LD      A,(HL)
248e E640      AND     40H
2490 200E      JR      NZ,24A0H         ; (+0eH)
2492 3A9AC6    LD      A,(0C69AH)
2495 CDD324    CALL    24D3H
2498 71        LD      (HL),C
2499 2AB9C6    LD      HL,(0C6B9H)
249c CDE61B    CALL    1BE6H
249f 70        LD      (HL),B
24a0 E1        POP     HL
24a1 C9        RET     

24a2 C5        PUSH    BC
24a3 CD8324    CALL    2483H
24a6 CDD024    CALL    24D0H
24a9 381A      JR      C,24C5H          ; (+1aH)
24ab C5        PUSH    BC
24ac CD4325    CALL    2543H
24af EE3F      XOR     3FH
24b1 4F        LD      C,A
24b2 A8        XOR     B
24b3 47        LD      B,A
24b4 CDE61B    CALL    1BE6H
24b7 7E        LD      A,(HL)
24b8 A1        AND     C
24b9 B0        OR      B
24ba 77        LD      (HL),A
24bb 2AB9C6    LD      HL,(0C6B9H)
24be CDF01B    CALL    1BF0H
24c1 C1        POP     BC
24c2 71        LD      (HL),C
24c3 C1        POP     BC
24c4 C9        RET     

24c5 CD4325    CALL    2543H
24c8 2F        CPL     
24c9 E5        PUSH    HL
24ca CDE61B    CALL    1BE6H
24cd A6        AND     (HL)
24ce 18AF      JR      247FH            ; (-51H)
24d0 3AB9FA    LD      A,(0FAB9H)
24d3 B7        OR      A
24d4 0E3F      LD      C,3FH
24d6 2009      JR      NZ,24E1H         ; (+09H)
24d8 4F        LD      C,A
24d9 3A99C6    LD      A,(0C699H)
24dc B7        OR      A
24dd 2001      JR      NZ,24E0H         ; (+01H)
24df 3C        INC     A
24e0 37        SCF     
24e1 F5        PUSH    AF
24e2 3D        DEC     A
24e3 FE04      CP      04H
24e5 F5        PUSH    AF
24e6 3802      JR      C,24EAH          ; (+02H)
24e8 D604      SUB     04H
24ea 0F        RRCA    
24eb 0F        RRCA    
24ec B1        OR      C
24ed 47        LD      B,A
24ee F1        POP     AF
24ef 3A9BC6    LD      A,(0C69BH)
24f2 3802      JR      C,24F6H          ; (+02H)
24f4 EE02      XOR     02H
24f6 F660      OR      60H
24f8 4F        LD      C,A
24f9 F1        POP     AF
24fa C9        RET     

24fb CD4325    CALL    2543H
24fe F5        PUSH    AF
24ff CDF01B    CALL    1BF0H
2502 24        INC     H
2503 24        INC     H
2504 F1        POP     AF
2505 A6        AND     (HL)
2506 E603      AND     03H
2508 3C        INC     A
2509 C9        RET     

250a CD4325    CALL    2543H
250d F5        PUSH    AF
250e 7C        LD      A,H
250f D602      SUB     02H
2511 67        LD      H,A
2512 F1        POP     AF
2513 A6        AND     (HL)
2514 C9        RET     

2515 CD0A25    CALL    250AH
2518 FE04      CP      04H
251a 3C        INC     A
251b D8        RET     C

251c 3D        DEC     A
251d 0F        RRCA    
251e 0F        RRCA    
251f 18F7      JR      2518H            ; (-09H)
2521 CD0A25    CALL    250AH
2524 FE02      CP      02H
2526 D8        RET     C

2527 0F        RRCA    
2528 18FA      JR      2524H            ; (-06H)
252a C5        PUSH    BC
252b CD0A25    CALL    250AH
252e 2811      JR      Z,2541H          ; (+11H)
2530 7E        LD      A,(HL)
2531 E6C0      AND     0C0H
2533 07        RLCA    
2534 07        RLCA    
2535 4F        LD      C,A
2536 CDF01B    CALL    1BF0H
2539 24        INC     H
253a 24        INC     H
253b 7E        LD      A,(HL)
253c E602      AND     02H
253e 07        RLCA    
253f B1        OR      C
2540 3C        INC     A
2541 C1        POP     BC
2542 C9        RET     

2543 3AB8C6    LD      A,(0C6B8H)
2546 2AB9C6    LD      HL,(0C6B9H)
2549 C9        RET     

254a D5        PUSH    DE
254b C5        PUSH    BC
254c 44        LD      B,H
254d 4D        LD      C,L
254e 78        LD      A,B
254f B1        OR      C
2550 2003      JR      NZ,2555H         ; (+03H)
2552 C1        POP     BC
2553 D1        POP     DE
2554 C9        RET     

2555 CD9323    CALL    2393H
2558 54        LD      D,H
2559 5D        LD      E,L
255a CD9B23    CALL    239BH
255d 0B        DEC     BC
255e E7        RST     20H
255f 28ED      JR      Z,254EH          ; (-13H)
2561 CDF420    CALL    20F4H
2564 38E8      JR      C,254EH          ; (-18H)
2566 59        LD      E,C
2567 CB38      SRL     B
2569 CB19      RR      C
256b CB38      SRL     B
256d CB19      RR      C
256f FE02      CP      02H
2571 3E03      LD      A,03H
2573 2806      JR      Z,257BH          ; (+06H)
2575 CB38      SRL     B
2577 CB19      RR      C
2579 3E07      LD      A,07H
257b A3        AND     E
257c F5        PUSH    AF
257d 78        LD      A,B
257e B1        OR      C
257f 281B      JR      Z,259CH          ; (+1bH)
2581 CDE61B    CALL    1BE6H
2584 3AB9FA    LD      A,(0FAB9H)
2587 77        LD      (HL),A
2588 23        INC     HL
2589 0B        DEC     BC
258a 78        LD      A,B
258b B1        OR      C
258c 280A      JR      Z,2598H          ; (+0aH)
258e 54        LD      D,H
258f 5D        LD      E,L
2590 2B        DEC     HL
2591 EDB0      LDIR    
2593 EB        EX      DE,HL
2594 7A        LD      A,D
2595 C602      ADD     A,02H
2597 57        LD      D,A
2598 7C        LD      A,H
2599 C602      ADD     A,02H
259b 67        LD      H,A
259c 22B9C6    LD      (0C6B9H),HL
259f C1        POP     BC
25a0 48        LD      C,B
25a1 0600      LD      B,00H
25a3 18A9      JR      254EH            ; (-57H)
25a5 2AB9C6    LD      HL,(0C6B9H)
25a8 23        INC     HL
25a9 22B9C6    LD      (0C6B9H),HL
25ac C9        RET     

25ad 3AB8C6    LD      A,(0C6B8H)
25b0 0F        RRCA    
25b1 0F        RRCA    
25b2 3007      JR      NC,25BBH         ; (+07H)
25b4 2AB9C6    LD      HL,(0C6B9H)
25b7 23        INC     HL
25b8 22B9C6    LD      (0C6B9H),HL
25bb 32B8C6    LD      (0C6B8H),A
25be C9        RET     

25bf 3AB8C6    LD      A,(0C6B8H)
25c2 0F        RRCA    
25c3 30F6      JR      NC,25BBH         ; (-0aH)
25c5 18ED      JR      25B4H            ; (-13H)
25c7 3AB8C6    LD      A,(0C6B8H)
25ca E615      AND     15H
25cc 281D      JR      Z,25EBH          ; (+1dH)
25ce F5        PUSH    AF
25cf 2AB9C6    LD      HL,(0C6B9H)
25d2 23        INC     HL
25d3 3E1F      LD      A,1FH
25d5 A5        AND     L
25d6 2804      JR      Z,25DCH          ; (+04H)
25d8 F1        POP     AF
25d9 07        RLCA    
25da 18D8      JR      25B4H            ; (-28H)
25dc F1        POP     AF
25dd 3D        DEC     A
25de 3E10      LD      A,10H
25e0 28F7      JR      Z,25D9H          ; (-09H)
25e2 C5        PUSH    BC
25e3 01E0FF    LD      BC,0FFE0H
25e6 09        ADD     HL,BC
25e7 C1        POP     BC
25e8 22B9C6    LD      (0C6B9H),HL
25eb 3AB8C6    LD      A,(0C6B8H)
25ee 0F        RRCA    
25ef C3BB25    JP      25BBH
25f2 2AB9C6    LD      HL,(0C6B9H)
25f5 2B        DEC     HL
25f6 22B9C6    LD      (0C6B9H),HL
25f9 C9        RET     

25fa 3AB8C6    LD      A,(0C6B8H)
25fd 07        RLCA    
25fe 07        RLCA    
25ff 30BA      JR      NC,25BBH         ; (-46H)
2601 CDF225    CALL    25F2H
2604 18B5      JR      25BBH            ; (-4bH)
2606 3AB8C6    LD      A,(0C6B8H)
2609 07        RLCA    
260a 30AF      JR      NC,25BBH         ; (-51H)
260c 18F3      JR      2601H            ; (-0dH)
260e 3AB8C6    LD      A,(0C6B8H)
2611 67        LD      H,A
2612 E62A      AND     2AH
2614 2803      JR      Z,2619H          ; (+03H)
2616 0F        RRCA    
2617 18E8      JR      2601H            ; (-18H)
2619 7C        LD      A,H
261a 07        RLCA    
261b 189E      JR      25BBH            ; (-62H)
261d 3A98C6    LD      A,(0C698H)
2620 FE01      CP      01H
2622 200E      JR      NZ,2632H         ; (+0eH)
2624 3AB8C6    LD      A,(0C6B8H)
2627 07        RLCA    
2628 07        RLCA    
2629 FE40      CP      40H
262b 388E      JR      C,25BBH          ; (-72H)
262d 07        RLCA    
262e 07        RLCA    
262f 32B8C6    LD      (0C6B8H),A
2632 D5        PUSH    DE
2633 11E0FF    LD      DE,0FFE0H
2636 2AB9C6    LD      HL,(0C6B9H)
2639 19        ADD     HL,DE
263a 22B9C6    LD      (0C6B9H),HL
263d D1        POP     DE
263e C9        RET     

263f 3A98C6    LD      A,(0C698H)
2642 FE01      CP      01H
2644 200F      JR      NZ,2655H         ; (+0fH)
2646 3AB8C6    LD      A,(0C6B8H)
2649 0F        RRCA    
264a 0F        RRCA    
264b FE40      CP      40H
264d DABB25    JP      C,25BBH
2650 0F        RRCA    
2651 0F        RRCA    
2652 32B8C6    LD      (0C6B8H),A
2655 D5        PUSH    DE
2656 112000    LD      DE,0020H
2659 18DB      JR      2636H            ; (-25H)
265b 3E01      LD      A,01H
265d 2AB9C6    LD      HL,(0C6B9H)
2660 A4        AND     H
2661 2007      JR      NZ,266AH         ; (+07H)
2663 3EE0      LD      A,0E0H
2665 A5        AND     L
2666 2002      JR      NZ,266AH         ; (+02H)
2668 37        SCF     
2669 C9        RET     

266a CD1D26    CALL    261DH
266d AF        XOR     A
266e C9        RET     

266f 3AB8C6    LD      A,(0C6B8H)
2672 E630      AND     30H
2674 28AE      JR      Z,2624H          ; (-52H)
2676 18E3      JR      265BH            ; (-1dH)
2678 3E1D      LD      A,1DH
267a 18E1      JR      265DH            ; (-1fH)
267c 3E01      LD      A,01H
267e C5        PUSH    BC
267f 47        LD      B,A
2680 2AB9C6    LD      HL,(0C6B9H)
2683 A4        AND     H
2684 A8        XOR     B
2685 C1        POP     BC
2686 200B      JR      NZ,2693H         ; (+0bH)
2688 3EE0      LD      A,0E0H
268a C5        PUSH    BC
268b 47        LD      B,A
268c A5        AND     L
268d A8        XOR     B
268e C1        POP     BC
268f 2002      JR      NZ,2693H         ; (+02H)
2691 37        SCF     
2692 C9        RET     

2693 CD3F26    CALL    263FH
2696 AF        XOR     A
2697 C9        RET     

2698 3AB8C6    LD      A,(0C6B8H)
269b E603      AND     03H
269d 28A7      JR      Z,2646H          ; (-59H)
269f 3E03      LD      A,03H
26a1 18DB      JR      267EH            ; (-25H)
26a3 3E19      LD      A,19H
26a5 18D7      JR      267EH            ; (-29H)
26a7 210000    LD      HL,0000H
26aa 22B4C6    LD      (0C6B4H),HL
26ad 22B6C6    LD      (0C6B6H),HL
26b0 EB        EX      DE,HL
26b1 42        LD      B,D
26b2 4B        LD      C,E
26b3 C37C23    JP      237CH
26b6 21D700    LD      HL,00D7H
26b9 113101    LD      DE,0131H
26bc AF        XOR     A
26bd 3296FA    LD      (0FA96H),A
26c0 C9        RET     

26c1 E5        PUSH    HL
26c2 32D3FA    LD      (0FAD3H),A
26c5 21B9FA    LD      HL,0FAB9H
26c8 46        LD      B,(HL)
26c9 CD8223    CALL    2382H
26cc 32D2FA    LD      (0FAD2H),A
26cf 70        LD      (HL),B
26d0 E1        POP     HL
26d1 C9        RET     

26d2 0E00      LD      C,00H
26d4 210000    LD      HL,0000H
26d7 CD4A27    CALL    274AH
26da 200D      JR      NZ,26E9H         ; (+0dH)
26dc 1B        DEC     DE
26dd 7A        LD      A,D
26de B3        OR      E
26df C8        RET     Z

26e0 CD1827    CALL    2718H
26e3 30F2      JR      NC,26D7H         ; (-0eH)
26e5 110000    LD      DE,0000H
26e8 C9        RET     

26e9 3AB8C6    LD      A,(0C6B8H)
26ec 32C9FA    LD      (0FAC9H),A
26ef E5        PUSH    HL
26f0 2AB9C6    LD      HL,(0C6B9H)
26f3 22CAFA    LD      (0FACAH),HL
26f6 E1        POP     HL
26f7 23        INC     HL
26f8 CD1827    CALL    2718H
26fb D8        RET     C

26fc CD4A27    CALL    274AH
26ff 20F6      JR      NZ,26F7H         ; (-0aH)
2701 C9        RET     

2702 210000    LD      HL,0000H
2705 0E00      LD      C,00H
2707 CD1727    CALL    2717H
270a D8        RET     C

270b CD4A27    CALL    274AH
270e 2803      JR      Z,2713H          ; (+03H)
2710 23        INC     HL
2711 18F4      JR      2707H            ; (-0cH)
2713 CD1827    CALL    2718H
2716 C9        RET     

2717 3EAF      LD      A,0AFH
2719 47        LD      B,A
271a E5        PUSH    HL
271b D5        PUSH    DE
271c CD4325    CALL    2543H
271f F5        PUSH    AF
2720 EB        EX      DE,HL
2721 78        LD      A,B
2722 B7        OR      A
2723 2019      JR      NZ,273EH         ; (+19H)
2725 CD9B23    CALL    239BH
2728 2AB9C6    LD      HL,(0C6B9H)
272b E7        RST     20H
272c 280C      JR      Z,273AH          ; (+0cH)
272e 3E1F      LD      A,1FH
2730 A5        AND     L
2731 2007      JR      NZ,273AH         ; (+07H)
2733 F1        POP     AF
2734 EB        EX      DE,HL
2735 CDB825    CALL    25B8H
2738 37        SCF     
2739 3ED1      LD      A,0D1H
273b D1        POP     DE
273c E1        POP     HL
273d C9        RET     

273e CD9F23    CALL    239FH
2741 2AB9C6    LD      HL,(0C6B9H)
2744 E7        RST     20H
2745 28F3      JR      Z,273AH          ; (-0dH)
2747 2C        INC     L
2748 18E4      JR      272EH            ; (-1cH)
274a 3A98C6    LD      A,(0C698H)
274d FE01      CP      01H
274f CAF6FA    JP      Z,0FAF6H
2752 E5        PUSH    HL
2753 CD4325    CALL    2543H
2756 47        LD      B,A
2757 CDE61B    CALL    1BE6H
275a 3AD2FA    LD      A,(0FAD2H)
275d AE        XOR     (HL)
275e A0        AND     B
275f 280D      JR      Z,276EH          ; (+0dH)
2761 F5        PUSH    AF
2762 3AB9FA    LD      A,(0FAB9H)
2765 AE        XOR     (HL)
2766 A0        AND     B
2767 47        LD      B,A
2768 B1        OR      C
2769 4F        LD      C,A
276a 78        LD      A,B
276b AE        XOR     (HL)
276c 77        LD      (HL),A
276d F1        POP     AF
276e E1        POP     HL
276f C9        RET     

2770 AB        XOR     E
2771 23        INC     HL
2772 BD        CP      L
2773 23        INC     HL
2774 CB23      SLA     E
2776 CF        RST     08H
2777 23        INC     HL
2778 D1        POP     DE
2779 23        INC     HL
277a E0        RET     PO

277b 23        INC     HL
277c 08        EX      AF,AF'
277d 24        INC     H
277e 19        ADD     HL,DE
277f 24        INC     H
2780 50        LD      D,B
2781 24        INC     H
2782 56        LD      D,(HL)
2783 24        INC     H
2784 50        LD      D,B
2785 24        INC     H
2786 5E        LD      E,(HL)
2787 24        INC     H
2788 6E        LD      L,(HL)
2789 24        INC     H
278a A2        AND     D
278b 24        INC     H
278c 6E        LD      L,(HL)
278d 24        INC     H
278e 6E        LD      L,(HL)
278f 24        INC     H
2790 FB        EI      
2791 24        INC     H
2792 2A2515    LD      HL,(1525H)
2795 25        DEC     H
2796 2125A5    LD      HL,0A525H
2799 25        DEC     H
279a C7        RST     00H
279b 25        DEC     H
279c AD        XOR     L
279d 25        DEC     H
279e BF        CP      A
279f 25        DEC     H
27a0 F2250E    JP      P,0E25H
27a3 26FA      LD      H,0FAH
27a5 25        DEC     H
27a6 0626      LD      B,26H
27a8 5B        LD      E,E
27a9 266F      LD      H,6FH
27ab 2678      LD      H,78H
27ad 2678      LD      H,78H
27af 267C      LD      H,7CH
27b1 2698      LD      H,98H
27b3 26A3      LD      H,0A3H
27b5 26A3      LD      H,0A3H
27b7 2629      LD      H,29H
27b9 24        INC     H
27ba 39        ADD     HL,SP
27bb 24        INC     H
27bc 3C        INC     A
27bd 24        INC     H
27be 4B        LD      C,E
27bf 24        INC     H
27c0 C5        PUSH    BC
27c1 1163C4    LD      DE,0C463H
27c4 3E01      LD      A,01H
27c6 063F      LD      B,3FH
27c8 CDE036    CALL    36E0H
27cb C1        POP     BC
27cc CD0428    CALL    2804H
27cf FB        EI      
27d0 DBB8      IN      A,(0B8H)
27d2 E602      AND     02H
27d4 C8        RET     Z

27d5 DBB0      IN      A,(0B0H)
27d7 C9        RET     

27d8 C5        PUSH    BC
27d9 D5        PUSH    DE
27da E5        PUSH    HL
27db 3E01      LD      A,01H
27dd F3        DI      
27de CDB836    CALL    36B8H
27e1 FB        EI      
27e2 F5        PUSH    AF
27e3 CDE11C    CALL    1CE1H
27e6 F1        POP     AF
27e7 C2531D    JP      NZ,1D53H
27ea CD571D    CALL    1D57H
27ed 18EC      JR      27DBH            ; (-14H)
27ef C5        PUSH    BC
27f0 D5        PUSH    DE
27f1 E5        PUSH    HL
27f2 F5        PUSH    AF
27f3 DBB8      IN      A,(0B8H)
27f5 E601      AND     01H
27f7 2005      JR      NZ,27FEH         ; (+05H)
27f9 CD571D    CALL    1D57H
27fc 18F5      JR      27F3H            ; (-0bH)
27fe F1        POP     AF
27ff D3B0      OUT     (0B0H),A
2801 C3531D    JP      1D53H
2804 CD1E29    CALL    291EH
2807 D333      OUT     (33H),A
2809 C9        RET     

280a 0608      LD      B,08H
280c CB21      SLA     C
280e 1F        RRA     
280f 10FB      DJNZ    280CH            ; (-05H)
2811 F5        PUSH    AF
2812 C5        PUSH    BC
2813 0E00      LD      C,00H
2815 180C      JR      2823H            ; (+0cH)
2817 F5        PUSH    AF
2818 C5        PUSH    BC
2819 CDC31D    CALL    1DC3H
281c 3835      JR      C,2853H          ; (+35H)
281e 05        DEC     B
281f 2832      JR      Z,2853H          ; (+32H)
2821 0E01      LD      C,01H
2823 47        LD      B,A
2824 0D        DEC     C
2825 F5        PUSH    AF
2826 AF        XOR     A
2827 D342      OUT     (42H),A
2829 DB44      IN      A,(44H)
282b E620      AND     20H
282d 2807      JR      Z,2836H          ; (+07H)
282f F1        POP     AF
2830 F5        PUSH    AF
2831 CC571D    CALL    Z,1D57H
2834 18F3      JR      2829H            ; (-0dH)
2836 F1        POP     AF
2837 78        LD      A,B
2838 F3        DI      
2839 D340      OUT     (40H),A
283b 3E01      LD      A,01H
283d 3273FA    LD      (0FA73H),A
2840 3EFB      LD      A,0FBH
2842 D343      OUT     (43H),A
2844 3EFF      LD      A,0FFH
2846 D343      OUT     (43H),A
2848 DB44      IN      A,(44H)
284a E610      AND     10H
284c 20FA      JR      NZ,2848H         ; (-06H)
284e 3E01      LD      A,01H
2850 D342      OUT     (42H),A
2852 FB        EI      
2853 C1        POP     BC
2854 F1        POP     AF
2855 C9        RET     

2856 3EF7      LD      A,0F7H
2858 D343      OUT     (43H),A
285a 3D        DEC     A
285b 20FD      JR      NZ,285AH         ; (-03H)
285d 3EFF      LD      A,0FFH
285f D343      OUT     (43H),A
2861 C9        RET     

2862 C5        PUSH    BC
2863 D5        PUSH    DE
2864 E5        PUSH    HL
2865 F5        PUSH    AF
2866 0637      LD      B,37H
2868 CD2029    CALL    2920H
286b CD5429    CALL    2954H
286e C3521D    JP      1D52H
2871 C5        PUSH    BC
2872 D5        PUSH    DE
2873 E5        PUSH    HL
2874 CDAE1B    CALL    1BAEH
2877 CB4F      BIT     1,A
2879 2011      JR      NZ,288CH         ; (+11H)
287b DBB8      IN      A,(0B8H)
287d 47        LD      B,A
287e E638      AND     38H
2880 202F      JR      NZ,28B1H         ; (+2fH)
2882 78        LD      A,B
2883 E602      AND     02H
2885 28ED      JR      Z,2874H          ; (-13H)
2887 DBB0      IN      A,(0B0H)
2889 C3531D    JP      1D53H
288c 3AEBFA    LD      A,(0FAEBH)
288f B7        OR      A
2890 CC0F47    CALL    Z,470FH
2893 CDBD28    CALL    28BDH
2896 0637      LD      B,37H
2898 CD2029    CALL    2920H
289b D333      OUT     (33H),A
289d 3A23FB    LD      A,(0FB23H)
28a0 B7        OR      A
28a1 C2485C    JP      NZ,5C48H
28a4 32D7FA    LD      (0FAD7H),A
28a7 CD5947    CALL    4759H
28aa CD9A1D    CALL    1D9AH
28ad FB        EI      
28ae C3A447    JP      47A4H
28b1 CD6228    CALL    2862H
28b4 3AEAFA    LD      A,(0FAEAH)
28b7 3C        INC     A
28b8 C2531D    JP      NZ,1D53H
28bb 18B7      JR      2874H            ; (-49H)
28bd C5        PUSH    BC
28be D5        PUSH    DE
28bf E5        PUSH    HL
28c0 F5        PUSH    AF
28c1 3E1A      LD      A,1AH
28c3 CD4F29    CALL    294FH
28c6 18A6      JR      286EH            ; (-5aH)
28c8 C5        PUSH    BC
28c9 D5        PUSH    DE
28ca E5        PUSH    HL
28cb F5        PUSH    AF
28cc CD5429    CALL    2954H
28cf CDDC28    CALL    28DCH
28d2 0633      LD      B,33H
28d4 CD2029    CALL    2920H
28d7 CDDC28    CALL    28DCH
28da 1892      JR      286EH            ; (-6eH)
28dc 010040    LD      BC,4000H
28df CDAE1B    CALL    1BAEH
28e2 2F        CPL     
28e3 CB4F      BIT     1,A
28e5 C8        RET     Z

28e6 E3        EX      (SP),HL
28e7 E3        EX      (SP),HL
28e8 0B        DEC     BC
28e9 78        LD      A,B
28ea B1        OR      C
28eb 20F2      JR      NZ,28DFH         ; (-0eH)
28ed C9        RET     

28ee CDF128    CALL    28F1H
28f1 C5        PUSH    BC
28f2 D5        PUSH    DE
28f3 E5        PUSH    HL
28f4 F5        PUSH    AF
28f5 DBB8      IN      A,(0B8H)
28f7 0F        RRCA    
28f8 380C      JR      C,2906H          ; (+0cH)
28fa CDAE1B    CALL    1BAEH
28fd CB4F      BIT     1,A
28ff 28F4      JR      Z,28F5H          ; (-0cH)
2901 CD0C29    CALL    290CH
2904 1890      JR      2896H            ; (-70H)
2906 F1        POP     AF
2907 D3B0      OUT     (0B0H),A
2909 C3531D    JP      1D53H
290c C5        PUSH    BC
290d D5        PUSH    DE
290e E5        PUSH    HL
290f F5        PUSH    AF
2910 01E803    LD      BC,03E8H
2913 CDDF28    CALL    28DFH
2916 3E3A      LD      A,3AH
2918 18A9      JR      28C3H            ; (-57H)
291a 0611      LD      B,11H
291c 1802      JR      2920H            ; (+02H)
291e 0637      LD      B,37H
2920 D331      OUT     (31H),A
2922 CD2529    CALL    2925H
2925 3E92      LD      A,92H
2927 D3B8      OUT     (0B8H),A
2929 D3B8      OUT     (0B8H),A
292b 3E40      LD      A,40H
292d D3B8      OUT     (0B8H),A
292f 3ECE      LD      A,0CEH
2931 D3B8      OUT     (0B8H),A
2933 78        LD      A,B
2934 D3B8      OUT     (0B8H),A
2936 D331      OUT     (31H),A
2938 C9        RET     

2939 E5        PUSH    HL
293a 3A97C6    LD      A,(0C697H)
293d C602      ADD     A,02H
293f 67        LD      H,A
2940 2E1E      LD      L,1EH
2942 3A7FFA    LD      A,(0FA7FH)
2945 EE0A      XOR     0AH
2947 327FFA    LD      (0FA7FH),A
294a CDC05F    CALL    5FC0H
294d E1        POP     HL
294e C9        RET     

294f AF        XOR     A
2950 0E33      LD      C,33H
2952 1804      JR      2958H            ; (+04H)
2954 3E08      LD      A,08H
2956 0E31      LD      C,31H
2958 0608      LD      B,08H
295a ED79      OUT     (C),A
295c C9        RET     

295d C5        PUSH    BC
295e D5        PUSH    DE
295f E5        PUSH    HL
2960 F5        PUSH    AF
2961 210000    LD      HL,0000H
2964 22AFFA    LD      (0FAAFH),HL
2967 2123C6    LD      HL,0C623H
296a 066F      LD      B,6FH
296c 3600      LD      (HL),00H
296e 23        INC     HL
296f 10FB      DJNZ    296CH            ; (-05H)
2971 11A3C4    LD      DE,0C4A3H
2974 3E03      LD      A,03H
2976 067F      LD      B,7FH
2978 4F        LD      C,A
2979 218000    LD      HL,0080H
297c E5        PUSH    HL
297d D5        PUSH    DE
297e C5        PUSH    BC
297f F5        PUSH    AF
2980 3D        DEC     A
2981 CDE036    CALL    36E0H
2984 F1        POP     AF
2985 C605      ADD     A,05H
2987 1E00      LD      E,00H
2989 CDC929    CALL    29C9H
298c D604      SUB     04H
298e C1        POP     BC
298f C5        PUSH    BC
2990 F5        PUSH    AF
2991 3E03      LD      A,03H
2993 91        SUB     C
2994 2E0F      LD      L,0FH
2996 CD0B2E    CALL    2E0BH
2999 EB        EX      DE,HL
299a 21BD29    LD      HL,29BDH
299d 010500    LD      BC,0005H
29a0 EDB0      LDIR    
29a2 F1        POP     AF
29a3 C1        POP     BC
29a4 E1        POP     HL
29a5 D1        POP     DE
29a6 0D        DEC     C
29a7 2804      JR      Z,29ADH          ; (+04H)
29a9 19        ADD     HL,DE
29aa EB        EX      DE,HL
29ab 18CF      JR      297CH            ; (-31H)
29ad 3E07      LD      A,07H
29af 1E38      LD      E,38H
29b1 CDC929    CALL    29C9H
29b4 C3521D    JP      1D52H
29b7 F3        DI      
29b8 CD5D29    CALL    295DH
29bb FB        EI      
29bc C9        RET     

29bd 04        INC     B
29be 04        INC     B
29bf 78        LD      A,B
29c0 C8        RET     Z

29c1 FF        RST     38H
29c2 D323      OUT     (23H),A
29c4 F5        PUSH    AF
29c5 DB22      IN      A,(22H)
29c7 57        LD      D,A
29c8 F1        POP     AF
29c9 D323      OUT     (23H),A
29cb F5        PUSH    AF
29cc 7B        LD      A,E
29cd D321      OUT     (21H),A
29cf F1        POP     AF
29d0 C9        RET     

29d1 CDB729    CALL    29B7H
29d4 AF        XOR     A
29d5 1E55      LD      E,55H
29d7 CDC929    CALL    29C9H
29da 5F        LD      E,A
29db 3C        INC     A
29dc CDC929    CALL    29C9H
29df 1E3E      LD      E,3EH
29e1 3E07      LD      A,07H
29e3 CDC929    CALL    29C9H
29e6 5F        LD      E,A
29e7 3C        INC     A
29e8 CDC929    CALL    29C9H
29eb 010040    LD      BC,4000H
29ee 0B        DEC     BC
29ef 78        LD      A,B
29f0 B1        OR      C
29f1 20FB      JR      NZ,29EEH         ; (-05H)
29f3 18C2      JR      29B7H            ; (-3eH)
29f5 47        LD      B,A
29f6 CD012E    CALL    2E01H
29f9 2B        DEC     HL
29fa 56        LD      D,(HL)
29fb 2B        DEC     HL
29fc 5E        LD      E,(HL)
29fd 1B        DEC     DE
29fe 73        LD      (HL),E
29ff 23        INC     HL
2a00 72        LD      (HL),D
2a01 7A        LD      A,D
2a02 B3        OR      E
2a03 C0        RET     NZ

2a04 3E03      LD      A,03H
2a06 90        SUB     B
2a07 47        LD      B,A
2a08 C602      ADD     A,02H
2a0a 32AEFA    LD      (0FAAEH),A
2a0d CDA52A    CALL    2AA5H
2a10 3C        INC     A
2a11 285E      JR      Z,2A71H          ; (+5eH)
2a13 3D        DEC     A
2a14 57        LD      D,A
2a15 E6E0      AND     0E0H
2a17 07        RLCA    
2a18 07        RLCA    
2a19 07        RLCA    
2a1a 4F        LD      C,A
2a1b 3E1F      LD      A,1FH
2a1d A2        AND     D
2a1e 77        LD      (HL),A
2a1f CDA52A    CALL    2AA5H
2a22 2B        DEC     HL
2a23 77        LD      (HL),A
2a24 0C        INC     C
2a25 0D        DEC     C
2a26 C8        RET     Z

2a27 CDA52A    CALL    2AA5H
2a2a 57        LD      D,A
2a2b E6C0      AND     0C0H
2a2d 2011      JR      NZ,2A40H         ; (+11H)
2a2f CDA52A    CALL    2AA5H
2a32 5F        LD      E,A
2a33 78        LD      A,B
2a34 07        RLCA    
2a35 CDC929    CALL    29C9H
2a38 3C        INC     A
2a39 5A        LD      E,D
2a3a CDC929    CALL    29C9H
2a3d 0D        DEC     C
2a3e 18E5      JR      2A25H            ; (-1bH)
2a40 67        LD      H,A
2a41 E680      AND     80H
2a43 2811      JR      Z,2A56H          ; (+11H)
2a45 5A        LD      E,D
2a46 78        LD      A,B
2a47 C608      ADD     A,08H
2a49 CDC929    CALL    29C9H
2a4c 3E10      LD      A,10H
2a4e A3        AND     E
2a4f 2805      JR      Z,2A56H          ; (+05H)
2a51 3E0D      LD      A,0DH
2a53 CDC929    CALL    29C9H
2a56 3E40      LD      A,40H
2a58 A4        AND     H
2a59 28CA      JR      Z,2A25H          ; (-36H)
2a5b CDA52A    CALL    2AA5H
2a5e 57        LD      D,A
2a5f CDA52A    CALL    2AA5H
2a62 5F        LD      E,A
2a63 3E0B      LD      A,0BH
2a65 CDC929    CALL    29C9H
2a68 3C        INC     A
2a69 5A        LD      E,D
2a6a CDC929    CALL    29C9H
2a6d 0D        DEC     C
2a6e 0D        DEC     C
2a6f 18B4      JR      2A25H            ; (-4cH)
2a71 78        LD      A,B
2a72 C608      ADD     A,08H
2a74 1E00      LD      E,00H
2a76 CDC929    CALL    29C9H
2a79 04        INC     B
2a7a 21AFFA    LD      HL,0FAAFH
2a7d AF        XOR     A
2a7e 37        SCF     
2a7f 17        RLA     
2a80 10FD      DJNZ    2A7FH            ; (-03H)
2a82 A6        AND     (HL)
2a83 AE        XOR     (HL)
2a84 77        LD      (HL),A
2a85 3AAFFA    LD      A,(0FAAFH)
2a88 B7        OR      A
2a89 C0        RET     NZ

2a8a 21B0FA    LD      HL,0FAB0H
2a8d 7E        LD      A,(HL)
2a8e B7        OR      A
2a8f C8        RET     Z

2a90 35        DEC     (HL)
2a91 0603      LD      B,03H
2a93 78        LD      A,B
2a94 CD012E    CALL    2E01H
2a97 2B        DEC     HL
2a98 3600      LD      (HL),00H
2a9a 2B        DEC     HL
2a9b 3601      LD      (HL),01H
2a9d 10F4      DJNZ    2A93H            ; (-0cH)
2a9f 3E07      LD      A,07H
2aa1 32AFFA    LD      (0FAAFH),A
2aa4 C9        RET     

2aa5 3AAEFA    LD      A,(0FAAEH)
2aa8 C5        PUSH    BC
2aa9 D5        PUSH    DE
2aaa E5        PUSH    HL
2aab CDB836    CALL    36B8H
2aae C3531D    JP      1D53H
2ab1 C5        PUSH    BC
2ab2 D5        PUSH    DE
2ab3 47        LD      B,A
2ab4 F3        DI      
2ab5 3E07      LD      A,07H
2ab7 D323      OUT     (23H),A
2ab9 DB22      IN      A,(22H)
2abb 4F        LD      C,A
2abc 3E3F      LD      A,3FH
2abe D321      OUT     (21H),A
2ac0 3E0E      LD      A,0EH
2ac2 D323      OUT     (23H),A
2ac4 DB22      IN      A,(22H)
2ac6 2F        CPL     
2ac7 57        LD      D,A
2ac8 3E0F      LD      A,0FH
2aca D323      OUT     (23H),A
2acc DB22      IN      A,(22H)
2ace 2F        CPL     
2acf 07        RLCA    
2ad0 07        RLCA    
2ad1 07        RLCA    
2ad2 5F        LD      E,A
2ad3 78        LD      A,B
2ad4 3D        DEC     A
2ad5 2003      JR      NZ,2ADAH         ; (+03H)
2ad7 7B        LD      A,E
2ad8 07        RLCA    
2ad9 5F        LD      E,A
2ada 7B        LD      A,E
2adb E610      AND     10H
2add 5F        LD      E,A
2ade 78        LD      A,B
2adf 3D        DEC     A
2ae0 2806      JR      Z,2AE8H          ; (+06H)
2ae2 7A        LD      A,D
2ae3 07        RLCA    
2ae4 07        RLCA    
2ae5 07        RLCA    
2ae6 07        RLCA    
2ae7 57        LD      D,A
2ae8 7A        LD      A,D
2ae9 E60F      AND     0FH
2aeb B3        OR      E
2aec 5F        LD      E,A
2aed 3E07      LD      A,07H
2aef D323      OUT     (23H),A
2af1 79        LD      A,C
2af2 D321      OUT     (21H),A
2af4 7B        LD      A,E
2af5 D1        POP     DE
2af6 C1        POP     BC
2af7 FB        EI      
2af8 C9        RET     

2af9 CD3716    CALL    1637H
2afc 3AB2C6    LD      A,(0C6B2H)
2aff 3D        DEC     A
2b00 BB        CP      E
2b01 DA880B    JP      C,0B88H
2b04 D5        PUSH    DE
2b05 CF        RST     08H
2b06 2C        INC     L
2b07 CD3716    CALL    1637H
2b0a 3A00FA    LD      A,(0FA00H)
2b0d 4F        LD      C,A
2b0e 7B        LD      A,E
2b0f B9        CP      C
2b10 D2880B    JP      NC,0B88H
2b13 3C        INC     A
2b14 E3        EX      (SP),HL
2b15 2C        INC     L
2b16 65        LD      H,L
2b17 6F        LD      L,A
2b18 CDB11E    CALL    1EB1H
2b1b E1        POP     HL
2b1c C9        RET     

2b1d EB        EX      DE,HL
2b1e 2AA8C6    LD      HL,(0C6A8H)
2b21 EB        EX      DE,HL
2b22 14        INC     D
2b23 FE2C      CP      2CH
2b25 2814      JR      Z,2B3BH          ; (+14H)
2b27 CD922B    CALL    2B92H
2b2a F5        PUSH    AF
2b2b 3C        INC     A
2b2c 5F        LD      E,A
2b2d 3A00FA    LD      A,(0FA00H)
2b30 BB        CP      E
2b31 3001      JR      NC,2B34H         ; (+01H)
2b33 5F        LD      E,A
2b34 F1        POP     AF
2b35 7A        LD      A,D
2b36 2003      JR      NZ,2B3BH         ; (+03H)
2b38 F5        PUSH    AF
2b39 180B      JR      2B46H            ; (+0bH)
2b3b CF        RST     08H
2b3c 2C        INC     L
2b3d FE2C      CP      2CH
2b3f 2811      JR      Z,2B52H          ; (+11H)
2b41 CD922B    CALL    2B92H
2b44 F5        PUSH    AF
2b45 83        ADD     A,E
2b46 BB        CP      E
2b47 CA880B    JP      Z,0B88H
2b4a DA880B    JP      C,0B88H
2b4d 3D        DEC     A
2b4e 57        LD      D,A
2b4f F1        POP     AF
2b50 2827      JR      Z,2B79H          ; (+27H)
2b52 CF        RST     08H
2b53 2C        INC     L
2b54 FE2C      CP      2CH
2b56 280F      JR      Z,2B67H          ; (+0fH)
2b58 CD922B    CALL    2B92H
2b5b F5        PUSH    AF
2b5c FE02      CP      02H
2b5e D2880B    JP      NC,0B88H
2b61 F1        POP     AF
2b62 32ACC6    LD      (0C6ACH),A
2b65 2812      JR      Z,2B79H          ; (+12H)
2b67 CF        RST     08H
2b68 2C        INC     L
2b69 CD922B    CALL    2B92H
2b6c F5        PUSH    AF
2b6d FE02      CP      02H
2b6f D2880B    JP      NC,0B88H
2b72 3201FA    LD      (0FA01H),A
2b75 F1        POP     AF
2b76 C25F05    JP      NZ,055FH
2b79 E5        PUSH    HL
2b7a CD9A2B    CALL    2B9AH
2b7d 3AAEC6    LD      A,(0C6AEH)
2b80 47        LD      B,A
2b81 3AABC6    LD      A,(0C6ABH)
2b84 B8        CP      B
2b85 3007      JR      NC,2B8EH         ; (+07H)
2b87 2AAEC6    LD      HL,(0C6AEH)
2b8a 6F        LD      L,A
2b8b CDB11E    CALL    1EB1H
2b8e E1        POP     HL
2b8f C31E20    JP      201EH
2b92 D5        PUSH    DE
2b93 C5        PUSH    BC
2b94 CD3716    CALL    1637H
2b97 C1        POP     BC
2b98 D1        POP     DE
2b99 C9        RET     

2b9a C5        PUSH    BC
2b9b E5        PUSH    HL
2b9c 3AACC6    LD      A,(0C6ACH)
2b9f 47        LD      B,A
2ba0 3A00FA    LD      A,(0FA00H)
2ba3 90        SUB     B
2ba4 EB        EX      DE,HL
2ba5 BD        CP      L
2ba6 3001      JR      NC,2BA9H         ; (+01H)
2ba8 6F        LD      L,A
2ba9 80        ADD     A,B
2baa BC        CP      H
2bab 3002      JR      NC,2BAFH         ; (+02H)
2bad 67        LD      H,A
2bae BC        CP      H
2baf 22A8C6    LD      (0C6A8H),HL
2bb2 2008      JR      NZ,2BBCH         ; (+08H)
2bb4 90        SUB     B
2bb5 47        LD      B,A
2bb6 CDF420    CALL    20F4H
2bb9 3001      JR      NC,2BBCH         ; (+01H)
2bbb 60        LD      H,B
2bbc 22AAC6    LD      (0C6AAH),HL
2bbf E1        POP     HL
2bc0 C1        POP     BC
2bc1 C9        RET     

2bc2 CA7405    JP      Z,0574H
2bc5 FE2C      CP      2CH
2bc7 280A      JR      Z,2BD3H          ; (+0aH)
2bc9 CD922B    CALL    2B92H
2bcc CD1F2C    CALL    2C1FH
2bcf 3299C6    LD      (0C699H),A
2bd2 C8        RET     Z

2bd3 CF        RST     08H
2bd4 2C        INC     L
2bd5 FE2C      CP      2CH
2bd7 280A      JR      Z,2BE3H          ; (+0aH)
2bd9 CD922B    CALL    2B92H
2bdc CD1F2C    CALL    2C1FH
2bdf 329AC6    LD      (0C69AH),A
2be2 C8        RET     Z

2be3 CF        RST     08H
2be4 2C        INC     L
2be5 CD3716    CALL    1637H
2be8 3D        DEC     A
2be9 FE02      CP      02H
2beb 3070      JR      NC,2C5DH         ; (+70H)
2bed E5        PUSH    HL
2bee 219BC6    LD      HL,0C69BH
2bf1 87        ADD     A,A
2bf2 BE        CP      (HL)
2bf3 2841      JR      Z,2C36H          ; (+41H)
2bf5 77        LD      (HL),A
2bf6 2A96C6    LD      HL,(0C696H)
2bf9 7C        LD      A,H
2bfa C602      ADD     A,02H
2bfc 67        LD      H,A
2bfd E620      AND     20H
2bff 2804      JR      Z,2C05H          ; (+04H)
2c01 7C        LD      A,H
2c02 C616      ADD     A,16H
2c04 67        LD      H,A
2c05 2E00      LD      L,00H
2c07 010002    LD      BC,0200H
2c0a 3A98C6    LD      A,(0C698H)
2c0d FE02      CP      02H
2c0f 381B      JR      C,2C2CH          ; (+1bH)
2c11 E5        PUSH    HL
2c12 D1        POP     DE
2c13 13        INC     DE
2c14 0B        DEC     BC
2c15 7E        LD      A,(HL)
2c16 EE02      XOR     02H
2c18 77        LD      (HL),A
2c19 EDB0      LDIR    
2c1b 3E03      LD      A,03H
2c1d 1817      JR      2C36H            ; (+17H)
2c1f C5        PUSH    BC
2c20 F5        PUSH    AF
2c21 4F        LD      C,A
2c22 FE09      CP      09H
2c24 3802      JR      C,2C28H          ; (+02H)
2c26 0E08      LD      C,08H
2c28 F1        POP     AF
2c29 79        LD      A,C
2c2a C1        POP     BC
2c2b C9        RET     

2c2c 7E        LD      A,(HL)
2c2d EE02      XOR     02H
2c2f 77        LD      (HL),A
2c30 23        INC     HL
2c31 0D        DEC     C
2c32 20F8      JR      NZ,2C2CH         ; (-08H)
2c34 10F6      DJNZ    2C2CH            ; (-0aH)
2c36 E1        POP     HL
2c37 C9        RET     

2c38 C25F05    JP      NZ,055FH
2c3b E5        PUSH    HL
2c3c CDF937    CALL    37F9H
2c3f CDA726    CALL    26A7H
2c42 E1        POP     HL
2c43 C9        RET     

2c44 CA7405    JP      Z,0574H
2c47 F5        PUSH    AF
2c48 0EFF      LD      C,0FFH
2c4a 3A95C6    LD      A,(0C695H)
2c4d 57        LD      D,A
2c4e 3A96C6    LD      A,(0C696H)
2c51 5F        LD      E,A
2c52 F1        POP     AF
2c53 FE2C      CP      2CH
2c55 280E      JR      Z,2C65H          ; (+0eH)
2c57 CD922B    CALL    2B92H
2c5a 3D        DEC     A
2c5b FE04      CP      04H
2c5d D2880B    JP      NC,0B88H
2c60 4F        LD      C,A
2c61 2B        DEC     HL
2c62 D7        RST     10H
2c63 2814      JR      Z,2C79H          ; (+14H)
2c65 CF        RST     08H
2c66 2C        INC     L
2c67 FE2C      CP      2CH
2c69 2808      JR      Z,2C73H          ; (+08H)
2c6b CDAE2C    CALL    2CAEH
2c6e 57        LD      D,A
2c6f 2B        DEC     HL
2c70 D7        RST     10H
2c71 2806      JR      Z,2C79H          ; (+06H)
2c73 CF        RST     08H
2c74 2C        INC     L
2c75 CDAE2C    CALL    2CAEH
2c78 5F        LD      E,A
2c79 E5        PUSH    HL
2c7a 3A95C6    LD      A,(0C695H)
2c7d BA        CP      D
2c7e 7A        LD      A,D
2c7f C49721    CALL    NZ,2197H
2c82 3A96C6    LD      A,(0C696H)
2c85 BB        CP      E
2c86 7B        LD      A,E
2c87 C46421    CALL    NZ,2164H
2c8a E1        POP     HL
2c8b 79        LD      A,C
2c8c 3C        INC     A
2c8d C8        RET     Z

2c8e 3A98C6    LD      A,(0C698H)
2c91 B9        CP      C
2c92 C8        RET     Z

2c93 79        LD      A,C
2c94 CDFA20    CALL    20FAH
2c97 3A96C6    LD      A,(0C696H)
2c9a FE01      CP      01H
2c9c 200B      JR      NZ,2CA9H         ; (+0bH)
2c9e F5        PUSH    AF
2c9f 3A98C6    LD      A,(0C698H)
2ca2 3206C7    LD      (0C706H),A
2ca5 CD6421    CALL    2164H
2ca8 F1        POP     AF
2ca9 BB        CP      E
2caa C46421    CALL    NZ,2164H
2cad C9        RET     

2cae CD922B    CALL    2B92H
2cb1 3D        DEC     A
2cb2 E5        PUSH    HL
2cb3 2192C6    LD      HL,0C692H
2cb6 BE        CP      (HL)
2cb7 E1        POP     HL
2cb8 30A3      JR      NC,2C5DH         ; (-5dH)
2cba C9        RET     

2cbb D7        RST     10H
2cbc CF        RST     08H
2cbd 28CD      JR      Z,2C8CH          ; (-33H)
2cbf 37        SCF     
2cc0 163C      LD      D,3CH
2cc2 57        LD      D,A
2cc3 CF        RST     08H
2cc4 2C        INC     L
2cc5 CD922B    CALL    2B92H
2cc8 3C        INC     A
2cc9 5F        LD      E,A
2cca CF        RST     08H
2ccb 29        ADD     HL,HL
2ccc E5        PUSH    HL
2ccd EB        EX      DE,HL
2cce CD111F    CALL    1F11H
2cd1 CD841F    CALL    1F84H
2cd4 CD0614    CALL    1406H
2cd7 E1        POP     HL
2cd8 C9        RET     

2cd9 CA5F05    JP      Z,055FH
2cdc CD3716    CALL    1637H
2cdf FE10      CP      10H
2ce1 D4880B    CALL    NC,0B88H
2ce4 F5        PUSH    AF
2ce5 CF        RST     08H
2ce6 2C        INC     L
2ce7 CD3716    CALL    1637H
2cea C25F05    JP      NZ,055FH
2ced F1        POP     AF
2cee C3C929    JP      29C9H
2cf1 E5        PUSH    HL
2cf2 3E00      LD      A,00H
2cf4 32A5FA    LD      (0FAA5H),A
2cf7 21F6FF    LD      HL,0FFF6H
2cfa 39        ADD     HL,SP
2cfb 22A6FA    LD      (0FAA6H),HL
2cfe E1        POP     HL
2cff 3E03      LD      A,03H
2d01 F5        PUSH    AF
2d02 CC7405    CALL    Z,0574H
2d05 CD9B10    CALL    109BH
2d08 E3        EX      (SP),HL
2d09 E5        PUSH    HL
2d0a CD8F42    CALL    428FH
2d0d CDF44D    CALL    4DF4H
2d10 7B        LD      A,E
2d11 B7        OR      A
2d12 2004      JR      NZ,2D18H         ; (+04H)
2d14 C1        POP     BC
2d15 E1        POP     HL
2d16 181A      JR      2D32H            ; (+1aH)
2d18 F1        POP     AF
2d19 F5        PUSH    AF
2d1a CD012E    CALL    2E01H
2d1d 73        LD      (HL),E
2d1e 23        INC     HL
2d1f 72        LD      (HL),D
2d20 23        INC     HL
2d21 71        LD      (HL),C
2d22 23        INC     HL
2d23 54        LD      D,H
2d24 5D        LD      E,L
2d25 011C00    LD      BC,001CH
2d28 09        ADD     HL,BC
2d29 EB        EX      DE,HL
2d2a 73        LD      (HL),E
2d2b 23        INC     HL
2d2c 72        LD      (HL),D
2d2d C1        POP     BC
2d2e E1        POP     HL
2d2f 05        DEC     B
2d30 2814      JR      Z,2D46H          ; (+14H)
2d32 2B        DEC     HL
2d33 D7        RST     10H
2d34 2805      JR      Z,2D3BH          ; (+05H)
2d36 C5        PUSH    BC
2d37 CF        RST     08H
2d38 2C        INC     L
2d39 18C7      JR      2D02H            ; (-39H)
2d3b 3E03      LD      A,03H
2d3d 90        SUB     B
2d3e 32A8FA    LD      (0FAA8H),A
2d41 CD1E2E    CALL    2E1EH
2d44 10F5      DJNZ    2D3BH            ; (-0bH)
2d46 E5        PUSH    HL
2d47 0603      LD      B,03H
2d49 C5        PUSH    BC
2d4a 3E03      LD      A,03H
2d4c 90        SUB     B
2d4d 32A8FA    LD      (0FAA8H),A
2d50 CD3E2E    CALL    2E3EH
2d53 DACE2D    JP      C,2DCEH
2d56 78        LD      A,B
2d57 CD012E    CALL    2E01H
2d5a 7E        LD      A,(HL)
2d5b B7        OR      A
2d5c CACE2D    JP      Z,2DCEH
2d5f 32ABFA    LD      (0FAABH),A
2d62 23        INC     HL
2d63 5E        LD      E,(HL)
2d64 23        INC     HL
2d65 56        LD      D,(HL)
2d66 23        INC     HL
2d67 ED53ACFA  LD      (0FAACH),DE
2d6b 5E        LD      E,(HL)
2d6c 23        INC     HL
2d6d 56        LD      D,(HL)
2d6e 23        INC     HL
2d6f E5        PUSH    HL
2d70 2E24      LD      L,24H
2d72 CD082E    CALL    2E08H
2d75 E5        PUSH    HL
2d76 2AA6FA    LD      HL,(0FAA6H)
2d79 2B        DEC     HL
2d7a C1        POP     BC
2d7b F3        DI      
2d7c CDDB46    CALL    46DBH
2d7f D1        POP     DE
2d80 60        LD      H,B
2d81 69        LD      L,C
2d82 F9        LD      SP,HL
2d83 FB        EI      
2d84 C3F732    JP      32F7H
2d87 3AABFA    LD      A,(0FAABH)
2d8a B7        OR      A
2d8b 2003      JR      NZ,2D90H         ; (+03H)
2d8d CD1E2E    CALL    2E1EH
2d90 3AA8FA    LD      A,(0FAA8H)
2d93 CD042E    CALL    2E04H
2d96 3AABFA    LD      A,(0FAABH)
2d99 77        LD      (HL),A
2d9a 23        INC     HL
2d9b ED5BACFA  LD      DE,(0FAACH)
2d9f 73        LD      (HL),E
2da0 23        INC     HL
2da1 72        LD      (HL),D
2da2 210000    LD      HL,0000H
2da5 39        ADD     HL,SP
2da6 EB        EX      DE,HL
2da7 2AA6FA    LD      HL,(0FAA6H)
2daa F3        DI      
2dab F9        LD      SP,HL
2dac C1        POP     BC
2dad C1        POP     BC
2dae C1        POP     BC
2daf E5        PUSH    HL
2db0 B7        OR      A
2db1 ED52      SBC     HL,DE
2db3 2817      JR      Z,2DCCH          ; (+17H)
2db5 3EF0      LD      A,0F0H
2db7 A5        AND     L
2db8 B4        OR      H
2db9 2042      JR      NZ,2DFDH         ; (+42H)
2dbb 2E24      LD      L,24H
2dbd CD082E    CALL    2E08H
2dc0 C1        POP     BC
2dc1 0B        DEC     BC
2dc2 CDDB46    CALL    46DBH
2dc5 E1        POP     HL
2dc6 2B        DEC     HL
2dc7 70        LD      (HL),B
2dc8 2B        DEC     HL
2dc9 71        LD      (HL),C
2dca 1802      JR      2DCEH            ; (+02H)
2dcc C1        POP     BC
2dcd C1        POP     BC
2dce FB        EI      
2dcf C1        POP     BC
2dd0 05        DEC     B
2dd1 C2492D    JP      NZ,2D49H
2dd4 F3        DI      
2dd5 3AD7FA    LD      A,(0FAD7H)
2dd8 FE03      CP      03H
2dda 281C      JR      Z,2DF8H          ; (+1cH)
2ddc 3AA5FA    LD      A,(0FAA5H)
2ddf 07        RLCA    
2de0 3807      JR      C,2DE9H          ; (+07H)
2de2 21B0FA    LD      HL,0FAB0H
2de5 34        INC     (HL)
2de6 CD852A    CALL    2A85H
2de9 FB        EI      
2dea 21A5FA    LD      HL,0FAA5H
2ded 7E        LD      A,(HL)
2dee F680      OR      80H
2df0 77        LD      (HL),A
2df1 FE83      CP      83H
2df3 C2472D    JP      NZ,2D47H
2df6 E1        POP     HL
2df7 C9        RET     

2df8 CDB729    CALL    29B7H
2dfb 18F9      JR      2DF6H            ; (-07H)
2dfd FB        EI      
2dfe CD880B    CALL    0B88H
2e01 2F        CPL     
2e02 C604      ADD     A,04H
2e04 2E02      LD      L,02H
2e06 1803      JR      2E0BH            ; (+03H)
2e08 3AA8FA    LD      A,(0FAA8H)
2e0b D5        PUSH    DE
2e0c 1123C6    LD      DE,0C623H
2e0f 2600      LD      H,00H
2e11 19        ADD     HL,DE
2e12 112500    LD      DE,0025H
2e15 B7        OR      A
2e16 2804      JR      Z,2E1CH          ; (+04H)
2e18 19        ADD     HL,DE
2e19 3D        DEC     A
2e1a 20FC      JR      NZ,2E18H         ; (-04H)
2e1c D1        POP     DE
2e1d C9        RET     

2e1e 3AA5FA    LD      A,(0FAA5H)
2e21 3C        INC     A
2e22 32A5FA    LD      (0FAA5H),A
2e25 1EFF      LD      E,0FFH
2e27 E5        PUSH    HL
2e28 C5        PUSH    BC
2e29 D5        PUSH    DE
2e2a CD3E2E    CALL    2E3EH
2e2d B7        OR      A
2e2e 28FA      JR      Z,2E2AH          ; (-06H)
2e30 3AA8FA    LD      A,(0FAA8H)
2e33 C602      ADD     A,02H
2e35 F3        DI      
2e36 CD9B36    CALL    369BH
2e39 FB        EI      
2e3a D1        POP     DE
2e3b C1        POP     BC
2e3c E1        POP     HL
2e3d C9        RET     

2e3e 3AA8FA    LD      A,(0FAA8H)
2e41 C602      ADD     A,02H
2e43 C5        PUSH    BC
2e44 CDF136    CALL    36F1H
2e47 C1        POP     BC
2e48 FE08      CP      08H
2e4a C9        RET     

2e4b 4D        LD      C,L
2e4c 2E41      LD      L,41H
2e4e 59        LD      E,C
2e4f 2F        CPL     
2e50 42        LD      B,D
2e51 59        LD      E,C
2e52 2F        CPL     
2e53 43        LD      B,E
2e54 59        LD      E,C
2e55 2F        CPL     
2e56 44        LD      B,H
2e57 59        LD      E,C
2e58 2F        CPL     
2e59 45        LD      B,L
2e5a 59        LD      E,C
2e5b 2F        CPL     
2e5c 46        LD      B,(HL)
2e5d 59        LD      E,C
2e5e 2F        CPL     
2e5f 47        LD      B,A
2e60 59        LD      E,C
2e61 2F        CPL     
2e62 CDBA2E    CALL    2EBAH
2e65 D6A2      SUB     0A2H
2e67 2ED3      LD      L,0D3H
2e69 DA2ECE    JP      C,0CE2EH
2e6c 3D        DEC     A
2e6d 2F        CPL     
2e6e CF        RST     08H
2e6f 0B        DEC     BC
2e70 2F        CPL     
2e71 D2182F    JP      NC,2F18H
2e74 D4FE2E    CALL    NC,2EFEH
2e77 CCE42E    CALL    Z,2EE4H
2e7a 00        NOP     
2e7b 1012      DJNZ    2E8FH            ; (+12H)
2e7d 14        INC     D
2e7e 1600      LD      D,00H
2e80 00        NOP     
2e81 02        LD      (BC),A
2e82 04        INC     B
2e83 0608      LD      B,08H
2e85 0A        LD      A,(BC)
2e86 0A        LD      A,(BC)
2e87 0C        INC     C
2e88 0E10      LD      C,10H
2e8a E8        RET     PE

2e8b 0E12      LD      C,12H
2e8d 0E48      LD      C,48H
2e8f 0D        DEC     C
2e90 89        ADC     A,C
2e91 0C        INC     C
2e92 D5        PUSH    DE
2e93 0B        DEC     BC
2e94 2B        DEC     HL
2e95 0B        DEC     BC
2e96 8A        ADC     A,D
2e97 0A        LD      A,(BC)
2e98 F3        DI      
2e99 09        ADD     HL,BC
2e9a 64        LD      H,H
2e9b 09        ADD     HL,BC
2e9c DD08      EX      AF,AF'
2e9e 5E        LD      E,(HL)
2e9f 08        EX      AF,AF'
2ea0 E607      AND     07H
2ea2 3802      JR      C,2EA6H          ; (+02H)
2ea4 1E08      LD      E,08H
2ea6 3E0F      LD      A,0FH
2ea8 BB        CP      E
2ea9 3850      JR      C,2EFBH          ; (+50H)
2eab AF        XOR     A
2eac B2        OR      D
2ead 204C      JR      NZ,2EFBH         ; (+4cH)
2eaf 2E12      LD      L,12H
2eb1 CD082E    CALL    2E08H
2eb4 3E40      LD      A,40H
2eb6 A6        AND     (HL)
2eb7 B3        OR      E
2eb8 77        LD      (HL),A
2eb9 C9        RET     

2eba 7B        LD      A,E
2ebb 3803      JR      C,2EC0H          ; (+03H)
2ebd 2F        CPL     
2ebe 3C        INC     A
2ebf 5F        LD      E,A
2ec0 B2        OR      D
2ec1 2838      JR      Z,2EFBH          ; (+38H)
2ec3 2E13      LD      L,13H
2ec5 CD082E    CALL    2E08H
2ec8 E5        PUSH    HL
2ec9 7E        LD      A,(HL)
2eca 23        INC     HL
2ecb 66        LD      H,(HL)
2ecc 6F        LD      L,A
2ecd E7        RST     20H
2ece E1        POP     HL
2ecf C8        RET     Z

2ed0 73        LD      (HL),E
2ed1 23        INC     HL
2ed2 72        LD      (HL),D
2ed3 2B        DEC     HL
2ed4 2B        DEC     HL
2ed5 3E40      LD      A,40H
2ed7 B6        OR      (HL)
2ed8 77        LD      (HL),A
2ed9 C9        RET     

2eda 7B        LD      A,E
2edb FE10      CP      10H
2edd 301C      JR      NC,2EFBH         ; (+1cH)
2edf F610      OR      10H
2ee1 5F        LD      E,A
2ee2 18C7      JR      2EABH            ; (-39H)
2ee4 3802      JR      C,2EE8H          ; (+02H)
2ee6 1E04      LD      E,04H
2ee8 7B        LD      A,E
2ee9 FE41      CP      41H
2eeb 300E      JR      NC,2EFBH         ; (+0eH)
2eed 2E10      LD      L,10H
2eef CD082E    CALL    2E08H
2ef2 AF        XOR     A
2ef3 B2        OR      D
2ef4 2005      JR      NZ,2EFBH         ; (+05H)
2ef6 B3        OR      E
2ef7 2802      JR      Z,2EFBH          ; (+02H)
2ef9 77        LD      (HL),A
2efa C9        RET     

2efb CD880B    CALL    0B88H
2efe 3802      JR      C,2F02H          ; (+02H)
2f00 1E78      LD      E,78H
2f02 7B        LD      A,E
2f03 FE20      CP      20H
2f05 38F4      JR      C,2EFBH          ; (-0cH)
2f07 2E11      LD      L,11H
2f09 18E4      JR      2EEFH            ; (-1cH)
2f0b 3802      JR      C,2F0FH          ; (+02H)
2f0d 1E04      LD      E,04H
2f0f 7B        LD      A,E
2f10 FE09      CP      09H
2f12 30E7      JR      NC,2EFBH         ; (-19H)
2f14 2E0F      LD      L,0FH
2f16 18D7      JR      2EEFH            ; (-29H)
2f18 3802      JR      C,2F1CH          ; (+02H)
2f1a 1E04      LD      E,04H
2f1c AF        XOR     A
2f1d B2        OR      D
2f1e 20DB      JR      NZ,2EFBH         ; (-25H)
2f20 B3        OR      E
2f21 28D8      JR      Z,2EFBH          ; (-28H)
2f23 FE41      CP      41H
2f25 30D4      JR      NC,2EFBH         ; (-2cH)
2f27 210000    LD      HL,0000H
2f2a E5        PUSH    HL
2f2b 2E10      LD      L,10H
2f2d CD082E    CALL    2E08H
2f30 E5        PUSH    HL
2f31 23        INC     HL
2f32 23        INC     HL
2f33 7E        LD      A,(HL)
2f34 32A9FA    LD      (0FAA9H),A
2f37 3680      LD      (HL),80H
2f39 2B        DEC     HL
2f3a 2B        DEC     HL
2f3b 187A      JR      2FB7H            ; (+7aH)
2f3d 30BC      JR      NC,2EFBH         ; (-44H)
2f3f AF        XOR     A
2f40 B2        OR      D
2f41 20B8      JR      NZ,2EFBH         ; (-48H)
2f43 B3        OR      E
2f44 28E1      JR      Z,2F27H          ; (-1fH)
2f46 FE61      CP      61H
2f48 30B1      JR      NC,2EFBH         ; (-4fH)
2f4a 4B        LD      C,E
2f4b 3E0C      LD      A,0CH
2f4d CD3023    CALL    2330H
2f50 59        LD      E,C
2f51 1C        INC     E
2f52 87        ADD     A,A
2f53 4F        LD      C,A
2f54 0600      LD      B,00H
2f56 C38E2F    JP      2F8EH
2f59 41        LD      B,C
2f5a 79        LD      A,C
2f5b D640      SUB     40H
2f5d 87        ADD     A,A
2f5e 4F        LD      C,A
2f5f CD4333    CALL    3343H
2f62 281C      JR      Z,2F80H          ; (+1cH)
2f64 FE23      CP      23H
2f66 2819      JR      Z,2F81H          ; (+19H)
2f68 FE2B      CP      2BH
2f6a 2815      JR      Z,2F81H          ; (+15H)
2f6c FE2D      CP      2DH
2f6e 2805      JR      Z,2F75H          ; (+05H)
2f70 CD6033    CALL    3360H
2f73 180B      JR      2F80H            ; (+0bH)
2f75 0D        DEC     C
2f76 78        LD      A,B
2f77 FE43      CP      43H
2f79 2804      JR      Z,2F7FH          ; (+04H)
2f7b FE46      CP      46H
2f7d 2001      JR      NZ,2F80H         ; (+01H)
2f7f 0D        DEC     C
2f80 0D        DEC     C
2f81 2E0F      LD      L,0FH
2f83 CD082E    CALL    2E08H
2f86 5E        LD      E,(HL)
2f87 0600      LD      B,00H
2f89 217B2E    LD      HL,2E7BH
2f8c 09        ADD     HL,BC
2f8d 4E        LD      C,(HL)
2f8e 218A2E    LD      HL,2E8AH
2f91 09        ADD     HL,BC
2f92 7B        LD      A,E
2f93 5E        LD      E,(HL)
2f94 23        INC     HL
2f95 56        LD      D,(HL)
2f96 3D        DEC     A
2f97 2809      JR      Z,2FA2H          ; (+09H)
2f99 CB3A      SRL     D
2f9b CB1B      RR      E
2f9d 18F7      JR      2F96H            ; (-09H)
2f9f CD880B    CALL    0B88H
2fa2 8B        ADC     A,E
2fa3 5F        LD      E,A
2fa4 8A        ADC     A,D
2fa5 93        SUB     E
2fa6 57        LD      D,A
2fa7 D5        PUSH    DE
2fa8 2E10      LD      L,10H
2faa CD082E    CALL    2E08H
2fad 4E        LD      C,(HL)
2fae E5        PUSH    HL
2faf CD4333    CALL    3343H
2fb2 2810      JR      Z,2FC4H          ; (+10H)
2fb4 CD7A33    CALL    337AH
2fb7 3E40      LD      A,40H
2fb9 BB        CP      E
2fba 38E3      JR      C,2F9FH          ; (-1dH)
2fbc AF        XOR     A
2fbd B2        OR      D
2fbe 20DF      JR      NZ,2F9FH         ; (-21H)
2fc0 B3        OR      E
2fc1 2801      JR      Z,2FC4H          ; (+01H)
2fc3 4B        LD      C,E
2fc4 E1        POP     HL
2fc5 1600      LD      D,00H
2fc7 42        LD      B,D
2fc8 23        INC     HL
2fc9 5E        LD      E,(HL)
2fca E5        PUSH    HL
2fcb CDD94F    CALL    4FD9H
2fce EB        EX      DE,HL
2fcf CDF94E    CALL    4EF9H
2fd2 216C30    LD      HL,306CH
2fd5 CDF44D    CALL    4DF4H
2fd8 CDC34C    CALL    4CC3H
2fdb CDB44E    CALL    4EB4H
2fde 54        LD      D,H
2fdf 5D        LD      E,L
2fe0 CD4333    CALL    3343H
2fe3 2816      JR      Z,2FFBH          ; (+16H)
2fe5 FE2E      CP      2EH
2fe7 200F      JR      NZ,2FF8H         ; (+0fH)
2fe9 CB3A      SRL     D
2feb CB1B      RR      E
2fed ED5A      ADC     HL,DE
2fef 3EE0      LD      A,0E0H
2ff1 A4        AND     H
2ff2 28EC      JR      Z,2FE0H          ; (-14H)
2ff4 AC        XOR     H
2ff5 67        LD      H,A
2ff6 1803      JR      2FFBH            ; (+03H)
2ff8 CD6033    CALL    3360H
2ffb 112D00    LD      DE,002DH
2ffe E7        RST     20H
2fff 3801      JR      C,3002H          ; (+01H)
3001 EB        EX      DE,HL
3002 01F7FF    LD      BC,0FFF7H
3005 E1        POP     HL
3006 E5        PUSH    HL
3007 09        ADD     HL,BC
3008 72        LD      (HL),D
3009 23        INC     HL
300a 73        LD      (HL),E
300b 23        INC     HL
300c 0E02      LD      C,02H
300e E3        EX      (SP),HL
300f 23        INC     HL
3010 5E        LD      E,(HL)
3011 7B        LD      A,E
3012 E6BF      AND     0BFH
3014 77        LD      (HL),A
3015 E3        EX      (SP),HL
3016 3E80      LD      A,80H
3018 B3        OR      E
3019 77        LD      (HL),A
301a 23        INC     HL
301b 0C        INC     C
301c E3        EX      (SP),HL
301d 7B        LD      A,E
301e E640      AND     40H
3020 280C      JR      Z,302EH          ; (+0cH)
3022 23        INC     HL
3023 5E        LD      E,(HL)
3024 23        INC     HL
3025 56        LD      D,(HL)
3026 E1        POP     HL
3027 72        LD      (HL),D
3028 23        INC     HL
3029 73        LD      (HL),E
302a 23        INC     HL
302b 0C        INC     C
302c 0C        INC     C
302d FEE1      CP      0E1H
302f D1        POP     DE
3030 7A        LD      A,D
3031 B3        OR      E
3032 2805      JR      Z,3039H          ; (+05H)
3034 72        LD      (HL),D
3035 23        INC     HL
3036 73        LD      (HL),E
3037 0C        INC     C
3038 0C        INC     C
3039 2E07      LD      L,07H
303b CD082E    CALL    2E08H
303e 71        LD      (HL),C
303f 79        LD      A,C
3040 D602      SUB     02H
3042 0F        RRCA    
3043 0F        RRCA    
3044 0F        RRCA    
3045 23        INC     HL
3046 B6        OR      (HL)
3047 77        LD      (HL),A
3048 2B        DEC     HL
3049 7A        LD      A,D
304a B3        OR      E
304b 200C      JR      NZ,3059H         ; (+0cH)
304d E5        PUSH    HL
304e 3AA9FA    LD      A,(0FAA9H)
3051 F680      OR      80H
3053 010B00    LD      BC,000BH
3056 09        ADD     HL,BC
3057 77        LD      (HL),A
3058 E1        POP     HL
3059 D1        POP     DE
305a 46        LD      B,(HL)
305b 23        INC     HL
305c 5E        LD      E,(HL)
305d 23        INC     HL
305e CD272E    CALL    2E27H
3061 10F9      DJNZ    305CH            ; (-07H)
3063 CD3E2E    CALL    2E3EH
3066 DA872D    JP      C,2D87H
3069 C3F732    JP      32F7H
306c 00        NOP     
306d A0        AND     B
306e 0C        INC     C
306f 91        SUB     C
3070 CDB030    CALL    30B0H
3073 E5        PUSH    HL
3074 B7        OR      A
3075 280F      JR      Z,3086H          ; (+0fH)
3077 21BA30    LD      HL,30BAH
307a CDB12A    CALL    2AB1H
307d E60F      AND     0FH
307f 4F        LD      C,A
3080 0600      LD      B,00H
3082 09        ADD     HL,BC
3083 7E        LD      A,(HL)
3084 181A      JR      30A0H            ; (+1aH)
3086 CDAE1B    CALL    1BAEH
3089 0F        RRCA    
308a 0F        RRCA    
308b 21CA30    LD      HL,30CAH
308e 18ED      JR      307DH            ; (-13H)
3090 CDB030    CALL    30B0H
3093 E5        PUSH    HL
3094 B7        OR      A
3095 2811      JR      Z,30A8H          ; (+11H)
3097 CDB12A    CALL    2AB1H
309a E610      AND     10H
309c 2802      JR      Z,30A0H          ; (+02H)
309e 3E01      LD      A,01H
30a0 2600      LD      H,00H
30a2 6F        LD      L,A
30a3 CDC44E    CALL    4EC4H
30a6 E1        POP     HL
30a7 C9        RET     

30a8 CDAE1B    CALL    1BAEH
30ab 07        RLCA    
30ac E601      AND     01H
30ae 18F0      JR      30A0H            ; (-10H)
30b0 CD4D18    CALL    184DH
30b3 7D        LD      A,L
30b4 FE03      CP      03H
30b6 D4880B    CALL    NC,0B88H
30b9 C9        RET     

30ba 00        NOP     
30bb 010500    LD      BC,0005H
30be 07        RLCA    
30bf 08        EX      AF,AF'
30c0 0607      LD      B,07H
30c2 03        INC     BC
30c3 02        LD      (BC),A
30c4 04        INC     B
30c5 02        LD      (BC),A
30c6 00        NOP     
30c7 010500    LD      BC,0005H
30ca 00        NOP     
30cb 010500    LD      BC,0005H
30ce 03        INC     BC
30cf 02        LD      (BC),A
30d0 04        INC     B
30d1 03        INC     BC
30d2 07        RLCA    
30d3 08        EX      AF,AF'
30d4 0607      LD      B,07H
30d6 00        NOP     
30d7 010500    LD      BC,0005H
30da CD02FB    CALL    0FB02H
30dd E5        PUSH    HL
30de 0605      LD      B,05H
30e0 219431    LD      HL,3194H
30e3 7E        LD      A,(HL)
30e4 CD1728    CALL    2817H
30e7 23        INC     HL
30e8 10F9      DJNZ    30E3H            ; (-07H)
30ea 2E01      LD      L,01H
30ec CDFC1E    CALL    1EFCH
30ef EB        EX      DE,HL
30f0 7C        LD      A,H
30f1 D602      SUB     02H
30f3 67        LD      H,A
30f4 CDF420    CALL    20F4H
30f7 3816      JR      C,310FH          ; (+16H)
30f9 110018    LD      DE,1800H
30fc 4E        LD      C,(HL)
30fd CD0A28    CALL    280AH
3100 23        INC     HL
3101 1B        DEC     DE
3102 CDAE1B    CALL    1BAEH
3105 E602      AND     02H
3107 204B      JR      NZ,3154H         ; (+4bH)
3109 7A        LD      A,D
310a B3        OR      E
310b 20EF      JR      NZ,30FCH         ; (-11H)
310d 1832      JR      3141H            ; (+32H)
310f 1610      LD      D,10H
3111 D5        PUSH    DE
3112 0E00      LD      C,00H
3114 E5        PUSH    HL
3115 0620      LD      B,20H
3117 C5        PUSH    BC
3118 E5        PUSH    HL
3119 D1        POP     DE
311a 14        INC     D
311b 14        INC     D
311c 1A        LD      A,(DE)
311d E640      AND     40H
311f E5        PUSH    HL
3120 CC7831    CALL    Z,3178H
3123 C45A31    CALL    NZ,315AH
3126 E1        POP     HL
3127 23        INC     HL
3128 C1        POP     BC
3129 10EC      DJNZ    3117H            ; (-14H)
312b E1        POP     HL
312c 0C        INC     C
312d 79        LD      A,C
312e FE0C      CP      0CH
3130 38E2      JR      C,3114H          ; (-1eH)
3132 112000    LD      DE,0020H
3135 19        ADD     HL,DE
3136 D1        POP     DE
3137 CDAE1B    CALL    1BAEH
313a E602      AND     02H
313c 2016      JR      NZ,3154H         ; (+16H)
313e 15        DEC     D
313f 20D0      JR      NZ,3111H         ; (-30H)
3141 AF        XOR     A
3142 0620      LD      B,20H
3144 CD1128    CALL    2811H
3147 10FB      DJNZ    3144H            ; (-05H)
3149 3E0A      LD      A,0AH
314b 0606      LD      B,06H
314d CD1728    CALL    2817H
3150 10FB      DJNZ    314DH            ; (-05H)
3152 E1        POP     HL
3153 C9        RET     

3154 CD5628    CALL    2856H
3157 C3701D    JP      1D70H
315a 79        LD      A,C
315b 0F        RRCA    
315c 0F        RRCA    
315d E603      AND     03H
315f 2F        CPL     
3160 C604      ADD     A,04H
3162 4F        LD      C,A
3163 7E        LD      A,(HL)
3164 0D        DEC     C
3165 2804      JR      Z,316BH          ; (+04H)
3167 0F        RRCA    
3168 0F        RRCA    
3169 18F9      JR      3164H            ; (-07H)
316b E603      AND     03H
316d 4F        LD      C,A
316e 0600      LD      B,00H
3170 219931    LD      HL,3199H
3173 09        ADD     HL,BC
3174 4E        LD      C,(HL)
3175 C30A28    JP      280AH
3178 7E        LD      A,(HL)
3179 D5        PUSH    DE
317a CD2B22    CALL    222BH
317d EB        EX      DE,HL
317e 0600      LD      B,00H
3180 09        ADD     HL,BC
3181 3E04      LD      A,04H
3183 D1        POP     DE
3184 1A        LD      A,(DE)
3185 0F        RRCA    
3186 7E        LD      A,(HL)
3187 3001      JR      NC,318AH         ; (+01H)
3189 2F        CPL     
318a 4F        LD      C,A
318b CD0A28    CALL    280AH
318e 3E05      LD      A,05H
3190 D370      OUT     (70H),A
3192 AF        XOR     A
3193 C9        RET     

3194 2020      JR      NZ,31B6H         ; (+20H)
3196 0A        LD      A,(BC)
3197 1D        DEC     E
3198 C1        POP     BC
3199 00        NOP     
319a 0F        RRCA    
319b F0        RET     P

319c FF        RST     38H
319d CD3716    CALL    1637H
31a0 3D        DEC     A
31a1 FE0A      CP      0AH
31a3 D4880B    CALL    NC,0B88H
31a6 87        ADD     A,A
31a7 87        ADD     A,A
31a8 87        ADD     A,A
31a9 EB        EX      DE,HL
31aa 2600      LD      H,00H
31ac 6F        LD      L,A
31ad 0121FA    LD      BC,0FA21H
31b0 09        ADD     HL,BC
31b1 E5        PUSH    HL
31b2 EB        EX      DE,HL
31b3 CF        RST     08H
31b4 2C        INC     L
31b5 CD9B10    CALL    109BH
31b8 E5        PUSH    HL
31b9 CD8F42    CALL    428FH
31bc 7E        LD      A,(HL)
31bd FE08      CP      08H
31bf 3802      JR      C,31C3H          ; (+02H)
31c1 3E08      LD      A,08H
31c3 23        INC     HL
31c4 5E        LD      E,(HL)
31c5 23        INC     HL
31c6 56        LD      D,(HL)
31c7 E1        POP     HL
31c8 E3        EX      (SP),HL
31c9 0600      LD      B,00H
31cb A7        AND     A
31cc 2805      JR      Z,31D3H          ; (+05H)
31ce EB        EX      DE,HL
31cf 4F        LD      C,A
31d0 EDB0      LDIR    
31d2 EB        EX      DE,HL
31d3 FE08      CP      08H
31d5 2801      JR      Z,31D8H          ; (+01H)
31d7 70        LD      (HL),B
31d8 E1        POP     HL
31d9 C31A20    JP      201AH
31dc CD4318    CALL    1843H
31df E5        PUSH    HL
31e0 21B14C    LD      HL,4CB1H
31e3 E5        PUSH    HL
31e4 EB        EX      DE,HL
31e5 E9        JP      (HL)
31e6 CD08FB    CALL    0FB08H
31e9 181C      JR      3207H            ; (+1cH)
31eb CD0BFB    CALL    0FB0BH
31ee 1817      JR      3207H            ; (+17H)
31f0 CD0EFB    CALL    0FB0EH
31f3 1812      JR      3207H            ; (+12H)
31f5 CD17FB    CALL    0FB17H
31f8 180D      JR      3207H            ; (+0dH)
31fa CD11FB    CALL    0FB11H
31fd 1808      JR      3207H            ; (+08H)
31ff CD14FB    CALL    0FB14H
3202 1803      JR      3207H            ; (+03H)
3204 CD1AFB    CALL    0FB1AH
3207 C35F05    JP      055FH
320a 3AF1FB    LD      A,(0FBF1H)
320d B7        OR      A
320e CA6132    JP      Z,3261H
3211 FA6532    JP      M,3265H
3214 E602      AND     02H
3216 C26932    JP      NZ,3269H
3219 F1        POP     AF
321a F5        PUSH    AF
321b FE09      CP      09H
321d 200E      JR      NZ,322DH         ; (+0eH)
321f 3E20      LD      A,20H
3221 CD1800    CALL    0018H
3224 3AF0FB    LD      A,(0FBF0H)
3227 E607      AND     07H
3229 20F4      JR      NZ,321FH         ; (-0cH)
322b F1        POP     AF
322c C9        RET     

322d F1        POP     AF
322e F5        PUSH    AF
322f D60D      SUB     0DH
3231 280A      JR      Z,323DH          ; (+0aH)
3233 380B      JR      C,3240H          ; (+0bH)
3235 3AF0FB    LD      A,(0FBF0H)
3238 3C        INC     A
3239 FEFF      CP      0FFH
323b 2803      JR      Z,3240H          ; (+03H)
323d 32F0FB    LD      (0FBF0H),A
3240 F1        POP     AF
3241 C31728    JP      2817H
3244 AF        XOR     A
3245 32F1FB    LD      (0FBF1H),A
3248 3AF0FB    LD      A,(0FBF0H)
324b B7        OR      A
324c C8        RET     Z

324d 3A73FA    LD      A,(0FA73H)
3250 B7        OR      A
3251 C8        RET     Z

3252 3E0D      LD      A,0DH
3254 CD4132    CALL    3241H
3257 3E0A      LD      A,0AH
3259 CD4132    CALL    3241H
325c AF        XOR     A
325d 32F0FB    LD      (0FBF0H),A
3260 C9        RET     

3261 F1        POP     AF
3262 C3AA1D    JP      1DAAH
3265 F1        POP     AF
3266 C3F128    JP      28F1H
3269 F1        POP     AF
326a C3EF27    JP      27EFH
326d C3131D    JP      1D13H
3270 3AAFC6    LD      A,(0C6AFH)
3273 3D        DEC     A
3274 C8        RET     Z

3275 1805      JR      327CH            ; (+05H)
3277 3600      LD      (HL),00H
3279 213DFD    LD      HL,0FD3DH
327c C3F717    JP      17F7H
327f 00        NOP     
3280 00        NOP     
3281 3E0A      LD      A,0AH
3283 CD1800    CALL    0018H
3286 3AF1FB    LD      A,(0FBF1H)
3289 B7        OR      A
328a C8        RET     Z

328b AF        XOR     A
328c 32F0FB    LD      (0FBF0H),A
328f C9        RET     

3290 D7        RST     10H
3291 E5        PUSH    HL
3292 CD021D    CALL    1D02H
3295 2809      JR      Z,32A0H          ; (+09H)
3297 F5        PUSH    AF
3298 CDE240    CALL    40E2H
329b F1        POP     AF
329c 5F        LD      E,A
329d CDDD42    CALL    42DDH
32a0 211805    LD      HL,0518H
32a3 22A7FF    LD      (0FFA7H),HL
32a6 3E03      LD      A,03H
32a8 3242FE    LD      (0FE42H),A
32ab E1        POP     HL
32ac C9        RET     

32ad D7        RST     10H
32ae CF        RST     08H
32af 24        INC     H
32b0 CF        RST     08H
32b1 28CD      JR      Z,3280H          ; (-33H)
32b3 37        SCF     
32b4 16D5      LD      D,0D5H
32b6 CF        RST     08H
32b7 29        ADD     HL,HL
32b8 E3        EX      (SP),HL
32b9 7D        LD      A,L
32ba B7        OR      A
32bb CA880B    JP      Z,0B88H
32be E5        PUSH    HL
32bf CDE440    CALL    40E4H
32c2 EB        EX      DE,HL
32c3 C1        POP     BC
32c4 CD6D32    CALL    326DH
32c7 FE03      CP      03H
32c9 2808      JR      Z,32D3H          ; (+08H)
32cb 77        LD      (HL),A
32cc 23        INC     HL
32cd 0D        DEC     C
32ce 20F4      JR      NZ,32C4H         ; (-0cH)
32d0 C31141    JP      4111H
32d3 2A8CFE    LD      HL,(0FE8CH)
32d6 F9        LD      SP,HL
32d7 C3B947    JP      47B9H
32da CD8F42    CALL    428FH
32dd CDF64D    CALL    4DF6H
32e0 78        LD      A,B
32e1 B1        OR      C
32e2 2806      JR      Z,32EAH          ; (+06H)
32e4 7A        LD      A,D
32e5 B7        OR      A
32e6 2802      JR      Z,32EAH          ; (+02H)
32e8 C5        PUSH    BC
32e9 D5        PUSH    DE
32ea F1        POP     AF
32eb 32ABFA    LD      (0FAABH),A
32ee E1        POP     HL
32ef 7C        LD      A,H
32f0 B5        OR      L
32f1 CA8D2D    JP      Z,2D8DH
32f4 22ACFA    LD      (0FAACH),HL
32f7 CD4333    CALL    3343H
32fa 28EE      JR      Z,32EAH          ; (-12H)
32fc 87        ADD     A,A
32fd 4F        LD      C,A
32fe 2A4B2E    LD      HL,(2E4BH)
3301 7E        LD      A,(HL)
3302 87        ADD     A,A
3303 CC880B    CALL    Z,0B88H
3306 B9        CP      C
3307 2805      JR      Z,330EH          ; (+05H)
3309 23        INC     HL
330a 23        INC     HL
330b 23        INC     HL
330c 18F3      JR      3301H            ; (-0dH)
330e 01F732    LD      BC,32F7H
3311 C5        PUSH    BC
3312 7E        LD      A,(HL)
3313 4F        LD      C,A
3314 87        ADD     A,A
3315 3020      JR      NC,3337H         ; (+20H)
3317 B7        OR      A
3318 1F        RRA     
3319 4F        LD      C,A
331a C5        PUSH    BC
331b E5        PUSH    HL
331c CD4333    CALL    3343H
331f 110100    LD      DE,0001H
3322 CA3433    JP      Z,3334H
3325 CD8148    CALL    4881H
3328 D23133    JP      NC,3331H
332b CD7133    CALL    3371H
332e 37        SCF     
332f 1804      JR      3335H            ; (+04H)
3331 CD6033    CALL    3360H
3334 B7        OR      A
3335 E1        POP     HL
3336 C1        POP     BC
3337 23        INC     HL
3338 7E        LD      A,(HL)
3339 23        INC     HL
333a 66        LD      H,(HL)
333b 6F        LD      L,A
333c E9        JP      (HL)
333d CD4333    CALL    3343H
3340 28C1      JR      Z,3303H          ; (-3fH)
3342 C9        RET     

3343 E5        PUSH    HL
3344 21ABFA    LD      HL,0FAABH
3347 7E        LD      A,(HL)
3348 B7        OR      A
3349 2813      JR      Z,335EH          ; (+13H)
334b 35        DEC     (HL)
334c 2AACFA    LD      HL,(0FAACH)
334f 7E        LD      A,(HL)
3350 23        INC     HL
3351 22ACFA    LD      (0FAACH),HL
3354 FE20      CP      20H
3356 28EC      JR      Z,3344H          ; (-14H)
3358 FE60      CP      60H
335a 3802      JR      C,335EH          ; (+02H)
335c D620      SUB     20H
335e E1        POP     HL
335f C9        RET     

3360 E5        PUSH    HL
3361 21ABFA    LD      HL,0FAABH
3364 34        INC     (HL)
3365 2AACFA    LD      HL,(0FAACH)
3368 2B        DEC     HL
3369 22ACFA    LD      (0FAACH),HL
336c E1        POP     HL
336d C9        RET     

336e CD3D33    CALL    333DH
3371 FE3D      CP      3DH
3373 CAC533    JP      Z,33C5H
3376 FE2B      CP      2BH
3378 28F4      JR      Z,336EH          ; (-0cH)
337a 110000    LD      DE,0000H
337d FE2C      CP      2CH
337f 28DF      JR      Z,3360H          ; (-21H)
3381 FE3B      CP      3BH
3383 C8        RET     Z

3384 FE3A      CP      3AH
3386 30D8      JR      NC,3360H         ; (-28H)
3388 FE30      CP      30H
338a 38D4      JR      C,3360H          ; (-2cH)
338c 210000    LD      HL,0000H
338f 060A      LD      B,0AH
3391 19        ADD     HL,DE
3392 382A      JR      C,33BEH          ; (+2aH)
3394 10FB      DJNZ    3391H            ; (-05H)
3396 D630      SUB     30H
3398 5F        LD      E,A
3399 1600      LD      D,00H
339b 19        ADD     HL,DE
339c 3820      JR      C,33BEH          ; (+20H)
339e EB        EX      DE,HL
339f CD4333    CALL    3343H
33a2 20D9      JR      NZ,337DH         ; (-27H)
33a4 C9        RET     

33a5 CD3D33    CALL    333DH
33a8 113EFD    LD      DE,0FD3EH
33ab D5        PUSH    DE
33ac 0628      LD      B,28H
33ae CD8148    CALL    4881H
33b1 380B      JR      C,33BEH          ; (+0bH)
33b3 12        LD      (DE),A
33b4 13        INC     DE
33b5 FE3B      CP      3BH
33b7 2808      JR      Z,33C1H          ; (+08H)
33b9 CD3D33    CALL    333DH
33bc 10F5      DJNZ    33B3H            ; (-0bH)
33be CD880B    CALL    0B88H
33c1 E1        POP     HL
33c2 C3AD12    JP      12ADH
33c5 CDA533    CALL    33A5H
33c8 CDA94E    CALL    4EA9H
33cb EB        EX      DE,HL
33cc C9        RET     

33cd FE4D      CP      4DH
33cf CA5135    JP      Z,3551H
33d2 CD9534    CALL    3495H
33d5 E5        PUSH    HL
33d6 CD3536    CALL    3635H
33d9 2A9DFE    LD      HL,(0FE9DH)
33dc 22ECFA    LD      (0FAECH),HL
33df 2AFAFB    LD      HL,(0FBFAH)
33e2 CDF05F    CALL    5FF0H
33e5 01401F    LD      BC,1F40H
33e8 0B        DEC     BC
33e9 78        LD      A,B
33ea B1        OR      C
33eb C2E833    JP      NZ,33E8H
33ee CD0C29    CALL    290CH
33f1 E1        POP     HL
33f2 C9        RET     

33f3 F3        DI      
33f4 FE4D      CP      4DH
33f6 CA4C35    JP      Z,354CH
33f9 D691      SUB     91H
33fb 2802      JR      Z,33FFH          ; (+02H)
33fd AF        XOR     A
33fe 012F23    LD      BC,232FH
3401 FE01      CP      01H
3403 F5        PUSH    AF
3404 3EFF      LD      A,0FFH
3406 32EBFA    LD      (0FAEBH),A
3409 CD8E34    CALL    348EH
340c 3EFF      LD      A,0FFH
340e 32EAFA    LD      (0FAEAH),A
3411 D5        PUSH    DE
3412 CD6228    CALL    2862H
3415 D1        POP     DE
3416 CDB534    CALL    34B5H
3419 21E4FA    LD      HL,0FAE4H
341c CDD134    CALL    34D1H
341f C27534    JP      NZ,3475H
3422 21E234    LD      HL,34E2H
3425 CDEF34    CALL    34EFH
3428 F1        POP     AF
3429 32A7FF    LD      (0FFA7H),A
342c DC0F47    CALL    C,470FH
342f 3AA7FF    LD      A,(0FFA7H)
3432 FE01      CP      01H
3434 32EBFA    LD      (0FAEBH),A
3437 F5        PUSH    AF
3438 CD8119    CALL    1981H
343b F1        POP     AF
343c 2AFAFB    LD      HL,(0FBFAH)
343f CD6836    CALL    3668H
3442 201F      JR      NZ,3463H         ; (+1fH)
3444 229DFE    LD      (0FE9DH),HL
3447 211905    LD      HL,0519H
344a CD3541    CALL    4135H
344d CDBD28    CALL    28BDH
3450 2AFAFB    LD      HL,(0FBFAH)
3453 E5        PUSH    HL
3454 0633      LD      B,33H
3456 CD2029    CALL    2920H
3459 D333      OUT     (33H),A
345b FB        EI      
345c AF        XOR     A
345d 32EBFA    LD      (0FAEBH),A
3460 C33107    JP      0731H
3463 23        INC     HL
3464 EB        EX      DE,HL
3465 2A9DFE    LD      HL,(0FE9DH)
3468 E7        RST     20H
3469 DA4734    JP      C,3447H
346c 218834    LD      HL,3488H
346f CD3541    CALL    4135H
3472 C3EC5F    JP      5FECH
3475 21E934    LD      HL,34E9H
3478 CDEF34    CALL    34EFH
347b 060A      LD      B,0AH
347d CD7128    CALL    2871H
3480 B7        OR      A
3481 20F8      JR      NZ,347BH         ; (-08H)
3483 10F8      DJNZ    347DH            ; (-08H)
3485 C30C34    JP      340CH
3488 42        LD      B,D
3489 61        LD      H,C
348a 64        LD      H,H
348b 0D        DEC     C
348c 0A        LD      A,(BC)
348d 00        NOP     
348e AF        XOR     A
348f 32DEFA    LD      (0FADEH),A
3492 2B        DEC     HL
3493 D7        RST     10H
3494 C8        RET     Z

3495 CD9B10    CALL    109BH
3498 E5        PUSH    HL
3499 CDCB42    CALL    42CBH
349c 2B        DEC     HL
349d 2B        DEC     HL
349e 46        LD      B,(HL)
349f 0E06      LD      C,06H
34a1 21DEFA    LD      HL,0FADEH
34a4 1A        LD      A,(DE)
34a5 77        LD      (HL),A
34a6 23        INC     HL
34a7 13        INC     DE
34a8 0D        DEC     C
34a9 2808      JR      Z,34B3H          ; (+08H)
34ab 10F7      DJNZ    34A4H            ; (-09H)
34ad 41        LD      B,C
34ae 3600      LD      (HL),00H
34b0 23        INC     HL
34b1 10FB      DJNZ    34AEH            ; (-05H)
34b3 E1        POP     HL
34b4 C9        RET     

34b5 060A      LD      B,0AH
34b7 CD7128    CALL    2871H
34ba D6D3      SUB     0D3H
34bc 20F7      JR      NZ,34B5H         ; (-09H)
34be 10F7      DJNZ    34B7H            ; (-09H)
34c0 AF        XOR     A
34c1 32EAFA    LD      (0FAEAH),A
34c4 21E4FA    LD      HL,0FAE4H
34c7 0606      LD      B,06H
34c9 CD7128    CALL    2871H
34cc 77        LD      (HL),A
34cd 23        INC     HL
34ce 10F9      DJNZ    34C9H            ; (-07H)
34d0 C9        RET     

34d1 01DEFA    LD      BC,0FADEH
34d4 1E06      LD      E,06H
34d6 0A        LD      A,(BC)
34d7 B7        OR      A
34d8 C8        RET     Z

34d9 0A        LD      A,(BC)
34da BE        CP      (HL)
34db 23        INC     HL
34dc 03        INC     BC
34dd C0        RET     NZ

34de 1D        DEC     E
34df 20F8      JR      NZ,34D9H         ; (-08H)
34e1 C9        RET     

34e2 46        LD      B,(HL)
34e3 6F        LD      L,A
34e4 75        LD      (HL),L
34e5 6E        LD      L,(HL)
34e6 64        LD      H,H
34e7 3A0053    LD      A,(5300H)
34ea 6B        LD      L,E
34eb 69        LD      L,C
34ec 70        LD      (HL),B
34ed 3A00D5    LD      A,(0D500H)
34f0 F5        PUSH    AF
34f1 3AEBFA    LD      A,(0FAEBH)
34f4 3D        DEC     A
34f5 2812      JR      Z,3509H          ; (+12H)
34f7 CD3541    CALL    4135H
34fa 21E4FA    LD      HL,0FAE4H
34fd 0606      LD      B,06H
34ff 7E        LD      A,(HL)
3500 23        INC     HL
3501 CD1800    CALL    0018H
3504 10F9      DJNZ    34FFH            ; (-07H)
3506 CD7C32    CALL    327CH
3509 F1        POP     AF
350a D1        POP     DE
350b C9        RET     

350c E5        PUSH    HL
350d F5        PUSH    AF
350e 3EFF      LD      A,0FFH
3510 32EBFA    LD      (0FAEBH),A
3513 32EAFA    LD      (0FAEAH),A
3516 CD6228    CALL    2862H
3519 0606      LD      B,06H
351b CD7128    CALL    2871H
351e FE9C      CP      9CH
3520 C21935    JP      NZ,3519H
3523 10F6      DJNZ    351BH            ; (-0aH)
3525 AF        XOR     A
3526 32EAFA    LD      (0FAEAH),A
3529 F1        POP     AF
352a E1        POP     HL
352b C9        RET     

352c E5        PUSH    HL
352d F5        PUSH    AF
352e CDC828    CALL    28C8H
3531 0606      LD      B,06H
3533 3E9C      LD      A,9CH
3535 CDF128    CALL    28F1H
3538 10FB      DJNZ    3535H            ; (-05H)
353a F1        POP     AF
353b E1        POP     HL
353c C9        RET     

353d D5        PUSH    DE
353e D7        RST     10H
353f CD2A16    CALL    162AH
3542 13        INC     DE
3543 7B        LD      A,E
3544 B2        OR      D
3545 C2880B    JP      NZ,0B88H
3548 D1        POP     DE
3549 CF        RST     08H
354a 2C        INC     L
354b C9        RET     

354c CD1DFB    CALL    0FB1DH
354f 1803      JR      3554H            ; (+03H)
3551 CD20FB    CALL    0FB20H
3554 C35F05    JP      055FH
3557 F3        DI      
3558 3ED0      LD      A,0D0H
355a F5        PUSH    AF
355b CDC828    CALL    28C8H
355e F1        POP     AF
355f CDF128    CALL    28F1H
3562 0E00      LD      C,00H
3564 21DEFA    LD      HL,0FADEH
3567 110206    LD      DE,0602H
356a 7E        LD      A,(HL)
356b CDF128    CALL    28F1H
356e 81        ADD     A,C
356f 4F        LD      C,A
3570 23        INC     HL
3571 15        DEC     D
3572 20F6      JR      NZ,356AH         ; (-0aH)
3574 21D8FA    LD      HL,0FAD8H
3577 1606      LD      D,06H
3579 1D        DEC     E
357a 20EE      JR      NZ,356AH         ; (-12H)
357c 79        LD      A,C
357d 2F        CPL     
357e 3C        INC     A
357f CDF128    CALL    28F1H
3582 0614      LD      B,14H
3584 AF        XOR     A
3585 CDF128    CALL    28F1H
3588 10FA      DJNZ    3584H            ; (-06H)
358a C9        RET     

358b CDDC28    CALL    28DCH
358e 3E8D      LD      A,8DH
3590 C3F128    JP      28F1H
3593 CD5735    CALL    3557H
3596 CD8B35    CALL    358BH
3599 2ADAFA    LD      HL,(0FADAH)
359c EB        EX      DE,HL
359d 2AD8FA    LD      HL,(0FAD8H)
35a0 0E00      LD      C,00H
35a2 7E        LD      A,(HL)
35a3 CDF128    CALL    28F1H
35a6 81        ADD     A,C
35a7 4F        LD      C,A
35a8 23        INC     HL
35a9 1B        DEC     DE
35aa 7A        LD      A,D
35ab B3        OR      E
35ac 20F4      JR      NZ,35A2H         ; (-0cH)
35ae C37C35    JP      357CH
35b1 F3        DI      
35b2 CD6228    CALL    2862H
35b5 F3        DI      
35b6 CD7128    CALL    2871H
35b9 FED0      CP      0D0H
35bb 20F8      JR      NZ,35B5H         ; (-08H)
35bd F5        PUSH    AF
35be 21E4FA    LD      HL,0FAE4H
35c1 110206    LD      DE,0602H
35c4 0E00      LD      C,00H
35c6 CD7128    CALL    2871H
35c9 77        LD      (HL),A
35ca 81        ADD     A,C
35cb 4F        LD      C,A
35cc 23        INC     HL
35cd 15        DEC     D
35ce 20F6      JR      NZ,35C6H         ; (-0aH)
35d0 21D8FA    LD      HL,0FAD8H
35d3 1606      LD      D,06H
35d5 1D        DEC     E
35d6 20EE      JR      NZ,35C6H         ; (-12H)
35d8 CD7128    CALL    2871H
35db 79        LD      A,C
35dc A7        AND     A
35dd CDBD28    CALL    28BDH
35e0 CDFE35    CALL    35FEH
35e3 2003      JR      NZ,35E8H         ; (+03H)
35e5 F1        POP     AF
35e6 A7        AND     A
35e7 C9        RET     

35e8 21E934    LD      HL,34E9H
35eb CDEF34    CALL    34EFH
35ee F1        POP     AF
35ef 18C0      JR      35B1H            ; (-40H)
35f1 CD6228    CALL    2862H
35f4 F3        DI      
35f5 CD7128    CALL    2871H
35f8 FE8D      CP      8DH
35fa C2F435    JP      NZ,35F4H
35fd C9        RET     

35fe 21DEFA    LD      HL,0FADEH
3601 0606      LD      B,06H
3603 3E20      LD      A,20H
3605 BE        CP      (HL)
3606 2004      JR      NZ,360CH         ; (+04H)
3608 23        INC     HL
3609 10FA      DJNZ    3605H            ; (-06H)
360b C9        RET     

360c 21DEFA    LD      HL,0FADEH
360f 11E4FA    LD      DE,0FAE4H
3612 0606      LD      B,06H
3614 1A        LD      A,(DE)
3615 A7        AND     A
3616 2002      JR      NZ,361AH         ; (+02H)
3618 3E20      LD      A,20H
361a BE        CP      (HL)
361b C0        RET     NZ

361c 13        INC     DE
361d 23        INC     HL
361e 10F4      DJNZ    3614H            ; (-0cH)
3620 C9        RET     

3621 0E00      LD      C,00H
3623 CD7128    CALL    2871H
3626 77        LD      (HL),A
3627 81        ADD     A,C
3628 4F        LD      C,A
3629 23        INC     HL
362a 1B        DEC     DE
362b 7A        LD      A,D
362c B3        OR      E
362d 20F4      JR      NZ,3623H         ; (-0cH)
362f CD7128    CALL    2871H
3632 79        LD      A,C
3633 A7        AND     A
3634 C9        RET     

3635 CDC828    CALL    28C8H
3638 3ED3      LD      A,0D3H
363a 060A      LD      B,0AH
363c CDF128    CALL    28F1H
363f 10FB      DJNZ    363CH            ; (-05H)
3641 0606      LD      B,06H
3643 21DEFA    LD      HL,0FADEH
3646 7E        LD      A,(HL)
3647 23        INC     HL
3648 CDF128    CALL    28F1H
364b 10F9      DJNZ    3646H            ; (-07H)
364d C9        RET     

364e E5        PUSH    HL
364f CD8119    CALL    1981H
3652 E1        POP     HL
3653 EB        EX      DE,HL
3654 2AECFA    LD      HL,(0FAECH)
3657 1A        LD      A,(DE)
3658 13        INC     DE
3659 CDF128    CALL    28F1H
365c E7        RST     20H
365d 20F8      JR      NZ,3657H         ; (-08H)
365f 2E09      LD      L,09H
3661 CDF128    CALL    28F1H
3664 2D        DEC     L
3665 20FA      JR      NZ,3661H         ; (-06H)
3667 C9        RET     

3668 3EFF      LD      A,0FFH
366a 32EAFA    LD      (0FAEAH),A
366d 9F        SBC     A,A
366e 2F        CPL     
366f 57        LD      D,A
3670 060A      LD      B,0AH
3672 CD7128    CALL    2871H
3675 5F        LD      E,A
3676 3AF5FB    LD      A,(0FBF5H)
3679 B7        OR      A
367a 2807      JR      Z,3683H          ; (+07H)
367c 7C        LD      A,H
367d B5        OR      L
367e 2006      JR      NZ,3686H         ; (+06H)
3680 C3FD46    JP      46FDH
3683 CDEF46    CALL    46EFH
3686 7B        LD      A,E
3687 96        SUB     (HL)
3688 A2        AND     D
3689 C0        RET     NZ

368a 73        LD      (HL),E
368b 7E        LD      A,(HL)
368c B7        OR      A
368d 23        INC     HL
368e 20E0      JR      NZ,3670H         ; (-20H)
3690 CD3929    CALL    2939H
3693 10DD      DJNZ    3672H            ; (-23H)
3695 01FAFF    LD      BC,0FFFAH
3698 09        ADD     HL,BC
3699 AF        XOR     A
369a C9        RET     

369b CD0037    CALL    3700H
369e 36FF      LD      (HL),0FFH
36a0 78        LD      A,B
36a1 3C        INC     A
36a2 23        INC     HL
36a3 A6        AND     (HL)
36a4 B9        CP      C
36a5 C8        RET     Z

36a6 E5        PUSH    HL
36a7 2B        DEC     HL
36a8 2B        DEC     HL
36a9 2B        DEC     HL
36aa E3        EX      (SP),HL
36ab 23        INC     HL
36ac 4F        LD      C,A
36ad 7E        LD      A,(HL)
36ae 23        INC     HL
36af 66        LD      H,(HL)
36b0 6F        LD      L,A
36b1 0600      LD      B,00H
36b3 09        ADD     HL,BC
36b4 73        LD      (HL),E
36b5 E1        POP     HL
36b6 71        LD      (HL),C
36b7 C9        RET     

36b8 CD0037    CALL    3700H
36bb C8        RET     Z

36bc 23        INC     HL
36bd 79        LD      A,C
36be 3C        INC     A
36bf A6        AND     (HL)
36c0 2B        DEC     HL
36c1 2B        DEC     HL
36c2 E5        PUSH    HL
36c3 23        INC     HL
36c4 23        INC     HL
36c5 23        INC     HL
36c6 4F        LD      C,A
36c7 7E        LD      A,(HL)
36c8 23        INC     HL
36c9 66        LD      H,(HL)
36ca 6F        LD      L,A
36cb 0600      LD      B,00H
36cd 09        ADD     HL,BC
36ce 46        LD      B,(HL)
36cf E1        POP     HL
36d0 71        LD      (HL),C
36d1 2B        DEC     HL
36d2 7E        LD      A,(HL)
36d3 B9        CP      C
36d4 78        LD      A,B
36d5 C0        RET     NZ

36d6 23        INC     HL
36d7 23        INC     HL
36d8 3600      LD      (HL),00H
36da B7        OR      A
36db C0        RET     NZ

36dc 3C        INC     A
36dd 3E00      LD      A,00H
36df C9        RET     

36e0 C5        PUSH    BC
36e1 CD0A37    CALL    370AH
36e4 70        LD      (HL),B
36e5 23        INC     HL
36e6 70        LD      (HL),B
36e7 23        INC     HL
36e8 70        LD      (HL),B
36e9 23        INC     HL
36ea F1        POP     AF
36eb 77        LD      (HL),A
36ec 23        INC     HL
36ed 73        LD      (HL),E
36ee 23        INC     HL
36ef 72        LD      (HL),D
36f0 C9        RET     

36f1 CD0037    CALL    3700H
36f4 78        LD      A,B
36f5 3C        INC     A
36f6 23        INC     HL
36f7 A6        AND     (HL)
36f8 47        LD      B,A
36f9 79        LD      A,C
36fa 90        SUB     B
36fb A6        AND     (HL)
36fc 6F        LD      L,A
36fd 2600      LD      H,00H
36ff C9        RET     

3700 CD0A37    CALL    370AH
3703 46        LD      B,(HL)
3704 23        INC     HL
3705 4E        LD      C,(HL)
3706 23        INC     HL
3707 7E        LD      A,(HL)
3708 B7        OR      A
3709 C9        RET     

370a 07        RLCA    
370b 47        LD      B,A
370c 07        RLCA    
370d 80        ADD     A,B
370e 4F        LD      C,A
370f 0600      LD      B,00H
3711 2A08FA    LD      HL,(0FA08H)
3714 09        ADD     HL,BC
3715 C9        RET     

3716 3D        DEC     A
3717 37        SCF     
3718 74        LD      (HL),H
3719 37        SCF     
371a F9        LD      SP,HL
371b 37        SCF     
371c 3837      JR      C,3755H          ; (+37H)
371e 2637      LD      H,37H
3720 7F        LD      A,A
3721 37        SCF     
3722 5E        LD      E,(HL)
3723 37        SCF     
3724 4E        LD      C,(HL)
3725 37        SCF     
3726 2AAEC6    LD      HL,(0C6AEH)
3729 CD6B37    CALL    376BH
372c C0        RET     NZ

372d 2601      LD      H,01H
372f AF        XOR     A
3730 CD7738    CALL    3877H
3733 CD4237    CALL    3742H
3736 AF        XOR     A
3737 C9        RET     

3738 2601      LD      H,01H
373a C3B11E    JP      1EB1H
373d 3EFF      LD      A,0FFH
373f CD7738    CALL    3877H
3742 CD4E37    CALL    374EH
3745 C0        RET     NZ

3746 CDB11E    CALL    1EB1H
3749 CD9437    CALL    3794H
374c AF        XOR     A
374d C9        RET     

374e 3AABC6    LD      A,(0C6ABH)
3751 BD        CP      L
3752 C8        RET     Z

3753 3005      JR      NC,375AH         ; (+05H)
3755 6F        LD      L,A
3756 AF        XOR     A
3757 C3B11E    JP      1EB1H
375a 2C        INC     L
375b C3B11E    JP      1EB1H
375e 3AAAC6    LD      A,(0C6AAH)
3761 BD        CP      L
3762 C8        RET     Z

3763 3E01      LD      A,01H
3765 BD        CP      L
3766 C8        RET     Z

3767 2D        DEC     L
3768 C3B11E    JP      1EB1H
376b 3AB2C6    LD      A,(0C6B2H)
376e BC        CP      H
376f C8        RET     Z

3770 24        INC     H
3771 C3B11E    JP      1EB1H
3774 2AAAC6    LD      HL,(0C6AAH)
3777 2601      LD      H,01H
3779 22B1FA    LD      (0FAB1H),HL
377c C3B11E    JP      1EB1H
377f 2AAEC6    LD      HL,(0C6AEH)
3782 CD8C37    CALL    378CH
3785 C0        RET     NZ

3786 3AB2C6    LD      A,(0C6B2H)
3789 67        LD      H,A
378a 18D2      JR      375EH            ; (-2eH)
378c 3E01      LD      A,01H
378e BC        CP      H
378f C8        RET     Z

3790 25        DEC     H
3791 C3B11E    JP      1EB1H
3794 3AAAC6    LD      A,(0C6AAH)
3797 67        LD      H,A
3798 3AABC6    LD      A,(0C6ABH)
379b 6F        LD      L,A
379c 94        SUB     H
379d D8        RET     C

379e 3C        INC     A
379f F5        PUSH    AF
37a0 CD3F38    CALL    383FH
37a3 3AB1FA    LD      A,(0FAB1H)
37a6 2C        INC     L
37a7 BD        CP      L
37a8 2D        DEC     L
37a9 300B      JR      NC,37B6H         ; (+0bH)
37ab BC        CP      H
37ac 3808      JR      C,37B6H          ; (+08H)
37ae 2002      JR      NZ,37B2H         ; (+02H)
37b0 3E01      LD      A,01H
37b2 3D        DEC     A
37b3 32B1FA    LD      (0FAB1H),A
37b6 F1        POP     AF
37b7 3D        DEC     A
37b8 CAC037    JP      Z,37C0H
37bb CDAA1F    CALL    1FAAH
37be 1801      JR      37C1H            ; (+01H)
37c0 6C        LD      L,H
37c1 CDFC1E    CALL    1EFCH
37c4 C31E1F    JP      1F1EH
37c7 3AAAC6    LD      A,(0C6AAH)
37ca 6F        LD      L,A
37cb 3AABC6    LD      A,(0C6ABH)
37ce 67        LD      H,A
37cf 95        SUB     L
37d0 D8        RET     C

37d1 3C        INC     A
37d2 F5        PUSH    AF
37d3 CD5238    CALL    3852H
37d6 3AB1FA    LD      A,(0FAB1H)
37d9 BD        CP      L
37da 380C      JR      C,37E8H          ; (+0cH)
37dc BC        CP      H
37dd F2E837    JP      P,37E8H
37e0 2002      JR      NZ,37E4H         ; (+02H)
37e2 3EFF      LD      A,0FFH
37e4 3C        INC     A
37e5 32B1FA    LD      (0FAB1H),A
37e8 F1        POP     AF
37e9 3D        DEC     A
37ea 28D4      JR      Z,37C0H          ; (-2cH)
37ec CD0E20    CALL    200EH
37ef 3AAAC6    LD      A,(0C6AAH)
37f2 6F        LD      L,A
37f3 CDFC1E    CALL    1EFCH
37f6 C31E1F    JP      1F1EH
37f9 2AAAC6    LD      HL,(0C6AAH)
37fc 3A00FA    LD      A,(0FA00H)
37ff 47        LD      B,A
3800 78        LD      A,B
3801 BD        CP      L
3802 3001      JR      NC,3805H         ; (+01H)
3804 6F        LD      L,A
3805 BC        CP      H
3806 3001      JR      NC,3809H         ; (+01H)
3808 67        LD      H,A
3809 7C        LD      A,H
380a 2600      LD      H,00H
380c 95        SUB     L
380d 3C        INC     A
380e 11BBC6    LD      DE,0C6BBH
3811 F5        PUSH    AF
3812 EB        EX      DE,HL
3813 19        ADD     HL,DE
3814 D5        PUSH    DE
3815 1D        DEC     E
3816 D1        POP     DE
3817 2801      JR      Z,381AH          ; (+01H)
3819 77        LD      (HL),A
381a 23        INC     HL
381b 77        LD      (HL),A
381c 23        INC     HL
381d 3D        DEC     A
381e 20FB      JR      NZ,381BH         ; (-05H)
3820 EB        EX      DE,HL
3821 F1        POP     AF
3822 F5        PUSH    AF
3823 E5        PUSH    HL
3824 CDFC1E    CALL    1EFCH
3827 CD1E1F    CALL    1F1EH
382a E1        POP     HL
382b 2C        INC     L
382c F1        POP     AF
382d 3D        DEC     A
382e 20F2      JR      NZ,3822H         ; (-0eH)
3830 32B1FA    LD      (0FAB1H),A
3833 32B2FA    LD      (0FAB2H),A
3836 32B3FA    LD      (0FAB3H),A
3839 CD1A20    CALL    201AH
383c C37437    JP      3774H
383f F5        PUSH    AF
3840 CD6A38    CALL    386AH
3843 0601      LD      B,01H
3845 4F        LD      C,A
3846 78        LD      A,B
3847 12        LD      (DE),A
3848 1B        DEC     DE
3849 1A        LD      A,(DE)
384a 41        LD      B,C
384b 4F        LD      C,A
384c F1        POP     AF
384d 3D        DEC     A
384e C8        RET     Z

384f F5        PUSH    AF
3850 18F4      JR      3846H            ; (-0cH)
3852 F5        PUSH    AF
3853 0601      LD      B,01H
3855 CD6A38    CALL    386AH
3858 4F        LD      C,A
3859 78        LD      A,B
385a 12        LD      (DE),A
385b 13        INC     DE
385c 1A        LD      A,(DE)
385d 41        LD      B,C
385e 4F        LD      C,A
385f F1        POP     AF
3860 3D        DEC     A
3861 F5        PUSH    AF
3862 20F5      JR      NZ,3859H         ; (-0bH)
3864 1B        DEC     DE
3865 3C        INC     A
3866 12        LD      (DE),A
3867 13        INC     DE
3868 F1        POP     AF
3869 C9        RET     

386a E5        PUSH    HL
386b 11BDC6    LD      DE,0C6BDH
386e 2600      LD      H,00H
3870 2D        DEC     L
3871 19        ADD     HL,DE
3872 7E        LD      A,(HL)
3873 EB        EX      DE,HL
3874 E1        POP     HL
3875 A7        AND     A
3876 C9        RET     

3877 E5        PUSH    HL
3878 11BDC6    LD      DE,0C6BDH
387b 2600      LD      H,00H
387d 2D        DEC     L
387e 19        ADD     HL,DE
387f 77        LD      (HL),A
3880 EB        EX      DE,HL
3881 E1        POP     HL
3882 C9        RET     

3883 2AAEC6    LD      HL,(0C6AEH)
3886 3A85FE    LD      A,(0FE85H)
3889 B7        OR      A
388a 2802      JR      Z,388EH          ; (+02H)
388c 2601      LD      H,01H
388e 22B1FA    LD      (0FAB1H),HL
3891 3AB2C6    LD      A,(0C6B2H)
3894 3C        INC     A
3895 1814      JR      38ABH            ; (+14H)
3897 CDE420    CALL    20E4H
389a 3E3F      LD      A,3FH
389c CD1800    CALL    0018H
389f 3E20      LD      A,20H
38a1 CD1800    CALL    0018H
38a4 2AAEC6    LD      HL,(0C6AEH)
38a7 22B1FA    LD      (0FAB1H),HL
38aa 7C        LD      A,H
38ab 32B3FA    LD      (0FAB3H),A
38ae 2D        DEC     L
38af 2805      JR      Z,38B6H          ; (+05H)
38b1 3E01      LD      A,01H
38b3 CD7738    CALL    3877H
38b6 CD131D    CALL    1D13H
38b9 F5        PUSH    AF
38ba 2AB1FA    LD      HL,(0FAB1H)
38bd EB        EX      DE,HL
38be 2AAEC6    LD      HL,(0C6AEH)
38c1 7D        LD      A,L
38c2 BB        CP      E
38c3 2011      JR      NZ,38D6H         ; (+11H)
38c5 7C        LD      A,H
38c6 BA        CP      D
38c7 3003      JR      NC,38CCH         ; (+03H)
38c9 22B1FA    LD      (0FAB1H),HL
38cc 3AB3FA    LD      A,(0FAB3H)
38cf BC        CP      H
38d0 3004      JR      NC,38D6H         ; (+04H)
38d2 7C        LD      A,H
38d3 32B3FA    LD      (0FAB3H),A
38d6 F1        POP     AF
38d7 CD0039    CALL    3900H
38da 380C      JR      C,38E8H          ; (+0cH)
38dc 28D8      JR      Z,38B6H          ; (-28H)
38de FE14      CP      14H
38e0 C46B3A    CALL    NZ,3A6BH
38e3 CD1800    CALL    0018H
38e6 18CE      JR      38B6H            ; (-32H)
38e8 FE03      CP      03H
38ea 37        SCF     
38eb 2801      JR      Z,38EEH          ; (+01H)
38ed 3F        CCF     
38ee 213DFD    LD      HL,0FD3DH
38f1 C9        RET     

38f2 FE3B      CP      3BH
38f4 C0        RET     NZ

38f5 C3900A    JP      0A90H
38f8 2B        DEC     HL
38f9 23        INC     HL
38fa 0D        DEC     C
38fb F8        RET     M

38fc BE        CP      (HL)
38fd 20FA      JR      NZ,38F9H         ; (-06H)
38ff C9        RET     

3900 215439    LD      HL,3954H
3903 0E0D      LD      C,0DH
3905 CDF838    CALL    38F8H
3908 FA1139    JP      M,3911H
390b F5        PUSH    AF
390c AF        XOR     A
390d 32B5FA    LD      (0FAB5H),A
3910 F1        POP     AF
3911 216139    LD      HL,3961H
3914 0E0B      LD      C,0BH
3916 CDF838    CALL    38F8H
3919 FA3039    JP      M,3930H
391c F5        PUSH    AF
391d 79        LD      A,C
391e B7        OR      A
391f 07        RLCA    
3920 4F        LD      C,A
3921 AF        XOR     A
3922 47        LD      B,A
3923 216C39    LD      HL,396CH
3926 09        ADD     HL,BC
3927 5E        LD      E,(HL)
3928 23        INC     HL
3929 56        LD      D,(HL)
392a F1        POP     AF
392b D5        PUSH    DE
392c 2AAEC6    LD      HL,(0C6AEH)
392f C9        RET     

3930 FE20      CP      20H
3932 3802      JR      C,3936H          ; (+02H)
3934 A7        AND     A
3935 C9        RET     

3936 FE07      CP      07H
3938 28FA      JR      Z,3934H          ; (-06H)
393a FE09      CP      09H
393c 28F6      JR      Z,3934H          ; (-0aH)
393e FE0B      CP      0BH
3940 28F2      JR      Z,3934H          ; (-0eH)
3942 FE0C      CP      0CH
3944 28EE      JR      Z,3934H          ; (-12H)
3946 FE1C      CP      1CH
3948 3804      JR      C,394EH          ; (+04H)
394a FE20      CP      20H
394c 38E6      JR      C,3934H          ; (-1aH)
394e FE14      CP      14H
3950 28E2      JR      Z,3934H          ; (-1eH)
3952 AF        XOR     A
3953 C9        RET     

3954 0D        DEC     C
3955 02        LD      (BC),A
3956 0605      LD      B,05H
3958 03        INC     BC
3959 0B        DEC     BC
395a 0C        INC     C
395b 1C        INC     E
395c 1D        DEC     E
395d 1E1F      LD      E,1FH
395f 7F        LD      A,A
3960 15        DEC     D
3961 09        ADD     HL,BC
3962 0A        LD      A,(BC)
3963 08        EX      AF,AF'
3964 12        LD      (DE),A
3965 02        LD      (BC),A
3966 0605      LD      B,05H
3968 03        INC     BC
3969 0D        DEC     C
396a 7F        LD      A,A
396b 15        DEC     D
396c 27        DAA     
396d 3B        DEC     SP
396e B9        CP      C
396f 3ABB39    LD      A,(39BBH)
3972 213A2F    LD      HL,2F3AH
3975 3B        DEC     SP
3976 49        LD      C,C
3977 3B        DEC     SP
3978 6A        LD      L,D
3979 3B        DEC     SP
397a 62        LD      H,D
397b 3AD53A    LD      A,(3AD5H)
397e 82        ADD     A,D
397f 39        ADD     HL,SP
3980 313A3A    LD      SP,3A3AH
3983 B5        OR      L
3984 FAB728    JP      M,28B7H
3987 2F        CPL     
3988 CD6A38    CALL    386AH
398b F5        PUSH    AF
398c EB        EX      DE,HL
398d 3600      LD      (HL),00H
398f EB        EX      DE,HL
3990 2C        INC     L
3991 CD2C3C    CALL    3C2CH
3994 3AB2C6    LD      A,(0C6B2H)
3997 F5        PUSH    AF
3998 CD6B3A    CALL    3A6BH
399b F1        POP     AF
399c 3D        DEC     A
399d 20F8      JR      NZ,3997H         ; (-08H)
399f 2AAEC6    LD      HL,(0C6AEH)
39a2 CD6A38    CALL    386AH
39a5 EB        EX      DE,HL
39a6 3600      LD      (HL),00H
39a8 23        INC     HL
39a9 3AABC6    LD      A,(0C6ABH)
39ac 3D        DEC     A
39ad BB        CP      E
39ae 2803      JR      Z,39B3H          ; (+03H)
39b0 F1        POP     AF
39b1 77        LD      (HL),A
39b2 FEF1      CP      0F1H
39b4 EB        EX      DE,HL
39b5 AF        XOR     A
39b6 C9        RET     

39b7 3E0A      LD      A,0AH
39b9 B7        OR      A
39ba C9        RET     

39bb CDA83B    CALL    3BA8H
39be 113EFD    LD      DE,0FD3EH
39c1 06FE      LD      B,0FEH
39c3 3AB1FA    LD      A,(0FAB1H)
39c6 BD        CP      L
39c7 2601      LD      H,01H
39c9 2022      JR      NZ,39EDH         ; (+22H)
39cb 2AB1FA    LD      HL,(0FAB1H)
39ce D5        PUSH    DE
39cf CD6A38    CALL    386AH
39d2 D1        POP     DE
39d3 2818      JR      Z,39EDH          ; (+18H)
39d5 3AB3FA    LD      A,(0FAB3H)
39d8 3D        DEC     A
39d9 32B3FA    LD      (0FAB3H),A
39dc CDB53B    CALL    3BB5H
39df 78        LD      A,B
39e0 A7        AND     A
39e1 280F      JR      Z,39F2H          ; (+0fH)
39e3 D5        PUSH    DE
39e4 CD6A38    CALL    386AH
39e7 D1        POP     DE
39e8 2008      JR      NZ,39F2H         ; (+08H)
39ea 2601      LD      H,01H
39ec 2C        INC     L
39ed 3AB2C6    LD      A,(0C6B2H)
39f0 18E7      JR      39D9H            ; (-19H)
39f2 EB        EX      DE,HL
39f3 3EFE      LD      A,0FEH
39f5 92        SUB     D
39f6 57        LD      D,A
39f7 2B        DEC     HL
39f8 7E        LD      A,(HL)
39f9 FE20      CP      20H
39fb 280A      JR      Z,3A07H          ; (+0aH)
39fd 47        LD      B,A
39fe 3AB3C6    LD      A,(0C6B3H)
3a01 B8        CP      B
3a02 2006      JR      NZ,3A0AH         ; (+06H)
3a04 15        DEC     D
3a05 2803      JR      Z,3A0AH          ; (+03H)
3a07 2B        DEC     HL
3a08 18EE      JR      39F8H            ; (-12H)
3a0a 23        INC     HL
3a0b 3600      LD      (HL),00H
3a0d EB        EX      DE,HL
3a0e 3E0D      LD      A,0DH
3a10 F5        PUSH    AF
3a11 2601      LD      H,01H
3a13 CDB11E    CALL    1EB1H
3a16 3E0A      LD      A,0AH
3a18 CD1800    CALL    0018H
3a1b 213DFD    LD      HL,0FD3DH
3a1e F1        POP     AF
3a1f 37        SCF     
3a20 C9        RET     

3a21 AF        XOR     A
3a22 323EFD    LD      (0FD3EH),A
3a25 CD6A38    CALL    386AH
3a28 2003      JR      NZ,3A2DH         ; (+03H)
3a2a 2C        INC     L
3a2b 18F8      JR      3A25H            ; (-08H)
3a2d 3E03      LD      A,03H
3a2f 18DF      JR      3A10H            ; (-21H)
3a31 7C        LD      A,H
3a32 3D        DEC     A
3a33 E6F8      AND     0F8H
3a35 C608      ADD     A,08H
3a37 3C        INC     A
3a38 47        LD      B,A
3a39 3AB2C6    LD      A,(0C6B2H)
3a3c B8        CP      B
3a3d 3001      JR      NC,3A40H         ; (+01H)
3a3f 47        LD      B,A
3a40 78        LD      A,B
3a41 3AB5FA    LD      A,(0FAB5H)
3a44 B7        OR      A
3a45 78        LD      A,B
3a46 2009      JR      NZ,3A51H         ; (+09H)
3a48 BC        CP      H
3a49 2804      JR      Z,3A4FH          ; (+04H)
3a4b 67        LD      H,A
3a4c CDB11E    CALL    1EB1H
3a4f AF        XOR     A
3a50 C9        RET     

3a51 94        SUB     H
3a52 C8        RET     Z

3a53 F5        PUSH    AF
3a54 3AB3C6    LD      A,(0C6B3H)
3a57 CD6B3A    CALL    3A6BH
3a5a CD1800    CALL    0018H
3a5d F1        POP     AF
3a5e 3D        DEC     A
3a5f 20F2      JR      NZ,3A53H         ; (-0eH)
3a61 C9        RET     

3a62 3AB5FA    LD      A,(0FAB5H)
3a65 2F        CPL     
3a66 32B5FA    LD      (0FAB5H),A
3a69 AF        XOR     A
3a6a C9        RET     

3a6b E5        PUSH    HL
3a6c 2AAEC6    LD      HL,(0C6AEH)
3a6f F5        PUSH    AF
3a70 3AB5FA    LD      A,(0FAB5H)
3a73 B7        OR      A
3a74 C47A3A    CALL    NZ,3A7AH
3a77 F1        POP     AF
3a78 E1        POP     HL
3a79 C9        RET     

3a7a 3AB1FA    LD      A,(0FAB1H)
3a7d BD        CP      L
3a7e 200D      JR      NZ,3A8DH         ; (+0dH)
3a80 E5        PUSH    HL
3a81 21B3FA    LD      HL,0FAB3H
3a84 34        INC     (HL)
3a85 3AB2C6    LD      A,(0C6B2H)
3a88 BE        CP      (HL)
3a89 3001      JR      NC,3A8CH         ; (+01H)
3a8b 77        LD      (HL),A
3a8c E1        POP     HL
3a8d 3AB3C6    LD      A,(0C6B3H)
3a90 4F        LD      C,A
3a91 CDDA3B    CALL    3BDAH
3a94 3816      JR      C,3AACH          ; (+16H)
3a96 F5        PUSH    AF
3a97 2008      JR      NZ,3AA1H         ; (+08H)
3a99 3AB2C6    LD      A,(0C6B2H)
3a9c BC        CP      H
3a9d 2802      JR      Z,3AA1H          ; (+02H)
3a9f F1        POP     AF
3aa0 C9        RET     

3aa1 AF        XOR     A
3aa2 CD7738    CALL    3877H
3aa5 2C        INC     L
3aa6 CD2C3C    CALL    3C2CH
3aa9 F1        POP     AF
3aaa C8        RET     Z

3aab 2D        DEC     L
3aac 2601      LD      H,01H
3aae 2C        INC     L
3aaf 18DF      JR      3A90H            ; (-21H)
3ab1 AF        XOR     A
3ab2 CD7738    CALL    3877H
3ab5 2C        INC     L
3ab6 F1        POP     AF
3ab7 18D7      JR      3A90H            ; (-29H)
3ab9 E5        PUSH    HL
3aba 3AB2C6    LD      A,(0C6B2H)
3abd BC        CP      H
3abe 2009      JR      NZ,3AC9H         ; (+09H)
3ac0 2600      LD      H,00H
3ac2 3A00FA    LD      A,(0FA00H)
3ac5 BD        CP      L
3ac6 2000      JR      NZ,3AC8H         ; (+00H)
3ac8 2C        INC     L
3ac9 24        INC     H
3aca CDD53A    CALL    3AD5H
3acd E1        POP     HL
3ace E5        PUSH    HL
3acf CDB11E    CALL    1EB1H
3ad2 AF        XOR     A
3ad3 E1        POP     HL
3ad4 C9        RET     

3ad5 3E01      LD      A,01H
3ad7 BC        CP      H
3ad8 2803      JR      Z,3ADDH          ; (+03H)
3ada 25        DEC     H
3adb 180F      JR      3AECH            ; (+0fH)
3add E5        PUSH    HL
3ade 2D        DEC     L
3adf 280A      JR      Z,3AEBH          ; (+0aH)
3ae1 3AB2C6    LD      A,(0C6B2H)
3ae4 67        LD      H,A
3ae5 CD6A38    CALL    386AH
3ae8 2001      JR      NZ,3AEBH         ; (+01H)
3aea E3        EX      (SP),HL
3aeb E1        POP     HL
3aec CDB11E    CALL    1EB1H
3aef 3AB1FA    LD      A,(0FAB1H)
3af2 BD        CP      L
3af3 2009      JR      NZ,3AFEH         ; (+09H)
3af5 3AB3FA    LD      A,(0FAB3H)
3af8 3D        DEC     A
3af9 2803      JR      Z,3AFEH          ; (+03H)
3afb 32B3FA    LD      (0FAB3H),A
3afe CDF43B    CALL    3BF4H
3b01 E5        PUSH    HL
3b02 CD6A38    CALL    386AH
3b05 200D      JR      NZ,3B14H         ; (+0dH)
3b07 2C        INC     L
3b08 2601      LD      H,01H
3b0a CD8C1F    CALL    1F8CH
3b0d E3        EX      (SP),HL
3b0e CDA11F    CALL    1FA1H
3b11 E1        POP     HL
3b12 18EA      JR      3AFEH            ; (-16H)
3b14 AF        XOR     A
3b15 E1        POP     HL
3b16 C9        RET     

3b17 E1        POP     HL
3b18 CDAE1E    CALL    1EAEH
3b1b AF        XOR     A
3b1c C9        RET     

3b1d 3E07      LD      A,07H
3b1f EB        EX      DE,HL
3b20 F5        PUSH    AF
3b21 CDB11E    CALL    1EB1H
3b24 F1        POP     AF
3b25 B7        OR      A
3b26 C9        RET     

3b27 CDA83B    CALL    3BA8H
3b2a 2601      LD      H,01H
3b2c CDB11E    CALL    1EB1H
3b2f E5        PUSH    HL
3b30 3AB3C6    LD      A,(0C6B3H)
3b33 CDA11F    CALL    1FA1H
3b36 E1        POP     HL
3b37 24        INC     H
3b38 3AB2C6    LD      A,(0C6B2H)
3b3b 3C        INC     A
3b3c BC        CP      H
3b3d 20F0      JR      NZ,3B2FH         ; (-10H)
3b3f CD6A38    CALL    386AH
3b42 2024      JR      NZ,3B68H         ; (+24H)
3b44 2601      LD      H,01H
3b46 2C        INC     L
3b47 18E6      JR      3B2FH            ; (-1aH)
3b49 AF        XOR     A
3b4a 1808      JR      3B54H            ; (+08H)
3b4c CD8C1F    CALL    1F8CH
3b4f CD693C    CALL    3C69H
3b52 380E      JR      C,3B62H          ; (+0eH)
3b54 CD8E3B    CALL    3B8EH
3b57 C8        RET     Z

3b58 18F2      JR      3B4CH            ; (-0eH)
3b5a CD8C1F    CALL    1F8CH
3b5d CD693C    CALL    3C69H
3b60 3006      JR      NC,3B68H         ; (+06H)
3b62 CD8E3B    CALL    3B8EH
3b65 C8        RET     Z

3b66 18F2      JR      3B5AH            ; (-0eH)
3b68 AF        XOR     A
3b69 C9        RET     

3b6a AF        XOR     A
3b6b 1808      JR      3B75H            ; (+08H)
3b6d CD8C1F    CALL    1F8CH
3b70 CD693C    CALL    3C69H
3b73 300E      JR      NC,3B83H         ; (+0eH)
3b75 CD9A3B    CALL    3B9AH
3b78 C8        RET     Z

3b79 18F2      JR      3B6DH            ; (-0eH)
3b7b CD8C1F    CALL    1F8CH
3b7e CD693C    CALL    3C69H
3b81 3806      JR      C,3B89H          ; (+06H)
3b83 CD9A3B    CALL    3B9AH
3b86 C8        RET     Z

3b87 18F2      JR      3B7BH            ; (-0eH)
3b89 CD8E3B    CALL    3B8EH
3b8c 18DA      JR      3B68H            ; (-26H)
3b8e 2AAEC6    LD      HL,(0C6AEH)
3b91 CD6B37    CALL    376BH
3b94 C0        RET     NZ

3b95 2601      LD      H,01H
3b97 C34E37    JP      374EH
3b9a 2AAEC6    LD      HL,(0C6AEH)
3b9d CD8C37    CALL    378CH
3ba0 C0        RET     NZ

3ba1 3AB2C6    LD      A,(0C6B2H)
3ba4 67        LD      H,A
3ba5 C35E37    JP      375EH
3ba8 3AAAC6    LD      A,(0C6AAH)
3bab BD        CP      L
3bac D0        RET     NC

3bad 2D        DEC     L
3bae CD6A38    CALL    386AH
3bb1 28F5      JR      Z,3BA8H          ; (-0bH)
3bb3 2C        INC     L
3bb4 C9        RET     

3bb5 3AB3FA    LD      A,(0FAB3H)
3bb8 BC        CP      H
3bb9 D8        RET     C

3bba C5        PUSH    BC
3bbb CD8C1F    CALL    1F8CH
3bbe C1        POP     BC
3bbf CDC93B    CALL    3BC9H
3bc2 12        LD      (DE),A
3bc3 13        INC     DE
3bc4 05        DEC     B
3bc5 C8        RET     Z

3bc6 24        INC     H
3bc7 18EC      JR      3BB5H            ; (-14H)
3bc9 FE20      CP      20H
3bcb D0        RET     NC

3bcc EB        EX      DE,HL
3bcd 3614      LD      (HL),14H
3bcf 23        INC     HL
3bd0 EB        EX      DE,HL
3bd1 C630      ADD     A,30H
3bd3 05        DEC     B
3bd4 C0        RET     NZ

3bd5 1B        DEC     DE
3bd6 04        INC     B
3bd7 3E20      LD      A,20H
3bd9 C9        RET     

3bda CD143C    CALL    3C14H
3bdd F5        PUSH    AF
3bde CD6A38    CALL    386AH
3be1 280E      JR      Z,3BF1H          ; (+0eH)
3be3 F1        POP     AF
3be4 A7        AND     A
3be5 C8        RET     Z

3be6 FE20      CP      20H
3be8 C8        RET     Z

3be9 3AB3C6    LD      A,(0C6B3H)
3bec B9        CP      C
3bed C8        RET     Z

3bee 79        LD      A,C
3bef A7        AND     A
3bf0 C9        RET     

3bf1 F1        POP     AF
3bf2 37        SCF     
3bf3 C9        RET     

3bf4 3AB2C6    LD      A,(0C6B2H)
3bf7 BC        CP      H
3bf8 2813      JR      Z,3C0DH          ; (+13H)
3bfa 24        INC     H
3bfb CD8C1F    CALL    1F8CH
3bfe E5        PUSH    HL
3bff 25        DEC     H
3c00 D4A11F    CALL    NC,1FA1H
3c03 E1        POP     HL
3c04 24        INC     H
3c05 3AB2C6    LD      A,(0C6B2H)
3c08 3C        INC     A
3c09 BC        CP      H
3c0a 20EF      JR      NZ,3BFBH         ; (-11H)
3c0c 25        DEC     H
3c0d 3AB3C6    LD      A,(0C6B3H)
3c10 CDA11F    CALL    1FA1H
3c13 C9        RET     

3c14 E5        PUSH    HL
3c15 C5        PUSH    BC
3c16 CD8C1F    CALL    1F8CH
3c19 C1        POP     BC
3c1a F5        PUSH    AF
3c1b 79        LD      A,C
3c1c CDA11F    CALL    1FA1H
3c1f F1        POP     AF
3c20 4F        LD      C,A
3c21 3AB2C6    LD      A,(0C6B2H)
3c24 3C        INC     A
3c25 24        INC     H
3c26 BC        CP      H
3c27 20EC      JR      NZ,3C15H         ; (-14H)
3c29 79        LD      A,C
3c2a E1        POP     HL
3c2b C9        RET     

3c2c E5        PUSH    HL
3c2d 3AABC6    LD      A,(0C6ABH)
3c30 95        SUB     L
3c31 3827      JR      C,3C5AH          ; (+27H)
3c33 2816      JR      Z,3C4BH          ; (+16H)
3c35 2AAAC6    LD      HL,(0C6AAH)
3c38 E3        EX      (SP),HL
3c39 E5        PUSH    HL
3c3a 7D        LD      A,L
3c3b 32AAC6    LD      (0C6AAH),A
3c3e 3A00FA    LD      A,(0FA00H)
3c41 CDC737    CALL    37C7H
3c44 E1        POP     HL
3c45 E3        EX      (SP),HL
3c46 22AAC6    LD      (0C6AAH),HL
3c49 E1        POP     HL
3c4a E5        PUSH    HL
3c4b 2601      LD      H,01H
3c4d CD111F    CALL    1F11H
3c50 EB        EX      DE,HL
3c51 CD1E1F    CALL    1F1EH
3c54 E1        POP     HL
3c55 3E01      LD      A,01H
3c57 C37738    JP      3877H
3c5a 2AAEC6    LD      HL,(0C6AEH)
3c5d 2D        DEC     L
3c5e 2803      JR      Z,3C63H          ; (+03H)
3c60 CDB11E    CALL    1EB1H
3c63 CD9437    CALL    3794H
3c66 E1        POP     HL
3c67 2D        DEC     L
3c68 C9        RET     

3c69 FE30      CP      30H
3c6b D8        RET     C

3c6c FE3A      CP      3AH
3c6e 3817      JR      C,3C87H          ; (+17H)
3c70 FE41      CP      41H
3c72 D8        RET     C

3c73 FE5B      CP      5BH
3c75 3810      JR      C,3C87H          ; (+10H)
3c77 FE61      CP      61H
3c79 D8        RET     C

3c7a FE7B      CP      7BH
3c7c 3809      JR      C,3C87H          ; (+09H)
3c7e FEA1      CP      0A1H
3c80 D8        RET     C

3c81 FEE0      CP      0E0H
3c83 3802      JR      C,3C87H          ; (+02H)
3c85 37        SCF     
3c86 C9        RET     

3c87 A7        AND     A
3c88 C9        RET     

3c89 E5        PUSH    HL
3c8a 2601      LD      H,01H
3c8c CD111F    CALL    1F11H
3c8f 3AB2C6    LD      A,(0C6B2H)
3c92 47        LD      B,A
3c93 C5        PUSH    BC
3c94 CD841F    CALL    1F84H
3c97 C1        POP     BC
3c98 FEFF      CP      0FFH
3c9a 2805      JR      Z,3CA1H          ; (+05H)
3c9c 23        INC     HL
3c9d 10F4      DJNZ    3C93H            ; (-0cH)
3c9f E1        POP     HL
3ca0 C9        RET     

3ca1 E1        POP     HL
3ca2 E5        PUSH    HL
3ca3 2601      LD      H,01H
3ca5 CD111F    CALL    1F11H
3ca8 EB        EX      DE,HL
3ca9 CD1E1F    CALL    1F1EH
3cac E1        POP     HL
3cad C9        RET     

3cae C9        RET     

3caf F5        PUSH    AF
3cb0 D370      OUT     (70H),A
3cb2 3AC268    LD      A,(68C2H)
3cb5 FED8      CP      0D8H
3cb7 2004      JR      NZ,3CBDH         ; (+04H)
3cb9 F1        POP     AF
3cba C3B0D4    JP      0D4B0H
3cbd F1        POP     AF
3cbe 1A        LD      A,(DE)
3cbf 77        LD      (HL),A
3cc0 23        INC     HL
3cc1 C32B07    JP      072BH
3cc4 2B        DEC     HL
3cc5 C9        RET     

3cc6 3A06F5    LD      A,(0F506H)
3cc9 D370      OUT     (70H),A
3ccb 3AC268    LD      A,(68C2H)
3cce FED8      CP      0D8H
3cd0 2004      JR      NZ,3CD6H         ; (+04H)
3cd2 F1        POP     AF
3cd3 C300D4    JP      0D400H
3cd6 F1        POP     AF
3cd7 09        ADD     HL,BC
3cd8 E5        PUSH    HL
3cd9 CDD846    CALL    46D8H
3cdc C31207    JP      0712H
3cdf F5        PUSH    AF
3ce0 D370      OUT     (70H),A
3ce2 3AC268    LD      A,(68C2H)
3ce5 FED8      CP      0D8H
3ce7 2007      JR      NZ,3CF0H         ; (+07H)
3ce9 F1        POP     AF
3cea CD3066    CALL    6630H
3ced C3061A    JP      1A06H
3cf0 F1        POP     AF
3cf1 CDC027    CALL    27C0H
3cf4 C3061A    JP      1A06H
3cf7 F5        PUSH    AF
3cf8 D370      OUT     (70H),A
3cfa 3AC268    LD      A,(68C2H)
3cfd FED8      CP      0D8H
3cff 2004      JR      NZ,3D05H         ; (+04H)
3d01 F1        POP     AF
3d02 C300C8    JP      0C800H
3d05 F1        POP     AF
3d06 CDE61B    CALL    1BE6H
3d09 C37622    JP      2276H
3d0c 06FE      LD      B,0FEH
3d0e 0A        LD      A,(BC)
3d0f C21800    JP      NZ,0018H
3d12 F5        PUSH    AF
3d13 3E0D      LD      A,0DH
3d15 CD1800    CALL    0018H
3d18 F1        POP     AF
3d19 CD1800    CALL    0018H
3d1c C9        RET     

3d1d 7E        LD      A,(HL)
3d1e FE40      CP      40H
3d20 CC900A    CALL    Z,0A90H
3d23 010000    LD      BC,0000H
3d26 50        LD      D,B
3d27 59        LD      E,C
3d28 FEEA      CP      0EAH
3d2a 2816      JR      Z,3D42H          ; (+16H)
3d2c 7E        LD      A,(HL)
3d2d FEC6      CP      0C6H
3d2f F5        PUSH    AF
3d30 CC900A    CALL    Z,0A90H
3d33 CF        RST     08H
3d34 28CD      JR      Z,3D03H          ; (-33H)
3d36 2A16D5    LD      HL,(0D516H)
3d39 CF        RST     08H
3d3a 2C        INC     L
3d3b CD2A16    CALL    162AH
3d3e CF        RST     08H
3d3f 29        ADD     HL,HL
3d40 C1        POP     BC
3d41 F1        POP     AF
3d42 E5        PUSH    HL
3d43 2AB4C6    LD      HL,(0C6B4H)
3d46 2803      JR      Z,3D4BH          ; (+03H)
3d48 210000    LD      HL,0000H
3d4b 09        ADD     HL,BC
3d4c 22B4C6    LD      (0C6B4H),HL
3d4f 22BAFA    LD      (0FABAH),HL
3d52 44        LD      B,H
3d53 4D        LD      C,L
3d54 2AB6C6    LD      HL,(0C6B6H)
3d57 2803      JR      Z,3D5CH          ; (+03H)
3d59 210000    LD      HL,0000H
3d5c 19        ADD     HL,DE
3d5d 22B6C6    LD      (0C6B6H),HL
3d60 22BCFA    LD      (0FABCH),HL
3d63 EB        EX      DE,HL
3d64 E1        POP     HL
3d65 C9        RET     

3d66 3A9AC6    LD      A,(0C69AH)
3d69 1803      JR      3D6EH            ; (+03H)
3d6b 3A99C6    LD      A,(0C699H)
3d6e F5        PUSH    AF
3d6f CD2C3D    CALL    3D2CH
3d72 F1        POP     AF
3d73 CDD13D    CALL    3DD1H
3d76 E5        PUSH    HL
3d77 CD3A23    CALL    233AH
3d7a 3006      JR      NC,3D82H         ; (+06H)
3d7c CD7C23    CALL    237CH
3d7f CD9323    CALL    2393H
3d82 E1        POP     HL
3d83 C9        RET     

3d84 D7        RST     10H
3d85 E5        PUSH    HL
3d86 CD4325    CALL    2543H
3d89 D1        POP     DE
3d8a E5        PUSH    HL
3d8b F5        PUSH    AF
3d8c 2ABCFA    LD      HL,(0FABCH)
3d8f E5        PUSH    HL
3d90 2ABAFA    LD      HL,(0FABAH)
3d93 E5        PUSH    HL
3d94 2AB6C6    LD      HL,(0C6B6H)
3d97 E5        PUSH    HL
3d98 2AB4C6    LD      HL,(0C6B4H)
3d9b E5        PUSH    HL
3d9c EB        EX      DE,HL
3d9d CD2C3D    CALL    3D2CH
3da0 E5        PUSH    HL
3da1 CD3A23    CALL    233AH
3da4 21FFFF    LD      HL,0FFFFH
3da7 3009      JR      NC,3DB2H         ; (+09H)
3da9 CD7C23    CALL    237CH
3dac CD9723    CALL    2397H
3daf 6F        LD      L,A
3db0 2600      LD      H,00H
3db2 CDC44E    CALL    4EC4H
3db5 D1        POP     DE
3db6 E1        POP     HL
3db7 22B4C6    LD      (0C6B4H),HL
3dba E1        POP     HL
3dbb 22B6C6    LD      (0C6B6H),HL
3dbe E1        POP     HL
3dbf 22BAFA    LD      (0FABAH),HL
3dc2 E1        POP     HL
3dc3 22BCFA    LD      (0FABCH),HL
3dc6 F1        POP     AF
3dc7 E1        POP     HL
3dc8 D5        PUSH    DE
3dc9 CDB825    CALL    25B8H
3dcc E1        POP     HL
3dcd C9        RET     

3dce 3A99C6    LD      A,(0C699H)
3dd1 C5        PUSH    BC
3dd2 D5        PUSH    DE
3dd3 5F        LD      E,A
3dd4 2B        DEC     HL
3dd5 D7        RST     10H
3dd6 2809      JR      Z,3DE1H          ; (+09H)
3dd8 CF        RST     08H
3dd9 2C        INC     L
3dda FE2C      CP      2CH
3ddc 2803      JR      Z,3DE1H          ; (+03H)
3dde CD3716    CALL    1637H
3de1 7B        LD      A,E
3de2 E5        PUSH    HL
3de3 CD8223    CALL    2382H
3de6 DA880B    JP      C,0B88H
3de9 E1        POP     HL
3dea D1        POP     DE
3deb C1        POP     BC
3dec C3910A    JP      0A91H
3def 2ABAFA    LD      HL,(0FABAH)
3df2 7D        LD      A,L
3df3 91        SUB     C
3df4 6F        LD      L,A
3df5 7C        LD      A,H
3df6 98        SBC     A,B
3df7 67        LD      H,A
3df8 D0        RET     NC

3df9 AF        XOR     A
3dfa 95        SUB     L
3dfb 6F        LD      L,A
3dfc 9C        SBC     A,H
3dfd 95        SUB     L
3dfe 67        LD      H,A
3dff 37        SCF     
3e00 C9        RET     

3e01 2ABCFA    LD      HL,(0FABCH)
3e04 7D        LD      A,L
3e05 93        SUB     E
3e06 6F        LD      L,A
3e07 7C        LD      A,H
3e08 9A        SBC     A,D
3e09 67        LD      H,A
3e0a 18EC      JR      3DF8H            ; (-14H)
3e0c E5        PUSH    HL
3e0d 2ABCFA    LD      HL,(0FABCH)
3e10 EB        EX      DE,HL
3e11 22BCFA    LD      (0FABCH),HL
3e14 E1        POP     HL
3e15 C9        RET     

3e16 CD0C3E    CALL    3E0CH
3e19 E5        PUSH    HL
3e1a C5        PUSH    BC
3e1b 2ABAFA    LD      HL,(0FABAH)
3e1e E3        EX      (SP),HL
3e1f 22BAFA    LD      (0FABAH),HL
3e22 C1        POP     BC
3e23 E1        POP     HL
3e24 C9        RET     

3e25 CDFCFA    CALL    0FAFCH
3e28 CD1D3D    CALL    3D1DH
3e2b C5        PUSH    BC
3e2c D5        PUSH    DE
3e2d CF        RST     08H
3e2e EACD2C    JP      PE,2CCDH
3e31 3D        DEC     A
3e32 CDCE3D    CALL    3DCEH
3e35 D1        POP     DE
3e36 C1        POP     BC
3e37 2844      JR      Z,3E7DH          ; (+44H)
3e39 CF        RST     08H
3e3a 2C        INC     L
3e3b CF        RST     08H
3e3c 42        LD      B,D
3e3d CA933E    JP      Z,3E93H
3e40 CF        RST     08H
3e41 46        LD      B,(HL)
3e42 E5        PUSH    HL
3e43 CD3A23    CALL    233AH
3e46 CD163E    CALL    3E16H
3e49 CD3A23    CALL    233AH
3e4c CD013E    CALL    3E01H
3e4f DC0C3E    CALL    C,3E0CH
3e52 23        INC     HL
3e53 E5        PUSH    HL
3e54 CDEF3D    CALL    3DEFH
3e57 DC193E    CALL    C,3E19H
3e5a 23        INC     HL
3e5b E5        PUSH    HL
3e5c CD7C23    CALL    237CH
3e5f D1        POP     DE
3e60 C1        POP     BC
3e61 D5        PUSH    DE
3e62 C5        PUSH    BC
3e63 CD4325    CALL    2543H
3e66 F5        PUSH    AF
3e67 E5        PUSH    HL
3e68 EB        EX      DE,HL
3e69 CD4A25    CALL    254AH
3e6c E1        POP     HL
3e6d F1        POP     AF
3e6e CDB825    CALL    25B8H
3e71 CD3F26    CALL    263FH
3e74 C1        POP     BC
3e75 D1        POP     DE
3e76 0B        DEC     BC
3e77 78        LD      A,B
3e78 B1        OR      C
3e79 20E6      JR      NZ,3E61H         ; (-1aH)
3e7b E1        POP     HL
3e7c C9        RET     

3e7d C5        PUSH    BC
3e7e D5        PUSH    DE
3e7f E5        PUSH    HL
3e80 CDBD3E    CALL    3EBDH
3e83 2AB4C6    LD      HL,(0C6B4H)
3e86 22BAFA    LD      (0FABAH),HL
3e89 2AB6C6    LD      HL,(0C6B6H)
3e8c 22BCFA    LD      (0FABCH),HL
3e8f E1        POP     HL
3e90 D1        POP     DE
3e91 C1        POP     BC
3e92 C9        RET     

3e93 E5        PUSH    HL
3e94 2ABCFA    LD      HL,(0FABCH)
3e97 E5        PUSH    HL
3e98 D5        PUSH    DE
3e99 EB        EX      DE,HL
3e9a CD7D3E    CALL    3E7DH
3e9d E1        POP     HL
3e9e 22BCFA    LD      (0FABCH),HL
3ea1 EB        EX      DE,HL
3ea2 CD7D3E    CALL    3E7DH
3ea5 E1        POP     HL
3ea6 22BCFA    LD      (0FABCH),HL
3ea9 2ABAFA    LD      HL,(0FABAH)
3eac C5        PUSH    BC
3ead 44        LD      B,H
3eae 4D        LD      C,L
3eaf CD7D3E    CALL    3E7DH
3eb2 E1        POP     HL
3eb3 22BAFA    LD      (0FABAH),HL
3eb6 44        LD      B,H
3eb7 4D        LD      C,L
3eb8 CD7D3E    CALL    3E7DH
3ebb E1        POP     HL
3ebc C9        RET     

3ebd CD3A23    CALL    233AH
3ec0 CD163E    CALL    3E16H
3ec3 CD3A23    CALL    233AH
3ec6 CD013E    CALL    3E01H
3ec9 DC163E    CALL    C,3E16H
3ecc D5        PUSH    DE
3ecd E5        PUSH    HL
3ece CDEF3D    CALL    3DEFH
3ed1 EB        EX      DE,HL
3ed2 219B23    LD      HL,239BH
3ed5 3003      JR      NC,3EDAH         ; (+03H)
3ed7 219F23    LD      HL,239FH
3eda E3        EX      (SP),HL
3edb E7        RST     20H
3edc 3010      JR      NC,3EEEH         ; (+10H)
3ede 22C0FA    LD      (0FAC0H),HL
3ee1 E1        POP     HL
3ee2 2203FA    LD      (0FA03H),HL
3ee5 213F26    LD      HL,263FH
3ee8 2206FA    LD      (0FA06H),HL
3eeb EB        EX      DE,HL
3eec 180F      JR      3EFDH            ; (+0fH)
3eee E3        EX      (SP),HL
3eef 2206FA    LD      (0FA06H),HL
3ef2 213F26    LD      HL,263FH
3ef5 2203FA    LD      (0FA03H),HL
3ef8 EB        EX      DE,HL
3ef9 22C0FA    LD      (0FAC0H),HL
3efc E1        POP     HL
3efd D1        POP     DE
3efe E5        PUSH    HL
3eff CDF93D    CALL    3DF9H
3f02 22BEFA    LD      (0FABEH),HL
3f05 CD7C23    CALL    237CH
3f08 D1        POP     DE
3f09 D5        PUSH    DE
3f0a CD323F    CALL    3F32H
3f0d C1        POP     BC
3f0e 03        INC     BC
3f0f 1807      JR      3F18H            ; (+07H)
3f11 E1        POP     HL
3f12 78        LD      A,B
3f13 B1        OR      C
3f14 C8        RET     Z

3f15 CD02FA    CALL    0FA02H
3f18 CD9323    CALL    2393H
3f1b 0B        DEC     BC
3f1c E5        PUSH    HL
3f1d 2AC0FA    LD      HL,(0FAC0H)
3f20 19        ADD     HL,DE
3f21 EB        EX      DE,HL
3f22 2ABEFA    LD      HL,(0FABEH)
3f25 19        ADD     HL,DE
3f26 30E9      JR      NC,3F11H         ; (-17H)
3f28 EB        EX      DE,HL
3f29 E1        POP     HL
3f2a 78        LD      A,B
3f2b B1        OR      C
3f2c C8        RET     Z

3f2d CD05FA    CALL    0FA05H
3f30 18E3      JR      3F15H            ; (-1dH)
3f32 7A        LD      A,D
3f33 B7        OR      A
3f34 1F        RRA     
3f35 57        LD      D,A
3f36 7B        LD      A,E
3f37 1F        RRA     
3f38 5F        LD      E,A
3f39 C9        RET     

3f3a CD1D3D    CALL    3D1DH
3f3d C5        PUSH    BC
3f3e D5        PUSH    DE
3f3f CDCE3D    CALL    3DCEH
3f42 3AD2FA    LD      A,(0FAD2H)
3f45 5F        LD      E,A
3f46 2B        DEC     HL
3f47 D7        RST     10H
3f48 2805      JR      Z,3F4FH          ; (+05H)
3f4a CF        RST     08H
3f4b 2C        INC     L
3f4c CD3716    CALL    1637H
3f4f 7B        LD      A,E
3f50 CDC126    CALL    26C1H
3f53 DA880B    JP      C,0B88H
3f56 D1        POP     DE
3f57 C1        POP     BC
3f58 E5        PUSH    HL
3f59 CD8140    CALL    4081H
3f5c CD7C23    CALL    237CH
3f5f 110100    LD      DE,0001H
3f62 CD4C40    CALL    404CH
3f65 2814      JR      Z,3F7BH          ; (+14H)
3f67 E5        PUSH    HL
3f68 CD5D40    CALL    405DH
3f6b D1        POP     DE
3f6c 19        ADD     HL,DE
3f6d EB        EX      DE,HL
3f6e AF        XOR     A
3f6f CD3E40    CALL    403EH
3f72 3E40      LD      A,40H
3f74 CD3E40    CALL    403EH
3f77 06C0      LD      B,0C0H
3f79 181E      JR      3F99H            ; (+1eH)
3f7b E1        POP     HL
3f7c C9        RET     

3f7d CD571D    CALL    1D57H
3f80 3AC3FA    LD      A,(0FAC3H)
3f83 B7        OR      A
3f84 280C      JR      Z,3F92H          ; (+0cH)
3f86 2AC4FA    LD      HL,(0FAC4H)
3f89 E5        PUSH    HL
3f8a 2AC2FA    LD      HL,(0FAC2H)
3f8d E5        PUSH    HL
3f8e 2AC6FA    LD      HL,(0FAC6H)
3f91 E5        PUSH    HL
3f92 D1        POP     DE
3f93 C1        POP     BC
3f94 E1        POP     HL
3f95 79        LD      A,C
3f96 CDB825    CALL    25B8H
3f99 78        LD      A,B
3f9a 32C8FA    LD      (0FAC8H),A
3f9d 87        ADD     A,A
3f9e 28DB      JR      Z,3F7BH          ; (-25H)
3fa0 D5        PUSH    DE
3fa1 3005      JR      NC,3FA8H         ; (+05H)
3fa3 CDA323    CALL    23A3H
3fa6 1803      JR      3FABH            ; (+03H)
3fa8 CDA723    CALL    23A7H
3fab D1        POP     DE
3fac 38E4      JR      C,3F92H          ; (-1cH)
3fae CD4C40    CALL    404CH
3fb1 CA923F    JP      Z,3F92H
3fb4 AF        XOR     A
3fb5 32C3FA    LD      (0FAC3H),A
3fb8 CD5D40    CALL    405DH
3fbb 5D        LD      E,L
3fbc 54        LD      D,H
3fbd B7        OR      A
3fbe 281A      JR      Z,3FDAH          ; (+1aH)
3fc0 2B        DEC     HL
3fc1 2B        DEC     HL
3fc2 7C        LD      A,H
3fc3 87        ADD     A,A
3fc4 3814      JR      C,3FDAH          ; (+14H)
3fc6 ED53C6FA  LD      (0FAC6H),DE
3fca CD4325    CALL    2543H
3fcd 22C4FA    LD      (0FAC4H),HL
3fd0 32C2FA    LD      (0FAC2H),A
3fd3 3AC8FA    LD      A,(0FAC8H)
3fd6 2F        CPL     
3fd7 32C3FA    LD      (0FAC3H),A
3fda 2ACCFA    LD      HL,(0FACCH)
3fdd 19        ADD     HL,DE
3fde EB        EX      DE,HL
3fdf CD3240    CALL    4032H
3fe2 2ACAFA    LD      HL,(0FACAH)
3fe5 3AC9FA    LD      A,(0FAC9H)
3fe8 CDB825    CALL    25B8H
3feb 2ACEFA    LD      HL,(0FACEH)
3fee ED5BCCFA  LD      DE,(0FACCH)
3ff2 B7        OR      A
3ff3 ED52      SBC     HL,DE
3ff5 2838      JR      Z,402FH          ; (+38H)
3ff7 381A      JR      C,4013H          ; (+1aH)
3ff9 EB        EX      DE,HL
3ffa CD4C40    CALL    404CH
3ffd 2830      JR      Z,402FH          ; (+30H)
3fff B7        OR      A
4000 28E9      JR      Z,3FEBH          ; (-17H)
4002 EB        EX      DE,HL
4003 2ACAFA    LD      HL,(0FACAH)
4006 3AC9FA    LD      A,(0FAC9H)
4009 4F        LD      C,A
400a 3AC8FA    LD      A,(0FAC8H)
400d 47        LD      B,A
400e CD4340    CALL    4043H
4011 18D8      JR      3FEBH            ; (-28H)
4013 CDF93D    CALL    3DF9H
4016 2B        DEC     HL
4017 2B        DEC     HL
4018 7C        LD      A,H
4019 87        ADD     A,A
401a 3813      JR      C,402FH          ; (+13H)
401c 23        INC     HL
401d E5        PUSH    HL
401e EB        EX      DE,HL
401f CD9F23    CALL    239FH
4022 1B        DEC     DE
4023 7A        LD      A,D
4024 B3        OR      E
4025 20F8      JR      NZ,401FH         ; (-08H)
4027 D1        POP     DE
4028 3AC8FA    LD      A,(0FAC8H)
402b 2F        CPL     
402c CD3E40    CALL    403EH
402f C37D3F    JP      3F7DH
4032 3AD0FA    LD      A,(0FAD0H)
4035 4F        LD      C,A
4036 3AD1FA    LD      A,(0FAD1H)
4039 B1        OR      C
403a C8        RET     Z

403b 3AC8FA    LD      A,(0FAC8H)
403e 47        LD      B,A
403f CD4325    CALL    2543H
4042 4F        LD      C,A
4043 E3        EX      (SP),HL
4044 C5        PUSH    BC
4045 D5        PUSH    DE
4046 E5        PUSH    HL
4047 0E02      LD      C,02H
4049 C3E646    JP      46E6H
404c CDD226    CALL    26D2H
404f ED53CEFA  LD      (0FACEH),DE
4053 22CCFA    LD      (0FACCH),HL
4056 7C        LD      A,H
4057 B5        OR      L
4058 79        LD      A,C
4059 32D1FA    LD      (0FAD1H),A
405c C9        RET     

405d CD4325    CALL    2543H
4060 E5        PUSH    HL
4061 F5        PUSH    AF
4062 2ACAFA    LD      HL,(0FACAH)
4065 3AC9FA    LD      A,(0FAC9H)
4068 CDB825    CALL    25B8H
406b F1        POP     AF
406c E1        POP     HL
406d 22CAFA    LD      (0FACAH),HL
4070 32C9FA    LD      (0FAC9H),A
4073 CD0227    CALL    2702H
4076 79        LD      A,C
4077 32D0FA    LD      (0FAD0H),A
407a C9        RET     

407b EB        EX      DE,HL
407c CDF93D    CALL    3DF9H
407f EB        EX      DE,HL
4080 C9        RET     

4081 E5        PUSH    HL
4082 CD3A23    CALL    233AH
4085 D2880B    JP      NC,0B88H
4088 E1        POP     HL
4089 C9        RET     

408a CD8F42    CALL    428FH
408d 7E        LD      A,(HL)
408e 23        INC     HL
408f 4E        LD      C,(HL)
4090 23        INC     HL
4091 46        LD      B,(HL)
4092 D1        POP     DE
4093 C5        PUSH    BC
4094 F5        PUSH    AF
4095 CD9642    CALL    4296H
4098 F1        POP     AF
4099 57        LD      D,A
409a 5E        LD      E,(HL)
409b 23        INC     HL
409c 4E        LD      C,(HL)
409d 23        INC     HL
409e 46        LD      B,(HL)
409f E1        POP     HL
40a0 7B        LD      A,E
40a1 B2        OR      D
40a2 C8        RET     Z

40a3 7A        LD      A,D
40a4 D601      SUB     01H
40a6 D8        RET     C

40a7 AF        XOR     A
40a8 BB        CP      E
40a9 3C        INC     A
40aa D0        RET     NC

40ab 15        DEC     D
40ac 1D        DEC     E
40ad 0A        LD      A,(BC)
40ae 03        INC     BC
40af BE        CP      (HL)
40b0 23        INC     HL
40b1 28ED      JR      Z,40A0H          ; (-13H)
40b3 3F        CCF     
40b4 C3924D    JP      4D92H
40b7 CDD358    CALL    58D3H
40ba 1808      JR      40C4H            ; (+08H)
40bc CDD658    CALL    58D6H
40bf 1803      JR      40C4H            ; (+03H)
40c1 CD6454    CALL    5464H
40c4 CDF240    CALL    40F2H
40c7 CD9242    CALL    4292H
40ca 01E142    LD      BC,42E1H
40cd C5        PUSH    BC
40ce C3170D    JP      0D17H
40d1 CD4D41    CALL    414DH
40d4 E1        POP     HL
40d5 4E        LD      C,(HL)
40d6 23        INC     HL
40d7 46        LD      B,(HL)
40d8 CDE740    CALL    40E7H
40db E5        PUSH    HL
40dc 6F        LD      L,A
40dd CD8642    CALL    4286H
40e0 D1        POP     DE
40e1 C9        RET     

40e2 3E01      LD      A,01H
40e4 CD4D41    CALL    414DH
40e7 2173FE    LD      HL,0FE73H
40ea E5        PUSH    HL
40eb 77        LD      (HL),A
40ec 23        INC     HL
40ed 73        LD      (HL),E
40ee 23        INC     HL
40ef 72        LD      (HL),D
40f0 E1        POP     HL
40f1 C9        RET     

40f2 2B        DEC     HL
40f3 0622      LD      B,22H
40f5 50        LD      D,B
40f6 E5        PUSH    HL
40f7 0EFF      LD      C,0FFH
40f9 23        INC     HL
40fa 7E        LD      A,(HL)
40fb 0C        INC     C
40fc B7        OR      A
40fd 2806      JR      Z,4105H          ; (+06H)
40ff BA        CP      D
4100 2803      JR      Z,4105H          ; (+03H)
4102 B8        CP      B
4103 20F4      JR      NZ,40F9H         ; (-0cH)
4105 FE22      CP      22H
4107 CC900A    CALL    Z,0A90H
410a E3        EX      (SP),HL
410b 23        INC     HL
410c EB        EX      DE,HL
410d 79        LD      A,C
410e CDE740    CALL    40E7H
4111 1173FE    LD      DE,0FE73H
4114 3ED5      LD      A,0D5H
4116 2A53FE    LD      HL,(0FE53H)
4119 22A7FF    LD      (0FFA7H),HL
411c 3E03      LD      A,03H
411e 3242FE    LD      (0FE42H),A
4121 CD054E    CALL    4E05H
4124 1176FE    LD      DE,0FE76H
4127 E7        RST     20H
4128 2253FE    LD      (0FE53H),HL
412b E1        POP     HL
412c 7E        LD      A,(HL)
412d C0        RET     NZ

412e 111000    LD      DE,0010H
4131 C37905    JP      0579H
4134 23        INC     HL
4135 CDF240    CALL    40F2H
4138 CD9242    CALL    4292H
413b CDF64D    CALL    4DF6H
413e 14        INC     D
413f 15        DEC     D
4140 C8        RET     Z

4141 0A        LD      A,(BC)
4142 CD1800    CALL    0018H
4145 FE0D      CP      0DH
4147 CC8632    CALL    Z,3286H
414a 03        INC     BC
414b 18F2      JR      413FH            ; (-0eH)
414d B7        OR      A
414e 0EF1      LD      C,0F1H
4150 F5        PUSH    AF
4151 2AF6FB    LD      HL,(0FBF6H)
4154 EB        EX      DE,HL
4155 2A76FE    LD      HL,(0FE76H)
4158 2F        CPL     
4159 4F        LD      C,A
415a 06FF      LD      B,0FFH
415c 09        ADD     HL,BC
415d 23        INC     HL
415e E7        RST     20H
415f 3807      JR      C,4168H          ; (+07H)
4161 2276FE    LD      (0FE76H),HL
4164 23        INC     HL
4165 EB        EX      DE,HL
4166 F1        POP     AF
4167 C9        RET     

4168 F1        POP     AF
4169 110E00    LD      DE,000EH
416c CA7905    JP      Z,0579H
416f BF        CP      A
4170 F5        PUSH    AF
4171 014F41    LD      BC,414FH
4174 C5        PUSH    BC
4175 2A51FE    LD      HL,(0FE51H)
4178 2276FE    LD      (0FE76H),HL
417b 210000    LD      HL,0000H
417e E5        PUSH    HL
417f 2AA1FE    LD      HL,(0FEA1H)
4182 E5        PUSH    HL
4183 2155FE    LD      HL,0FE55H
4186 ED5B53FE  LD      DE,(0FE53H)
418a E7        RST     20H
418b 018641    LD      BC,4186H
418e C20142    JP      NZ,4201H
4191 2127FF    LD      HL,0FF27H
4194 2293FF    LD      (0FF93H),HL
4197 2A9FFE    LD      HL,(0FE9FH)
419a 2290FF    LD      (0FF90H),HL
419d 2A9DFE    LD      HL,(0FE9DH)
41a0 ED5B90FF  LD      DE,(0FF90H)
41a4 E7        RST     20H
41a5 2812      JR      Z,41B9H          ; (+12H)
41a7 7E        LD      A,(HL)
41a8 23        INC     HL
41a9 23        INC     HL
41aa 23        INC     HL
41ab FE03      CP      03H
41ad 2004      JR      NZ,41B3H         ; (+04H)
41af CD0242    CALL    4202H
41b2 AF        XOR     A
41b3 5F        LD      E,A
41b4 1600      LD      D,00H
41b6 19        ADD     HL,DE
41b7 18E7      JR      41A0H            ; (-19H)
41b9 2A93FF    LD      HL,(0FF93H)
41bc 5E        LD      E,(HL)
41bd 23        INC     HL
41be 56        LD      D,(HL)
41bf 7A        LD      A,D
41c0 B3        OR      E
41c1 2A9FFE    LD      HL,(0FE9FH)
41c4 2813      JR      Z,41D9H          ; (+13H)
41c6 EB        EX      DE,HL
41c7 2293FF    LD      (0FF93H),HL
41ca 23        INC     HL
41cb 23        INC     HL
41cc 5E        LD      E,(HL)
41cd 23        INC     HL
41ce 56        LD      D,(HL)
41cf 23        INC     HL
41d0 EB        EX      DE,HL
41d1 19        ADD     HL,DE
41d2 2290FF    LD      (0FF90H),HL
41d5 EB        EX      DE,HL
41d6 18C8      JR      41A0H            ; (-38H)
41d8 C1        POP     BC
41d9 ED5BA1FE  LD      DE,(0FEA1H)
41dd E7        RST     20H
41de CA2242    JP      Z,4222H
41e1 7E        LD      A,(HL)
41e2 23        INC     HL
41e3 CDF44D    CALL    4DF4H
41e6 E5        PUSH    HL
41e7 09        ADD     HL,BC
41e8 FE03      CP      03H
41ea 20EC      JR      NZ,41D8H         ; (-14H)
41ec 227AFE    LD      (0FE7AH),HL
41ef E1        POP     HL
41f0 4E        LD      C,(HL)
41f1 0600      LD      B,00H
41f3 09        ADD     HL,BC
41f4 09        ADD     HL,BC
41f5 23        INC     HL
41f6 EB        EX      DE,HL
41f7 2A7AFE    LD      HL,(0FE7AH)
41fa EB        EX      DE,HL
41fb E7        RST     20H
41fc 28DB      JR      Z,41D9H          ; (-25H)
41fe 01F641    LD      BC,41F6H
4201 C5        PUSH    BC
4202 AF        XOR     A
4203 B6        OR      (HL)
4204 23        INC     HL
4205 5E        LD      E,(HL)
4206 23        INC     HL
4207 56        LD      D,(HL)
4208 23        INC     HL
4209 C8        RET     Z

420a 44        LD      B,H
420b 4D        LD      C,L
420c 2A76FE    LD      HL,(0FE76H)
420f E7        RST     20H
4210 60        LD      H,B
4211 69        LD      L,C
4212 D8        RET     C

4213 E1        POP     HL
4214 E3        EX      (SP),HL
4215 E7        RST     20H
4216 E3        EX      (SP),HL
4217 E5        PUSH    HL
4218 60        LD      H,B
4219 69        LD      L,C
421a D0        RET     NC

421b C1        POP     BC
421c F1        POP     AF
421d F1        POP     AF
421e E5        PUSH    HL
421f D5        PUSH    DE
4220 C5        PUSH    BC
4221 C9        RET     

4222 D1        POP     DE
4223 E1        POP     HL
4224 7C        LD      A,H
4225 B5        OR      L
4226 C8        RET     Z

4227 2B        DEC     HL
4228 46        LD      B,(HL)
4229 2B        DEC     HL
422a 4E        LD      C,(HL)
422b E5        PUSH    HL
422c 2B        DEC     HL
422d 6E        LD      L,(HL)
422e 2600      LD      H,00H
4230 09        ADD     HL,BC
4231 50        LD      D,B
4232 59        LD      E,C
4233 2B        DEC     HL
4234 44        LD      B,H
4235 4D        LD      C,L
4236 2A76FE    LD      HL,(0FE76H)
4239 CDDB46    CALL    46DBH
423c E1        POP     HL
423d 71        LD      (HL),C
423e 23        INC     HL
423f 70        LD      (HL),B
4240 60        LD      H,B
4241 69        LD      L,C
4242 2B        DEC     HL
4243 C37841    JP      4178H
4246 C5        PUSH    BC
4247 E5        PUSH    HL
4248 2AA7FF    LD      HL,(0FFA7H)
424b E3        EX      (SP),HL
424c CD0E12    CALL    120EH
424f E3        EX      (SP),HL
4250 CD1D4F    CALL    4F1DH
4253 7E        LD      A,(HL)
4254 E5        PUSH    HL
4255 2AA7FF    LD      HL,(0FFA7H)
4258 E5        PUSH    HL
4259 86        ADD     A,(HL)
425a 110F00    LD      DE,000FH
425d DA7905    JP      C,0579H
4260 CDE440    CALL    40E4H
4263 D1        POP     DE
4264 CD9642    CALL    4296H
4267 E3        EX      (SP),HL
4268 CD9542    CALL    4295H
426b E5        PUSH    HL
426c 2A74FE    LD      HL,(0FE74H)
426f EB        EX      DE,HL
4270 CD7E42    CALL    427EH
4273 CD7E42    CALL    427EH
4276 21A710    LD      HL,10A7H
4279 E3        EX      (SP),HL
427a E5        PUSH    HL
427b C31141    JP      4111H
427e E1        POP     HL
427f E3        EX      (SP),HL
4280 7E        LD      A,(HL)
4281 23        INC     HL
4282 4E        LD      C,(HL)
4283 23        INC     HL
4284 46        LD      B,(HL)
4285 6F        LD      L,A
4286 2C        INC     L
4287 2D        DEC     L
4288 C8        RET     Z

4289 0A        LD      A,(BC)
428a 12        LD      (DE),A
428b 03        INC     BC
428c 13        INC     DE
428d 18F8      JR      4287H            ; (-08H)
428f CD1D4F    CALL    4F1DH
4292 2AA7FF    LD      HL,(0FFA7H)
4295 EB        EX      DE,HL
4296 CDAD42    CALL    42ADH
4299 EB        EX      DE,HL
429a C0        RET     NZ

429b D5        PUSH    DE
429c 50        LD      D,B
429d 59        LD      E,C
429e 1B        DEC     DE
429f 4E        LD      C,(HL)
42a0 2A76FE    LD      HL,(0FE76H)
42a3 E7        RST     20H
42a4 2005      JR      NZ,42ABH         ; (+05H)
42a6 47        LD      B,A
42a7 09        ADD     HL,BC
42a8 2276FE    LD      (0FE76H),HL
42ab E1        POP     HL
42ac C9        RET     

42ad 2A53FE    LD      HL,(0FE53H)
42b0 2B        DEC     HL
42b1 46        LD      B,(HL)
42b2 2B        DEC     HL
42b3 4E        LD      C,(HL)
42b4 2B        DEC     HL
42b5 E7        RST     20H
42b6 C0        RET     NZ

42b7 2253FE    LD      (0FE53H),HL
42ba C9        RET     

42bb 010614    LD      BC,1406H
42be C5        PUSH    BC
42bf CD8F42    CALL    428FH
42c2 AF        XOR     A
42c3 57        LD      D,A
42c4 7E        LD      A,(HL)
42c5 B7        OR      A
42c6 C9        RET     

42c7 010614    LD      BC,1406H
42ca C5        PUSH    BC
42cb CDBF42    CALL    42BFH
42ce CA880B    JP      Z,0B88H
42d1 23        INC     HL
42d2 5E        LD      E,(HL)
42d3 23        INC     HL
42d4 56        LD      D,(HL)
42d5 1A        LD      A,(DE)
42d6 C9        RET     

42d7 CDE240    CALL    40E2H
42da CD3A16    CALL    163AH
42dd 2A74FE    LD      HL,(0FE74H)
42e0 73        LD      (HL),E
42e1 C1        POP     BC
42e2 C31141    JP      4111H
42e5 D7        RST     10H
42e6 CF        RST     08H
42e7 28CD      JR      Z,42B6H          ; (-33H)
42e9 37        SCF     
42ea 16D5      LD      D,0D5H
42ec CF        RST     08H
42ed 2C        INC     L
42ee CD9B10    CALL    109BH
42f1 CF        RST     08H
42f2 29        ADD     HL,HL
42f3 E3        EX      (SP),HL
42f4 E5        PUSH    HL
42f5 F7        RST     30H
42f6 2805      JR      Z,42FDH          ; (+05H)
42f8 CD3A16    CALL    163AH
42fb 1803      JR      4300H            ; (+03H)
42fd CDCB42    CALL    42CBH
4300 D1        POP     DE
4301 CD0943    CALL    4309H
4304 CD3A16    CALL    163AH
4307 3E20      LD      A,20H
4309 F5        PUSH    AF
430a 7B        LD      A,E
430b CDE440    CALL    40E4H
430e 47        LD      B,A
430f F1        POP     AF
4310 04        INC     B
4311 05        DEC     B
4312 28CD      JR      Z,42E1H          ; (-33H)
4314 2A74FE    LD      HL,(0FE74H)
4317 77        LD      (HL),A
4318 23        INC     HL
4319 10FC      DJNZ    4317H            ; (-04H)
431b 18C4      JR      42E1H            ; (-3cH)
431d CD9F43    CALL    439FH
4320 AF        XOR     A
4321 E3        EX      (SP),HL
4322 4F        LD      C,A
4323 3EE5      LD      A,0E5H
4325 E5        PUSH    HL
4326 7E        LD      A,(HL)
4327 B8        CP      B
4328 3802      JR      C,432CH          ; (+02H)
432a 78        LD      A,B
432b 110E00    LD      DE,000EH
432e C5        PUSH    BC
432f CD4D41    CALL    414DH
4332 C1        POP     BC
4333 E1        POP     HL
4334 E5        PUSH    HL
4335 23        INC     HL
4336 46        LD      B,(HL)
4337 23        INC     HL
4338 66        LD      H,(HL)
4339 68        LD      L,B
433a 0600      LD      B,00H
433c 09        ADD     HL,BC
433d 44        LD      B,H
433e 4D        LD      C,L
433f CDE740    CALL    40E7H
4342 6F        LD      L,A
4343 CD8642    CALL    4286H
4346 D1        POP     DE
4347 CD9642    CALL    4296H
434a C31141    JP      4111H
434d CD9F43    CALL    439FH
4350 D1        POP     DE
4351 D5        PUSH    DE
4352 1A        LD      A,(DE)
4353 90        SUB     B
4354 18CB      JR      4321H            ; (-35H)
4356 EB        EX      DE,HL
4357 7E        LD      A,(HL)
4358 CDA243    CALL    43A2H
435b 04        INC     B
435c 05        DEC     B
435d CA880B    JP      Z,0B88H
4360 C5        PUSH    BC
4361 CD9A44    CALL    449AH
4364 F1        POP     AF
4365 E3        EX      (SP),HL
4366 012543    LD      BC,4325H
4369 C5        PUSH    BC
436a 3D        DEC     A
436b BE        CP      (HL)
436c 0600      LD      B,00H
436e D0        RET     NC

436f 4F        LD      C,A
4370 7E        LD      A,(HL)
4371 91        SUB     C
4372 BB        CP      E
4373 47        LD      B,A
4374 D8        RET     C

4375 43        LD      B,E
4376 C9        RET     

4377 CDBF42    CALL    42BFH
437a CA0614    JP      Z,1406H
437d 5F        LD      E,A
437e 23        INC     HL
437f 7E        LD      A,(HL)
4380 23        INC     HL
4381 66        LD      H,(HL)
4382 6F        LD      L,A
4383 E5        PUSH    HL
4384 19        ADD     HL,DE
4385 46        LD      B,(HL)
4386 22FCFB    LD      (0FBFCH),HL
4389 78        LD      A,B
438a 3297FF    LD      (0FF97H),A
438d 72        LD      (HL),D
438e E3        EX      (SP),HL
438f C5        PUSH    BC
4390 2B        DEC     HL
4391 D7        RST     10H
4392 CDF252    CALL    52F2H
4395 210000    LD      HL,0000H
4398 22FCFB    LD      (0FBFCH),HL
439b C1        POP     BC
439c E1        POP     HL
439d 70        LD      (HL),B
439e C9        RET     

439f EB        EX      DE,HL
43a0 CF        RST     08H
43a1 29        ADD     HL,HL
43a2 C1        POP     BC
43a3 D1        POP     DE
43a4 C5        PUSH    BC
43a5 43        LD      B,E
43a6 C9        RET     

43a7 D7        RST     10H
43a8 CD9910    CALL    1099H
43ab F7        RST     30H
43ac 3E01      LD      A,01H
43ae F5        PUSH    AF
43af 2811      JR      Z,43C2H          ; (+11H)
43b1 F1        POP     AF
43b2 CD3A16    CALL    163AH
43b5 B7        OR      A
43b6 CA880B    JP      Z,0B88H
43b9 F5        PUSH    AF
43ba CF        RST     08H
43bb 2C        INC     L
43bc CD9B10    CALL    109BH
43bf CD1D4F    CALL    4F1DH
43c2 CF        RST     08H
43c3 2C        INC     L
43c4 E5        PUSH    HL
43c5 2AA7FF    LD      HL,(0FFA7H)
43c8 E3        EX      (SP),HL
43c9 CD9B10    CALL    109BH
43cc CF        RST     08H
43cd 29        ADD     HL,HL
43ce E5        PUSH    HL
43cf CD8F42    CALL    428FH
43d2 EB        EX      DE,HL
43d3 C1        POP     BC
43d4 E1        POP     HL
43d5 F1        POP     AF
43d6 C5        PUSH    BC
43d7 01B14C    LD      BC,4CB1H
43da C5        PUSH    BC
43db 010614    LD      BC,1406H
43de C5        PUSH    BC
43df F5        PUSH    AF
43e0 D5        PUSH    DE
43e1 CD9542    CALL    4295H
43e4 D1        POP     DE
43e5 F1        POP     AF
43e6 47        LD      B,A
43e7 3D        DEC     A
43e8 4F        LD      C,A
43e9 BE        CP      (HL)
43ea 3E00      LD      A,00H
43ec D0        RET     NC

43ed 1A        LD      A,(DE)
43ee B7        OR      A
43ef 78        LD      A,B
43f0 C8        RET     Z

43f1 7E        LD      A,(HL)
43f2 23        INC     HL
43f3 46        LD      B,(HL)
43f4 23        INC     HL
43f5 66        LD      H,(HL)
43f6 68        LD      L,B
43f7 0600      LD      B,00H
43f9 09        ADD     HL,BC
43fa 91        SUB     C
43fb 47        LD      B,A
43fc C5        PUSH    BC
43fd D5        PUSH    DE
43fe E3        EX      (SP),HL
43ff 4E        LD      C,(HL)
4400 23        INC     HL
4401 5E        LD      E,(HL)
4402 23        INC     HL
4403 56        LD      D,(HL)
4404 E1        POP     HL
4405 E5        PUSH    HL
4406 D5        PUSH    DE
4407 C5        PUSH    BC
4408 1A        LD      A,(DE)
4409 BE        CP      (HL)
440a 2016      JR      NZ,4422H         ; (+16H)
440c 13        INC     DE
440d 0D        DEC     C
440e 2809      JR      Z,4419H          ; (+09H)
4410 23        INC     HL
4411 10F5      DJNZ    4408H            ; (-0bH)
4413 D1        POP     DE
4414 D1        POP     DE
4415 C1        POP     BC
4416 D1        POP     DE
4417 AF        XOR     A
4418 C9        RET     

4419 E1        POP     HL
441a D1        POP     DE
441b D1        POP     DE
441c C1        POP     BC
441d 78        LD      A,B
441e 94        SUB     H
441f 81        ADD     A,C
4420 3C        INC     A
4421 C9        RET     

4422 C1        POP     BC
4423 D1        POP     DE
4424 E1        POP     HL
4425 23        INC     HL
4426 10DD      DJNZ    4405H            ; (-23H)
4428 18EC      JR      4416H            ; (-14H)
442a CF        RST     08H
442b 28CD      JR      Z,43FAH          ; (-33H)
442d CE44      ADC     A,44H
442f CD1D4F    CALL    4F1DH
4432 E5        PUSH    HL
4433 D5        PUSH    DE
4434 EB        EX      DE,HL
4435 23        INC     HL
4436 5E        LD      E,(HL)
4437 23        INC     HL
4438 56        LD      D,(HL)
4439 2AA1FE    LD      HL,(0FEA1H)
443c E7        RST     20H
443d 380A      JR      C,4449H          ; (+0aH)
443f E1        POP     HL
4440 E5        PUSH    HL
4441 CDCE40    CALL    40CEH
4444 E1        POP     HL
4445 E5        PUSH    HL
4446 CD054E    CALL    4E05H
4449 E1        POP     HL
444a E3        EX      (SP),HL
444b CF        RST     08H
444c 2C        INC     L
444d CD3716    CALL    1637H
4450 B7        OR      A
4451 CA880B    JP      Z,0B88H
4454 F5        PUSH    AF
4455 7E        LD      A,(HL)
4456 CD9A44    CALL    449AH
4459 D5        PUSH    DE
445a CD9610    CALL    1096H
445d E5        PUSH    HL
445e CD8F42    CALL    428FH
4461 EB        EX      DE,HL
4462 E1        POP     HL
4463 C1        POP     BC
4464 F1        POP     AF
4465 47        LD      B,A
4466 E3        EX      (SP),HL
4467 E5        PUSH    HL
4468 21B14C    LD      HL,4CB1H
446b E3        EX      (SP),HL
446c 79        LD      A,C
446d B7        OR      A
446e C8        RET     Z

446f 7E        LD      A,(HL)
4470 90        SUB     B
4471 DA880B    JP      C,0B88H
4474 3C        INC     A
4475 B9        CP      C
4476 3801      JR      C,4479H          ; (+01H)
4478 79        LD      A,C
4479 48        LD      C,B
447a 0D        DEC     C
447b 0600      LD      B,00H
447d D5        PUSH    DE
447e 23        INC     HL
447f 5E        LD      E,(HL)
4480 23        INC     HL
4481 66        LD      H,(HL)
4482 6B        LD      L,E
4483 09        ADD     HL,BC
4484 47        LD      B,A
4485 D1        POP     DE
4486 EB        EX      DE,HL
4487 4E        LD      C,(HL)
4488 23        INC     HL
4489 7E        LD      A,(HL)
448a 23        INC     HL
448b 66        LD      H,(HL)
448c 6F        LD      L,A
448d EB        EX      DE,HL
448e 79        LD      A,C
448f B7        OR      A
4490 C8        RET     Z

4491 1A        LD      A,(DE)
4492 77        LD      (HL),A
4493 13        INC     DE
4494 23        INC     HL
4495 0D        DEC     C
4496 C8        RET     Z

4497 10F8      DJNZ    4491H            ; (-08H)
4499 C9        RET     

449a 1EFF      LD      E,0FFH
449c FE29      CP      29H
449e 2805      JR      Z,44A5H          ; (+05H)
44a0 CF        RST     08H
44a1 2C        INC     L
44a2 CD3716    CALL    1637H
44a5 CF        RST     08H
44a6 29        ADD     HL,HL
44a7 C9        RET     

44a8 2AA1FE    LD      HL,(0FEA1H)
44ab EB        EX      DE,HL
44ac 210000    LD      HL,0000H
44af 39        ADD     HL,SP
44b0 F7        RST     30H
44b1 C2EC13    JP      NZ,13ECH
44b4 CD9242    CALL    4292H
44b7 CD7541    CALL    4175H
44ba ED5BF6FB  LD      DE,(0FBF6H)
44be 2A76FE    LD      HL,(0FE76H)
44c1 C3EC13    JP      13ECH
44c4 2B        DEC     HL
44c5 D7        RST     10H
44c6 C8        RET     Z

44c7 CF        RST     08H
44c8 2C        INC     L
44c9 01C444    LD      BC,44C4H
44cc C5        PUSH    BC
44cd F6AF      OR      0AFH
44cf 3241FE    LD      (0FE41H),A
44d2 4E        LD      C,(HL)
44d3 CD8048    CALL    4880H
44d6 DA5F05    JP      C,055FH
44d9 AF        XOR     A
44da 47        LD      B,A
44db D7        RST     10H
44dc 3805      JR      C,44E3H          ; (+05H)
44de CD8148    CALL    4881H
44e1 3809      JR      C,44ECH          ; (+09H)
44e3 47        LD      B,A
44e4 D7        RST     10H
44e5 38FD      JR      C,44E4H          ; (-03H)
44e7 CD8148    CALL    4881H
44ea 30F8      JR      NC,44E4H         ; (-08H)
44ec FE26      CP      26H
44ee 3017      JR      NC,4507H         ; (+17H)
44f0 111545    LD      DE,4515H
44f3 D5        PUSH    DE
44f4 1602      LD      D,02H
44f6 FE25      CP      25H
44f8 C8        RET     Z

44f9 14        INC     D
44fa FE24      CP      24H
44fc C8        RET     Z

44fd 14        INC     D
44fe FE21      CP      21H
4500 C8        RET     Z

4501 1608      LD      D,08H
4503 FE23      CP      23H
4505 C8        RET     Z

4506 F1        POP     AF
4507 79        LD      A,C
4508 E67F      AND     7FH
450a 5F        LD      E,A
450b 1600      LD      D,00H
450d E5        PUSH    HL
450e 2164FE    LD      HL,0FE64H
4511 19        ADD     HL,DE
4512 56        LD      D,(HL)
4513 E1        POP     HL
4514 2B        DEC     HL
4515 7A        LD      A,D
4516 3242FE    LD      (0FE42H),A
4519 D7        RST     10H
451a 3A80FE    LD      A,(0FE80H)
451d 3D        DEC     A
451e CA0F46    JP      Z,460FH
4521 F22F45    JP      P,452FH
4524 7E        LD      A,(HL)
4525 D628      SUB     28H
4527 CAE145    JP      Z,45E1H
452a D633      SUB     33H
452c CAE145    JP      Z,45E1H
452f AF        XOR     A
4530 3280FE    LD      (0FE80H),A
4533 E5        PUSH    HL
4534 3A92FF    LD      A,(0FF92H)
4537 B7        OR      A
4538 328FFF    LD      (0FF8FH),A
453b 283C      JR      Z,4579H          ; (+3cH)
453d 2AC1FE    LD      HL,(0FEC1H)
4540 11C3FE    LD      DE,0FEC3H
4543 19        ADD     HL,DE
4544 2290FF    LD      (0FF90H),HL
4547 EB        EX      DE,HL
4548 1817      JR      4561H            ; (+17H)
454a 1A        LD      A,(DE)
454b 6F        LD      L,A
454c 13        INC     DE
454d 1A        LD      A,(DE)
454e 13        INC     DE
454f B9        CP      C
4550 200B      JR      NZ,455DH         ; (+0bH)
4552 3A42FE    LD      A,(0FE42H)
4555 BD        CP      L
4556 2005      JR      NZ,455DH         ; (+05H)
4558 1A        LD      A,(DE)
4559 B8        CP      B
455a CACB45    JP      Z,45CBH
455d 13        INC     DE
455e 2600      LD      H,00H
4560 19        ADD     HL,DE
4561 EB        EX      DE,HL
4562 3A90FF    LD      A,(0FF90H)
4565 BB        CP      E
4566 C24A45    JP      NZ,454AH
4569 3A91FF    LD      A,(0FF91H)
456c BA        CP      D
456d 20DB      JR      NZ,454AH         ; (-25H)
456f 3A8FFF    LD      A,(0FF8FH)
4572 B7        OR      A
4573 2818      JR      Z,458DH          ; (+18H)
4575 AF        XOR     A
4576 328FFF    LD      (0FF8FH),A
4579 2A9FFE    LD      HL,(0FE9FH)
457c 2290FF    LD      (0FF90H),HL
457f 2A9DFE    LD      HL,(0FE9DH)
4582 18DD      JR      4561H            ; (-23H)
4584 CDCE44    CALL    44CEH
4587 C9        RET     

4588 57        LD      D,A
4589 5F        LD      E,A
458a C1        POP     BC
458b E3        EX      (SP),HL
458c C9        RET     

458d E1        POP     HL
458e E3        EX      (SP),HL
458f D5        PUSH    DE
4590 118745    LD      DE,4587H
4593 E7        RST     20H
4594 28F2      JR      Z,4588H          ; (-0eH)
4596 11B012    LD      DE,12B0H
4599 E7        RST     20H
459a D1        POP     DE
459b 2831      JR      Z,45CEH          ; (+31H)
459d E3        EX      (SP),HL
459e E5        PUSH    HL
459f C5        PUSH    BC
45a0 3A42FE    LD      A,(0FE42H)
45a3 4F        LD      C,A
45a4 C5        PUSH    BC
45a5 0600      LD      B,00H
45a7 03        INC     BC
45a8 03        INC     BC
45a9 03        INC     BC
45aa 2AA1FE    LD      HL,(0FEA1H)
45ad E5        PUSH    HL
45ae 09        ADD     HL,BC
45af C1        POP     BC
45b0 E5        PUSH    HL
45b1 CDD846    CALL    46D8H
45b4 E1        POP     HL
45b5 22A1FE    LD      (0FEA1H),HL
45b8 60        LD      H,B
45b9 69        LD      L,C
45ba 229FFE    LD      (0FE9FH),HL
45bd 2B        DEC     HL
45be 3600      LD      (HL),00H
45c0 E7        RST     20H
45c1 20FA      JR      NZ,45BDH         ; (-06H)
45c3 D1        POP     DE
45c4 73        LD      (HL),E
45c5 23        INC     HL
45c6 D1        POP     DE
45c7 73        LD      (HL),E
45c8 23        INC     HL
45c9 72        LD      (HL),D
45ca EB        EX      DE,HL
45cb 13        INC     DE
45cc E1        POP     HL
45cd C9        RET     

45ce 32AAFF    LD      (0FFAAH),A
45d1 67        LD      H,A
45d2 6F        LD      L,A
45d3 22A7FF    LD      (0FFA7H),HL
45d6 F7        RST     30H
45d7 2006      JR      NZ,45DFH         ; (+06H)
45d9 211805    LD      HL,0518H
45dc 22A7FF    LD      (0FFA7H),HL
45df E1        POP     HL
45e0 C9        RET     

45e1 E5        PUSH    HL
45e2 2A41FE    LD      HL,(0FE41H)
45e5 E3        EX      (SP),HL
45e6 57        LD      D,A
45e7 D5        PUSH    DE
45e8 C5        PUSH    BC
45e9 CD830B    CALL    0B83H
45ec C1        POP     BC
45ed F1        POP     AF
45ee EB        EX      DE,HL
45ef E3        EX      (SP),HL
45f0 E5        PUSH    HL
45f1 EB        EX      DE,HL
45f2 3C        INC     A
45f3 57        LD      D,A
45f4 7E        LD      A,(HL)
45f5 FE2C      CP      2CH
45f7 CAE745    JP      Z,45E7H
45fa FE29      CP      29H
45fc 2805      JR      Z,4603H          ; (+05H)
45fe FE5D      CP      5DH
4600 C25F05    JP      NZ,055FH
4603 D7        RST     10H
4604 2297FE    LD      (0FE97H),HL
4607 E1        POP     HL
4608 2241FE    LD      (0FE41H),HL
460b 1E00      LD      E,00H
460d D5        PUSH    DE
460e 11E5F5    LD      DE,0F5E5H
4611 2A9FFE    LD      HL,(0FE9FH)
4614 3E19      LD      A,19H
4616 ED5BA1FE  LD      DE,(0FEA1H)
461a E7        RST     20H
461b 282D      JR      Z,464AH          ; (+2dH)
461d 5E        LD      E,(HL)
461e 23        INC     HL
461f 7E        LD      A,(HL)
4620 23        INC     HL
4621 B9        CP      C
4622 2008      JR      NZ,462CH         ; (+08H)
4624 3A42FE    LD      A,(0FE42H)
4627 BB        CP      E
4628 2002      JR      NZ,462CH         ; (+02H)
462a 7E        LD      A,(HL)
462b B8        CP      B
462c 23        INC     HL
462d 5E        LD      E,(HL)
462e 23        INC     HL
462f 56        LD      D,(HL)
4630 23        INC     HL
4631 20E2      JR      NZ,4615H         ; (-1eH)
4633 3A41FE    LD      A,(0FE41H)
4636 B7        OR      A
4637 C26805    JP      NZ,0568H
463a F1        POP     AF
463b 44        LD      B,H
463c 4D        LD      C,L
463d CAB14C    JP      Z,4CB1H
4640 96        SUB     (HL)
4641 CAA446    JP      Z,46A4H
4644 110900    LD      DE,0009H
4647 C37905    JP      0579H
464a 3A42FE    LD      A,(0FE42H)
464d 77        LD      (HL),A
464e 23        INC     HL
464f 5F        LD      E,A
4650 1600      LD      D,00H
4652 F1        POP     AF
4653 CA880B    JP      Z,0B88H
4656 71        LD      (HL),C
4657 23        INC     HL
4658 70        LD      (HL),B
4659 23        INC     HL
465a 4F        LD      C,A
465b CDE646    CALL    46E6H
465e 23        INC     HL
465f 23        INC     HL
4660 2278FE    LD      (0FE78H),HL
4663 71        LD      (HL),C
4664 23        INC     HL
4665 3A41FE    LD      A,(0FE41H)
4668 17        RLA     
4669 79        LD      A,C
466a 010B00    LD      BC,000BH
466d 3002      JR      NC,4671H         ; (+02H)
466f C1        POP     BC
4670 03        INC     BC
4671 71        LD      (HL),C
4672 F5        PUSH    AF
4673 23        INC     HL
4674 70        LD      (HL),B
4675 23        INC     HL
4676 CDD94F    CALL    4FD9H
4679 F1        POP     AF
467a 3D        DEC     A
467b 20ED      JR      NZ,466AH         ; (-13H)
467d F5        PUSH    AF
467e 42        LD      B,D
467f 4B        LD      C,E
4680 EB        EX      DE,HL
4681 19        ADD     HL,DE
4682 DAFD46    JP      C,46FDH
4685 CDEF46    CALL    46EFH
4688 22A1FE    LD      (0FEA1H),HL
468b 2B        DEC     HL
468c 3600      LD      (HL),00H
468e E7        RST     20H
468f 20FA      JR      NZ,468BH         ; (-06H)
4691 03        INC     BC
4692 57        LD      D,A
4693 2A78FE    LD      HL,(0FE78H)
4696 5E        LD      E,(HL)
4697 EB        EX      DE,HL
4698 29        ADD     HL,HL
4699 09        ADD     HL,BC
469a EB        EX      DE,HL
469b 2B        DEC     HL
469c 2B        DEC     HL
469d 73        LD      (HL),E
469e 23        INC     HL
469f 72        LD      (HL),D
46a0 23        INC     HL
46a1 F1        POP     AF
46a2 3830      JR      C,46D4H          ; (+30H)
46a4 47        LD      B,A
46a5 4F        LD      C,A
46a6 7E        LD      A,(HL)
46a7 23        INC     HL
46a8 16E1      LD      D,0E1H
46aa 5E        LD      E,(HL)
46ab 23        INC     HL
46ac 56        LD      D,(HL)
46ad 23        INC     HL
46ae E3        EX      (SP),HL
46af F5        PUSH    AF
46b0 E7        RST     20H
46b1 D24446    JP      NC,4644H
46b4 CDD94F    CALL    4FD9H
46b7 19        ADD     HL,DE
46b8 F1        POP     AF
46b9 3D        DEC     A
46ba 44        LD      B,H
46bb 4D        LD      C,L
46bc 20EB      JR      NZ,46A9H         ; (-15H)
46be 3A42FE    LD      A,(0FE42H)
46c1 44        LD      B,H
46c2 4D        LD      C,L
46c3 29        ADD     HL,HL
46c4 D604      SUB     04H
46c6 3804      JR      C,46CCH          ; (+04H)
46c8 29        ADD     HL,HL
46c9 2806      JR      Z,46D1H          ; (+06H)
46cb 29        ADD     HL,HL
46cc B7        OR      A
46cd E2D146    JP      PO,46D1H
46d0 09        ADD     HL,BC
46d1 C1        POP     BC
46d2 09        ADD     HL,BC
46d3 EB        EX      DE,HL
46d4 2A97FE    LD      HL,(0FE97H)
46d7 C9        RET     

46d8 CDEF46    CALL    46EFH
46db C5        PUSH    BC
46dc E3        EX      (SP),HL
46dd C1        POP     BC
46de E7        RST     20H
46df 7E        LD      A,(HL)
46e0 02        LD      (BC),A
46e1 C8        RET     Z

46e2 0B        DEC     BC
46e3 2B        DEC     HL
46e4 18F8      JR      46DEH            ; (-08H)
46e6 E5        PUSH    HL
46e7 2AA1FE    LD      HL,(0FEA1H)
46ea 0600      LD      B,00H
46ec 09        ADD     HL,BC
46ed 09        ADD     HL,BC
46ee 3EE5      LD      A,0E5H
46f0 3EC6      LD      A,0C6H
46f2 95        SUB     L
46f3 6F        LD      L,A
46f4 3EFF      LD      A,0FFH
46f6 9C        SBC     A,H
46f7 67        LD      H,A
46f8 3803      JR      C,46FDH          ; (+03H)
46fa 39        ADD     HL,SP
46fb E1        POP     HL
46fc D8        RET     C

46fd CD3B07    CALL    073BH
4700 2AF6FB    LD      HL,(0FBF6H)
4703 2B        DEC     HL
4704 2B        DEC     HL
4705 228CFE    LD      (0FE8CH),HL
4708 110700    LD      DE,0007H
470b C37905    JP      0579H
470e C0        RET     NZ

470f 2AFAFB    LD      HL,(0FBFAH)
4712 CD0248    CALL    4802H
4715 3285FE    LD      (0FE85H),A
4718 3284FE    LD      (0FE84H),A
471b 77        LD      (HL),A
471c 23        INC     HL
471d 77        LD      (HL),A
471e 23        INC     HL
471f 229DFE    LD      (0FE9DH),HL
4722 210040    LD      HL,4000H
4725 2B        DEC     HL
4726 7C        LD      A,H
4727 B5        OR      L
4728 20FB      JR      NZ,4725H         ; (-05H)
472a 2AFAFB    LD      HL,(0FBFAH)
472d 2B        DEC     HL
472e 2282FE    LD      (0FE82H),HL
4731 061A      LD      B,1AH
4733 21A5FE    LD      HL,0FEA5H
4736 3604      LD      (HL),04H
4738 23        INC     HL
4739 10FB      DJNZ    4736H            ; (-05H)
473b AF        XOR     A
473c 3296FE    LD      (0FE96H),A
473f 6F        LD      L,A
4740 67        LD      H,A
4741 2294FE    LD      (0FE94H),HL
4744 229BFE    LD      (0FE9BH),HL
4747 2A51FE    LD      HL,(0FE51H)
474a 2276FE    LD      (0FE76H),HL
474d CD8947    CALL    4789H
4750 2A9DFE    LD      HL,(0FE9DH)
4753 229FFE    LD      (0FE9FH),HL
4756 22A1FE    LD      (0FEA1H),HL
4759 C1        POP     BC
475a 2AF6FB    LD      HL,(0FBF6H)
475d 2B        DEC     HL
475e 2B        DEC     HL
475f 228CFE    LD      (0FE8CH),HL
4762 23        INC     HL
4763 23        INC     HL
4764 F9        LD      SP,HL
4765 2155FE    LD      HL,0FE55H
4768 2253FE    LD      (0FE53H),HL
476b CD4432    CALL    3244H
476e AF        XOR     A
476f 67        LD      H,A
4770 6F        LD      L,A
4771 22C1FE    LD      (0FEC1H),HL
4774 3292FF    LD      (0FF92H),A
4777 2229FF    LD      (0FF29H),HL
477a 2295FF    LD      (0FF95H),HL
477d 22BFFE    LD      (0FEBFH),HL
4780 3280FE    LD      (0FE80H),A
4783 E5        PUSH    HL
4784 C5        PUSH    BC
4785 2A82FE    LD      HL,(0FE82H)
4788 C9        RET     

4789 EB        EX      DE,HL
478a 2AFAFB    LD      HL,(0FBFAH)
478d 280E      JR      Z,479DH          ; (+0eH)
478f EB        EX      DE,HL
4790 CD970B    CALL    0B97H
4793 E5        PUSH    HL
4794 CD7D07    CALL    077DH
4797 60        LD      H,B
4798 69        LD      L,C
4799 D1        POP     DE
479a D22B0C    JP      NC,0C2BH
479d 2B        DEC     HL
479e 22A3FE    LD      (0FEA3H),HL
47a1 EB        EX      DE,HL
47a2 C9        RET     

47a3 C0        RET     NZ

47a4 3C        INC     A
47a5 1805      JR      47ACH            ; (+05H)
47a7 C0        RET     NZ

47a8 AF        XOR     A
47a9 3296FE    LD      (0FE96H),A
47ac 228AFE    LD      (0FE8AH),HL
47af 2155FE    LD      HL,0FE55H
47b2 2253FE    LD      (0FE53H),HL
47b5 21F6FF    LD      HL,0FFF6H
47b8 C1        POP     BC
47b9 2AF8FB    LD      HL,(0FBF8H)
47bc E5        PUSH    HL
47bd F5        PUSH    AF
47be 7D        LD      A,L
47bf A4        AND     H
47c0 3C        INC     A
47c1 2809      JR      Z,47CCH          ; (+09H)
47c3 2299FE    LD      (0FE99H),HL
47c6 2A8AFE    LD      HL,(0FE8AH)
47c9 229BFE    LD      (0FE9BH),HL
47cc CD4432    CALL    3244H
47cf CD7032    CALL    3270H
47d2 F1        POP     AF
47d3 212105    LD      HL,0521H
47d6 C20406    JP      NZ,0604H
47d9 C31E06    JP      061EH
47dc 3E0F      LD      A,0FH
47de F5        PUSH    AF
47df 3E5E      LD      A,5EH
47e1 CD1800    CALL    0018H
47e4 F1        POP     AF
47e5 C640      ADD     A,40H
47e7 CD1800    CALL    0018H
47ea C37C32    JP      327CH
47ed 2A9BFE    LD      HL,(0FE9BH)
47f0 7C        LD      A,H
47f1 B5        OR      L
47f2 111100    LD      DE,0011H
47f5 CA7905    JP      Z,0579H
47f8 ED5B99FE  LD      DE,(0FE99H)
47fc ED53F8FB  LD      (0FBF8H),DE
4800 C9        RET     

4801 3EAF      LD      A,0AFH
4803 3298FF    LD      (0FF98H),A
4806 C9        RET     

4807 C3880B    JP      0B88H
480a 06FF      LD      B,0FFH
480c D7        RST     10H
480d 78        LD      A,B
480e FEAF      CP      0AFH
4810 3282FE    LD      (0FE82H),A
4813 3E01      LD      A,01H
4815 3280FE    LD      (0FE80H),A
4818 CDCE44    CALL    44CEH
481b E5        PUSH    HL
481c 3280FE    LD      (0FE80H),A
481f 60        LD      H,B
4820 69        LD      L,C
4821 0B        DEC     BC
4822 0B        DEC     BC
4823 0B        DEC     BC
4824 0B        DEC     BC
4825 0B        DEC     BC
4826 3A82FE    LD      A,(0FE82H)
4829 B7        OR      A
482a 201A      JR      NZ,4846H         ; (+1aH)
482c 19        ADD     HL,DE
482d EB        EX      DE,HL
482e 2AA1FE    LD      HL,(0FEA1H)
4831 E7        RST     20H
4832 1A        LD      A,(DE)
4833 02        LD      (BC),A
4834 13        INC     DE
4835 03        INC     BC
4836 20F9      JR      NZ,4831H         ; (-07H)
4838 0B        DEC     BC
4839 60        LD      H,B
483a 69        LD      L,C
483b 22A1FE    LD      (0FEA1H),HL
483e E1        POP     HL
483f 7E        LD      A,(HL)
4840 FE2C      CP      2CH
4842 C0        RET     NZ

4843 D7        RST     10H
4844 18C9      JR      480FH            ; (-37H)
4846 F5        PUSH    AF
4847 EB        EX      DE,HL
4848 19        ADD     HL,DE
4849 EB        EX      DE,HL
484a 4E        LD      C,(HL)
484b 0600      LD      B,00H
484d 09        ADD     HL,BC
484e 09        ADD     HL,BC
484f 23        INC     HL
4850 06D2      LD      B,0D2H
4852 FA5E48    JP      M,485EH
4855 78        LD      A,B
4856 CDEE28    CALL    28EEH
4859 CDEE28    CALL    28EEH
485c 180B      JR      4869H            ; (+0bH)
485e 0E04      LD      C,04H
4860 CD7128    CALL    2871H
4863 B8        CP      B
4864 20F8      JR      NZ,485EH         ; (-08H)
4866 0D        DEC     C
4867 20F7      JR      NZ,4860H         ; (-09H)
4869 F7        RST     30H
486a CA7705    JP      Z,0577H
486d E7        RST     20H
486e 280D      JR      Z,487DH          ; (+0dH)
4870 F1        POP     AF
4871 F5        PUSH    AF
4872 7E        LD      A,(HL)
4873 F4F128    CALL    P,28F1H
4876 FC7128    CALL    M,2871H
4879 77        LD      (HL),A
487a 23        INC     HL
487b 18F0      JR      486DH            ; (-10H)
487d F1        POP     AF
487e E1        POP     HL
487f C9        RET     

4880 7E        LD      A,(HL)
4881 FE41      CP      41H
4883 D8        RET     C

4884 FE5B      CP      5BH
4886 3F        CCF     
4887 C9        RET     

4888 CA2E47    JP      Z,472EH
488b CD840B    CALL    0B84H
488e 2B        DEC     HL
488f D7        RST     10H
4890 E5        PUSH    HL
4891 2A51FE    LD      HL,(0FE51H)
4894 280E      JR      Z,48A4H          ; (+0eH)
4896 E1        POP     HL
4897 CF        RST     08H
4898 2C        INC     L
4899 D5        PUSH    DE
489a CD4318    CALL    1843H
489d 2B        DEC     HL
489e D7        RST     10H
489f C25F05    JP      NZ,055FH
48a2 E3        EX      (SP),HL
48a3 EB        EX      DE,HL
48a4 7D        LD      A,L
48a5 93        SUB     E
48a6 5F        LD      E,A
48a7 7C        LD      A,H
48a8 9A        SBC     A,D
48a9 57        LD      D,A
48aa DAFD46    JP      C,46FDH
48ad E5        PUSH    HL
48ae 2A9DFE    LD      HL,(0FE9DH)
48b1 012800    LD      BC,0028H
48b4 09        ADD     HL,BC
48b5 E7        RST     20H
48b6 D2FD46    JP      NC,46FDH
48b9 EB        EX      DE,HL
48ba 22F6FB    LD      (0FBF6H),HL
48bd E1        POP     HL
48be 2251FE    LD      (0FE51H),HL
48c1 E1        POP     HL
48c2 C32E47    JP      472EH
48c5 7D        LD      A,L
48c6 93        SUB     E
48c7 5F        LD      E,A
48c8 7C        LD      A,H
48c9 9A        SBC     A,D
48ca 57        LD      D,A
48cb C9        RET     

48cc 110000    LD      DE,0000H
48cf C4CE44    CALL    NZ,44CEH
48d2 2282FE    LD      (0FE82H),HL
48d5 CD2705    CALL    0527H
48d8 C26505    JP      NZ,0565H
48db F9        LD      SP,HL
48dc D5        PUSH    DE
48dd 7E        LD      A,(HL)
48de F5        PUSH    AF
48df 23        INC     HL
48e0 D5        PUSH    DE
48e1 7E        LD      A,(HL)
48e2 23        INC     HL
48e3 B7        OR      A
48e4 FAFD48    JP      M,48FDH
48e7 CDE34D    CALL    4DE3H
48ea E3        EX      (SP),HL
48eb E5        PUSH    HL
48ec CDF04A    CALL    4AF0H
48ef E1        POP     HL
48f0 CDFD4D    CALL    4DFDH
48f3 E1        POP     HL
48f4 CDF44D    CALL    4DF4H
48f7 E5        PUSH    HL
48f8 CD3D4E    CALL    4E3DH
48fb 1829      JR      4926H            ; (+29H)
48fd 23        INC     HL
48fe 23        INC     HL
48ff 23        INC     HL
4900 23        INC     HL
4901 4E        LD      C,(HL)
4902 23        INC     HL
4903 46        LD      B,(HL)
4904 23        INC     HL
4905 E3        EX      (SP),HL
4906 5E        LD      E,(HL)
4907 23        INC     HL
4908 56        LD      D,(HL)
4909 E5        PUSH    HL
490a 69        LD      L,C
490b 60        LD      H,B
490c CD0150    CALL    5001H
490f 3A42FE    LD      A,(0FE42H)
4912 FE04      CP      04H
4914 CA7105    JP      Z,0571H
4917 EB        EX      DE,HL
4918 E1        POP     HL
4919 72        LD      (HL),D
491a 2B        DEC     HL
491b 73        LD      (HL),E
491c E1        POP     HL
491d D5        PUSH    DE
491e 5E        LD      E,(HL)
491f 23        INC     HL
4920 56        LD      D,(HL)
4921 23        INC     HL
4922 E3        EX      (SP),HL
4923 CD684E    CALL    4E68H
4926 E1        POP     HL
4927 C1        POP     BC
4928 90        SUB     B
4929 CDF44D    CALL    4DF4H
492c 2809      JR      Z,4937H          ; (+09H)
492e EB        EX      DE,HL
492f 22F8FB    LD      (0FBF8H),HL
4932 69        LD      L,C
4933 60        LD      H,B
4934 C3360A    JP      0A36H
4937 F9        LD      SP,HL
4938 228CFE    LD      (0FE8CH),HL
493b EB        EX      DE,HL
493c 2A82FE    LD      HL,(0FE82H)
493f 7E        LD      A,(HL)
4940 FE2C      CP      2CH
4942 C23A0A    JP      NZ,0A3AH
4945 D7        RST     10H
4946 CDCF48    CALL    48CFH
4949 CD9C10    CALL    109CH
494c CD1D4F    CALL    4F1DH
494f CF        RST     08H
4950 3B        DEC     SP
4951 EB        EX      DE,HL
4952 2AA7FF    LD      HL,(0FFA7H)
4955 1808      JR      495FH            ; (+08H)
4957 3A81FE    LD      A,(0FE81H)
495a B7        OR      A
495b 280D      JR      Z,496AH          ; (+0dH)
495d D1        POP     DE
495e EB        EX      DE,HL
495f E5        PUSH    HL
4960 AF        XOR     A
4961 3281FE    LD      (0FE81H),A
4964 3C        INC     A
4965 F5        PUSH    AF
4966 D5        PUSH    DE
4967 46        LD      B,(HL)
4968 04        INC     B
4969 05        DEC     B
496a CA880B    JP      Z,0B88H
496d 23        INC     HL
496e 7E        LD      A,(HL)
496f 23        INC     HL
4970 66        LD      H,(HL)
4971 6F        LD      L,A
4972 181C      JR      4990H            ; (+1cH)
4974 58        LD      E,B
4975 E5        PUSH    HL
4976 0E02      LD      C,02H
4978 7E        LD      A,(HL)
4979 23        INC     HL
497a FE5C      CP      5CH
497c CAA34A    JP      Z,4AA3H
497f FE20      CP      20H
4981 2003      JR      NZ,4986H         ; (+03H)
4983 0C        INC     C
4984 10F2      DJNZ    4978H            ; (-0eH)
4986 E1        POP     HL
4987 43        LD      B,E
4988 3E5C      LD      A,5CH
498a CDD64A    CALL    4AD6H
498d CD1800    CALL    0018H
4990 AF        XOR     A
4991 5F        LD      E,A
4992 57        LD      D,A
4993 CDD64A    CALL    4AD6H
4996 57        LD      D,A
4997 7E        LD      A,(HL)
4998 23        INC     HL
4999 FE21      CP      21H
499b CAA04A    JP      Z,4AA0H
499e FE23      CP      23H
49a0 2837      JR      Z,49D9H          ; (+37H)
49a2 05        DEC     B
49a3 CA8A4A    JP      Z,4A8AH
49a6 FE2B      CP      2BH
49a8 3E08      LD      A,08H
49aa 28E7      JR      Z,4993H          ; (-19H)
49ac 2B        DEC     HL
49ad 7E        LD      A,(HL)
49ae 23        INC     HL
49af FE2E      CP      2EH
49b1 2840      JR      Z,49F3H          ; (+40H)
49b3 FE5C      CP      5CH
49b5 28BD      JR      Z,4974H          ; (-43H)
49b7 BE        CP      (HL)
49b8 20D0      JR      NZ,498AH         ; (-30H)
49ba FE24      CP      24H
49bc 2814      JR      Z,49D2H          ; (+14H)
49be FE2A      CP      2AH
49c0 20C8      JR      NZ,498AH         ; (-38H)
49c2 23        INC     HL
49c3 78        LD      A,B
49c4 FE02      CP      02H
49c6 3803      JR      C,49CBH          ; (+03H)
49c8 7E        LD      A,(HL)
49c9 FE24      CP      24H
49cb 3E20      LD      A,20H
49cd 2007      JR      NZ,49D6H         ; (+07H)
49cf 05        DEC     B
49d0 1C        INC     E
49d1 FEAF      CP      0AFH
49d3 C610      ADD     A,10H
49d5 23        INC     HL
49d6 1C        INC     E
49d7 82        ADD     A,D
49d8 57        LD      D,A
49d9 1C        INC     E
49da 0E00      LD      C,00H
49dc 05        DEC     B
49dd 2848      JR      Z,4A27H          ; (+48H)
49df 7E        LD      A,(HL)
49e0 23        INC     HL
49e1 FE2E      CP      2EH
49e3 2819      JR      Z,49FEH          ; (+19H)
49e5 FE23      CP      23H
49e7 28F0      JR      Z,49D9H          ; (-10H)
49e9 FE2C      CP      2CH
49eb 201B      JR      NZ,4A08H         ; (+1bH)
49ed 7A        LD      A,D
49ee F640      OR      40H
49f0 57        LD      D,A
49f1 18E6      JR      49D9H            ; (-1aH)
49f3 7E        LD      A,(HL)
49f4 FE23      CP      23H
49f6 3E2E      LD      A,2EH
49f8 C28A49    JP      NZ,498AH
49fb 0E01      LD      C,01H
49fd 23        INC     HL
49fe 0C        INC     C
49ff 05        DEC     B
4a00 2825      JR      Z,4A27H          ; (+25H)
4a02 7E        LD      A,(HL)
4a03 23        INC     HL
4a04 FE23      CP      23H
4a06 28F6      JR      Z,49FEH          ; (-0aH)
4a08 D5        PUSH    DE
4a09 11254A    LD      DE,4A25H
4a0c D5        PUSH    DE
4a0d 54        LD      D,H
4a0e 5D        LD      E,L
4a0f FE5E      CP      5EH
4a11 C0        RET     NZ

4a12 BE        CP      (HL)
4a13 C0        RET     NZ

4a14 23        INC     HL
4a15 BE        CP      (HL)
4a16 C0        RET     NZ

4a17 23        INC     HL
4a18 BE        CP      (HL)
4a19 C0        RET     NZ

4a1a 23        INC     HL
4a1b 78        LD      A,B
4a1c D604      SUB     04H
4a1e D8        RET     C

4a1f D1        POP     DE
4a20 D1        POP     DE
4a21 47        LD      B,A
4a22 14        INC     D
4a23 23        INC     HL
4a24 CAEBD1    JP      Z,0D1EBH
4a27 7A        LD      A,D
4a28 2B        DEC     HL
4a29 1C        INC     E
4a2a E608      AND     08H
4a2c 2015      JR      NZ,4A43H         ; (+15H)
4a2e 1D        DEC     E
4a2f 78        LD      A,B
4a30 B7        OR      A
4a31 2810      JR      Z,4A43H          ; (+10H)
4a33 7E        LD      A,(HL)
4a34 D62D      SUB     2DH
4a36 2806      JR      Z,4A3EH          ; (+06H)
4a38 FEFE      CP      0FEH
4a3a 2007      JR      NZ,4A43H         ; (+07H)
4a3c 3E08      LD      A,08H
4a3e C604      ADD     A,04H
4a40 82        ADD     A,D
4a41 57        LD      D,A
4a42 05        DEC     B
4a43 E1        POP     HL
4a44 F1        POP     AF
4a45 284E      JR      Z,4A95H          ; (+4eH)
4a47 C5        PUSH    BC
4a48 D5        PUSH    DE
4a49 CD9B10    CALL    109BH
4a4c D1        POP     DE
4a4d C1        POP     BC
4a4e C5        PUSH    BC
4a4f E5        PUSH    HL
4a50 43        LD      B,E
4a51 78        LD      A,B
4a52 81        ADD     A,C
4a53 FE19      CP      19H
4a55 D2880B    JP      NC,0B88H
4a58 7A        LD      A,D
4a59 F680      OR      80H
4a5b CD6554    CALL    5465H
4a5e CD3541    CALL    4135H
4a61 E1        POP     HL
4a62 2B        DEC     HL
4a63 D7        RST     10H
4a64 37        SCF     
4a65 280B      JR      Z,4A72H          ; (+0bH)
4a67 3281FE    LD      (0FE81H),A
4a6a FE3B      CP      3BH
4a6c 2803      JR      Z,4A71H          ; (+03H)
4a6e CF        RST     08H
4a6f 2C        INC     L
4a70 06D7      LD      B,0D7H
4a72 C1        POP     BC
4a73 EB        EX      DE,HL
4a74 E1        POP     HL
4a75 E5        PUSH    HL
4a76 F5        PUSH    AF
4a77 D5        PUSH    DE
4a78 7E        LD      A,(HL)
4a79 90        SUB     B
4a7a 23        INC     HL
4a7b 1600      LD      D,00H
4a7d 5F        LD      E,A
4a7e 7E        LD      A,(HL)
4a7f 23        INC     HL
4a80 66        LD      H,(HL)
4a81 6F        LD      L,A
4a82 19        ADD     HL,DE
4a83 78        LD      A,B
4a84 B7        OR      A
4a85 C29049    JP      NZ,4990H
4a88 1806      JR      4A90H            ; (+06H)
4a8a CDD64A    CALL    4AD6H
4a8d CD1800    CALL    0018H
4a90 E1        POP     HL
4a91 F1        POP     AF
4a92 C25749    JP      NZ,4957H
4a95 DC7C32    CALL    C,327CH
4a98 E3        EX      (SP),HL
4a99 CD9542    CALL    4295H
4a9c E1        POP     HL
4a9d C3BE0E    JP      0EBEH
4aa0 0E01      LD      C,01H
4aa2 3EF1      LD      A,0F1H
4aa4 05        DEC     B
4aa5 CDD64A    CALL    4AD6H
4aa8 E1        POP     HL
4aa9 F1        POP     AF
4aaa 28E9      JR      Z,4A95H          ; (-17H)
4aac C5        PUSH    BC
4aad CD9B10    CALL    109BH
4ab0 CD1D4F    CALL    4F1DH
4ab3 C1        POP     BC
4ab4 C5        PUSH    BC
4ab5 E5        PUSH    HL
4ab6 2AA7FF    LD      HL,(0FFA7H)
4ab9 41        LD      B,C
4aba 0E00      LD      C,00H
4abc 78        LD      A,B
4abd F5        PUSH    AF
4abe CD2443    CALL    4324H
4ac1 CD3841    CALL    4138H
4ac4 2AA7FF    LD      HL,(0FFA7H)
4ac7 F1        POP     AF
4ac8 96        SUB     (HL)
4ac9 47        LD      B,A
4aca 3E20      LD      A,20H
4acc 04        INC     B
4acd 05        DEC     B
4ace CA614A    JP      Z,4A61H
4ad1 CD1800    CALL    0018H
4ad4 18F7      JR      4ACDH            ; (-09H)
4ad6 F5        PUSH    AF
4ad7 7A        LD      A,D
4ad8 B7        OR      A
4ad9 3E2B      LD      A,2BH
4adb C41800    CALL    NZ,0018H
4ade F1        POP     AF
4adf C9        RET     

4ae0 CD2D4E    CALL    4E2DH
4ae3 216D58    LD      HL,586DH
4ae6 CD284E    CALL    4E28H
4ae9 CDEB50    CALL    50EBH
4aec C9        RET     

4aed 217158    LD      HL,5871H
4af0 CDF44D    CALL    4DF4H
4af3 1806      JR      4AFBH            ; (+06H)
4af5 CDF44D    CALL    4DF4H
4af8 CDB44D    CALL    4DB4H
4afb 78        LD      A,B
4afc B7        OR      A
4afd C8        RET     Z

4afe 3AAAFF    LD      A,(0FFAAH)
4b01 B7        OR      A
4b02 CAE64D    JP      Z,4DE6H
4b05 90        SUB     B
4b06 300C      JR      NC,4B14H         ; (+0cH)
4b08 2F        CPL     
4b09 3C        INC     A
4b0a EB        EX      DE,HL
4b0b CDD64D    CALL    4DD6H
4b0e EB        EX      DE,HL
4b0f CDE64D    CALL    4DE6H
4b12 C1        POP     BC
4b13 D1        POP     DE
4b14 FE19      CP      19H
4b16 D0        RET     NC

4b17 F5        PUSH    AF
4b18 CD104E    CALL    4E10H
4b1b 67        LD      H,A
4b1c F1        POP     AF
4b1d CDCA4B    CALL    4BCAH
4b20 7C        LD      A,H
4b21 B7        OR      A
4b22 21A7FF    LD      HL,0FFA7H
4b25 F2394B    JP      P,4B39H
4b28 CDAA4B    CALL    4BAAH
4b2b 305E      JR      NC,4B8BH         ; (+5eH)
4b2d 23        INC     HL
4b2e 34        INC     (HL)
4b2f CA7105    JP      Z,0571H
4b32 2E01      LD      L,01H
4b34 CDEC4B    CALL    4BECH
4b37 1852      JR      4B8BH            ; (+52H)
4b39 AF        XOR     A
4b3a 90        SUB     B
4b3b 47        LD      B,A
4b3c 7E        LD      A,(HL)
4b3d 9B        SBC     A,E
4b3e 5F        LD      E,A
4b3f 23        INC     HL
4b40 7E        LD      A,(HL)
4b41 9A        SBC     A,D
4b42 57        LD      D,A
4b43 23        INC     HL
4b44 7E        LD      A,(HL)
4b45 99        SBC     A,C
4b46 4F        LD      C,A
4b47 DCB64B    CALL    C,4BB6H
4b4a 68        LD      L,B
4b4b 63        LD      H,E
4b4c AF        XOR     A
4b4d 47        LD      B,A
4b4e 79        LD      A,C
4b4f B7        OR      A
4b50 2027      JR      NZ,4B79H         ; (+27H)
4b52 4A        LD      C,D
4b53 54        LD      D,H
4b54 65        LD      H,L
4b55 6F        LD      L,A
4b56 78        LD      A,B
4b57 D608      SUB     08H
4b59 FEE0      CP      0E0H
4b5b 20F0      JR      NZ,4B4DH         ; (-10H)
4b5d AF        XOR     A
4b5e 32AAFF    LD      (0FFAAH),A
4b61 C9        RET     

4b62 7C        LD      A,H
4b63 B5        OR      L
4b64 B2        OR      D
4b65 200A      JR      NZ,4B71H         ; (+0aH)
4b67 79        LD      A,C
4b68 05        DEC     B
4b69 17        RLA     
4b6a 30FC      JR      NC,4B68H         ; (-04H)
4b6c 04        INC     B
4b6d 1F        RRA     
4b6e 4F        LD      C,A
4b6f 180B      JR      4B7CH            ; (+0bH)
4b71 05        DEC     B
4b72 29        ADD     HL,HL
4b73 7A        LD      A,D
4b74 17        RLA     
4b75 57        LD      D,A
4b76 79        LD      A,C
4b77 8F        ADC     A,A
4b78 4F        LD      C,A
4b79 F2624B    JP      P,4B62H
4b7c 78        LD      A,B
4b7d 5C        LD      E,H
4b7e 45        LD      B,L
4b7f B7        OR      A
4b80 2809      JR      Z,4B8BH          ; (+09H)
4b82 21AAFF    LD      HL,0FFAAH
4b85 86        ADD     A,(HL)
4b86 77        LD      (HL),A
4b87 30D4      JR      NC,4B5DH         ; (-2cH)
4b89 28D2      JR      Z,4B5DH          ; (-2eH)
4b8b 78        LD      A,B
4b8c 21AAFF    LD      HL,0FFAAH
4b8f B7        OR      A
4b90 FC9D4B    CALL    M,4B9DH
4b93 46        LD      B,(HL)
4b94 23        INC     HL
4b95 7E        LD      A,(HL)
4b96 E680      AND     80H
4b98 A9        XOR     C
4b99 4F        LD      C,A
4b9a C3E64D    JP      4DE6H
4b9d 1C        INC     E
4b9e C0        RET     NZ

4b9f 14        INC     D
4ba0 C0        RET     NZ

4ba1 0C        INC     C
4ba2 C0        RET     NZ

4ba3 0E80      LD      C,80H
4ba5 34        INC     (HL)
4ba6 C0        RET     NZ

4ba7 C37105    JP      0571H
4baa 7E        LD      A,(HL)
4bab 83        ADD     A,E
4bac 5F        LD      E,A
4bad 23        INC     HL
4bae 7E        LD      A,(HL)
4baf 8A        ADC     A,D
4bb0 57        LD      D,A
4bb1 23        INC     HL
4bb2 7E        LD      A,(HL)
4bb3 89        ADC     A,C
4bb4 4F        LD      C,A
4bb5 C9        RET     

4bb6 21ABFF    LD      HL,0FFABH
4bb9 7E        LD      A,(HL)
4bba 2F        CPL     
4bbb 77        LD      (HL),A
4bbc AF        XOR     A
4bbd 6F        LD      L,A
4bbe 90        SUB     B
4bbf 47        LD      B,A
4bc0 7D        LD      A,L
4bc1 9B        SBC     A,E
4bc2 5F        LD      E,A
4bc3 7D        LD      A,L
4bc4 9A        SBC     A,D
4bc5 57        LD      D,A
4bc6 7D        LD      A,L
4bc7 99        SBC     A,C
4bc8 4F        LD      C,A
4bc9 C9        RET     

4bca 0600      LD      B,00H
4bcc D608      SUB     08H
4bce 3807      JR      C,4BD7H          ; (+07H)
4bd0 43        LD      B,E
4bd1 5A        LD      E,D
4bd2 51        LD      D,C
4bd3 0E00      LD      C,00H
4bd5 18F5      JR      4BCCH            ; (-0bH)
4bd7 C609      ADD     A,09H
4bd9 6F        LD      L,A
4bda 7A        LD      A,D
4bdb B3        OR      E
4bdc B0        OR      B
4bdd 2009      JR      NZ,4BE8H         ; (+09H)
4bdf 79        LD      A,C
4be0 2D        DEC     L
4be1 C8        RET     Z

4be2 1F        RRA     
4be3 4F        LD      C,A
4be4 30FA      JR      NC,4BE0H         ; (-06H)
4be6 1806      JR      4BEEH            ; (+06H)
4be8 AF        XOR     A
4be9 2D        DEC     L
4bea C8        RET     Z

4beb 79        LD      A,C
4bec 1F        RRA     
4bed 4F        LD      C,A
4bee 7A        LD      A,D
4bef 1F        RRA     
4bf0 57        LD      D,A
4bf1 7B        LD      A,E
4bf2 1F        RRA     
4bf3 5F        LD      E,A
4bf4 78        LD      A,B
4bf5 1F        RRA     
4bf6 47        LD      B,A
4bf7 18EF      JR      4BE8H            ; (-11H)
4bf9 00        NOP     
4bfa 00        NOP     
4bfb 00        NOP     
4bfc 81        ADD     A,C
4bfd 04        INC     B
4bfe 9A        SBC     A,D
4bff F7        RST     30H
4c00 19        ADD     HL,DE
4c01 83        ADD     A,E
4c02 24        INC     H
4c03 63        LD      H,E
4c04 43        LD      B,E
4c05 83        ADD     A,E
4c06 75        LD      (HL),L
4c07 CD8D84    CALL    848DH
4c0a A9        XOR     C
4c0b 7F        LD      A,A
4c0c 83        ADD     A,E
4c0d 82        ADD     A,D
4c0e 04        INC     B
4c0f 00        NOP     
4c10 00        NOP     
4c11 00        NOP     
4c12 81        ADD     A,C
4c13 E2B04D    JP      PO,4DB0H
4c16 83        ADD     A,E
4c17 0A        LD      A,(BC)
4c18 72        LD      (HL),D
4c19 1183F4    LD      DE,0F483H
4c1c 04        INC     B
4c1d 35        DEC     (HL)
4c1e 7F        LD      A,A
4c1f EF        RST     28H
4c20 B7        OR      A
4c21 EA880B    JP      PE,0B88H
4c24 CD2F4C    CALL    4C2FH
4c27 013180    LD      BC,8031H
4c2a 111872    LD      DE,7218H
4c2d 1833      JR      4C62H            ; (+33H)
4c2f CDF14D    CALL    4DF1H
4c32 3E80      LD      A,80H
4c34 32AAFF    LD      (0FFAAH),A
4c37 A8        XOR     B
4c38 F5        PUSH    AF
4c39 CDD64D    CALL    4DD6H
4c3c 21FD4B    LD      HL,4BFDH
4c3f CD935A    CALL    5A93H
4c42 C1        POP     BC
4c43 E1        POP     HL
4c44 CDD64D    CALL    4DD6H
4c47 EB        EX      DE,HL
4c48 CDE64D    CALL    4DE6H
4c4b 210E4C    LD      HL,4C0EH
4c4e CD935A    CALL    5A93H
4c51 C1        POP     BC
4c52 D1        POP     DE
4c53 CDC34C    CALL    4CC3H
4c56 F1        POP     AF
4c57 CDD64D    CALL    4DD6H
4c5a CD964D    CALL    4D96H
4c5d C1        POP     BC
4c5e D1        POP     DE
4c5f C3FB4A    JP      4AFBH
4c62 EF        RST     28H
4c63 C8        RET     Z

4c64 2E00      LD      L,00H
4c66 CD4D4D    CALL    4D4DH
4c69 79        LD      A,C
4c6a 32DDFF    LD      (0FFDDH),A
4c6d EB        EX      DE,HL
4c6e 22DEFF    LD      (0FFDEH),HL
4c71 010000    LD      BC,0000H
4c74 50        LD      D,B
4c75 58        LD      E,B
4c76 214A4B    LD      HL,4B4AH
4c79 E5        PUSH    HL
4c7a 21824C    LD      HL,4C82H
4c7d E5        PUSH    HL
4c7e E5        PUSH    HL
4c7f 21A7FF    LD      HL,0FFA7H
4c82 7E        LD      A,(HL)
4c83 23        INC     HL
4c84 B7        OR      A
4c85 282C      JR      Z,4CB3H          ; (+2cH)
4c87 E5        PUSH    HL
4c88 2E08      LD      L,08H
4c8a 1F        RRA     
4c8b 67        LD      H,A
4c8c 79        LD      A,C
4c8d 300B      JR      NC,4C9AH         ; (+0bH)
4c8f E5        PUSH    HL
4c90 2ADEFF    LD      HL,(0FFDEH)
4c93 19        ADD     HL,DE
4c94 EB        EX      DE,HL
4c95 E1        POP     HL
4c96 3ADDFF    LD      A,(0FFDDH)
4c99 89        ADC     A,C
4c9a 1F        RRA     
4c9b 4F        LD      C,A
4c9c 7A        LD      A,D
4c9d 1F        RRA     
4c9e 57        LD      D,A
4c9f 7B        LD      A,E
4ca0 1F        RRA     
4ca1 5F        LD      E,A
4ca2 78        LD      A,B
4ca3 1F        RRA     
4ca4 47        LD      B,A
4ca5 E610      AND     10H
4ca7 2804      JR      Z,4CADH          ; (+04H)
4ca9 78        LD      A,B
4caa F620      OR      20H
4cac 47        LD      B,A
4cad 2D        DEC     L
4cae 7C        LD      A,H
4caf 20D9      JR      NZ,4C8AH         ; (-27H)
4cb1 E1        POP     HL
4cb2 C9        RET     

4cb3 43        LD      B,E
4cb4 5A        LD      E,D
4cb5 51        LD      D,C
4cb6 4F        LD      C,A
4cb7 C9        RET     

4cb8 CDD64D    CALL    4DD6H
4cbb 215A52    LD      HL,525AH
4cbe CDE34D    CALL    4DE3H
4cc1 C1        POP     BC
4cc2 D1        POP     DE
4cc3 EF        RST     28H
4cc4 CA6205    JP      Z,0562H
4cc7 2EFF      LD      L,0FFH
4cc9 CD4D4D    CALL    4D4DH
4ccc 34        INC     (HL)
4ccd CA7105    JP      Z,0571H
4cd0 34        INC     (HL)
4cd1 CA7105    JP      Z,0571H
4cd4 2B        DEC     HL
4cd5 7E        LD      A,(HL)
4cd6 32A9FB    LD      (0FBA9H),A
4cd9 2B        DEC     HL
4cda 7E        LD      A,(HL)
4cdb 32A5FB    LD      (0FBA5H),A
4cde 2B        DEC     HL
4cdf 7E        LD      A,(HL)
4ce0 32A1FB    LD      (0FBA1H),A
4ce3 41        LD      B,C
4ce4 EB        EX      DE,HL
4ce5 AF        XOR     A
4ce6 4F        LD      C,A
4ce7 57        LD      D,A
4ce8 5F        LD      E,A
4ce9 32ACFB    LD      (0FBACH),A
4cec E5        PUSH    HL
4ced C5        PUSH    BC
4cee 7D        LD      A,L
4cef CDA0FB    CALL    0FBA0H
4cf2 DE00      SBC     A,00H
4cf4 3F        CCF     
4cf5 3007      JR      NC,4CFEH         ; (+07H)
4cf7 32ACFB    LD      (0FBACH),A
4cfa F1        POP     AF
4cfb F1        POP     AF
4cfc 37        SCF     
4cfd D2C1E1    JP      NC,0E1C1H
4d00 79        LD      A,C
4d01 3C        INC     A
4d02 3D        DEC     A
4d03 1F        RRA     
4d04 F21B4D    JP      P,4D1BH
4d07 17        RLA     
4d08 3AACFB    LD      A,(0FBACH)
4d0b 1F        RRA     
4d0c E6C0      AND     0C0H
4d0e F5        PUSH    AF
4d0f 78        LD      A,B
4d10 B4        OR      H
4d11 B5        OR      L
4d12 2802      JR      Z,4D16H          ; (+02H)
4d14 3E20      LD      A,20H
4d16 E1        POP     HL
4d17 B4        OR      H
4d18 C38C4B    JP      4B8CH
4d1b 17        RLA     
4d1c 7B        LD      A,E
4d1d 17        RLA     
4d1e 5F        LD      E,A
4d1f 7A        LD      A,D
4d20 17        RLA     
4d21 57        LD      D,A
4d22 79        LD      A,C
4d23 17        RLA     
4d24 4F        LD      C,A
4d25 29        ADD     HL,HL
4d26 78        LD      A,B
4d27 17        RLA     
4d28 47        LD      B,A
4d29 3AACFB    LD      A,(0FBACH)
4d2c 17        RLA     
4d2d 32ACFB    LD      (0FBACH),A
4d30 79        LD      A,C
4d31 B2        OR      D
4d32 B3        OR      E
4d33 20B7      JR      NZ,4CECH         ; (-49H)
4d35 E5        PUSH    HL
4d36 21AAFF    LD      HL,0FFAAH
4d39 35        DEC     (HL)
4d3a E1        POP     HL
4d3b 20AF      JR      NZ,4CECH         ; (-51H)
4d3d C35D4B    JP      4B5DH
4d40 3EFF      LD      A,0FFH
4d42 2EAF      LD      L,0AFH
4d44 21B3FF    LD      HL,0FFB3H
4d47 4E        LD      C,(HL)
4d48 23        INC     HL
4d49 AE        XOR     (HL)
4d4a 47        LD      B,A
4d4b 2E00      LD      L,00H
4d4d 78        LD      A,B
4d4e B7        OR      A
4d4f 281D      JR      Z,4D6EH          ; (+1dH)
4d51 7D        LD      A,L
4d52 21AAFF    LD      HL,0FFAAH
4d55 AE        XOR     (HL)
4d56 80        ADD     A,B
4d57 47        LD      B,A
4d58 1F        RRA     
4d59 A8        XOR     B
4d5a 78        LD      A,B
4d5b F26D4D    JP      P,4D6DH
4d5e C680      ADD     A,80H
4d60 77        LD      (HL),A
4d61 CAB14C    JP      Z,4CB1H
4d64 CD104E    CALL    4E10H
4d67 77        LD      (HL),A
4d68 2B        DEC     HL
4d69 C9        RET     

4d6a EF        RST     28H
4d6b 2F        CPL     
4d6c E1        POP     HL
4d6d B7        OR      A
4d6e E1        POP     HL
4d6f F25D4B    JP      P,4B5DH
4d72 C37105    JP      0571H
4d75 CDF14D    CALL    4DF1H
4d78 78        LD      A,B
4d79 B7        OR      A
4d7a C8        RET     Z

4d7b C602      ADD     A,02H
4d7d DA7105    JP      C,0571H
4d80 47        LD      B,A
4d81 CDFB4A    CALL    4AFBH
4d84 21AAFF    LD      HL,0FFAAH
4d87 34        INC     (HL)
4d88 C0        RET     NZ

4d89 C37105    JP      0571H
4d8c 3AA9FF    LD      A,(0FFA9H)
4d8f FE2F      CP      2FH
4d91 17        RLA     
4d92 9F        SBC     A,A
4d93 C0        RET     NZ

4d94 3C        INC     A
4d95 C9        RET     

4d96 0688      LD      B,88H
4d98 110000    LD      DE,0000H
4d9b 21AAFF    LD      HL,0FFAAH
4d9e 4F        LD      C,A
4d9f 70        LD      (HL),B
4da0 0600      LD      B,00H
4da2 23        INC     HL
4da3 3680      LD      (HL),80H
4da5 17        RLA     
4da6 C3474B    JP      4B47H
4da9 CDC64D    CALL    4DC6H
4dac F0        RET     P

4dad F7        RST     30H
4dae FABE50    JP      M,50BEH
4db1 CA7705    JP      Z,0577H
4db4 21A9FF    LD      HL,0FFA9H
4db7 7E        LD      A,(HL)
4db8 EE80      XOR     80H
4dba 77        LD      (HL),A
4dbb C9        RET     

4dbc CDC64D    CALL    4DC6H
4dbf 6F        LD      L,A
4dc0 17        RLA     
4dc1 9F        SBC     A,A
4dc2 67        LD      H,A
4dc3 C3C44E    JP      4EC4H
4dc6 F7        RST     30H
4dc7 CA7705    JP      Z,0577H
4dca F22800    JP      P,0028H
4dcd 2AA7FF    LD      HL,(0FFA7H)
4dd0 7C        LD      A,H
4dd1 B5        OR      L
4dd2 C8        RET     Z

4dd3 7C        LD      A,H
4dd4 18BB      JR      4D91H            ; (-45H)
4dd6 EB        EX      DE,HL
4dd7 2AA7FF    LD      HL,(0FFA7H)
4dda E3        EX      (SP),HL
4ddb E5        PUSH    HL
4ddc 2AA9FF    LD      HL,(0FFA9H)
4ddf E3        EX      (SP),HL
4de0 E5        PUSH    HL
4de1 EB        EX      DE,HL
4de2 C9        RET     

4de3 CDF44D    CALL    4DF4H
4de6 EB        EX      DE,HL
4de7 22A7FF    LD      (0FFA7H),HL
4dea 60        LD      H,B
4deb 69        LD      L,C
4dec 22A9FF    LD      (0FFA9H),HL
4def EB        EX      DE,HL
4df0 C9        RET     

4df1 21A7FF    LD      HL,0FFA7H
4df4 5E        LD      E,(HL)
4df5 23        INC     HL
4df6 56        LD      D,(HL)
4df7 23        INC     HL
4df8 4E        LD      C,(HL)
4df9 23        INC     HL
4dfa 46        LD      B,(HL)
4dfb 23        INC     HL
4dfc C9        RET     

4dfd 11A7FF    LD      DE,0FFA7H
4e00 0604      LD      B,04H
4e02 1805      JR      4E09H            ; (+05H)
4e04 EB        EX      DE,HL
4e05 3A42FE    LD      A,(0FE42H)
4e08 47        LD      B,A
4e09 1A        LD      A,(DE)
4e0a 77        LD      (HL),A
4e0b 13        INC     DE
4e0c 23        INC     HL
4e0d 10FA      DJNZ    4E09H            ; (-06H)
4e0f C9        RET     

4e10 21A9FF    LD      HL,0FFA9H
4e13 7E        LD      A,(HL)
4e14 07        RLCA    
4e15 37        SCF     
4e16 1F        RRA     
4e17 77        LD      (HL),A
4e18 3F        CCF     
4e19 1F        RRA     
4e1a 23        INC     HL
4e1b 23        INC     HL
4e1c 77        LD      (HL),A
4e1d 79        LD      A,C
4e1e 07        RLCA    
4e1f 37        SCF     
4e20 1F        RRA     
4e21 4F        LD      C,A
4e22 1F        RRA     
4e23 AE        XOR     (HL)
4e24 C9        RET     

4e25 21ADFF    LD      HL,0FFADH
4e28 11044E    LD      DE,4E04H
4e2b 1806      JR      4E33H            ; (+06H)
4e2d 21ADFF    LD      HL,0FFADH
4e30 11054E    LD      DE,4E05H
4e33 D5        PUSH    DE
4e34 11A7FF    LD      DE,0FFA7H
4e37 F7        RST     30H
4e38 D8        RET     C

4e39 11A3FF    LD      DE,0FFA3H
4e3c C9        RET     

4e3d 78        LD      A,B
4e3e B7        OR      A
4e3f CA2800    JP      Z,0028H
4e42 21904D    LD      HL,4D90H
4e45 E5        PUSH    HL
4e46 EF        RST     28H
4e47 79        LD      A,C
4e48 C8        RET     Z

4e49 21A9FF    LD      HL,0FFA9H
4e4c AE        XOR     (HL)
4e4d 79        LD      A,C
4e4e F8        RET     M

4e4f CD554E    CALL    4E55H
4e52 1F        RRA     
4e53 A9        XOR     C
4e54 C9        RET     

4e55 23        INC     HL
4e56 78        LD      A,B
4e57 BE        CP      (HL)
4e58 C0        RET     NZ

4e59 2B        DEC     HL
4e5a 79        LD      A,C
4e5b BE        CP      (HL)
4e5c C0        RET     NZ

4e5d 2B        DEC     HL
4e5e 7A        LD      A,D
4e5f BE        CP      (HL)
4e60 C0        RET     NZ

4e61 2B        DEC     HL
4e62 7B        LD      A,E
4e63 96        SUB     (HL)
4e64 C0        RET     NZ

4e65 E1        POP     HL
4e66 E1        POP     HL
4e67 C9        RET     

4e68 7A        LD      A,D
4e69 AC        XOR     H
4e6a 7C        LD      A,H
4e6b FA914D    JP      M,4D91H
4e6e BA        CP      D
4e6f 2003      JR      NZ,4E74H         ; (+03H)
4e71 7D        LD      A,L
4e72 93        SUB     E
4e73 C8        RET     Z

4e74 C3924D    JP      4D92H
4e77 21ADFF    LD      HL,0FFADH
4e7a CD054E    CALL    4E05H
4e7d 11B4FF    LD      DE,0FFB4H
4e80 1A        LD      A,(DE)
4e81 B7        OR      A
4e82 CA2800    JP      Z,0028H
4e85 21904D    LD      HL,4D90H
4e88 E5        PUSH    HL
4e89 EF        RST     28H
4e8a 1B        DEC     DE
4e8b 1A        LD      A,(DE)
4e8c 4F        LD      C,A
4e8d C8        RET     Z

4e8e 21A9FF    LD      HL,0FFA9H
4e91 AE        XOR     (HL)
4e92 79        LD      A,C
4e93 F8        RET     M

4e94 13        INC     DE
4e95 23        INC     HL
4e96 0608      LD      B,08H
4e98 1A        LD      A,(DE)
4e99 96        SUB     (HL)
4e9a 20B6      JR      NZ,4E52H         ; (-4aH)
4e9c 1B        DEC     DE
4e9d 2B        DEC     HL
4e9e 10F8      DJNZ    4E98H            ; (-08H)
4ea0 C1        POP     BC
4ea1 C9        RET     

4ea2 CD7D4E    CALL    4E7DH
4ea5 C2904D    JP      NZ,4D90H
4ea8 C9        RET     

4ea9 F7        RST     30H
4eaa 2AA7FF    LD      HL,(0FFA7H)
4ead F8        RET     M

4eae CA7705    JP      Z,0577H
4eb1 D4E34E    CALL    NC,4EE3H
4eb4 217105    LD      HL,0571H
4eb7 E5        PUSH    HL
4eb8 3AAAFF    LD      A,(0FFAAH)
4ebb FE90      CP      90H
4ebd 300E      JR      NC,4ECDH         ; (+0eH)
4ebf CD224F    CALL    4F22H
4ec2 EB        EX      DE,HL
4ec3 D1        POP     DE
4ec4 22A7FF    LD      (0FFA7H),HL
4ec7 3E02      LD      A,02H
4ec9 3242FE    LD      (0FE42H),A
4ecc C9        RET     

4ecd 018090    LD      BC,9080H
4ed0 110000    LD      DE,0000H
4ed3 CD3D4E    CALL    4E3DH
4ed6 C0        RET     NZ

4ed7 61        LD      H,C
4ed8 6A        LD      L,D
4ed9 18E8      JR      4EC3H            ; (-18H)
4edb F7        RST     30H
4edc E0        RET     PO

4edd FAF64E    JP      M,4EF6H
4ee0 CA7705    JP      Z,0577H
4ee3 CDF14D    CALL    4DF1H
4ee6 CD194F    CALL    4F19H
4ee9 78        LD      A,B
4eea B7        OR      A
4eeb C8        RET     Z

4eec CD104E    CALL    4E10H
4eef 21A6FF    LD      HL,0FFA6H
4ef2 46        LD      B,(HL)
4ef3 C38B4B    JP      4B8BH
4ef6 2AA7FF    LD      HL,(0FFA7H)
4ef9 CD194F    CALL    4F19H
4efc 7C        LD      A,H
4efd 55        LD      D,L
4efe 1E00      LD      E,00H
4f00 0690      LD      B,90H
4f02 C39B4D    JP      4D9BH
4f05 F7        RST     30H
4f06 D0        RET     NC

4f07 CA7705    JP      Z,0577H
4f0a FCF64E    CALL    M,4EF6H
4f0d 210000    LD      HL,0000H
4f10 22A3FF    LD      (0FFA3H),HL
4f13 22A5FF    LD      (0FFA5H),HL
4f16 3E08      LD      A,08H
4f18 013E04    LD      BC,043EH
4f1b 18AC      JR      4EC9H            ; (-54H)
4f1d F7        RST     30H
4f1e C8        RET     Z

4f1f C37705    JP      0577H
4f22 47        LD      B,A
4f23 4F        LD      C,A
4f24 57        LD      D,A
4f25 5F        LD      E,A
4f26 B7        OR      A
4f27 C8        RET     Z

4f28 E5        PUSH    HL
4f29 CDF14D    CALL    4DF1H
4f2c CD104E    CALL    4E10H
4f2f AE        XOR     (HL)
4f30 67        LD      H,A
4f31 FC464F    CALL    M,4F46H
4f34 3E98      LD      A,98H
4f36 90        SUB     B
4f37 CDCA4B    CALL    4BCAH
4f3a 7C        LD      A,H
4f3b 17        RLA     
4f3c DC9D4B    CALL    C,4B9DH
4f3f 0600      LD      B,00H
4f41 DCB64B    CALL    C,4BB6H
4f44 E1        POP     HL
4f45 C9        RET     

4f46 1B        DEC     DE
4f47 7A        LD      A,D
4f48 A3        AND     E
4f49 3C        INC     A
4f4a C0        RET     NZ

4f4b 0B        DEC     BC
4f4c C9        RET     

4f4d F7        RST     30H
4f4e F8        RET     M

4f4f EF        RST     28H
4f50 F25C4F    JP      P,4F5CH
4f53 CDB44D    CALL    4DB4H
4f56 CD5C4F    CALL    4F5CH
4f59 C3AD4D    JP      4DADH
4f5c F7        RST     30H
4f5d F8        RET     M

4f5e 301F      JR      NC,4F7FH         ; (+1fH)
4f60 CA7705    JP      Z,0577H
4f63 CDB84E    CALL    4EB8H
4f66 21AAFF    LD      HL,0FFAAH
4f69 7E        LD      A,(HL)
4f6a FE98      CP      98H
4f6c 3AA7FF    LD      A,(0FFA7H)
4f6f D0        RET     NC

4f70 7E        LD      A,(HL)
4f71 CD224F    CALL    4F22H
4f74 3698      LD      (HL),98H
4f76 7B        LD      A,E
4f77 F5        PUSH    AF
4f78 79        LD      A,C
4f79 17        RLA     
4f7a CD474B    CALL    4B47H
4f7d F1        POP     AF
4f7e C9        RET     

4f7f 21AAFF    LD      HL,0FFAAH
4f82 7E        LD      A,(HL)
4f83 FE90      CP      90H
4f85 2018      JR      NZ,4F9FH         ; (+18H)
4f87 4F        LD      C,A
4f88 2B        DEC     HL
4f89 7E        LD      A,(HL)
4f8a EE80      XOR     80H
4f8c 0606      LD      B,06H
4f8e 2B        DEC     HL
4f8f B6        OR      (HL)
4f90 10FC      DJNZ    4F8EH            ; (-04H)
4f92 B7        OR      A
4f93 210080    LD      HL,8000H
4f96 2006      JR      NZ,4F9EH         ; (+06H)
4f98 CDC44E    CALL    4EC4H
4f9b C3054F    JP      4F05H
4f9e 79        LD      A,C
4f9f B7        OR      A
4fa0 C8        RET     Z

4fa1 FEB8      CP      0B8H
4fa3 D0        RET     NC

4fa4 F5        PUSH    AF
4fa5 CDF14D    CALL    4DF1H
4fa8 CD104E    CALL    4E10H
4fab AE        XOR     (HL)
4fac 2B        DEC     HL
4fad 36B8      LD      (HL),0B8H
4faf F5        PUSH    AF
4fb0 2B        DEC     HL
4fb1 71        LD      (HL),C
4fb2 FCCF4F    CALL    M,4FCFH
4fb5 3AA9FF    LD      A,(0FFA9H)
4fb8 4F        LD      C,A
4fb9 21A9FF    LD      HL,0FFA9H
4fbc 3EB8      LD      A,0B8H
4fbe 90        SUB     B
4fbf CDDF51    CALL    51DFH
4fc2 F1        POP     AF
4fc3 FC9851    CALL    M,5198H
4fc6 AF        XOR     A
4fc7 32A2FF    LD      (0FFA2H),A
4fca F1        POP     AF
4fcb D0        RET     NC

4fcc C35051    JP      5150H
4fcf 21A3FF    LD      HL,0FFA3H
4fd2 7E        LD      A,(HL)
4fd3 35        DEC     (HL)
4fd4 B7        OR      A
4fd5 23        INC     HL
4fd6 28FA      JR      Z,4FD2H          ; (-06H)
4fd8 C9        RET     

4fd9 E5        PUSH    HL
4fda 210000    LD      HL,0000H
4fdd 78        LD      A,B
4fde B1        OR      C
4fdf 2812      JR      Z,4FF3H          ; (+12H)
4fe1 3E10      LD      A,10H
4fe3 29        ADD     HL,HL
4fe4 DA4446    JP      C,4644H
4fe7 EB        EX      DE,HL
4fe8 29        ADD     HL,HL
4fe9 EB        EX      DE,HL
4fea 3004      JR      NC,4FF0H         ; (+04H)
4fec 09        ADD     HL,BC
4fed DA4446    JP      C,4644H
4ff0 3D        DEC     A
4ff1 20F0      JR      NZ,4FE3H         ; (-10H)
4ff3 EB        EX      DE,HL
4ff4 E1        POP     HL
4ff5 C9        RET     

4ff6 7C        LD      A,H
4ff7 17        RLA     
4ff8 9F        SBC     A,A
4ff9 47        LD      B,A
4ffa CDB450    CALL    50B4H
4ffd 79        LD      A,C
4ffe 98        SBC     A,B
4fff 1803      JR      5004H            ; (+03H)
5001 7C        LD      A,H
5002 17        RLA     
5003 9F        SBC     A,A
5004 47        LD      B,A
5005 E5        PUSH    HL
5006 7A        LD      A,D
5007 17        RLA     
5008 9F        SBC     A,A
5009 19        ADD     HL,DE
500a 88        ADC     A,B
500b 0F        RRCA    
500c AC        XOR     H
500d F2C34E    JP      P,4EC3H
5010 C5        PUSH    BC
5011 EB        EX      DE,HL
5012 CDF94E    CALL    4EF9H
5015 F1        POP     AF
5016 E1        POP     HL
5017 CDD64D    CALL    4DD6H
501a EB        EX      DE,HL
501b CDCE50    CALL    50CEH
501e C33654    JP      5436H
5021 7C        LD      A,H
5022 B5        OR      L
5023 CAC44E    JP      Z,4EC4H
5026 E5        PUSH    HL
5027 D5        PUSH    DE
5028 CDA850    CALL    50A8H
502b C5        PUSH    BC
502c 44        LD      B,H
502d 4D        LD      C,L
502e 210000    LD      HL,0000H
5031 3E10      LD      A,10H
5033 29        ADD     HL,HL
5034 381D      JR      C,5053H          ; (+1dH)
5036 EB        EX      DE,HL
5037 29        ADD     HL,HL
5038 EB        EX      DE,HL
5039 3003      JR      NC,503EH         ; (+03H)
503b 09        ADD     HL,BC
503c 3815      JR      C,5053H          ; (+15H)
503e 3D        DEC     A
503f 20F2      JR      NZ,5033H         ; (-0eH)
5041 C1        POP     BC
5042 D1        POP     DE
5043 7C        LD      A,H
5044 B7        OR      A
5045 FA4C50    JP      M,504CH
5048 D1        POP     DE
5049 78        LD      A,B
504a 1864      JR      50B0H            ; (+64H)
504c EE80      XOR     80H
504e B5        OR      L
504f 2813      JR      Z,5064H          ; (+13H)
5051 EB        EX      DE,HL
5052 01C1E1    LD      BC,0E1C1H
5055 CDF94E    CALL    4EF9H
5058 E1        POP     HL
5059 CDD64D    CALL    4DD6H
505c CDF94E    CALL    4EF9H
505f C1        POP     BC
5060 D1        POP     DE
5061 C3624C    JP      4C62H
5064 78        LD      A,B
5065 B7        OR      A
5066 C1        POP     BC
5067 FAC44E    JP      M,4EC4H
506a D5        PUSH    DE
506b CDF94E    CALL    4EF9H
506e D1        POP     DE
506f C3B44D    JP      4DB4H
5072 7C        LD      A,H
5073 B5        OR      L
5074 CA6205    JP      Z,0562H
5077 CDA850    CALL    50A8H
507a C5        PUSH    BC
507b EB        EX      DE,HL
507c CDB450    CALL    50B4H
507f 44        LD      B,H
5080 4D        LD      C,L
5081 210000    LD      HL,0000H
5084 3E11      LD      A,11H
5086 F5        PUSH    AF
5087 B7        OR      A
5088 1809      JR      5093H            ; (+09H)
508a F5        PUSH    AF
508b E5        PUSH    HL
508c 09        ADD     HL,BC
508d 3003      JR      NC,5092H         ; (+03H)
508f F1        POP     AF
5090 37        SCF     
5091 3EE1      LD      A,0E1H
5093 7B        LD      A,E
5094 17        RLA     
5095 5F        LD      E,A
5096 7A        LD      A,D
5097 17        RLA     
5098 57        LD      D,A
5099 7D        LD      A,L
509a 17        RLA     
509b 6F        LD      L,A
509c 7C        LD      A,H
509d 17        RLA     
509e 67        LD      H,A
509f F1        POP     AF
50a0 3D        DEC     A
50a1 20E7      JR      NZ,508AH         ; (-19H)
50a3 EB        EX      DE,HL
50a4 C1        POP     BC
50a5 D5        PUSH    DE
50a6 189B      JR      5043H            ; (-65H)
50a8 7C        LD      A,H
50a9 AA        XOR     D
50aa 47        LD      B,A
50ab CDAF50    CALL    50AFH
50ae EB        EX      DE,HL
50af 7C        LD      A,H
50b0 B7        OR      A
50b1 F2C44E    JP      P,4EC4H
50b4 AF        XOR     A
50b5 4F        LD      C,A
50b6 95        SUB     L
50b7 6F        LD      L,A
50b8 79        LD      A,C
50b9 9C        SBC     A,H
50ba 67        LD      H,A
50bb C3C44E    JP      4EC4H
50be 2AA7FF    LD      HL,(0FFA7H)
50c1 CDB450    CALL    50B4H
50c4 7C        LD      A,H
50c5 EE80      XOR     80H
50c7 B5        OR      L
50c8 C0        RET     NZ

50c9 EB        EX      DE,HL
50ca CD194F    CALL    4F19H
50cd AF        XOR     A
50ce 0698      LD      B,98H
50d0 C39B4D    JP      4D9BH
50d3 D5        PUSH    DE
50d4 CD7250    CALL    5072H
50d7 AF        XOR     A
50d8 82        ADD     A,D
50d9 1F        RRA     
50da 67        LD      H,A
50db 7B        LD      A,E
50dc 1F        RRA     
50dd 6F        LD      L,A
50de CDC74E    CALL    4EC7H
50e1 F1        POP     AF
50e2 18CC      JR      50B0H            ; (-34H)
50e4 21B3FF    LD      HL,0FFB3H
50e7 7E        LD      A,(HL)
50e8 EE80      XOR     80H
50ea 77        LD      (HL),A
50eb 21B4FF    LD      HL,0FFB4H
50ee 7E        LD      A,(HL)
50ef B7        OR      A
50f0 C8        RET     Z

50f1 47        LD      B,A
50f2 2B        DEC     HL
50f3 4E        LD      C,(HL)
50f4 11AAFF    LD      DE,0FFAAH
50f7 1A        LD      A,(DE)
50f8 B7        OR      A
50f9 CA254E    JP      Z,4E25H
50fc 90        SUB     B
50fd 3016      JR      NC,5115H         ; (+16H)
50ff 2F        CPL     
5100 3C        INC     A
5101 F5        PUSH    AF
5102 0E08      LD      C,08H
5104 23        INC     HL
5105 E5        PUSH    HL
5106 1A        LD      A,(DE)
5107 46        LD      B,(HL)
5108 77        LD      (HL),A
5109 78        LD      A,B
510a 12        LD      (DE),A
510b 1B        DEC     DE
510c 2B        DEC     HL
510d 0D        DEC     C
510e 20F6      JR      NZ,5106H         ; (-0aH)
5110 E1        POP     HL
5111 46        LD      B,(HL)
5112 2B        DEC     HL
5113 4E        LD      C,(HL)
5114 F1        POP     AF
5115 FE39      CP      39H
5117 D0        RET     NC

5118 F5        PUSH    AF
5119 CD104E    CALL    4E10H
511c 21ACFF    LD      HL,0FFACH
511f 47        LD      B,A
5120 3E00      LD      A,00H
5122 77        LD      (HL),A
5123 32A2FF    LD      (0FFA2H),A
5126 F1        POP     AF
5127 21B3FF    LD      HL,0FFB3H
512a CDDF51    CALL    51DFH
512d 78        LD      A,B
512e B7        OR      A
512f F24751    JP      P,5147H
5132 3AACFF    LD      A,(0FFACH)
5135 32A2FF    LD      (0FFA2H),A
5138 CDAA51    CALL    51AAH
513b 3049      JR      NC,5186H         ; (+49H)
513d EB        EX      DE,HL
513e 34        INC     (HL)
513f CA7105    JP      Z,0571H
5142 CD0652    CALL    5206H
5145 183F      JR      5186H            ; (+3fH)
5147 CDBC51    CALL    51BCH
514a 21ABFF    LD      HL,0FFABH
514d DCCE51    CALL    C,51CEH
5150 AF        XOR     A
5151 47        LD      B,A
5152 3AA9FF    LD      A,(0FFA9H)
5155 B7        OR      A
5156 201E      JR      NZ,5176H         ; (+1eH)
5158 21A2FF    LD      HL,0FFA2H
515b 0E08      LD      C,08H
515d 56        LD      D,(HL)
515e 77        LD      (HL),A
515f 7A        LD      A,D
5160 23        INC     HL
5161 0D        DEC     C
5162 20F9      JR      NZ,515DH         ; (-07H)
5164 78        LD      A,B
5165 D608      SUB     08H
5167 FEC0      CP      0C0H
5169 20E6      JR      NZ,5151H         ; (-1aH)
516b C35D4B    JP      4B5DH
516e 05        DEC     B
516f 21A2FF    LD      HL,0FFA2H
5172 CD0D52    CALL    520DH
5175 B7        OR      A
5176 F26E51    JP      P,516EH
5179 78        LD      A,B
517a B7        OR      A
517b 2809      JR      Z,5186H          ; (+09H)
517d 21AAFF    LD      HL,0FFAAH
5180 86        ADD     A,(HL)
5181 77        LD      (HL),A
5182 D25D4B    JP      NC,4B5DH
5185 C8        RET     Z

5186 3AA2FF    LD      A,(0FFA2H)
5189 B7        OR      A
518a FC9851    CALL    M,5198H
518d 21ABFF    LD      HL,0FFABH
5190 7E        LD      A,(HL)
5191 E680      AND     80H
5193 2B        DEC     HL
5194 2B        DEC     HL
5195 AE        XOR     (HL)
5196 77        LD      (HL),A
5197 C9        RET     

5198 21A3FF    LD      HL,0FFA3H
519b 0607      LD      B,07H
519d 34        INC     (HL)
519e C0        RET     NZ

519f 23        INC     HL
51a0 10FB      DJNZ    519DH            ; (-05H)
51a2 34        INC     (HL)
51a3 CA7105    JP      Z,0571H
51a6 2B        DEC     HL
51a7 3680      LD      (HL),80H
51a9 C9        RET     

51aa 21ADFF    LD      HL,0FFADH
51ad 11A3FF    LD      DE,0FFA3H
51b0 0E07      LD      C,07H
51b2 AF        XOR     A
51b3 1A        LD      A,(DE)
51b4 8E        ADC     A,(HL)
51b5 12        LD      (DE),A
51b6 13        INC     DE
51b7 23        INC     HL
51b8 0D        DEC     C
51b9 20F8      JR      NZ,51B3H         ; (-08H)
51bb C9        RET     

51bc 21ADFF    LD      HL,0FFADH
51bf 11A3FF    LD      DE,0FFA3H
51c2 0E07      LD      C,07H
51c4 AF        XOR     A
51c5 1A        LD      A,(DE)
51c6 9E        SBC     A,(HL)
51c7 12        LD      (DE),A
51c8 13        INC     DE
51c9 23        INC     HL
51ca 0D        DEC     C
51cb 20F8      JR      NZ,51C5H         ; (-08H)
51cd C9        RET     

51ce 7E        LD      A,(HL)
51cf 2F        CPL     
51d0 77        LD      (HL),A
51d1 21A2FF    LD      HL,0FFA2H
51d4 0608      LD      B,08H
51d6 AF        XOR     A
51d7 4F        LD      C,A
51d8 79        LD      A,C
51d9 9E        SBC     A,(HL)
51da 77        LD      (HL),A
51db 23        INC     HL
51dc 10FA      DJNZ    51D8H            ; (-06H)
51de C9        RET     

51df 71        LD      (HL),C
51e0 E5        PUSH    HL
51e1 D608      SUB     08H
51e3 380E      JR      C,51F3H          ; (+0eH)
51e5 E1        POP     HL
51e6 E5        PUSH    HL
51e7 110008    LD      DE,0800H
51ea 4E        LD      C,(HL)
51eb 73        LD      (HL),E
51ec 59        LD      E,C
51ed 2B        DEC     HL
51ee 15        DEC     D
51ef 20F9      JR      NZ,51EAH         ; (-07H)
51f1 18EE      JR      51E1H            ; (-12H)
51f3 C609      ADD     A,09H
51f5 57        LD      D,A
51f6 AF        XOR     A
51f7 E1        POP     HL
51f8 15        DEC     D
51f9 C8        RET     Z

51fa E5        PUSH    HL
51fb 1E08      LD      E,08H
51fd 7E        LD      A,(HL)
51fe 1F        RRA     
51ff 77        LD      (HL),A
5200 2B        DEC     HL
5201 1D        DEC     E
5202 20F9      JR      NZ,51FDH         ; (-07H)
5204 18F0      JR      51F6H            ; (-10H)
5206 21A9FF    LD      HL,0FFA9H
5209 1601      LD      D,01H
520b 18ED      JR      51FAH            ; (-13H)
520d 0E08      LD      C,08H
520f 7E        LD      A,(HL)
5210 17        RLA     
5211 77        LD      (HL),A
5212 23        INC     HL
5213 0D        DEC     C
5214 20F9      JR      NZ,520FH         ; (-07H)
5216 C9        RET     

5217 EF        RST     28H
5218 C8        RET     Z

5219 3AB4FF    LD      A,(0FFB4H)
521c B7        OR      A
521d CA5D4B    JP      Z,4B5DH
5220 CD434D    CALL    4D43H
5223 CDC752    CALL    52C7H
5226 71        LD      (HL),C
5227 13        INC     DE
5228 0607      LD      B,07H
522a 1A        LD      A,(DE)
522b 13        INC     DE
522c B7        OR      A
522d D5        PUSH    DE
522e 2816      JR      Z,5246H          ; (+16H)
5230 0E08      LD      C,08H
5232 C5        PUSH    BC
5233 1F        RRA     
5234 47        LD      B,A
5235 DCAA51    CALL    C,51AAH
5238 CD0652    CALL    5206H
523b 78        LD      A,B
523c C1        POP     BC
523d 0D        DEC     C
523e 20F2      JR      NZ,5232H         ; (-0eH)
5240 D1        POP     DE
5241 10E7      DJNZ    522AH            ; (-19H)
5243 C35051    JP      5150H
5246 21A9FF    LD      HL,0FFA9H
5249 CDE651    CALL    51E6H
524c 18F2      JR      5240H            ; (-0eH)
524e CDCCCC    CALL    0CCCCH
5251 CCCCCC    CALL    Z,0CCCCH
5254 4C        LD      C,H
5255 7D        LD      A,L
5256 00        NOP     
5257 00        NOP     
5258 00        NOP     
5259 00        NOP     
525a 00        NOP     
525b 00        NOP     
525c 2084      JR      NZ,51E2H         ; (-7cH)
525e 114E52    LD      DE,524EH
5261 21ADFF    LD      HL,0FFADH
5264 CD054E    CALL    4E05H
5267 18AE      JR      5217H            ; (-52H)
5269 3AB4FF    LD      A,(0FFB4H)
526c B7        OR      A
526d CA6205    JP      Z,0562H
5270 3AAAFF    LD      A,(0FFAAH)
5273 B7        OR      A
5274 CA5D4B    JP      Z,4B5DH
5277 CD404D    CALL    4D40H
527a 34        INC     (HL)
527b 34        INC     (HL)
527c CA7105    JP      Z,0571H
527f CDC752    CALL    52C7H
5282 21D7FF    LD      HL,0FFD7H
5285 71        LD      (HL),C
5286 41        LD      B,C
5287 11D0FF    LD      DE,0FFD0H
528a 21ADFF    LD      HL,0FFADH
528d CDC251    CALL    51C2H
5290 1A        LD      A,(DE)
5291 99        SBC     A,C
5292 3F        CCF     
5293 380B      JR      C,52A0H          ; (+0bH)
5295 11D0FF    LD      DE,0FFD0H
5298 21ADFF    LD      HL,0FFADH
529b CDB051    CALL    51B0H
529e AF        XOR     A
529f DA1204    JP      C,0412H
52a2 3AA9FF    LD      A,(0FFA9H)
52a5 3C        INC     A
52a6 3D        DEC     A
52a7 1F        RRA     
52a8 FA8951    JP      M,5189H
52ab 17        RLA     
52ac 21A3FF    LD      HL,0FFA3H
52af 0E07      LD      C,07H
52b1 CD0F52    CALL    520FH
52b4 21D0FF    LD      HL,0FFD0H
52b7 CD0D52    CALL    520DH
52ba 78        LD      A,B
52bb B7        OR      A
52bc 20C9      JR      NZ,5287H         ; (-37H)
52be 21AAFF    LD      HL,0FFAAH
52c1 35        DEC     (HL)
52c2 20C3      JR      NZ,5287H         ; (-3dH)
52c4 C35D4B    JP      4B5DH
52c7 79        LD      A,C
52c8 32B3FF    LD      (0FFB3H),A
52cb 2B        DEC     HL
52cc 11D6FF    LD      DE,0FFD6H
52cf 010007    LD      BC,0700H
52d2 7E        LD      A,(HL)
52d3 12        LD      (DE),A
52d4 71        LD      (HL),C
52d5 1B        DEC     DE
52d6 2B        DEC     HL
52d7 10F9      DJNZ    52D2H            ; (-07H)
52d9 C9        RET     

52da CD2D4E    CALL    4E2DH
52dd EB        EX      DE,HL
52de 2B        DEC     HL
52df 7E        LD      A,(HL)
52e0 B7        OR      A
52e1 C8        RET     Z

52e2 C602      ADD     A,02H
52e4 DA7105    JP      C,0571H
52e7 77        LD      (HL),A
52e8 E5        PUSH    HL
52e9 CDEB50    CALL    50EBH
52ec E1        POP     HL
52ed 34        INC     (HL)
52ee C0        RET     NZ

52ef C37105    JP      0571H
52f2 CD5D4B    CALL    4B5DH
52f5 CD164F    CALL    4F16H
52f8 F6AF      OR      0AFH
52fa EB        EX      DE,HL
52fb 01FF00    LD      BC,00FFH
52fe 60        LD      H,B
52ff 68        LD      L,B
5300 CCC44E    CALL    Z,4EC4H
5303 EB        EX      DE,HL
5304 7E        LD      A,(HL)
5305 FE26      CP      26H
5307 CACA12    JP      Z,12CAH
530a FE2D      CP      2DH
530c F5        PUSH    AF
530d 2805      JR      Z,5314H          ; (+05H)
530f FE2B      CP      2BH
5311 2801      JR      Z,5314H          ; (+01H)
5313 2B        DEC     HL
5314 D7        RST     10H
5315 DAD053    JP      C,53D0H
5318 FE2E      CP      2EH
531a 286B      JR      Z,5387H          ; (+6bH)
531c FE65      CP      65H
531e 2802      JR      Z,5322H          ; (+02H)
5320 FE45      CP      45H
5322 201F      JR      NZ,5343H         ; (+1fH)
5324 E5        PUSH    HL
5325 D7        RST     10H
5326 FE6C      CP      6CH
5328 280A      JR      Z,5334H          ; (+0aH)
532a FE4C      CP      4CH
532c 2806      JR      Z,5334H          ; (+06H)
532e FE71      CP      71H
5330 2802      JR      Z,5334H          ; (+02H)
5332 FE51      CP      51H
5334 E1        POP     HL
5335 280B      JR      Z,5342H          ; (+0bH)
5337 3A42FE    LD      A,(0FE42H)
533a FE08      CP      08H
533c 2819      JR      Z,5357H          ; (+19H)
533e 3E00      LD      A,00H
5340 1815      JR      5357H            ; (+15H)
5342 7E        LD      A,(HL)
5343 FE25      CP      25H
5345 284A      JR      Z,5391H          ; (+4aH)
5347 FE23      CP      23H
5349 2850      JR      Z,539BH          ; (+50H)
534b FE21      CP      21H
534d 284D      JR      Z,539CH          ; (+4dH)
534f FE64      CP      64H
5351 2804      JR      Z,5357H          ; (+04H)
5353 FE44      CP      44H
5355 2012      JR      NZ,5369H         ; (+12H)
5357 B7        OR      A
5358 CDA253    CALL    53A2H
535b D7        RST     10H
535c CD6713    CALL    1367H
535f D7        RST     10H
5360 DA3B54    JP      C,543BH
5363 14        INC     D
5364 2003      JR      NZ,5369H         ; (+03H)
5366 AF        XOR     A
5367 93        SUB     E
5368 5F        LD      E,A
5369 E5        PUSH    HL
536a 7B        LD      A,E
536b 90        SUB     B
536c 5F        LD      E,A
536d F4B153    CALL    P,53B1H
5370 FCBF53    CALL    M,53BFH
5373 20F8      JR      NZ,536DH         ; (-08H)
5375 E1        POP     HL
5376 F1        POP     AF
5377 E5        PUSH    HL
5378 CCAD4D    CALL    Z,4DADH
537b E1        POP     HL
537c F7        RST     30H
537d E8        RET     PE

537e E5        PUSH    HL
537f 21B14C    LD      HL,4CB1H
5382 E5        PUSH    HL
5383 CDCD4E    CALL    4ECDH
5386 C9        RET     

5387 F7        RST     30H
5388 0C        INC     C
5389 20DE      JR      NZ,5369H         ; (-22H)
538b DCA253    CALL    C,53A2H
538e C31453    JP      5314H
5391 D7        RST     10H
5392 F1        POP     AF
5393 E5        PUSH    HL
5394 21B14C    LD      HL,4CB1H
5397 E5        PUSH    HL
5398 F5        PUSH    AF
5399 18CE      JR      5369H            ; (-32H)
539b B7        OR      A
539c CDA253    CALL    53A2H
539f D7        RST     10H
53a0 18C7      JR      5369H            ; (-39H)
53a2 E5        PUSH    HL
53a3 D5        PUSH    DE
53a4 C5        PUSH    BC
53a5 F5        PUSH    AF
53a6 CCDB4E    CALL    Z,4EDBH
53a9 F1        POP     AF
53aa C4054F    CALL    NZ,4F05H
53ad C1        POP     BC
53ae D1        POP     DE
53af E1        POP     HL
53b0 C9        RET     

53b1 C8        RET     Z

53b2 F5        PUSH    AF
53b3 F7        RST     30H
53b4 F5        PUSH    AF
53b5 E4754D    CALL    PO,4D75H
53b8 F1        POP     AF
53b9 ECDA52    CALL    PE,52DAH
53bc F1        POP     AF
53bd 3D        DEC     A
53be C9        RET     

53bf D5        PUSH    DE
53c0 E5        PUSH    HL
53c1 F5        PUSH    AF
53c2 F7        RST     30H
53c3 F5        PUSH    AF
53c4 E4B84C    CALL    PO,4CB8H
53c7 F1        POP     AF
53c8 EC5E52    CALL    PE,525EH
53cb F1        POP     AF
53cc E1        POP     HL
53cd D1        POP     DE
53ce 3C        INC     A
53cf C9        RET     

53d0 D5        PUSH    DE
53d1 78        LD      A,B
53d2 89        ADC     A,C
53d3 47        LD      B,A
53d4 C5        PUSH    BC
53d5 E5        PUSH    HL
53d6 7E        LD      A,(HL)
53d7 D630      SUB     30H
53d9 F5        PUSH    AF
53da F7        RST     30H
53db F20454    JP      P,5404H
53de 2AA7FF    LD      HL,(0FFA7H)
53e1 11CD0C    LD      DE,0CCDH
53e4 E7        RST     20H
53e5 3019      JR      NC,5400H         ; (+19H)
53e7 54        LD      D,H
53e8 5D        LD      E,L
53e9 29        ADD     HL,HL
53ea 29        ADD     HL,HL
53eb 19        ADD     HL,DE
53ec 29        ADD     HL,HL
53ed F1        POP     AF
53ee 4F        LD      C,A
53ef 09        ADD     HL,BC
53f0 7C        LD      A,H
53f1 B7        OR      A
53f2 FAFE53    JP      M,53FEH
53f5 22A7FF    LD      (0FFA7H),HL
53f8 E1        POP     HL
53f9 C1        POP     BC
53fa D1        POP     DE
53fb C31453    JP      5314H
53fe 79        LD      A,C
53ff F5        PUSH    AF
5400 CDF64E    CALL    4EF6H
5403 37        SCF     
5404 3018      JR      NC,541EH         ; (+18H)
5406 017494    LD      BC,9474H
5409 110024    LD      DE,2400H
540c CD3D4E    CALL    4E3DH
540f F21B54    JP      P,541BH
5412 CD754D    CALL    4D75H
5415 F1        POP     AF
5416 CD3054    CALL    5430H
5419 18DD      JR      53F8H            ; (-23H)
541b CD0D4F    CALL    4F0DH
541e CDDA52    CALL    52DAH
5421 CD2D4E    CALL    4E2DH
5424 F1        POP     AF
5425 CD964D    CALL    4D96H
5428 CD0D4F    CALL    4F0DH
542b CDEB50    CALL    50EBH
542e 18C8      JR      53F8H            ; (-38H)
5430 CDD64D    CALL    4DD6H
5433 CD964D    CALL    4D96H
5436 C1        POP     BC
5437 D1        POP     DE
5438 C3FB4A    JP      4AFBH
543b 7B        LD      A,E
543c FE0A      CP      0AH
543e 3009      JR      NC,5449H         ; (+09H)
5440 07        RLCA    
5441 07        RLCA    
5442 83        ADD     A,E
5443 07        RLCA    
5444 86        ADD     A,(HL)
5445 D630      SUB     30H
5447 5F        LD      E,A
5448 FA1E7F    JP      M,7F1EH
544b C35F53    JP      535FH
544e E5        PUSH    HL
544f 211405    LD      HL,0514H
5452 CD3541    CALL    4135H
5455 E1        POP     HL
5456 013441    LD      BC,4134H
5459 C5        PUSH    BC
545a CDC44E    CALL    4EC4H
545d AF        XOR     A
545e CDDF54    CALL    54DFH
5461 B6        OR      (HL)
5462 181C      JR      5480H            ; (+1cH)
5464 AF        XOR     A
5465 CDDF54    CALL    54DFH
5468 E608      AND     08H
546a 2802      JR      Z,546EH          ; (+02H)
546c 362B      LD      (HL),2BH
546e EB        EX      DE,HL
546f CDC64D    CALL    4DC6H
5472 EB        EX      DE,HL
5473 F28054    JP      P,5480H
5476 362D      LD      (HL),2DH
5478 C5        PUSH    BC
5479 E5        PUSH    HL
547a CDAD4D    CALL    4DADH
547d E1        POP     HL
547e C1        POP     BC
547f B4        OR      H
5480 23        INC     HL
5481 3630      LD      (HL),30H
5483 3A78FE    LD      A,(0FE78H)
5486 57        LD      D,A
5487 17        RLA     
5488 3A42FE    LD      A,(0FE42H)
548b DA4555    JP      C,5545H
548e CA3D55    JP      Z,553DH
5491 FE04      CP      04H
5493 3053      JR      NC,54E8H         ; (+53H)
5495 010000    LD      BC,0000H
5498 CD2058    CALL    5820H
549b 21B6FF    LD      HL,0FFB6H
549e 46        LD      B,(HL)
549f 0E20      LD      C,20H
54a1 3A78FE    LD      A,(0FE78H)
54a4 5F        LD      E,A
54a5 E620      AND     20H
54a7 280C      JR      Z,54B5H          ; (+0cH)
54a9 78        LD      A,B
54aa B9        CP      C
54ab 0E2A      LD      C,2AH
54ad 2006      JR      NZ,54B5H         ; (+06H)
54af 7B        LD      A,E
54b0 E604      AND     04H
54b2 2001      JR      NZ,54B5H         ; (+01H)
54b4 41        LD      B,C
54b5 71        LD      (HL),C
54b6 D7        RST     10H
54b7 2814      JR      Z,54CDH          ; (+14H)
54b9 FE45      CP      45H
54bb 2810      JR      Z,54CDH          ; (+10H)
54bd FE44      CP      44H
54bf 280C      JR      Z,54CDH          ; (+0cH)
54c1 FE30      CP      30H
54c3 28F0      JR      Z,54B5H          ; (-10H)
54c5 FE2C      CP      2CH
54c7 28EC      JR      Z,54B5H          ; (-14H)
54c9 FE2E      CP      2EH
54cb 2003      JR      NZ,54D0H         ; (+03H)
54cd 2B        DEC     HL
54ce 3630      LD      (HL),30H
54d0 7B        LD      A,E
54d1 E610      AND     10H
54d3 2803      JR      Z,54D8H          ; (+03H)
54d5 2B        DEC     HL
54d6 3624      LD      (HL),24H
54d8 7B        LD      A,E
54d9 E604      AND     04H
54db C0        RET     NZ

54dc 2B        DEC     HL
54dd 70        LD      (HL),B
54de C9        RET     

54df 3278FE    LD      (0FE78H),A
54e2 21B6FF    LD      HL,0FFB6H
54e5 3620      LD      (HL),20H
54e7 C9        RET     

54e8 FE05      CP      05H
54ea E5        PUSH    HL
54eb DE00      SBC     A,00H
54ed 17        RLA     
54ee 57        LD      D,A
54ef 14        INC     D
54f0 CDFC56    CALL    56FCH
54f3 010003    LD      BC,0300H
54f6 82        ADD     A,D
54f7 FA0255    JP      M,5502H
54fa 14        INC     D
54fb BA        CP      D
54fc 3004      JR      NC,5502H         ; (+04H)
54fe 3C        INC     A
54ff 47        LD      B,A
5500 3E02      LD      A,02H
5502 D602      SUB     02H
5504 E1        POP     HL
5505 F5        PUSH    AF
5506 CD8C57    CALL    578CH
5509 3630      LD      (HL),30H
550b CCFB4D    CALL    Z,4DFBH
550e CD9F57    CALL    579FH
5511 2B        DEC     HL
5512 7E        LD      A,(HL)
5513 FE30      CP      30H
5515 28FA      JR      Z,5511H          ; (-06H)
5517 FE2E      CP      2EH
5519 C4FB4D    CALL    NZ,4DFBH
551c F1        POP     AF
551d 281F      JR      Z,553EH          ; (+1fH)
551f F5        PUSH    AF
5520 F7        RST     30H
5521 3E22      LD      A,22H
5523 8F        ADC     A,A
5524 77        LD      (HL),A
5525 23        INC     HL
5526 F1        POP     AF
5527 362B      LD      (HL),2BH
5529 F23055    JP      P,5530H
552c 362D      LD      (HL),2DH
552e 2F        CPL     
552f 3C        INC     A
5530 062F      LD      B,2FH
5532 04        INC     B
5533 D60A      SUB     0AH
5535 30FB      JR      NC,5532H         ; (-05H)
5537 C63A      ADD     A,3AH
5539 23        INC     HL
553a 70        LD      (HL),B
553b 23        INC     HL
553c 77        LD      (HL),A
553d 23        INC     HL
553e 3600      LD      (HL),00H
5540 EB        EX      DE,HL
5541 21B6FF    LD      HL,0FFB6H
5544 C9        RET     

5545 23        INC     HL
5546 C5        PUSH    BC
5547 FE04      CP      04H
5549 7A        LD      A,D
554a 3066      JR      NC,55B2H         ; (+66H)
554c 1F        RRA     
554d DA4A56    JP      C,564AH
5550 010306    LD      BC,0603H
5553 CD8457    CALL    5784H
5556 D1        POP     DE
5557 7A        LD      A,D
5558 D605      SUB     05H
555a F46457    CALL    P,5764H
555d CD2058    CALL    5820H
5560 7B        LD      A,E
5561 B7        OR      A
5562 CC684D    CALL    Z,4D68H
5565 3D        DEC     A
5566 F46457    CALL    P,5764H
5569 E5        PUSH    HL
556a CD9B54    CALL    549BH
556d E1        POP     HL
556e 2802      JR      Z,5572H          ; (+02H)
5570 70        LD      (HL),B
5571 23        INC     HL
5572 3600      LD      (HL),00H
5574 21B5FF    LD      HL,0FFB5H
5577 23        INC     HL
5578 3A97FE    LD      A,(0FE97H)
557b 95        SUB     L
557c 92        SUB     D
557d C8        RET     Z

557e 7E        LD      A,(HL)
557f FE20      CP      20H
5581 28F4      JR      Z,5577H          ; (-0cH)
5583 FE2A      CP      2AH
5585 28F0      JR      Z,5577H          ; (-10H)
5587 2B        DEC     HL
5588 E5        PUSH    HL
5589 F5        PUSH    AF
558a 018955    LD      BC,5589H
558d C5        PUSH    BC
558e D7        RST     10H
558f FE2D      CP      2DH
5591 C8        RET     Z

5592 FE2B      CP      2BH
5594 C8        RET     Z

5595 FE24      CP      24H
5597 C8        RET     Z

5598 C1        POP     BC
5599 FE30      CP      30H
559b 200E      JR      NZ,55ABH         ; (+0eH)
559d 23        INC     HL
559e D7        RST     10H
559f 300A      JR      NC,55ABH         ; (+0aH)
55a1 2B        DEC     HL
55a2 012B77    LD      BC,772BH
55a5 F1        POP     AF
55a6 28FB      JR      Z,55A3H          ; (-05H)
55a8 C1        POP     BC
55a9 18CD      JR      5578H            ; (-33H)
55ab F1        POP     AF
55ac 28FD      JR      Z,55ABH          ; (-03H)
55ae E1        POP     HL
55af 3625      LD      (HL),25H
55b1 C9        RET     

55b2 E5        PUSH    HL
55b3 1F        RRA     
55b4 DA5156    JP      C,5651H
55b7 2814      JR      Z,55CDH          ; (+14H)
55b9 117558    LD      DE,5875H
55bc CD774E    CALL    4E77H
55bf 1610      LD      D,10H
55c1 FADB55    JP      M,55DBH
55c4 E1        POP     HL
55c5 C1        POP     BC
55c6 CD6454    CALL    5464H
55c9 2B        DEC     HL
55ca 3625      LD      (HL),25H
55cc C9        RET     

55cd 010EB6    LD      BC,0B60EH
55d0 11CA1B    LD      DE,1BCAH
55d3 CD3D4E    CALL    4E3DH
55d6 F2C455    JP      P,55C4H
55d9 1606      LD      D,06H
55db EF        RST     28H
55dc C4FC56    CALL    NZ,56FCH
55df E1        POP     HL
55e0 C1        POP     BC
55e1 FAFE55    JP      M,55FEH
55e4 C5        PUSH    BC
55e5 5F        LD      E,A
55e6 78        LD      A,B
55e7 92        SUB     D
55e8 93        SUB     E
55e9 F46457    CALL    P,5764H
55ec CD7857    CALL    5778H
55ef CD9F57    CALL    579FH
55f2 B3        OR      E
55f3 C47257    CALL    NZ,5772H
55f6 B3        OR      E
55f7 C48C57    CALL    NZ,578CH
55fa D1        POP     DE
55fb C36055    JP      5560H
55fe 5F        LD      E,A
55ff 79        LD      A,C
5600 B7        OR      A
5601 C4BD53    CALL    NZ,53BDH
5604 83        ADD     A,E
5605 FA0956    JP      M,5609H
5608 AF        XOR     A
5609 C5        PUSH    BC
560a F5        PUSH    AF
560b FCBF53    CALL    M,53BFH
560e FA0B56    JP      M,560BH
5611 C1        POP     BC
5612 7B        LD      A,E
5613 90        SUB     B
5614 C1        POP     BC
5615 5F        LD      E,A
5616 82        ADD     A,D
5617 78        LD      A,B
5618 FA2656    JP      M,5626H
561b 92        SUB     D
561c 93        SUB     E
561d F46457    CALL    P,5764H
5620 C5        PUSH    BC
5621 CD7857    CALL    5778H
5624 1811      JR      5637H            ; (+11H)
5626 CD6457    CALL    5764H
5629 79        LD      A,C
562a CD8F57    CALL    578FH
562d 4F        LD      C,A
562e AF        XOR     A
562f 92        SUB     D
5630 93        SUB     E
5631 CD6457    CALL    5764H
5634 C5        PUSH    BC
5635 47        LD      B,A
5636 4F        LD      C,A
5637 CD9F57    CALL    579FH
563a C1        POP     BC
563b B1        OR      C
563c 2003      JR      NZ,5641H         ; (+03H)
563e 2A97FE    LD      HL,(0FE97H)
5641 83        ADD     A,E
5642 3D        DEC     A
5643 F46457    CALL    P,5764H
5646 50        LD      D,B
5647 C36955    JP      5569H
564a E5        PUSH    HL
564b D5        PUSH    DE
564c CDF64E    CALL    4EF6H
564f D1        POP     DE
5650 AF        XOR     A
5651 2803      JR      Z,5656H          ; (+03H)
5653 1E10      LD      E,10H
5655 011E06    LD      BC,061EH
5658 EF        RST     28H
5659 37        SCF     
565a C4FC56    CALL    NZ,56FCH
565d E1        POP     HL
565e C1        POP     BC
565f F5        PUSH    AF
5660 79        LD      A,C
5661 B7        OR      A
5662 F5        PUSH    AF
5663 C4BD53    CALL    NZ,53BDH
5666 80        ADD     A,B
5667 4F        LD      C,A
5668 AF        XOR     A
5669 B0        OR      B
566a 2806      JR      Z,5672H          ; (+06H)
566c 7A        LD      A,D
566d E604      AND     04H
566f FE01      CP      01H
5671 9F        SBC     A,A
5672 57        LD      D,A
5673 81        ADD     A,C
5674 4F        LD      C,A
5675 93        SUB     E
5676 F5        PUSH    AF
5677 C5        PUSH    BC
5678 D5        PUSH    DE
5679 E5        PUSH    HL
567a F5        PUSH    AF
567b FCBF53    CALL    M,53BFH
567e FA7B56    JP      M,567BH
5681 AF        XOR     A
5682 3299FF    LD      (0FF99H),A
5685 219AFF    LD      HL,0FF9AH
5688 CD304E    CALL    4E30H
568b F7        RST     30H
568c EA9756    JP      PE,5697H
568f CDED4A    CALL    4AEDH
5692 3EFA      LD      A,0FAH
5694 C39C56    JP      569CH
5697 CDE04A    CALL    4AE0H
569a 3EF0      LD      A,0F0H
569c D1        POP     DE
569d 92        SUB     D
569e FCBF53    CALL    M,53BFH
56a1 FA9E56    JP      M,569EH
56a4 3AAAFF    LD      A,(0FFAAH)
56a7 D681      SUB     81H
56a9 F5        PUSH    AF
56aa 219AFF    LD      HL,0FF9AH
56ad CD284E    CALL    4E28H
56b0 F1        POP     AF
56b1 FABC56    JP      M,56BCH
56b4 3E01      LD      A,01H
56b6 3299FF    LD      (0FF99H),A
56b9 CDBF53    CALL    53BFH
56bc E1        POP     HL
56bd D1        POP     DE
56be C1        POP     BC
56bf F1        POP     AF
56c0 C5        PUSH    BC
56c1 F5        PUSH    AF
56c2 FAC656    JP      M,56C6H
56c5 AF        XOR     A
56c6 2F        CPL     
56c7 3C        INC     A
56c8 80        ADD     A,B
56c9 3C        INC     A
56ca 82        ADD     A,D
56cb 47        LD      B,A
56cc 0E00      LD      C,00H
56ce CD9F57    CALL    579FH
56d1 F1        POP     AF
56d2 F46C57    CALL    P,576CH
56d5 CD8C57    CALL    578CH
56d8 C1        POP     BC
56d9 F1        POP     AF
56da 200C      JR      NZ,56E8H         ; (+0cH)
56dc CD684D    CALL    4D68H
56df 7E        LD      A,(HL)
56e0 FE2E      CP      2EH
56e2 C4FB4D    CALL    NZ,4DFBH
56e5 2297FE    LD      (0FE97H),HL
56e8 F1        POP     AF
56e9 3803      JR      C,56EEH          ; (+03H)
56eb 83        ADD     A,E
56ec 90        SUB     B
56ed 92        SUB     D
56ee C5        PUSH    BC
56ef 47        LD      B,A
56f0 3A99FF    LD      A,(0FF99H)
56f3 80        ADD     A,B
56f4 CD1F55    CALL    551FH
56f7 EB        EX      DE,HL
56f8 D1        POP     DE
56f9 C36955    JP      5569H
56fc D5        PUSH    DE
56fd AF        XOR     A
56fe F5        PUSH    AF
56ff F7        RST     30H
5700 E21C57    JP      PO,571CH
5703 3AAAFF    LD      A,(0FFAAH)
5706 FE91      CP      91H
5708 3012      JR      NC,571CH         ; (+12H)
570a 115558    LD      DE,5855H
570d 21ADFF    LD      HL,0FFADH
5710 CD054E    CALL    4E05H
5713 CD1752    CALL    5217H
5716 F1        POP     AF
5717 D60A      SUB     0AH
5719 F5        PUSH    AF
571a 18E7      JR      5703H            ; (-19H)
571c CD4A57    CALL    574AH
571f F7        RST     30H
5720 EA2E57    JP      PE,572EH
5723 014391    LD      BC,9143H
5726 11F94F    LD      DE,4FF9H
5729 CD3D4E    CALL    4E3DH
572c 1806      JR      5734H            ; (+06H)
572e 115D58    LD      DE,585DH
5731 CD774E    CALL    4E77H
5734 F24657    JP      P,5746H
5737 F1        POP     AF
5738 CDB253    CALL    53B2H
573b F5        PUSH    AF
573c 18E1      JR      571FH            ; (-1fH)
573e F1        POP     AF
573f CDBF53    CALL    53BFH
5742 F5        PUSH    AF
5743 CD4A57    CALL    574AH
5746 F1        POP     AF
5747 B7        OR      A
5748 D1        POP     DE
5749 C9        RET     

574a F7        RST     30H
574b EA5957    JP      PE,5759H
574e 017494    LD      BC,9474H
5751 11F823    LD      DE,23F8H
5754 CD3D4E    CALL    4E3DH
5757 1806      JR      575FH            ; (+06H)
5759 116558    LD      DE,5865H
575c CD774E    CALL    4E77H
575f E1        POP     HL
5760 F23E57    JP      P,573EH
5763 E9        JP      (HL)
5764 B7        OR      A
5765 C8        RET     Z

5766 3D        DEC     A
5767 3630      LD      (HL),30H
5769 23        INC     HL
576a 18F9      JR      5765H            ; (-07H)
576c 2004      JR      NZ,5772H         ; (+04H)
576e C8        RET     Z

576f CD8C57    CALL    578CH
5772 3630      LD      (HL),30H
5774 23        INC     HL
5775 3D        DEC     A
5776 18F6      JR      576EH            ; (-0aH)
5778 7B        LD      A,E
5779 82        ADD     A,D
577a 3C        INC     A
577b 47        LD      B,A
577c 3C        INC     A
577d D603      SUB     03H
577f 30FC      JR      NC,577DH         ; (-04H)
5781 C605      ADD     A,05H
5783 4F        LD      C,A
5784 3A78FE    LD      A,(0FE78H)
5787 E640      AND     40H
5789 C0        RET     NZ

578a 4F        LD      C,A
578b C9        RET     

578c 05        DEC     B
578d 2008      JR      NZ,5797H         ; (+08H)
578f 362E      LD      (HL),2EH
5791 2297FE    LD      (0FE97H),HL
5794 23        INC     HL
5795 48        LD      C,B
5796 C9        RET     

5797 0D        DEC     C
5798 C0        RET     NZ

5799 362C      LD      (HL),2CH
579b 23        INC     HL
579c 0E03      LD      C,03H
579e C9        RET     

579f D5        PUSH    DE
57a0 C5        PUSH    BC
57a1 E5        PUSH    HL
57a2 F7        RST     30H
57a3 E2DC57    JP      PO,57DCH
57a6 CDE04A    CALL    4AE0H
57a9 AF        XOR     A
57aa CDA44F    CALL    4FA4H
57ad E1        POP     HL
57ae C1        POP     BC
57af 117D58    LD      DE,587DH
57b2 3E0A      LD      A,0AH
57b4 CD8C57    CALL    578CH
57b7 C5        PUSH    BC
57b8 F5        PUSH    AF
57b9 E5        PUSH    HL
57ba D5        PUSH    DE
57bb 062F      LD      B,2FH
57bd 04        INC     B
57be E1        POP     HL
57bf E5        PUSH    HL
57c0 CDBF51    CALL    51BFH
57c3 30F8      JR      NC,57BDH         ; (-08H)
57c5 E1        POP     HL
57c6 CDAD51    CALL    51ADH
57c9 EB        EX      DE,HL
57ca E1        POP     HL
57cb 70        LD      (HL),B
57cc 23        INC     HL
57cd F1        POP     AF
57ce C1        POP     BC
57cf 3D        DEC     A
57d0 20E2      JR      NZ,57B4H         ; (-1eH)
57d2 C5        PUSH    BC
57d3 E5        PUSH    HL
57d4 21A3FF    LD      HL,0FFA3H
57d7 CDE34D    CALL    4DE3H
57da 180B      JR      57E7H            ; (+0bH)
57dc CDED4A    CALL    4AEDH
57df 3E01      LD      A,01H
57e1 CD224F    CALL    4F22H
57e4 CDE64D    CALL    4DE6H
57e7 E1        POP     HL
57e8 C1        POP     BC
57e9 AF        XOR     A
57ea 11C358    LD      DE,58C3H
57ed 3F        CCF     
57ee CD8C57    CALL    578CH
57f1 C5        PUSH    BC
57f2 F5        PUSH    AF
57f3 E5        PUSH    HL
57f4 D5        PUSH    DE
57f5 CDF14D    CALL    4DF1H
57f8 E1        POP     HL
57f9 062F      LD      B,2FH
57fb 04        INC     B
57fc 7B        LD      A,E
57fd 96        SUB     (HL)
57fe 5F        LD      E,A
57ff 23        INC     HL
5800 7A        LD      A,D
5801 9E        SBC     A,(HL)
5802 57        LD      D,A
5803 23        INC     HL
5804 79        LD      A,C
5805 9E        SBC     A,(HL)
5806 4F        LD      C,A
5807 2B        DEC     HL
5808 2B        DEC     HL
5809 30F0      JR      NC,57FBH         ; (-10H)
580b CDAA4B    CALL    4BAAH
580e 23        INC     HL
580f CDE64D    CALL    4DE6H
5812 EB        EX      DE,HL
5813 E1        POP     HL
5814 70        LD      (HL),B
5815 23        INC     HL
5816 F1        POP     AF
5817 C1        POP     BC
5818 38D3      JR      C,57EDH          ; (-2dH)
581a 13        INC     DE
581b 13        INC     DE
581c 3E04      LD      A,04H
581e 1806      JR      5826H            ; (+06H)
5820 D5        PUSH    DE
5821 11C958    LD      DE,58C9H
5824 3E05      LD      A,05H
5826 CD8C57    CALL    578CH
5829 C5        PUSH    BC
582a F5        PUSH    AF
582b E5        PUSH    HL
582c EB        EX      DE,HL
582d 4E        LD      C,(HL)
582e 23        INC     HL
582f 46        LD      B,(HL)
5830 C5        PUSH    BC
5831 23        INC     HL
5832 E3        EX      (SP),HL
5833 EB        EX      DE,HL
5834 2AA7FF    LD      HL,(0FFA7H)
5837 062F      LD      B,2FH
5839 04        INC     B
583a 7D        LD      A,L
583b 93        SUB     E
583c 6F        LD      L,A
583d 7C        LD      A,H
583e 9A        SBC     A,D
583f 67        LD      H,A
5840 30F7      JR      NC,5839H         ; (-09H)
5842 19        ADD     HL,DE
5843 22A7FF    LD      (0FFA7H),HL
5846 D1        POP     DE
5847 E1        POP     HL
5848 70        LD      (HL),B
5849 23        INC     HL
584a F1        POP     AF
584b C1        POP     BC
584c 3D        DEC     A
584d 20D7      JR      NZ,5826H         ; (-29H)
584f CD8C57    CALL    578CH
5852 77        LD      (HL),A
5853 D1        POP     DE
5854 C9        RET     

5855 00        NOP     
5856 00        NOP     
5857 00        NOP     
5858 00        NOP     
5859 F9        LD      SP,HL
585a 02        LD      (BC),A
585b 15        DEC     D
585c A2        AND     D
585d E1        POP     HL
585e FF        RST     38H
585f 9F        SBC     A,A
5860 31A95F    LD      SP,5FA9H
5863 63        LD      H,E
5864 B2        OR      D
5865 FEFF      CP      0FFH
5867 03        INC     BC
5868 BF        CP      A
5869 C9        RET     

586a 1B        DEC     DE
586b 0EB6      LD      C,0B6H
586d 00        NOP     
586e 00        NOP     
586f 00        NOP     
5870 00        NOP     
5871 00        NOP     
5872 00        NOP     
5873 00        NOP     
5874 80        ADD     A,B
5875 00        NOP     
5876 00        NOP     
5877 04        INC     B
5878 BF        CP      A
5879 C9        RET     

587a 1B        DEC     DE
587b 0EB6      LD      C,0B6H
587d 00        NOP     
587e 80        ADD     A,B
587f C6A4      ADD     A,0A4H
5881 7E        LD      A,(HL)
5882 8D        ADC     A,L
5883 03        INC     BC
5884 00        NOP     
5885 40        LD      B,B
5886 7A        LD      A,D
5887 10F3      DJNZ    587CH            ; (-0dH)
5889 5A        LD      E,D
588a 00        NOP     
588b 00        NOP     
588c A0        AND     B
588d 72        LD      (HL),D
588e 4E        LD      C,(HL)
588f 1809      JR      589AH            ; (+09H)
5891 00        NOP     
5892 00        NOP     
5893 10A5      DJNZ    583AH            ; (-5bH)
5895 D4E800    CALL    NC,00E8H
5898 00        NOP     
5899 00        NOP     
589a E8        RET     PE

589b 76        HALT    
589c 48        LD      C,B
589d 17        RLA     
589e 00        NOP     
589f 00        NOP     
58a0 00        NOP     
58a1 E40B54    CALL    PO,540BH
58a4 02        LD      (BC),A
58a5 00        NOP     
58a6 00        NOP     
58a7 00        NOP     
58a8 CA9A3B    JP      Z,3B9AH
58ab 00        NOP     
58ac 00        NOP     
58ad 00        NOP     
58ae 00        NOP     
58af E1        POP     HL
58b0 F5        PUSH    AF
58b1 05        DEC     B
58b2 00        NOP     
58b3 00        NOP     
58b4 00        NOP     
58b5 80        ADD     A,B
58b6 96        SUB     (HL)
58b7 98        SBC     A,B
58b8 00        NOP     
58b9 00        NOP     
58ba 00        NOP     
58bb 00        NOP     
58bc 40        LD      B,B
58bd 42        LD      B,D
58be 0F        RRCA    
58bf 00        NOP     
58c0 00        NOP     
58c1 00        NOP     
58c2 00        NOP     
58c3 A0        AND     B
58c4 86        ADD     A,(HL)
58c5 011027    LD      BC,2710H
58c8 00        NOP     
58c9 1027      DJNZ    58F2H            ; (+27H)
58cb E8        RET     PE

58cc 03        INC     BC
58cd 64        LD      H,H
58ce 00        NOP     
58cf 0A        LD      A,(BC)
58d0 00        NOP     
58d1 0100AF    LD      BC,0AF00H
58d4 47        LD      B,A
58d5 C20601    JP      NZ,0106H
58d8 C5        PUSH    BC
58d9 CD4D18    CALL    184DH
58dc C1        POP     BC
58dd 11B5FF    LD      DE,0FFB5H
58e0 D5        PUSH    DE
58e1 AF        XOR     A
58e2 12        LD      (DE),A
58e3 05        DEC     B
58e4 04        INC     B
58e5 0E06      LD      C,06H
58e7 2808      JR      Z,58F1H          ; (+08H)
58e9 0E04      LD      C,04H
58eb 29        ADD     HL,HL
58ec 8F        ADC     A,A
58ed 29        ADD     HL,HL
58ee 8F        ADC     A,A
58ef 29        ADD     HL,HL
58f0 8F        ADC     A,A
58f1 29        ADD     HL,HL
58f2 8F        ADC     A,A
58f3 B7        OR      A
58f4 2009      JR      NZ,58FFH         ; (+09H)
58f6 79        LD      A,C
58f7 3D        DEC     A
58f8 2805      JR      Z,58FFH          ; (+05H)
58fa 1A        LD      A,(DE)
58fb B7        OR      A
58fc 280C      JR      Z,590AH          ; (+0cH)
58fe AF        XOR     A
58ff C630      ADD     A,30H
5901 FE3A      CP      3AH
5903 3802      JR      C,5907H          ; (+02H)
5905 C607      ADD     A,07H
5907 12        LD      (DE),A
5908 13        INC     DE
5909 12        LD      (DE),A
590a AF        XOR     A
590b 0D        DEC     C
590c 2806      JR      Z,5914H          ; (+06H)
590e 05        DEC     B
590f 04        INC     B
5910 28DB      JR      Z,58EDH          ; (-25H)
5912 18D7      JR      58EBH            ; (-29H)
5914 12        LD      (DE),A
5915 E1        POP     HL
5916 C9        RET     

5917 21B44D    LD      HL,4DB4H
591a E3        EX      (SP),HL
591b E9        JP      (HL)
591c CDD64D    CALL    4DD6H
591f 217158    LD      HL,5871H
5922 CDE34D    CALL    4DE3H
5925 1803      JR      592AH            ; (+03H)
5927 CDDB4E    CALL    4EDBH
592a C1        POP     BC
592b D1        POP     DE
592c EF        RST     28H
592d 78        LD      A,B
592e CACC59    JP      Z,59CCH
5931 F23859    JP      P,5938H
5934 B7        OR      A
5935 CA6205    JP      Z,0562H
5938 B7        OR      A
5939 CA5E4B    JP      Z,4B5EH
593c D5        PUSH    DE
593d C5        PUSH    BC
593e 79        LD      A,C
593f F67F      OR      7FH
5941 CDF14D    CALL    4DF1H
5944 F5        PUSH    AF
5945 D5        PUSH    DE
5946 C5        PUSH    BC
5947 CD664F    CALL    4F66H
594a C1        POP     BC
594b D1        POP     DE
594c F5        PUSH    AF
594d CD3D4E    CALL    4E3DH
5950 C29559    JP      NZ,5995H
5953 B1        OR      C
5954 F5        PUSH    AF
5955 E67F      AND     7FH
5957 32A9FF    LD      (0FFA9H),A
595a 010090    LD      BC,9000H
595d 110000    LD      DE,0000H
5960 CD3D4E    CALL    4E3DH
5963 F28E59    JP      P,598EH
5966 F1        POP     AF
5967 F28759    JP      P,5987H
596a F1        POP     AF
596b 0F        RRCA    
596c C1        POP     BC
596d A0        AND     B
596e C1        POP     BC
596f D1        POP     DE
5970 F5        PUSH    AF
5971 CD365A    CALL    5A36H
5974 F1        POP     AF
5975 17        RLA     
5976 3AAAFF    LD      A,(0FFAAH)
5979 3C        INC     A
597a 3D        DEC     A
597b CA7105    JP      Z,0571H
597e 010081    LD      BC,8100H
5981 110000    LD      DE,0000H
5984 C3C34C    JP      4CC3H
5987 F1        POP     AF
5988 F1        POP     AF
5989 C1        POP     BC
598a D1        POP     DE
598b C3365A    JP      5A36H
598e F1        POP     AF
598f 32A9FF    LD      (0FFA9H),A
5992 CDF14D    CALL    4DF1H
5995 F1        POP     AF
5996 F1        POP     AF
5997 F2B459    JP      P,59B4H
599a F5        PUSH    AF
599b 3AAAFF    LD      A,(0FFAAH)
599e FE99      CP      99H
59a0 3803      JR      C,59A5H          ; (+03H)
59a2 F1        POP     AF
59a3 180F      JR      59B4H            ; (+0fH)
59a5 F1        POP     AF
59a6 D5        PUSH    DE
59a7 C5        PUSH    BC
59a8 CD664F    CALL    4F66H
59ab C1        POP     BC
59ac D1        POP     DE
59ad F5        PUSH    AF
59ae CD3D4E    CALL    4E3DH
59b1 E1        POP     HL
59b2 7C        LD      A,H
59b3 1F        RRA     
59b4 E1        POP     HL
59b5 22A9FF    LD      (0FFA9H),HL
59b8 E1        POP     HL
59b9 22A7FF    LD      (0FFA7H),HL
59bc DC1759    CALL    C,5917H
59bf CCB44D    CALL    Z,4DB4H
59c2 D5        PUSH    DE
59c3 C5        PUSH    BC
59c4 CD1F4C    CALL    4C1FH
59c7 C1        POP     BC
59c8 D1        POP     DE
59c9 CD624C    CALL    4C62H
59cc 013881    LD      BC,8138H
59cf 113BAA    LD      DE,0AA3BH
59d2 CD624C    CALL    4C62H
59d5 3AAAFF    LD      A,(0FFAAH)
59d8 FE88      CP      88H
59da 3022      JR      NC,59FEH         ; (+22H)
59dc FE68      CP      68H
59de 3830      JR      C,5A10H          ; (+30H)
59e0 CDD64D    CALL    4DD6H
59e3 CD664F    CALL    4F66H
59e6 C681      ADD     A,81H
59e8 2817      JR      Z,5A01H          ; (+17H)
59ea C1        POP     BC
59eb D1        POP     DE
59ec F5        PUSH    AF
59ed CDF84A    CALL    4AF8H
59f0 21195A    LD      HL,5A19H
59f3 CD935A    CALL    5A93H
59f6 C1        POP     BC
59f7 110000    LD      DE,0000H
59fa 4A        LD      C,D
59fb C3624C    JP      4C62H
59fe CDD64D    CALL    4DD6H
5a01 3AA9FF    LD      A,(0FFA9H)
5a04 B7        OR      A
5a05 F20D5A    JP      P,5A0DH
5a08 F1        POP     AF
5a09 F1        POP     AF
5a0a C35D4B    JP      4B5DH
5a0d C37105    JP      0571H
5a10 010081    LD      BC,8100H
5a13 110000    LD      DE,0000H
5a16 C3E64D    JP      4DE6H
5a19 07        RLCA    
5a1a 7C        LD      A,H
5a1b 88        ADC     A,B
5a1c 59        LD      E,C
5a1d 74        LD      (HL),H
5a1e E0        RET     PO

5a1f 97        SUB     A
5a20 2677      LD      H,77H
5a22 C41D1E    CALL    NZ,1E1DH
5a25 7A        LD      A,D
5a26 5E        LD      E,(HL)
5a27 50        LD      D,B
5a28 63        LD      H,E
5a29 7C        LD      A,H
5a2a 1A        LD      A,(DE)
5a2b FE75      CP      75H
5a2d 7E        LD      A,(HL)
5a2e 1872      JR      5AA2H            ; (+72H)
5a30 318000    LD      SP,0080H
5a33 00        NOP     
5a34 00        NOP     
5a35 81        ADD     A,C
5a36 D5        PUSH    DE
5a37 C5        PUSH    BC
5a38 CD224F    CALL    4F22H
5a3b 21B3FF    LD      HL,0FFB3H
5a3e 73        LD      (HL),E
5a3f 23        INC     HL
5a40 72        LD      (HL),D
5a41 21F94B    LD      HL,4BF9H
5a44 CDE34D    CALL    4DE3H
5a47 2AB3FF    LD      HL,(0FFB3H)
5a4a 7C        LD      A,H
5a4b B7        OR      A
5a4c 1F        RRA     
5a4d 67        LD      H,A
5a4e 7D        LD      A,L
5a4f 1F        RRA     
5a50 6F        LD      L,A
5a51 22B3FF    LD      (0FFB3H),HL
5a54 D25E5A    JP      NC,5A5EH
5a57 C1        POP     BC
5a58 D1        POP     DE
5a59 D5        PUSH    DE
5a5a C5        PUSH    BC
5a5b CD624C    CALL    4C62H
5a5e 21B3FF    LD      HL,0FFB3H
5a61 7E        LD      A,(HL)
5a62 23        INC     HL
5a63 B6        OR      (HL)
5a64 CA815A    JP      Z,5A81H
5a67 C1        POP     BC
5a68 E1        POP     HL
5a69 CDD64D    CALL    4DD6H
5a6c 54        LD      D,H
5a6d 5D        LD      E,L
5a6e CDE64D    CALL    4DE6H
5a71 EB        EX      DE,HL
5a72 CD624C    CALL    4C62H
5a75 C1        POP     BC
5a76 E1        POP     HL
5a77 CDD64D    CALL    4DD6H
5a7a EB        EX      DE,HL
5a7b CDE64D    CALL    4DE6H
5a7e C3475A    JP      5A47H
5a81 C1        POP     BC
5a82 D1        POP     DE
5a83 C9        RET     

5a84 CDD64D    CALL    4DD6H
5a87 115F50    LD      DE,505FH
5a8a D5        PUSH    DE
5a8b E5        PUSH    HL
5a8c CDF14D    CALL    4DF1H
5a8f CD624C    CALL    4C62H
5a92 E1        POP     HL
5a93 CDD64D    CALL    4DD6H
5a96 7E        LD      A,(HL)
5a97 23        INC     HL
5a98 CDE34D    CALL    4DE3H
5a9b 06F1      LD      B,0F1H
5a9d C1        POP     BC
5a9e D1        POP     DE
5a9f 3D        DEC     A
5aa0 C8        RET     Z

5aa1 D5        PUSH    DE
5aa2 C5        PUSH    BC
5aa3 F5        PUSH    AF
5aa4 E5        PUSH    HL
5aa5 CD624C    CALL    4C62H
5aa8 E1        POP     HL
5aa9 CDF44D    CALL    4DF4H
5aac E5        PUSH    HL
5aad CDFB4A    CALL    4AFBH
5ab0 E1        POP     HL
5ab1 18E9      JR      5A9CH            ; (-17H)
5ab3 EF        RST     28H
5ab4 21B0FB    LD      HL,0FBB0H
5ab7 FA115B    JP      M,5B11H
5aba 21D1FB    LD      HL,0FBD1H
5abd CDE34D    CALL    4DE3H
5ac0 21B0FB    LD      HL,0FBB0H
5ac3 C8        RET     Z

5ac4 86        ADD     A,(HL)
5ac5 E607      AND     07H
5ac7 0600      LD      B,00H
5ac9 77        LD      (HL),A
5aca 23        INC     HL
5acb 87        ADD     A,A
5acc 87        ADD     A,A
5acd 4F        LD      C,A
5ace 09        ADD     HL,BC
5acf CDF44D    CALL    4DF4H
5ad2 CD624C    CALL    4C62H
5ad5 3AAFFB    LD      A,(0FBAFH)
5ad8 3C        INC     A
5ad9 E603      AND     03H
5adb 0600      LD      B,00H
5add FE01      CP      01H
5adf 88        ADC     A,B
5ae0 32AFFB    LD      (0FBAFH),A
5ae3 21145B    LD      HL,5B14H
5ae6 87        ADD     A,A
5ae7 87        ADD     A,A
5ae8 4F        LD      C,A
5ae9 09        ADD     HL,BC
5aea CDF04A    CALL    4AF0H
5aed CDF14D    CALL    4DF1H
5af0 7B        LD      A,E
5af1 59        LD      E,C
5af2 EE4F      XOR     4FH
5af4 4F        LD      C,A
5af5 3680      LD      (HL),80H
5af7 2B        DEC     HL
5af8 46        LD      B,(HL)
5af9 3680      LD      (HL),80H
5afb 21AEFB    LD      HL,0FBAEH
5afe 34        INC     (HL)
5aff 7E        LD      A,(HL)
5b00 D6AB      SUB     0ABH
5b02 2004      JR      NZ,5B08H         ; (+04H)
5b04 77        LD      (HL),A
5b05 0C        INC     C
5b06 15        DEC     D
5b07 1C        INC     E
5b08 CD4A4B    CALL    4B4AH
5b0b 21D1FB    LD      HL,0FBD1H
5b0e C3FD4D    JP      4DFDH
5b11 77        LD      (HL),A
5b12 2B        DEC     HL
5b13 77        LD      (HL),A
5b14 2B        DEC     HL
5b15 77        LD      (HL),A
5b16 18D5      JR      5AEDH            ; (-2bH)
5b18 68        LD      L,B
5b19 B1        OR      C
5b1a 46        LD      B,(HL)
5b1b 68        LD      L,B
5b1c 99        SBC     A,C
5b1d E9        JP      (HL)
5b1e 92        SUB     D
5b1f 69        LD      L,C
5b20 10D1      DJNZ    5AF3H            ; (-2fH)
5b22 75        LD      (HL),L
5b23 68        LD      L,B
5b24 21A85B    LD      HL,5BA8H
5b27 CDF04A    CALL    4AF0H
5b2a 3AAAFF    LD      A,(0FFAAH)
5b2d FE77      CP      77H
5b2f D8        RET     C

5b30 3AA9FF    LD      A,(0FFA9H)
5b33 B7        OR      A
5b34 F2405B    JP      P,5B40H
5b37 E67F      AND     7FH
5b39 32A9FF    LD      (0FFA9H),A
5b3c 11B44D    LD      DE,4DB4H
5b3f D5        PUSH    DE
5b40 01227E    LD      BC,7E22H
5b43 1183F9    LD      DE,0F983H
5b46 CD624C    CALL    4C62H
5b49 CDD64D    CALL    4DD6H
5b4c CD664F    CALL    4F66H
5b4f C1        POP     BC
5b50 D1        POP     DE
5b51 CDF84A    CALL    4AF8H
5b54 01007F    LD      BC,7F00H
5b57 110000    LD      DE,0000H
5b5a CD3D4E    CALL    4E3DH
5b5d FA825B    JP      M,5B82H
5b60 01807F    LD      BC,7F80H
5b63 110000    LD      DE,0000H
5b66 CDFB4A    CALL    4AFBH
5b69 018080    LD      BC,8080H
5b6c 110000    LD      DE,0000H
5b6f CDFB4A    CALL    4AFBH
5b72 EF        RST     28H
5b73 F4B44D    CALL    P,4DB4H
5b76 01007F    LD      BC,7F00H
5b79 110000    LD      DE,0000H
5b7c CDFB4A    CALL    4AFBH
5b7f CDB44D    CALL    4DB4H
5b82 3AA9FF    LD      A,(0FFA9H)
5b85 B7        OR      A
5b86 F5        PUSH    AF
5b87 F28F5B    JP      P,5B8FH
5b8a EE80      XOR     80H
5b8c 32A9FF    LD      (0FFA9H),A
5b8f 21B05B    LD      HL,5BB0H
5b92 CD845A    CALL    5A84H
5b95 F1        POP     AF
5b96 F0        RET     P

5b97 3AA9FF    LD      A,(0FFA9H)
5b9a EE80      XOR     80H
5b9c 32A9FF    LD      (0FFA9H),A
5b9f C9        RET     

5ba0 00        NOP     
5ba1 00        NOP     
5ba2 00        NOP     
5ba3 00        NOP     
5ba4 83        ADD     A,E
5ba5 F9        LD      SP,HL
5ba6 227EDB    LD      (0DB7EH),HL
5ba9 0F        RRCA    
5baa 49        LD      C,C
5bab 81        ADD     A,C
5bac 00        NOP     
5bad 00        NOP     
5bae 00        NOP     
5baf 7F        LD      A,A
5bb0 05        DEC     B
5bb1 FB        EI      
5bb2 D7        RST     10H
5bb3 1E86      LD      E,86H
5bb5 65        LD      H,L
5bb6 2699      LD      H,99H
5bb8 87        ADD     A,A
5bb9 58        LD      E,B
5bba 34        INC     (HL)
5bbb 23        INC     HL
5bbc 87        ADD     A,A
5bbd E1        POP     HL
5bbe 5D        LD      E,L
5bbf A5        AND     L
5bc0 86        ADD     A,(HL)
5bc1 DB0F      IN      A,(0FH)
5bc3 49        LD      C,C
5bc4 83        ADD     A,E
5bc5 CDD64D    CALL    4DD6H
5bc8 CD2A5B    CALL    5B2AH
5bcb C1        POP     BC
5bcc E1        POP     HL
5bcd CDD64D    CALL    4DD6H
5bd0 EB        EX      DE,HL
5bd1 CDE64D    CALL    4DE6H
5bd4 CD245B    CALL    5B24H
5bd7 C3C14C    JP      4CC1H
5bda EF        RST     28H
5bdb FC1759    CALL    M,5917H
5bde FCB44D    CALL    M,4DB4H
5be1 3AAAFF    LD      A,(0FFAAH)
5be4 FE81      CP      81H
5be6 380C      JR      C,5BF4H          ; (+0cH)
5be8 010081    LD      BC,8100H
5beb 51        LD      D,C
5bec 59        LD      E,C
5bed CDC34C    CALL    4CC3H
5bf0 21F54A    LD      HL,4AF5H
5bf3 E5        PUSH    HL
5bf4 21FE5B    LD      HL,5BFEH
5bf7 CD845A    CALL    5A84H
5bfa 21A85B    LD      HL,5BA8H
5bfd C9        RET     

5bfe 09        ADD     HL,BC
5bff 4A        LD      C,D
5c00 D7        RST     10H
5c01 3B        DEC     SP
5c02 78        LD      A,B
5c03 02        LD      (BC),A
5c04 6E        LD      L,(HL)
5c05 84        ADD     A,H
5c06 7B        LD      A,E
5c07 FEC1      CP      0C1H
5c09 2F        CPL     
5c0a 7C        LD      A,H
5c0b 74        LD      (HL),H
5c0c 319A7D    LD      SP,7D9AH
5c0f 84        ADD     A,H
5c10 3D        DEC     A
5c11 5A        LD      E,D
5c12 7D        LD      A,L
5c13 C8        RET     Z

5c14 7F        LD      A,A
5c15 91        SUB     C
5c16 7E        LD      A,(HL)
5c17 E4BB4C    CALL    PO,4CBBH
5c1a 7E        LD      A,(HL)
5c1b 6C        LD      L,H
5c1c AA        XOR     D
5c1d AA        XOR     D
5c1e 7F        LD      A,A
5c1f 00        NOP     
5c20 00        NOP     
5c21 00        NOP     
5c22 81        ADD     A,C
5c23 CD131D    CALL    1D13H
5c26 FE03      CP      03H
5c28 CA6B5C    JP      Z,5C6BH
5c2b CDAA1D    CALL    1DAAH
5c2e FE41      CP      41H
5c30 D8        RET     C

5c31 FE7B      CP      7BH
5c33 D0        RET     NC

5c34 E65F      AND     5FH
5c36 C9        RET     

5c37 CD3A5C    CALL    5C3AH
5c3a 3E20      LD      A,20H
5c3c 1807      JR      5C45H            ; (+07H)
5c3e 3E0D      LD      A,0DH
5c40 CD455C    CALL    5C45H
5c43 3E0A      LD      A,0AH
5c45 C3AA1D    JP      1DAAH
5c48 D333      OUT     (33H),A
5c4a 3E3F      LD      A,3FH
5c4c CD455C    CALL    5C45H
5c4f FB        EI      
5c50 1819      JR      5C6BH            ; (+19H)
5c52 7E        LD      A,(HL)
5c53 23        INC     HL
5c54 B7        OR      A
5c55 C8        RET     Z

5c56 5F        LD      E,A
5c57 CD455C    CALL    5C45H
5c5a 18F6      JR      5C52H            ; (-0aH)
5c5c 3EFF      LD      A,0FFH
5c5e 3223FB    LD      (0FB23H),A
5c61 210000    LD      HL,0000H
5c64 22F8FB    LD      (0FBF8H),HL
5c67 ED733CFB  LD      (0FB3CH),SP
5c6b 31A2FB    LD      SP,0FBA2H
5c6e CDE420    CALL    20E4H
5c71 FB        EI      
5c72 CD3E5C    CALL    5C3EH
5c75 3E2D      LD      A,2DH
5c77 CD455C    CALL    5C45H
5c7a CD235C    CALL    5C23H
5c7d 218B5C    LD      HL,5C8BH
5c80 23        INC     HL
5c81 BE        CP      (HL)
5c82 38C4      JR      C,5C48H          ; (-3cH)
5c84 23        INC     HL
5c85 5E        LD      E,(HL)
5c86 23        INC     HL
5c87 56        LD      D,(HL)
5c88 20F6      JR      NZ,5C80H         ; (-0aH)
5c8a EB        EX      DE,HL
5c8b E9        JP      (HL)
5c8c 02        LD      (BC),A
5c8d A5        AND     L
5c8e 5C        LD      E,H
5c8f 44        LD      B,H
5c90 05        DEC     B
5c91 5D        LD      E,L
5c92 47        LD      B,A
5c93 24        INC     H
5c94 5E        LD      E,(HL)
5c95 4D        LD      C,L
5c96 49        LD      C,C
5c97 5E        LD      E,(HL)
5c98 52        LD      D,D
5c99 82        ADD     A,D
5c9a 5E        LD      E,(HL)
5c9b 53        LD      D,E
5c9c 3F        CCF     
5c9d 5D        LD      E,L
5c9e 57        LD      D,A
5c9f BF        CP      A
5ca0 5E        LD      E,(HL)
5ca1 58        LD      E,B
5ca2 6A        LD      L,D
5ca3 5D        LD      E,L
5ca4 FF        RST     38H
5ca5 ED7B3CFB  LD      SP,(0FB3CH)
5ca9 97        SUB     A
5caa 3223FB    LD      (0FB23H),A
5cad 21FFFF    LD      HL,0FFFFH
5cb0 22F8FB    LD      (0FBF8H),HL
5cb3 C31F06    JP      061FH
5cb6 7C        LD      A,H
5cb7 CDBB5C    CALL    5CBBH
5cba 7D        LD      A,L
5cbb F5        PUSH    AF
5cbc 0F        RRCA    
5cbd 0F        RRCA    
5cbe 0F        RRCA    
5cbf 0F        RRCA    
5cc0 CDC45C    CALL    5CC4H
5cc3 F1        POP     AF
5cc4 E60F      AND     0FH
5cc6 C690      ADD     A,90H
5cc8 27        DAA     
5cc9 CE40      ADC     A,40H
5ccb 27        DAA     
5ccc C3455C    JP      5C45H
5ccf CDDB5C    CALL    5CDBH
5cd2 DA485C    JP      C,5C48H
5cd5 0C        INC     C
5cd6 0D        DEC     C
5cd7 CA485C    JP      Z,5C48H
5cda C9        RET     

5cdb 210000    LD      HL,0000H
5cde 0E00      LD      C,00H
5ce0 CD235C    CALL    5C23H
5ce3 FE0D      CP      0DH
5ce5 C8        RET     Z

5ce6 FE20      CP      20H
5ce8 C8        RET     Z

5ce9 D630      SUB     30H
5ceb D8        RET     C

5cec C6E9      ADD     A,0E9H
5cee D8        RET     C

5cef C606      ADD     A,06H
5cf1 3803      JR      C,5CF6H          ; (+03H)
5cf3 C607      ADD     A,07H
5cf5 D8        RET     C

5cf6 04        INC     B
5cf7 C60A      ADD     A,0AH
5cf9 5F        LD      E,A
5cfa 1600      LD      D,00H
5cfc 29        ADD     HL,HL
5cfd 29        ADD     HL,HL
5cfe 29        ADD     HL,HL
5cff 29        ADD     HL,HL
5d00 19        ADD     HL,DE
5d01 0C        INC     C
5d02 C3E05C    JP      5CE0H
5d05 CDCF5C    CALL    5CCFH
5d08 015000    LD      BC,0050H
5d0b FE0D      CP      0DH
5d0d 280E      JR      Z,5D1DH          ; (+0eH)
5d0f E5        PUSH    HL
5d10 CDCF5C    CALL    5CCFH
5d13 D1        POP     DE
5d14 ED52      SBC     HL,DE
5d16 DA485C    JP      C,5C48H
5d19 44        LD      B,H
5d1a 4D        LD      C,L
5d1b 03        INC     BC
5d1c EB        EX      DE,HL
5d1d 97        SUB     A
5d1e CDE15F    CALL    5FE1H
5d21 CD3E5C    CALL    5C3EH
5d24 CDB65C    CALL    5CB6H
5d27 CD571D    CALL    1D57H
5d2a CD3A5C    CALL    5C3AH
5d2d 7E        LD      A,(HL)
5d2e 23        INC     HL
5d2f CDBB5C    CALL    5CBBH
5d32 0B        DEC     BC
5d33 78        LD      A,B
5d34 B1        OR      C
5d35 CA6B5C    JP      Z,5C6BH
5d38 7D        LD      A,L
5d39 E607      AND     07H
5d3b 28E4      JR      Z,5D21H          ; (-1cH)
5d3d 18E8      JR      5D27H            ; (-18H)
5d3f CDCF5C    CALL    5CCFH
5d42 CD3E5C    CALL    5C3EH
5d45 CDB65C    CALL    5CB6H
5d48 CD3A5C    CALL    5C3AH
5d4b 7E        LD      A,(HL)
5d4c CDBB5C    CALL    5CBBH
5d4f CD3A5C    CALL    5C3AH
5d52 E5        PUSH    HL
5d53 CDDB5C    CALL    5CDBH
5d56 DA6B5C    JP      C,5C6BH
5d59 0C        INC     C
5d5a 0D        DEC     C
5d5b 4D        LD      C,L
5d5c E1        POP     HL
5d5d 2801      JR      Z,5D60H          ; (+01H)
5d5f 71        LD      (HL),C
5d60 FE0D      CP      0DH
5d62 2003      JR      NZ,5D67H         ; (+03H)
5d64 23        INC     HL
5d65 18DB      JR      5D42H            ; (-25H)
5d67 2B        DEC     HL
5d68 18D8      JR      5D42H            ; (-28H)
5d6a CD235C    CALL    5C23H
5d6d FE0D      CP      0DH
5d6f 282E      JR      Z,5D9FH          ; (+2eH)
5d71 FE27      CP      27H
5d73 281B      JR      Z,5D90H          ; (+1bH)
5d75 21395F    LD      HL,5F39H
5d78 110000    LD      DE,0000H
5d7b BE        CP      (HL)
5d7c CACB5D    JP      Z,5DCBH
5d7f 23        INC     HL
5d80 BE        CP      (HL)
5d81 CAD05D    JP      Z,5DD0H
5d84 23        INC     HL
5d85 0605      LD      B,05H
5d87 BE        CP      (HL)
5d88 2866      JR      Z,5DF0H          ; (+66H)
5d8a 23        INC     HL
5d8b 10FA      DJNZ    5D87H            ; (-06H)
5d8d C3485C    JP      5C48H
5d90 CD235C    CALL    5C23H
5d93 FE0D      CP      0DH
5d95 2810      JR      Z,5DA7H          ; (+10H)
5d97 21405F    LD      HL,5F40H
5d9a 11F4FF    LD      DE,0FFF4H
5d9d 18DC      JR      5D7BH            ; (-24H)
5d9f 21F75E    LD      HL,5EF7H
5da2 113BFB    LD      DE,0FB3BH
5da5 1806      JR      5DADH            ; (+06H)
5da7 21185F    LD      HL,5F18H
5daa 112FFB    LD      DE,0FB2FH
5dad D5        PUSH    DE
5dae CD525C    CALL    5C52H
5db1 E1        POP     HL
5db2 CD1F5E    CALL    5E1FH
5db5 CD3A5C    CALL    5C3AH
5db8 CD1F5E    CALL    5E1FH
5dbb 0605      LD      B,05H
5dbd CD3A5C    CALL    5C3AH
5dc0 CD1F5E    CALL    5E1FH
5dc3 CD1F5E    CALL    5E1FH
5dc6 10F5      DJNZ    5DBDH            ; (-0bH)
5dc8 C36B5C    JP      5C6BH
5dcb 213BFB    LD      HL,0FB3BH
5dce 1803      JR      5DD3H            ; (+03H)
5dd0 213AFB    LD      HL,0FB3AH
5dd3 19        ADD     HL,DE
5dd4 E5        PUSH    HL
5dd5 CD3A5C    CALL    5C3AH
5dd8 7E        LD      A,(HL)
5dd9 CDBB5C    CALL    5CBBH
5ddc CD3A5C    CALL    5C3AH
5ddf CDDB5C    CALL    5CDBH
5de2 DA485C    JP      C,5C48H
5de5 0C        INC     C
5de6 0D        DEC     C
5de7 CA6B5C    JP      Z,5C6BH
5dea 7D        LD      A,L
5deb E1        POP     HL
5dec 77        LD      (HL),A
5ded C36B5C    JP      5C6BH
5df0 2600      LD      H,00H
5df2 68        LD      L,B
5df3 29        ADD     HL,HL
5df4 19        ADD     HL,DE
5df5 112FFB    LD      DE,0FB2FH
5df8 19        ADD     HL,DE
5df9 CD3A5C    CALL    5C3AH
5dfc 56        LD      D,(HL)
5dfd 2B        DEC     HL
5dfe 5E        LD      E,(HL)
5dff EB        EX      DE,HL
5e00 D5        PUSH    DE
5e01 CDB65C    CALL    5CB6H
5e04 CD3A5C    CALL    5C3AH
5e07 CDDB5C    CALL    5CDBH
5e0a DA485C    JP      C,5C48H
5e0d 0C        INC     C
5e0e 0D        DEC     C
5e0f CA6B5C    JP      Z,5C6BH
5e12 D1        POP     DE
5e13 EB        EX      DE,HL
5e14 73        LD      (HL),E
5e15 23        INC     HL
5e16 72        LD      (HL),D
5e17 C36B5C    JP      5C6BH
5e1a 7E        LD      A,(HL)
5e1b 23        INC     HL
5e1c C3455C    JP      5C45H
5e1f 7E        LD      A,(HL)
5e20 2B        DEC     HL
5e21 C3BB5C    JP      5CBBH
5e24 CD235C    CALL    5C23H
5e27 FE0D      CP      0DH
5e29 C2485C    JP      NZ,5C48H
5e2c 2A3AFB    LD      HL,(0FB3AH)
5e2f 7D        LD      A,L
5e30 6C        LD      L,H
5e31 67        LD      H,A
5e32 E5        PUSH    HL
5e33 F1        POP     AF
5e34 ED5B36FB  LD      DE,(0FB36H)
5e38 ED4B38FB  LD      BC,(0FB38H)
5e3c ED7B32FB  LD      SP,(0FB32H)
5e40 2A34FB    LD      HL,(0FB34H)
5e43 E5        PUSH    HL
5e44 2A30FB    LD      HL,(0FB30H)
5e47 E3        EX      (SP),HL
5e48 C9        RET     

5e49 CDCF5C    CALL    5CCFH
5e4c FE0D      CP      0DH
5e4e CA485C    JP      Z,5C48H
5e51 E5        PUSH    HL
5e52 CDCF5C    CALL    5CCFH
5e55 D1        POP     DE
5e56 FE0D      CP      0DH
5e58 CA485C    JP      Z,5C48H
5e5b B7        OR      A
5e5c ED52      SBC     HL,DE
5e5e DA485C    JP      C,5C48H
5e61 44        LD      B,H
5e62 4D        LD      C,L
5e63 03        INC     BC
5e64 C5        PUSH    BC
5e65 D5        PUSH    DE
5e66 CDCF5C    CALL    5CCFH
5e69 D1        POP     DE
5e6a C1        POP     BC
5e6b E5        PUSH    HL
5e6c B7        OR      A
5e6d ED52      SBC     HL,DE
5e6f E1        POP     HL
5e70 3006      JR      NC,5E78H         ; (+06H)
5e72 EB        EX      DE,HL
5e73 EDB0      LDIR    
5e75 C36B5C    JP      5C6BH
5e78 0B        DEC     BC
5e79 09        ADD     HL,BC
5e7a EB        EX      DE,HL
5e7b 09        ADD     HL,BC
5e7c 03        INC     BC
5e7d EDB8      LDDR    
5e7f C36B5C    JP      5C6BH
5e82 CDDB5C    CALL    5CDBH
5e85 DA485C    JP      C,5C48H
5e88 0C        INC     C
5e89 0D        DEC     C
5e8a E5        PUSH    HL
5e8b F5        PUSH    AF
5e8c F3        DI      
5e8d 3EFF      LD      A,0FFH
5e8f 32EBFA    LD      (0FAEBH),A
5e92 CDE95E    CALL    5EE9H
5e95 CDB135    CALL    35B1H
5e98 CDF135    CALL    35F1H
5e9b C2485C    JP      NZ,5C48H
5e9e 21E234    LD      HL,34E2H
5ea1 CDEF34    CALL    34EFH
5ea4 2ADAFA    LD      HL,(0FADAH)
5ea7 EB        EX      DE,HL
5ea8 F1        POP     AF
5ea9 E1        POP     HL
5eaa 2003      JR      NZ,5EAFH         ; (+03H)
5eac 2AD8FA    LD      HL,(0FAD8H)
5eaf CD2136    CALL    3621H
5eb2 D333      OUT     (33H),A
5eb4 CDBD28    CALL    28BDH
5eb7 97        SUB     A
5eb8 32EBFA    LD      (0FAEBH),A
5ebb FB        EI      
5ebc C36B5C    JP      5C6BH
5ebf CDCF5C    CALL    5CCFH
5ec2 FE0D      CP      0DH
5ec4 CA485C    JP      Z,5C48H
5ec7 E5        PUSH    HL
5ec8 CDCF5C    CALL    5CCFH
5ecb D1        POP     DE
5ecc D5        PUSH    DE
5ecd CDCB5F    CALL    5FCBH
5ed0 D1        POP     DE
5ed1 DA485C    JP      C,5C48H
5ed4 22DAFA    LD      (0FADAH),HL
5ed7 EB        EX      DE,HL
5ed8 22DCFA    LD      (0FADCH),HL
5edb 22D8FA    LD      (0FAD8H),HL
5ede CDE95E    CALL    5EE9H
5ee1 CD9335    CALL    3593H
5ee4 D333      OUT     (33H),A
5ee6 C36B5C    JP      5C6BH
5ee9 21DEFA    LD      HL,0FADEH
5eec 3620      LD      (HL),20H
5eee 11DFFA    LD      DE,0FADFH
5ef1 010600    LD      BC,0006H
5ef4 EDB0      LDIR    
5ef6 C9        RET     

5ef7 0D        DEC     C
5ef8 0A        LD      A,(BC)
5ef9 46        LD      B,(HL)
5efa 2020      JR      NZ,5F1CH         ; (+20H)
5efc 41        LD      B,C
5efd 2020      JR      NZ,5F1FH         ; (+20H)
5eff 42        LD      B,D
5f00 43        LD      B,E
5f01 2020      JR      NZ,5F23H         ; (+20H)
5f03 2044      JR      NZ,5F49H         ; (+44H)
5f05 45        LD      B,L
5f06 2020      JR      NZ,5F28H         ; (+20H)
5f08 2048      JR      NZ,5F52H         ; (+48H)
5f0a 4C        LD      C,H
5f0b 2020      JR      NZ,5F2DH         ; (+20H)
5f0d 2053      JR      NZ,5F62H         ; (+53H)
5f0f 50        LD      D,B
5f10 2020      JR      NZ,5F32H         ; (+20H)
5f12 2050      JR      NZ,5F64H         ; (+50H)
5f14 43        LD      B,E
5f15 0D        DEC     C
5f16 0A        LD      A,(BC)
5f17 00        NOP     
5f18 0D        DEC     C
5f19 0A        LD      A,(BC)
5f1a 46        LD      B,(HL)
5f1b 27        DAA     
5f1c 2041      JR      NZ,5F5FH         ; (+41H)
5f1e 27        DAA     
5f1f 2042      JR      NZ,5F63H         ; (+42H)
5f21 43        LD      B,E
5f22 27        DAA     
5f23 2020      JR      NZ,5F45H         ; (+20H)
5f25 44        LD      B,H
5f26 45        LD      B,L
5f27 27        DAA     
5f28 2020      JR      NZ,5F4AH         ; (+20H)
5f2a 48        LD      C,B
5f2b 4C        LD      C,H
5f2c 27        DAA     
5f2d 2020      JR      NZ,5F4FH         ; (+20H)
5f2f 49        LD      C,C
5f30 58        LD      E,B
5f31 2020      JR      NZ,5F53H         ; (+20H)
5f33 2049      JR      NZ,5F7EH         ; (+49H)
5f35 59        LD      E,C
5f36 0D        DEC     C
5f37 0A        LD      A,(BC)
5f38 00        NOP     
5f39 46        LD      B,(HL)
5f3a 41        LD      B,C
5f3b 42        LD      B,D
5f3c 44        LD      B,H
5f3d 48        LD      C,B
5f3e 53        LD      D,E
5f3f 50        LD      D,B
5f40 46        LD      B,(HL)
5f41 41        LD      B,C
5f42 42        LD      B,D
5f43 44        LD      B,H
5f44 48        LD      C,B
5f45 58        LD      E,B
5f46 59        LD      E,C
5f47 10FF      DJNZ    5F48H            ; (-01H)
5f49 C30000    JP      0000H
5f4c C30000    JP      0000H
5f4f 00        NOP     
5f50 C440FF    CALL    NZ,0FF40H
5f53 FF        RST     38H
5f54 FF        RST     38H
5f55 FF        RST     38H
5f56 FF        RST     38H
5f57 FF        RST     38H
5f58 FF        RST     38H
5f59 FF        RST     38H
5f5a FF        RST     38H
5f5b FF        RST     38H
5f5c FF        RST     38H
5f5d FF        RST     38H
5f5e FF        RST     38H
5f5f FF        RST     38H
5f60 FF        RST     38H
5f61 FF        RST     38H
5f62 0A        LD      A,(BC)
5f63 64        LD      H,H
5f64 23        INC     HL
5f65 C423C4    CALL    NZ,0C423H
5f68 43        LD      B,E
5f69 4C        LD      C,H
5f6a 4F        LD      C,A
5f6b 41        LD      B,C
5f6c 44        LD      B,H
5f6d 2022      JR      NZ,5F91H         ; (+22H)
5f6f 00        NOP     
5f70 53        LD      D,E
5f71 43        LD      B,E
5f72 52        LD      D,D
5f73 45        LD      B,L
5f74 45        LD      B,L
5f75 4E        LD      C,(HL)
5f76 00        NOP     
5f77 00        NOP     
5f78 47        LD      B,A
5f79 4F        LD      C,A
5f7a 54        LD      D,H
5f7b 4F        LD      C,A
5f7c 00        NOP     
5f7d 00        NOP     
5f7e 00        NOP     
5f7f 00        NOP     
5f80 47        LD      B,A
5f81 4F        LD      C,A
5f82 53        LD      D,E
5f83 55        LD      D,L
5f84 42        LD      B,D
5f85 00        NOP     
5f86 00        NOP     
5f87 00        NOP     
5f88 4C        LD      C,H
5f89 49        LD      C,C
5f8a 53        LD      D,E
5f8b 54        LD      D,H
5f8c 00        NOP     
5f8d 00        NOP     
5f8e 00        NOP     
5f8f 00        NOP     
5f90 43        LD      B,E
5f91 53        LD      D,E
5f92 41        LD      B,C
5f93 56        LD      D,(HL)
5f94 45        LD      B,L
5f95 2022      JR      NZ,5FB9H         ; (+22H)
5f97 00        NOP     
5f98 43        LD      B,E
5f99 4F        LD      C,A
5f9a 4E        LD      C,(HL)
5f9b 53        LD      D,E
5f9c 4F        LD      C,A
5f9d 4C        LD      C,H
5f9e 45        LD      B,L
5f9f 00        NOP     
5fa0 43        LD      B,E
5fa1 4F        LD      C,A
5fa2 4C        LD      C,H
5fa3 4F        LD      C,A
5fa4 52        LD      D,D
5fa5 00        NOP     
5fa6 00        NOP     
5fa7 00        NOP     
5fa8 52        LD      D,D
5fa9 45        LD      B,L
5faa 54        LD      D,H
5fab 55        LD      D,L
5fac 52        LD      D,D
5fad 4E        LD      C,(HL)
5fae 00        NOP     
5faf 00        NOP     
5fb0 50        LD      D,B
5fb1 52        LD      D,D
5fb2 49        LD      C,C
5fb3 4E        LD      C,(HL)
5fb4 54        LD      D,H
5fb5 00        NOP     
5fb6 00        NOP     
5fb7 00        NOP     
5fb8 52        LD      D,D
5fb9 55        LD      D,L
5fba 4E        LD      C,(HL)
5fbb 0D        DEC     C
5fbc 00        NOP     
5fbd 00        NOP     
5fbe 00        NOP     
5fbf 00        NOP     
5fc0 C620      ADD     A,20H
5fc2 C34A22    JP      224AH
5fc5 FB        EI      
5fc6 362C      LD      (HL),2CH
5fc8 C3A30F    JP      0FA3H
5fcb B7        OR      A
5fcc ED52      SBC     HL,DE
5fce 23        INC     HL
5fcf C9        RET     

5fd0 4F        LD      C,A
5fd1 3A7AFA    LD      A,(0FA7AH)
5fd4 CB7F      BIT     7,A
5fd6 79        LD      A,C
5fd7 2802      JR      Z,5FDBH          ; (+02H)
5fd9 C680      ADD     A,80H
5fdb 3275FA    LD      (0FA75H),A
5fde C3781B    JP      1B78H
5fe1 32D7FA    LD      (0FAD7H),A
5fe4 E5        PUSH    HL
5fe5 CD9A1D    CALL    1D9AH
5fe8 E1        POP     HL
5fe9 C9        RET     

5fea 00        NOP     
5feb 00        NOP     
5fec FB        EI      
5fed C31E06    JP      061EH
5ff0 010080    LD      BC,8000H
5ff3 0B        DEC     BC
5ff4 78        LD      A,B
5ff5 B1        OR      C
5ff6 20FB      JR      NZ,5FF3H         ; (-05H)
5ff8 C34E36    JP      364EH
5ffb 00        NOP     
5ffc 97        SUB     A
5ffd C3A447    JP      47A4H
