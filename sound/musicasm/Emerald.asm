Emerald_Header:
	sHeaderInit						; Z80 offset is $C96A
	sHeaderPatch	Emerald_Patches
	sHeaderCh	$07, $03
	sHeaderTempo	$01, $35
	sHeaderDAC	Emerald_DAC
	sHeaderFM	Emerald_FM1, $F4, $08
	sHeaderFM	Emerald_FM2, $F4, $08
	sHeaderFM	Emerald_FM3, $F4, $07
	sHeaderFM	Emerald_FM4, $F4, $16
	sHeaderFM	Emerald_FM5, $F4, $16
	sHeaderFM	Emerald_FM6, $F4, $16
	sHeaderPSG	Emerald_PSG1, $F4, $02, $00, v04
	sHeaderPSG	Emerald_PSG2, $F4, $02, $00, v05
	sHeaderPSG	Emerald_DAC, $F4, $00, $00, v04

Emerald_FM3:
	ssDetune	$02

Emerald_FM1:
	sPatFM		$00
	dc.b nE5, $06, nG5, nC6, nE6, $0C, nC6, nG6
	dc.b $2A
	sStop

Emerald_FM2:
	sPatFM		$00
	dc.b nC5, $06, nE5, nG5, nC6, $0C, nA5, nD6
	dc.b $2A
	sStop

Emerald_FM4:
	sPatFM		$01
	dc.b nE5, $0C, nE5, $06, nG5, $06, nRst, nG5
	dc.b nRst, nC6, $2A
	sStop

Emerald_FM5:
	sPatFM		$01
	dc.b nC6, $0C, nC6, $06, nE6, $06, nRst, nE6
	dc.b nRst, nG6, $2A
	sStop

Emerald_FM6:
	sPatFM		$01
	dc.b nG5, $0C, nG5, $06, nC6, $06, nRst, nC6
	dc.b nRst, nE6, $2A
	sStop

Emerald_PSG2:
	dc.b nRst, $2D

Emerald_Loop2:
	dc.b nG5, $06, nF5, nE5, nD5
	saVolPSG	$03
	sLoop		$00, $04, Emerald_Loop2
	sStop

Emerald_PSG1:
	sFade		$01
	dc.b nRst, $02, nRst, $2D

Emerald_Loop1:
	dc.b nG5, $06, nF5, nE5, nD5
	saVolPSG	$03
	sLoop		$00, $04, Emerald_Loop1

Emerald_DAC:
	sFade		$01
	sStop

Emerald_Patches:

	; Patch $00
	; $04
	; $35, $72, $54, $46,	$1F, $1F, $1F, $1F
	; $07, $0A, $07, $0D,	$00, $0B, $00, $0B
	; $1F, $0F, $1F, $0F,	$23, $14, $1D, $80
	spAlgorithm	$04
	spFeedback	$00
	spDetune	$03, $05, $07, $04
	spMultiple	$05, $04, $02, $06
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $07, $0A, $0D
	spSustainLv	$01, $01, $00, $00
	spDecayRt	$00, $00, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$23, $1D, $14, $00

	; Patch $01
	; $3C
	; $31, $52, $50, $30,	$52, $53, $52, $53
	; $08, $00, $08, $00,	$04, $00, $04, $00
	; $10, $07, $10, $07,	$1A, $80, $16, $80
	spAlgorithm	$04
	spFeedback	$07
	spDetune	$03, $05, $05, $03
	spMultiple	$01, $00, $02, $00
	spRateScale	$01, $01, $01, $01
	spAttackRt	$12, $12, $13, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $08, $00, $00
	spSustainLv	$01, $01, $00, $00
	spDecayRt	$04, $04, $00, $00
	spReleaseRt	$00, $00, $07, $07
	spTotalLv	$1A, $16, $00, $00
