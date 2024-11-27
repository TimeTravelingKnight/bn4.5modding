
;instrustment, track, song pointers, song header
.align 4
InstrumentRoar:
.incbin "BeastSound.bin"
.incbin "BeastSound2.bin"

TrackRoar:
.incbin "BeastTrack.bin"

.align 4 
RoarSongHeader:
.db 1,0,0x80,0
.dw RoarInstrumentHeader
.dw TrackRoar




.align 4
RoarInstrumentHeader:
.db 0,0x3C,0,0
.dw InstrumentRoar
.db 0xFF,0,0xFF,0

.align 4
swooshinstrustment:
.incbin "swooshinstrustment.bin"

.align 4
swooshtrack:
.incbin "swooshtrack.bin"

.align 4
swooshSongHeader:
.db 1,0,0x40,0
.dw swooshinstrustment
.dw swooshtrack

.org 0x8135C44
.dw swooshSongHeader
.db 0x19,0,0x19,0
.dw RoarSongHeader
.db 0x1C,0,0x1C,0  

