move:
push r14
BXwithR11 0x801344C|1
ldr r1,[r5,0x50]
ldr r0,[r1,0x2C]
mov r0,0
tst r0,r0
bne @@DifferentTime
ldr r1,=@move
ldrb r0,[r5,0x9]
ldr r1,[r1,r0]
mov r14,r15
bx r1
BXwithR11 0x80137BA|1 
b @@AnotherTime
@@DifferentTime:
BXwithR11 0x8013818|1 
mov r0,0x8
str r0,[r5,0x8]
@@AnotherTime:
pop r15

.pool
@move:
.dw ClawEntry|1
.dw Attack|1

ClawEntry:
push r14
ldrb r0,[r5,0xB]
tst r0,r0
bne @@Escaping
mov r0,0x14
strh r0,[r5,0x20]
mov r0,0x4
strb r0,[r5,0xB]
b @@Escaping2
@@Escaping:
ldrh r0,[r5,0x20]
cmp r0,0xA
bne @@Escaping3
ldrb r0,[r5]
mov r1,0x2
orr r0,r1
strb r0,[r5]
mov r7,0x34
add r7,r7,r5
ldmia [r7]!,r1-r3
mov r4,0x6
;BXwithR11 0x80EDE80|1
@@Escaping3:
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20]
bgt @@Escaping2
mov r0,0xA
strh r0,[r5,0x20]
mov r0,0x47
add r0,0xFF
BXwithR11 0x8000534|1
mov r0,0x4
strb r0,[r5,0x9]
mov r0,0
strh r0,[r5,0xA]



@@Escaping2:
pop r15
.pool