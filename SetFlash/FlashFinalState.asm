FlashGone equ 0x8001E86

FlashFinalState:
push r14
ldrb r0,[r5,0xB]
tst r0,r0
bne @@NotInit
ldrb r0,[r5,0x5]
strh r0,[r5,0x20]
mov  r0,0x4
strb r0,[r5,0xB]
b @@Escape1
@@NotInit:
ldrh r0,[r5,0x20]
sub r0,0x1
strh r0,[r5,0x20]
bne @@Escape1
ldrb r0,[r5,0x5]
strh r0,[r5,0x20]
ldrb r0,[r5,0x6]
ldrb r1,[r5,0x7]
sub r0,r0,r1
strb r0,[r5,0x6]
bgt @@Escape1
mov r0,0x10
BXwithR11 FlashGone|1
bl Destory
b @@Finish
@@Escape1:
bl Type02_fade_set
@@Finish:
pop r15