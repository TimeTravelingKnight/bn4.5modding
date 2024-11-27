counterTime equ 0x800C48A 
flagOn equ 0x080139DA
.align 2
LaserMain:
push r14
ldr r0,=LaserStates
ldrb r1,[r5,0xA]
add r0,r0,r1
ldr r0,[r0]
mov r14,r15
bx r0
pop r15
.pool
LaserStates:
.dw InitAttack|1
.dw WaitToSetHead|1
.dw InitHead|1
.dw InitLaser|1
.dw LastPhase|1
InitAttack:
push r14
mov r0,20
strh r0,[r5,0x20]
mov r0,27
strb r0,[r5,0x10]
ldrb r1,[r5,0xA]
add r1,r1,4
strb r1,[r5,0xA]
bl SetHand
pop r15
WaitToSetHead:
push r14
mov r0,2
mov r1,0xA
BXwithR11 0x8029978|1
ldrh r0,[r5,0x20]
sub r0,1
strh r0,[r5,0x20]
bne @@Finish
mov r0,0
str r0,[r5,0x4C]
ldrb r1,[r5,0xA]
add r1,r1,4
strb r1,[r5,0xA]
@@Finish:
pop r15

InitHead:
push r14
;ldrh r0,[r5,0x20]
;sub r0,1
;strh r0,[r5,0x20]
;bne @@Finish
BXwithR11 counterTime|1
mov r0,0x48
add r0,0xFF
BXwithR11 0x8000534|1 ;sound
bl SummonHead
mov r0,28
strb r0,[r5,0x10]
mov r0,1
lsl r0,r0,0x16
BXwithR11 flagOn|1
ldrb r1,[r5,0xA]
add r1,r1,4
strb r1,[r5,0xA]
mov r0,5
strh r0,[r5,0x20]
@@Finish:
pop r15
.pool
InitLaser:
push r14
ldrh r0,[r5,0x20]
sub r0,1
strh r0,[r5,0x20]
bne @@Finish
mov r0,29
strb r0,[r5,0x10]
bl FireLaser
ldrb r1,[r5,0xA]
add r1,r1,4
strb r1,[r5,0xA]
mov r0,80
strh r0,[r5,0x20]
@@Finish:
pop r15
.pool
LastPhase:
push r14
ldrh r0,[r5,0x20]
sub r0,1
strh r0,[r5,0x20]
bne @@Finish
str r0,[r5,0x4C]
BXwithR11 0x800D5bC|1
@@Finish:
pop r15
.pool
