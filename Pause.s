.section .text

.global Pause

Pause:

	push	{r0-r9, lr}
	ldr	r5, =InputValue			//Gets the address of the SNES controller info
	ldr	r8, [r5]			//Gets the input from the SNES controller
	ldr	r5, =0x1000			//Creates a bitmask to isolate Start
	and	r8, r5				// ANDs the bitmask and the input
	ldr	r5, =0x0000			//Sets r5 to 0
	cmp	r5, r8				//Compares the AND of the input and the bitmask to 0
	bne	noPause				//Branches to noPause if Start is not pressed

	bl	DrawMenu


	ldr		r2, =0x00FF
	bl		DrawPauseWord
	ldr		r2, =0x00FF
	bl		DrawRestart
	ldr		r2, =0x00FF
	bl		DrawEnd
	ldr		r2, =0xF800
	bl		DrawContinue

	mov		r6, #0
	str		r6, [r4]

waiting:
	bl	GetInput
	ldr	r5, =InputValue			//Gets the address of the SNES controller info
	ldr	r8, [r5]			//Gets the input from the SNES controller
	ldr	r5, =0x1000			//Creates a bitmask to isolate Start
	and	r8, r5				// ANDs the bitmask and the input
	ldr	r5, =0x0000			//Sets r5 to 0
	cmp	r5, r8				//Compares the AND of the input and the bitmask to 0
	beq	waiting



CheckDown:

	bl	GetInput			//Scan SNES input
	ldr	r5, =InputValue			//Get SNES input address
	ldr	r8, [r5]			//Get SNES input
	ldr	r5, =0xFBFF			//Down button value
	cmp	r5, r8				//Compare down button with input
	bne	CheckUp				//If the down button is not pressed check the up button


//----------------------------
	cmp	r6, #0				
	bne	NotContinue

	ldr	r2, =0x00FF
	bl	DrawContinue

	ldr	r2, =0xF800
	bl	DrawRestart

	ldr	r4, =MenuSelection
	mov	r6, #1

	str	r6, [r4]

	bl	releaseButtons
	bl	Delay
	b	CheckDown

NotContinue:
//--------------------------------
	cmp	r6, #1				
	bne	CheckDown

	ldr	r2, =0x00FF
	bl	DrawRestart

	ldr	r2, =0xF800
	bl	DrawEnd

	ldr	r4, =MenuSelection
	mov	r6, #2

	str	r6, [r4]

	bl	releaseButtons
	bl	Delay


	bal	CheckDown




CheckUp:


	ldr	r5, =0xF7FF			//Up
	cmp	r5, r8	
	bne	CheckA


	cmp	r6, #1				
	bne	NotEnd

	ldr	r2, =0x00FF
	bl	DrawRestart

	ldr	r2, =0xF800
	bl	DrawContinue

	ldr	r4, =MenuSelection
	mov	r6, #0
Check5:
	str	r6, [r4]

	bl	releaseButtons
	bl	Delay
	bal	CheckDown

NotEnd:
//--------------------------------
	cmp	r6, #2				
	bne	CheckDown

	ldr	r2, =0x00FF
	bl	DrawEnd

	ldr	r2, =0xF800
	bl	DrawRestart

	ldr	r4, =MenuSelection
	mov	r6, #1
	str	r6, [r4]

	bl	releaseButtons
	bl	Delay
	bal	CheckDown

CheckA:
	ldr	r5, =0xFF7F			//A
	cmp	r5, r8
	bne	CheckDown



	cmp	r6, #0
	bne	CheckSelect2
	bl	ClearMenu
	pop	{r0-r9, lr}
	bx	lr
	

CheckSelect2:

	cmp	r6, #1
	bne	CheckSelect3
	bl	ClearScreen
	bl	Initialize
	b	GamePlay

CheckSelect3:
	
	bl	ClearScreen
	b	haltLoop$


noPause: 
	pop	{r0-r9, lr}
	bx	lr


.global releaseButtons
releaseButtons:
	push	{r4-r7, lr}
	ldr	r7, =0xFFFF
notReleased:
	bl	GetInput
	ldr	r4, =InputValue
	ldr	r5, [r4]
	cmp	r5, r7
	bne	notReleased

	pop	{r4-r7, lr}
	bx	lr

Delay:
	push		{r4, lr}
	ldr		r0, =0x20003004
	ldr		r1, [r0]
	ldr		r4, =9999
	add		r1, r4
DelayLoop:
	ldr		r2, [r0]
	cmp		r1, r2
	bhi		DelayLoop
	pop		{r4, lr}
	bx 		lr












