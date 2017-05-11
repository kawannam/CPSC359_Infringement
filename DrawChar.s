.section .text
//----------------------------------------------------------------------------------
//This code is primarily created by the TA's of CPSC 359 at the University of Calgary
//During the Winter Semester of 2015
//Some minor changes were made
//-------------------------------------------------------------------------------------

.global DrawChar
DrawChar:
	push	{r4-r10, lr}

	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask		.req	r8

	ldr		chAdr,	=font		// load the address of the font map
	add		chAdr,	r3, lsl #4	// char address = font base + (char * 16)

	mov		r9, r0			//Saves the input for X into r9
	mov		r10, r1			//Saves the input for Y into r10
	mov		r3, r2			//Saves the input for colour into r3

	mov		py, r10			// init the Y coordinate (pixel coordinate)

charLoop$:
	mov		px, r9			// init the X coordinate


	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	
	ldrb	row,	[chAdr], #1		// load the row byte, post increment chAdr

rowLoop$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel$

	mov		r1,		px
	mov		r2,		py

	bl		DrawPixel16bpp		// draw red pixel at (px, py)

noPixel$:
	add		px,		#1	// increment x coordinate by 1
	lsl		mask,	#1		// shift bitmask left by 1

	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop$

	add		py,		#1	// increment y coordinate by 1

	tst		chAdr,	#0xF
	bne		charLoop$		// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)

	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask

	pop		{r4-r10, lr}
	bx		lr

.section .data

.align 4
font:		.incbin	"font.bin"
