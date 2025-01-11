
.relativeinclude on
.gba
.open "rockmanreal.gba","Output/rockmanreal.gba",0x8000000




size equ filesize("rockmanreal.gba")
.include "macros/helpermacro.asm"
.include "SettingLasers/LaserDmgHook.asm"
.include "ShieldReset/shield.asm"

.org 0x82B09AC
.area 0xF30B
.include "SettingLasers/LaserDmg.asm"
.endarea


.align 4

.include "Sound/addingswosh.asm"

.orga size
.include "SettingExplode/EFCExplode.asm"
.include "SettingClaw/Claw.asm"
.include "SettingLasers/LaserMaster.asm"
.include "LaserSHL/LaserMaster.asm"
.include "SetFlash/FlashMaster.asm"

.align 4
Songs:
.incbin "Sound/soundList.bin" 
.dw swooshSongHeader
.db 0x19,0,0x19,0
.dw RoarSongHeader
.db 0x1C,0,0x1C,0  
.dw chargeSongHeader
.db 0x03,0,0x03,0

.align 4 
CannonNew:
.incbin "bins/thecannonattackwithhand.DMP"


.align 4
BassAttack:
.incbin "bins/BassAttack.DMP"

.align 4
ClawSprite:
.incbin "bins/theclaw.DMP"

.align 4
BassSprite:
.incbin "bins/Bass.DMP"

.align 4
BassCape:
.incbin "bins/bassnewcape.DMP"

.align 4
LaserWhite:
.incbin "bins/White_Laser.dmp"

.align 4
EMList:
pointercopy "rockmanreal.gba",0x32A8,0,0x6B
.dw BASSEFCCLAW|1
.dw FlashMove|1
SHLList:
pointercopy "rockmanreal.gba",0x34F4,0,0x6B
pointercopy "rockmanreal.gba",0x36A0,0,0x4C
.dw ClawMOVE2|1
.dw LaserMainMove|1



.orga 0x8124E8
.dw BassMainClaw|1;.dw BASSCLAWATTACK|1





;.orga 0x34F4+0x1DC
;.dw ClawMOVE2|1

.orga 0x2B588
.dw CannonNew

.orga 0x2B790
.dw ClawSprite
.dw LaserWhite

;.orga 0x2BC20
;.dw ClawSprite

.orga 0x2B478
.dw BassSprite

.orga 0x2B704
.dw BassCape

.orga 0x2BC4C
.dw BassAttack

.orga 0x2B458
.dw BassAttack

;.orga 0x3400
;.dw BASSEFCCLAW|1

.org 0x88122B4+0x23C
.dw LaserMain|1

.orga 0x2B94
.dw EMList

.orga 0x2B9C
.dw SHLList

.orga 0xEE36C
.dw Songs
.orga 0xEE3A0
.dw Songs
.orga 0xEE3EC
.dw Songs
.orga 0xEE440
.dw Songs
.orga 0xEE474
.dw Songs
.close
