LaserMoveMain:
push r7,r14
ldr r1,=PoolLasers
ldrb r0,[r5,0x9]
ldr r1,[r1,r0]
mov r14,r15
bx r1
pop r7,r15
.pool
PoolLasers:
.dw LaserWait|1
.dw KillLaser|1