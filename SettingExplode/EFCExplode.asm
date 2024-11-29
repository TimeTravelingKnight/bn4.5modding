EFCSetGeneral equ 0x8002D1C
DirectionSome equ 0x800B3E4
EFCExplodeTime:
push r6,r7,r14
push r0,r1,r5
mov r0,0x24
BXwithR11 EFCSetGeneral|1
mov r7,r5
pop r0,r1,r5
beq @@Finish
strh r1,[r7,0x22]
;lsl r0,r0,0x19
;bcc @@Finish
mov r1,0
strh r1,[r7,0x12]
push r5,r7
;mov r5,r7
;lsrs r0,r0,0x16
;ldr r6,=0x8013058
;add r6,r6,r0
;ldr r2,[r6]
;ldr r3,[r6,0x4]
add r7,0x60
bl CreateRandSpots
pop r5,r7
strb r3,[r7,0x5]
@@Finish:
pop r6,r7,r15

CreateRandSpots:
push r14
mov r3,0
BXwithR11 DirectionSome|1
mov r4,r0
ldrb r0,[r5,0x12]
ldrb r1,[r5,0x13]

add r0,r4
bl CompareXEFC 
bl CompareYEFC

add r0,r4
bl CompareXEFC 
bl CompareYEFC

push r1
add r1,1
bl CompareYEFC
pop r1

push r1
sub r1,1
bl CompareYEFC
pop r1

add r0,r4
bl CompareXEFC 
bl CompareYEFC

push r1
add r1,1
bl CompareYEFC
pop r1

push r1
sub r1,1
bl CompareYEFC
pop r1

@@InfiniteLoop:
add r0,r4
bl CompareXEFC 
bl CompareYEFC
b @@InfiniteLoop






CompareYEFC:
cmp r1,0
beq @@Finish
cmp r1,4
beq @@Finish

push r0,r1
lsl r1,4
add r1,r0
strb r1,[r7,r3]
pop r0,r1
add r3,1
@@Finish:
mov r15,r14

CompareXEFC:
cmp r0,7
beq @@Finish
cmp r0,0
beq @@Finish
mov r15,r14
@@Finish:
pop r15