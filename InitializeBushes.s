	.section .text
.global InitializeBushes
InitializeBushes:
	push	{r0-r6, lr}
// Bush1-----------------------------
	ldr		r3, =Bush1		//Gets the Address of the given variable

	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #100
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =350
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable

//Bush2-------------------------------
	ldr		r3, =Bush2		//Gets the Address of the given variable

	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #500
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =350
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable

//Bush3-----------------------------------
	ldr		r3, =Bush3		//Gets the Address of the given variable
	
	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #900
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =350
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable
//Bush4-------------------------------------
	ldr		r3, =Bush4		//Gets the Address of the given variable

	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #100
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =450
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable

//Bush5------------------------------------
	ldr		r3, =Bush5		//Gets the Address of the given variable
	
	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #500
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =450
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable

//Bush6-----------------------------------
	ldr		r3, =Bush6		//Gets the Address of the given variable

	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #900
	str		r4, [r3, #4]		//Bush X-coor
	ldr		r4, =450
	str		r4, [r3, #8]		//Bush Y-coor
	ldr		r4, =0x6644
	str		r4, [r3, #12]		//Bush Colour
	mov		r4, #20
	str		r4, [r3, #16]		//Bush SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Bush Life

	bl		DrawBush		//Draws the above variable

	pop		{r0-r6, lr}
	bx		lr



