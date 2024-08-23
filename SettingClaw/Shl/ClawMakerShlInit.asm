Init:
push r14
mov r0,0x1
mov r1,0x10
mov r2,0x52
BXwithR11 0x80021BC|1
mov r0,0x0
strb r0,[r5,0x10]
strb r0,[r5,0x11]
BXwithR11 0x8002750|1 
BXwithR11 0x800217C|1
BXwithR11 0x8002922|1
BXwithR11 0x800B3C0|1


mov r0,0x64
lsl r0,r0,0x10
str r0,[r5,0x3C]
ldr r1,[r5,0x34]
sub r1,r1,r0
str r1, [r5,0x34]
mov r0,0xA
lsl r0,r0,0x10
neg r0,r0
str r0,[r5,0x40]
str r0,[r5,0x48]
mov r0,0
strb r0,[r5,0x17]
BXwithR11 0x8012EC6|1
tst r0,r0
bne @@SettingData 
BXwithR11 0x8002DAC|1
b @@Finished
@@SettingData:
mov r1,0x28
mov r2,0x29
mov r3,0x1
BXwithR11 0x80133FC|1

BXwithR11 0x8013818|1 
BXwithR11 0x80137BA|1 
mov r0, 4
str r0,[r5,0x8]
bl move
@@Finished:
pop r15
.pool


 