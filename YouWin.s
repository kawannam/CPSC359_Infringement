.section .text

.global YouWin

YouWin:

	push	{r0-r9, lr}
	
	ldr	r0, =Jack0Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack1Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack2Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack3Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack4Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack5Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack6Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack7Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack8Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack9Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack10Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Jack11Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Queen0Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Queen1Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Queen2Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =Queen3Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =King0Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

	ldr	r0, =King1Variables	//Stores Enemy Address
	ldr	r1, [r0, #24]		//Stores Enemy Life
	cmp	r1, #0			//Check if Dead
	bgt	NoWin			//Did not Win

//--------------There has been victory-------------------------------

	bl	ClearScreen		//Clear Screen
	bl	DrawMenu		//Draw Menu

	ldr	r0, =380
	ldr	r1, =350
	ldr	r2, =0x00FF
	ldr	r3, =WinMessage
	bl	WriteWord

	ldr	r0, =380
	ldr	r1, =370
	ldr	r2, =0x00FF
	ldr	r3, =TryAgainMessage
	bl	WriteWord

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



NoWin:
	pop	{r0-r9, lr}
	bx	lr
