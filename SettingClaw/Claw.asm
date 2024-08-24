.align 2
BassMainClaw:
push r14
ldr r0,=ClawStates
ldrb r1,[r5,0xA]
add r0,r0,r1
ldr r0,[r0]
mov r14,r15
bx r0
pop r15

.pool
ClawStates:
.dw IntializeBassClawAttack|1
.dw BASSCLAWATTACK|1

.align 2
IntializeBassClawAttack: 
push r14
mov r0,0
mov r1,0
bl BASSefcControl
mov r0,0x4
strb r0,[r5,0xA]
pop r15

LoopNumber equ 6
.align 2
BASSCLAWATTACK:
push r14
ldrb r0,[r5,0xB]
cmp r0,0x10
bge @@BRANCH1



ldr r0,[r5,0x3C]
ldr r1,=0x140000

cmp r0,r1
beq @@ZUpdateFinished
mov r1,0x21
ldrb r0,[r5,r1]
tst r0,r0
beq @@ZUpdate
sub r0,r0,1
strb r0,[r5,r1]
b @@FINISH


@@ZUpdate:
mov r0,1
strb r0,[r5,r1]
ldr r0,[r5,0x3C]
ldr r1,=0x10000
add r0,r0,r1
str r0,[r5,0x3C]
b @@FINISH

@@ZUpdateFinished:
ldrb r0,[r5,0xB]
tst r0,r0
bne @@BRANCH1
mov r0,20
mov r1,0x20
strb r0,[r5,r1]
mov r0,0
add r1,1
strb r0,[r5,r1]
mov r0,24 ;Animation
strb r0,[r5,0x10]


mov r0,0x4
strb r0,[r5,0xB]
mov r0,0
mov r1,0xA0
strb r0,[r7,r1]


b @@FINISH
@@BRANCH1:

ldrb r2,[r5,0xB] ;phase of animation

cmp r2,0x1C
beq @@UpdateAnimationandClose

cmp r2,0x18
beq @@TelportBass

cmp r2,0x14
beq @@BeginPuttingBassDown
cmp r2,0x10
beq @@PuttingBassDown

cmp r2,0xC
beq @@NoAnimationupdate

cmp r2,0x4
beq @@CheckToUpdate

mov r1,0x20
ldrb r0,[r5,r1]
cmp r0,1
beq @@UpdateToPhaseC
b @@UpdateCounter
@@UpdateToPhaseC:
add r2,4
strb r2,[r5,0xB]
mov r0,26
strb r0,[r5,0x10]




b @@UpdateCounter



@@CheckToUpdate:
mov r1,0x20
ldrb r0,[r5,r1]
cmp r0,10
beq @@UpdateToPhase8
b @@UpdateCounter

@@UpdateToPhase8:
add r2,4
strb r2,[r5,0xB]
mov r0,25
strb r0,[r5,0x10]
b @@UpdateCounter

@@NoAnimationUpdate:
mov r1,0x20
ldrb r0,[r5,r1]
tst r0,r0
beq @@generate

@@UpdateCounter:
ldrb r0,[r5,r1]
sub r0,0x1
strb r0,[r5,r1] 
b @@FINISH

@@generate:
bl shootingclawpostions
push r2,r3
mov r2,r1
mov r1,r0
bl SetClaw
pop r1,r2
bl SetClaw

mov r1,0x21
ldrb r0,[r5,r1]
cmp r0,LoopNumber
beq @@End
add r0,1
strb r0,[r5,r1]
mov r0,0xA
mov r1,0x20
strb r0,[r5,r1]
b @@FINISH




@@End:
;mov r0, 0x6
;strb r0,[r5,0x9]
;mov r0,0
;strh r0,[r5,0xA]
;mov r0,0x4
;strb r0,[r5,0xB]



ldrb r0,[r5,0xB]
add r0,4
strb r0,[r5,0xB]
b @@FINISH




@@PuttingBassDown:
mov r1,0xA0
ldrb r0,[r7,r1]
cmp r0,(LoopNumber+1)*2
bne @@FINISH

@@UpdateSpriteToTeleport:
mov r0,3
mov r1,0x20
strb r0,[r5,r1]
ldrb r0,[r5,0xB]
add r0,4
strb r0,[r5,0xB]
b @@FINISH


@@BeginPuttingBassDown:
bl PutMeDown
bne @@FINISH




mov r0,0
strb r0,[r5,0x10]
ldrb r0,[r5,0xB]
add r0,4
strb r0,[r5,0xB]
b @@FINISH

@@TelportBass:
mov r0,3
strb r0,[r5,0x10]
ldrb r0,[r5,0xB]
add r0,4
strb r0,[r5,0xB]

mov r0,4
mov r1,0x20
strb r0,[r5,r1]
b @@FINISH

@@UpdateAnimationandClose:
mov r1,0x20
ldrb r2,[r5,r1]
tst r2,r2
beq @@CloseBass
sub r2,0x1
strb r2,[r5,r1] 
b @@FINISH

@@CloseBass:
BXwithR11 0x800D5bC|1


@@FINISH:


pop r15
.pool

PutMeDown:
ldr r0,[r5,0x3C]
mov r1,0x20
ldrb r2,[r5,r1]
tst r2,r2
beq @@CounterisZero

ldrb r2,[r5,r1]
sub r2,0x1
strb r2,[r5,r1] 
b @@Testing

@@CounterisZero:
;mov r2,1
;strb r2,[r5,r1]

mov r0,0
;ldr r1,=0x10000
;sub r0,r0,r1
;mov r0,3
;strb r0,[r5,0x10]

str r0,[r5,0x3C]
@@Testing:
tst r0,r0
mov r15,r14
.pool

.include "ClawHelperFunctions/ClawLocate.asm"
.include "ClawHelperFunctions/ClawSet.asm"
.include "Shl/ClawMaster.asm"
.include "EFC/SetClawEFC.asm"

