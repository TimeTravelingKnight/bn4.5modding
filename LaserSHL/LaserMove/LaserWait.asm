ObjSeqInfoGet equ 0x8002796
Direction2 equ 0x80083FC
NaviStatusGet equ 0x800E35C
LaserWait:
push r14
ldrb r0,[r5,0x10]
cmp r0,0x11
bne @@CounterDown
BXwithR11 ObjSeqInfoGet|1
mov r1,0x80
tst r0,r1
beq @@Finish
mov r0,0x1
strb r0,[r5,0x10]
mov r0,0x6
strh r0,[r5,0x20]
@@CounterDown:
ldrh r0,[r5,0x20]
sub r0,1
strh r0,[r5,0x20]
bgt @@Finish
ldrh r0,[r5,0x22]
cmp r0,0xA
beq @@Escape2
add r1,r0,1
ldrb r2,[r5,4]
cmp r2,5
bne @@Escape3
add r1,1
@@Escape3:
strh r1,[r5,22]
ldrb r2,[r5,4]
lsl r2,r2,0x2
ldr r1,=0x80A78D4
ldr r1,[r1,r2]
lsl r0,r0,1
ldrh r0,[r1,r0]
cmp r0,0xFF
beq @@Escape4
cmp r0,0xFE
bne @@Escape5
ldrb r0,[r5,0x16]
mov r1,1
eor r0,r1
mov r1,0x12
BXwithR11 NaviStatusGet|1
cmp r0,0x2
ble @@Subtract1
sub r0,1
@@Subtract1:
lsl r0,r0,8
add r0,0x12

@@Escape5:
bl MakeLaser

@@Escape4:
mov r0,0x6
strh r0,[r5,0x20]
b @@Finish

@@Escape2:
mov r0,0x2
strb r0,[r5,0x10]
mov r0,0x4
strb r0,[r5,0x9]
mov r0,0
strh r0,[r5,0xA]
mov r0,1
mov r2,0xC
add r2,r5,r2
strb r0,[r2]


@@Finish:
pop r15

MakeLaser:
push r4-r7,r14
cmp r0,0xFD
bne @@CheckDirection
ldr r5,[r6,0x2C]
mov r7,0x3
b @@LoadDirection
@@CheckDirection:
ldr r6,[r5,0x2C]
lsl r7,r0,0x10
add r7,3 
@@LoadDirection:
BXwithR11 Direction2|1
cmp r0,0x1
bne @@SetDefaultLaser
ldr r4,=0x0B05FF00
ldrb r0,[r5,0x16]
mov r1,0x6
mul r0,r1
ldrb r1,[r5,0x12]
sub r1,1
add r0,r0,r1
ldr r1,=0x80A79D4
ldrb r0,[r1,r0]
orr r4,r0
b @@LaserShl
@@SetDefaultLaser:
ldr r4,=0x0B05FF08
@@LaserShl:
ldrb r2,[r5,0x17]
ldr r3,[r5,0x3C]
ldrb r0,[r5,0x12]
ldrb r1,[r5,0x13]
BXwithR11 SetLaserDmg|1
pop r4-r7,r15

Seq1InfoGet equ 0x8002796 
KillLaser:
push r14
BXWithR11 Seq1InfoGet|1
mov r1,0x80
tst r0,r1
beq @@Finish
mov r0,0x8
str r0,[r5,0x8]
@@Finish:
pop r15