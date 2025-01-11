getBlockToPos equ 0x800b3C0
ObjNoShadow equ 0x8002922
ObjCharInit equ 0x80021BC
SeqSet equ 0x8002750
ObjCharSet equ 0x800217C
PaletteSet equ 0x800272C
EnemyFlipCheck equ 0x800B540
ObjFlipSet equ 0x80028EE
EFCsetPal equ 0x8002862
CalcPlEmSpd equ 0x800B3E4

LaserInit:
push r14
BXwithR11  getBlockToPos|1 
mov r0,0x8
mov r1,0x10
mov r2,(0x52+0x25)
BXwithR11 ObjCharInit|1
BXwithR11 ObjNoShadow|1

ldrb r0,[r5]
mov r1,0x2
orr r0,r1
strb r0,[r5]
mov r0,0
strb r0,[r5,0x10]
strb r0,[r5,0x11]

BXwithR11 SeqSet|1
BXwithR11 ObjCharSet|1

mov r0,0
BXwithR11 PaletteSet|1
BXwithR11 EnemyFlipCheck|1
BXwithR11 ObjFlipSet|1

mov r0,0

BXwithR11 EFCsetPal|1
BXwithR11 CalcPlEmSpd|1

mov r1,0x40
lsl r1,r1,0x10
mul r0,r1
ldr r1,[r5,0x34]
add r1,r1,r0
str r1,[r5,0x34]
mov r0,0x4
str r0,[r5,0x8]

mov r7,0xC
add r7,r7,r5
mov r0,0
strb r0,[r7]
bl SetFlash

pop r15
.pool