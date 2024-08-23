Attack:
push r14
ldrb r0,[r5,0xB]
tst r0,r0
bne @@somewhere
ldr r0,[r5,0x34]
ldr r1,[r5,0x40]
sub r0,r0,r1
str r0,[r5,0x34]
ldr r0,[r5,0x3C]
ldr r1,[r5,0x48]
add r0,r0,r1
str r0,[r5,0x3C]
ldrh r0,[r5,0x20]
cmp r0,0x3
bne @@Server
mov r0,0x1
BXwithR11 0x8013820|1
@@Server:
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20]
bgt @@Somewhere2
BXwithR11 0x8013818|1
BXwithR11 0x800A728|1 
beq @@Somewhere3
mov r0,0x34
add r0,r0,r5
ldmia [r0]!,r1-r3
mov r4,0x9
;EfC01
@@Somewhere3:
ldrb r0,[r5,0x12]
ldrb r1,[r5,0x13]
BXwithR11 0x800A348|1
mov r0,2
mov r1,0xA
BXwithR11 0x8029978|1
mov r0,0xA
strh r0,[r5,0x20]
mov r0,0x4
strb r0,[r5,0xB]
b @@Somewhere2
@@Somewhere:
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20]
bgt @@Somewhere2
mov r0,0x8
str r0,[r5,0x8]
@@Somewhere2:
pop r15
.pool