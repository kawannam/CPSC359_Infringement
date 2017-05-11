.section .text

.global StartTimer
StartTimer:
	push		{r0, r1, r2, r3, r4, r5, lr}
	ldr		r0, =0x20003004
	ldr		r1, [r0]

	ldr		r3, =TimeDelay
	ldr		r4, [r3]

	add		r1, r4

	ldr		r5, =TimeToMove
	str		r1, [r5]

	pop		{r0, r1, r2, r3, r4, r5, lr}
	bx		lr

.global CheckTimer
CheckTimer:
	push		{r0, r1, r2, r3, r4, lr}
	ldr		r0, =0x20003004
	ldr		r1, [r0]

	ldr		r2, =TimeToMove
	ldr		r3, [r2]

	cmp		r1, r3
	blt		notYet

	ldr		r3, =King0Variables
	bl		KingMotion

	ldr		r3, =Queen0Variables
	bl		QueenMotion

	ldr		r3, =Queen1Variables
	bl		QueenMotion
	
	ldr		r3, =Jack0Variables
	bl		JackMotion

	ldr		r3, =Jack1Variables
	bl		JackMotion

	ldr		r3, =Jack2Variables
	bl		JackMotion

	ldr		r3, =Jack3Variables
	bl		JackMotion

	ldr		r3, =Jack4Variables
	bl		JackMotion

	ldr		r3, =Jack5Variables
	bl		JackMotion

	ldr		r3, =King1Variables
	bl		DKingMotion

	ldr		r3, =Queen2Variables
	bl		DQueenMotion

	ldr		r3, =Queen3Variables
	bl		DQueenMotion
	
	ldr		r3, =Jack6Variables
	bl		DJackMotion

	ldr		r3, =Jack7Variables
	bl		DJackMotion

	ldr		r3, =Jack8Variables
	bl		DJackMotion

	ldr		r3, =Jack9Variables
	bl		DJackMotion

	ldr		r3, =Jack10Variables
	bl		DJackMotion

	ldr		r3, =Jack11Variables
	bl		DJackMotion

	bl		StartTimer

notYet:

	pop		{r0, r1, r2, r3, r4, lr}
	bx		lr


