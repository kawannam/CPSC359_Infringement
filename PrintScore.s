	.section .text
.global PrintScore
PrintScore:

	push	{r4-r7, lr}
//---------------Write the word score--------------------------------------
	ldr	r0, =830
	ldr	r1, =744
	ldr	r2, =0xFFFF
	ldr	r3, =ScoreWord
	bl	WriteWord

//--------------Clear Score--------------------------------------------
	ldr	r3, =LittleBlackBox
	ldr	r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr	r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr	r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr	r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov	r6, r1			//Save the initial X-Coordinate into r6
	add	r4, r2			//Calculates the lowest vertical point of the box

BlackOutLoop:

	mov	r1, r6			//Resets the X-coordinate to start new line

	bl	DrawHLine		//Calls the DrawHLine function

	add	r2, #1
	cmp	r2, r4
	blt	BlackOutLoop

ldr	r3, =LittleBlackBox1
	ldr	r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr	r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr	r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr	r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov	r6, r1			//Save the initial X-Coordinate into r6
	add	r4, r2			//Calculates the lowest vertical point of the box

BlackOutLoop1:

	mov	r1, r6			//Resets the X-coordinate to start new line

	bl	DrawHLine		//Calls the DrawHLine function

	add	r2, #1
	cmp	r2, r4
	blt	BlackOutLoop1
//------------------------------------------------------------

	ldr	r4, =PlayerVariables
	ldr	r5, [r4, #24]

//---------------Hundreds Value---------------------------------------------

	cmp	r5, #400
	blt	Less400	
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r0, =892		// init the X coordinate
	ldr	r2, =0xFF98
	mov	r3, #'4'		// load the character into r9
	bl	DrawChar

	sub	r5, #400
	b	Tens

Less400:	
	cmp	r5, #300
	blt	Less300	
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r0, =892		// init the X coordinate
	ldr	r2, =0xFF98
	mov	r3, #'3'		// load the character into r9
	bl	DrawChar

	sub	r5, #300
	b	Tens

Less300:	
	cmp	r5, #200
	blt	Less200	
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r0, =892		// init the X coordinate
	ldr	r2, =0xFF98
	mov	r3, #'2'		// load the character into r9
	bl	DrawChar

	sub	r5, #200
	b	Tens

Less200:	
	cmp	r5, #100
	blt	Less100	
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r0, =892		// init the X coordinate
	ldr	r2, =0xFF98
	mov	r3, #'1'		// load the character into r9
	bl	DrawChar

	sub	r5, #100
	b	Tens
Less100:	
	
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r0, =892		// init the X coordinate
	ldr	r2, =0xFF98
	mov	r3, #'0'		// load the character into r9
	bl	DrawChar


//--------------Ten place check-----------------------------------------
Tens:

	cmp	r5, #90
	blt	Less90	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'9'		// load the character into r9
	bl	DrawChar

	sub	r5, #90
	b	Ones

Less90:
	cmp	r5, #80
	blt	Less80	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'8'		// load the character into r9
	bl	DrawChar

	sub	r5, #80
	b	Ones

Less80:
	cmp	r5, #70
	blt	Less70	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'7'		// load the character into r9
	bl	DrawChar

	sub	r5, #70
	b	Ones


Less70:
	cmp	r5, #60
	blt	Less60	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'6'		// load the character into r9
	bl	DrawChar

	sub	r5, #60
	b	Ones


Less60:
	cmp	r5, #50
	blt	Less50	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'5'		// load the character into r9
	bl	DrawChar

	sub	r5, #50
	b	Ones

Less50:
	cmp	r5, #40
	blt	Less40	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'4'		// load the character into r9
	bl	DrawChar

	sub	r5, #40
	b	Ones

Less40:
	cmp	r5, #30
	blt	Less30	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'3'		// load the character into r9
	bl	DrawChar

	sub	r5, #30
	b	Ones

Less30:
	cmp	r5, #20
	blt	Less20	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'2'		// load the character into r9
	bl	DrawChar

	sub	r5, #20
	b	Ones

Less20:
	cmp	r5, #10
	blt	Less10	
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'1'		// load the character into r9
	bl	DrawChar

	sub	r5, #10
	b	Ones

Less10:
	ldr	r0, =904		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'0'		// load the character into r9
	bl	DrawChar

Ones:

	cmp	r5, #5
	blt	Less5	
	ldr	r0, =916		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'5'		// load the character into r9
	bl	DrawChar
	b	EndPrint

Less5:

	ldr	r0, =916		// init the X coordinate
	ldr	r1, =744		// init the Y coordinate (pixel coordinate)
	ldr	r2, =0xFF98
	mov	r3, #'0'		// load the character into r9
	bl	DrawChar

	



EndPrint:

	pop	{r4-r7, lr}
	bx	lr
