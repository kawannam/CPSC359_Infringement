.section .text

.global YouDead

YouDead:

	bl	ClearScreen		//Clear Screen
	bl	DrawMenu
	
	ldr	r0, =370
	ldr	r1, =350
	ldr	r2, =0xF800
	ldr	r3, =EndMessage
	bl	WriteWord

	ldr	r0, =390
	ldr	r1, =370
	ldr	r2, =0xF800
	ldr	r3, =TryAgainMessage
	bl	WriteWord

	bl	releaseButtons
AnyButton:

	ldr	r6, =0xFFFF
notPressed:
	bl	GetInput
	ldr	r4, =InputValue
	ldr	r5, [r4]
	cmp	r5, r6
	beq	notPressed

	bl	ClearScreen
	bl	Initialize
	b	GamePlay




