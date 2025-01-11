FadeSet equ 0x8001E64

FlashStep00:
push r14
ldrb r0,[r5,0xB]
tst r0,r0
bne @@NotInit
ldrb r0,[r5,0x5]
strh r0,[r5,0x20]
mov r0,0x4
strb r0,[r5,0xB]
b @@Escape
@@NotInit:
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20]
bne @@Finish
ldrb r0,[r5,0x5]
strh r0,[r5,0x20]
ldrb r0,[r5,0x6]
add r0,r0,r1
strb r0,[r5,0x6]
cmp r0,0x1F
blt @@Escape
mov r0,0x1F
strb r0,[r5,0x6]
mov r0,0x4
str r0,[r5,0x8]
@@Escape:
bl type02_fade_set
@@Finish:
pop r15

Type02_fade_set:
push r14
ldrb r0,[r5,0x6]
lsl r1,r0,0x5
lsl r2,r0,0xA
orr r1,r0
orr r1,r2
mov r0,0
mov r2,0x9
mov r3,0x10
ldr r4,=0x3002C50
BXwithR11 FadeSet|1
pop r15 
.pool