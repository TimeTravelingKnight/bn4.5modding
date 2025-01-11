FlashWait:
push r14
ldr r0,[r5,0x60]
ldrb r1,[r0]
tst r1,r1
beq @@Finish
mov r0,0x8
str r0,[r5,0x8]

@@Finish:
pop r15

