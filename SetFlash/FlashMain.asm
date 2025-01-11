FlashMove:
push r14
bl FlashType2Main
pop r15
.pool

FlashType2Main:
push r14
ldr r1,=Flash
ldrb r0,[r5,0x8]
ldr r1,[r1,r0]
mov r14,r15
bx r1
pop r15
.pool
Flash:
.dw FlashStep00|1
.dw FlashWait|1
.dw FlashFinalState|1