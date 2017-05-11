.section .text

/* The DrawPixel16bpp was created by the 
 *TA's for CPSC 359 at the University of Calgary
 *During the Winter semester 2015
 *Very limited modification was implemented
 */

/* Draw Pixel to a 1024x768x16bpp frame buffer
 * Note: no bounds checking on the (X, Y) coordinate
 *	r0 - frame buffer pointer
 *	r1 - pixel X coord
 *	r2 - pixel Y coord
 *	r3 - colour (use low half-word)
 */
.global DrawPixel16bpp
DrawPixel16bpp:
	push	{r0, r4, r5}

	offset	.req	r4

	// offset = (y * 1024) + x = x + (y << 10)
	add		offset,	r1, r2, lsl #10
	// offset *= 2 (for 16 bits per pixel = 2 bytes per pixel)
	lsl		offset, #1

	// store the colour (half word) at framebuffer pointer + offset
	ldr		r5, =FrameBufferThing
	ldr		r0, [r5]	
	strh	r3,		[r0, offset]

	pop		{r0, r4, r5}
	bx		lr

//-----------------------------------Draws a Horizontal Line-----------------------------------
.global DrawHLine
DrawHLine:
	push		{r4, r5, lr}
	
	mov		r5, r3			//Stores the Address in r5 for use in method

	ldr		r3, [r5, #12]		//Sets r3 to the colour
	ldr		r4, [r5, #16]		//Sets r4 to Size

	add		r4, r1			//Calculates the right-most point of the line
lineLoop:

	bl		DrawPixel16bpp		//Calls DrawPixel

	add		r1, #1			//Moves x-coordinate to the right
	cmp		r1, r4			//Compares the x-coordinate to the rightmost point in the line
	blt		lineLoop		//Ends loop when they are the same

	mov		r3, r5			//Resaves the given address to r3
	pop		{r4, r5, lr}
	bx		lr


//--------------------------------------Draws a Vertical Line--------------------------------------
.global DrawVLine
DrawVLine:
	push		{r4, r5, lr}
	
	mov		r5, r3			//Stores the Address in r5 for use in method
	
	ldr		r3, [r5, #12]		//Sets r3 to the colour
	ldr		r4, [r5, #16]		//Sets r4 to Size

	add		r4, r2			//Calculates the bottom-most point of the line
lineVLoop:

	bl		DrawPixel16bpp		//Calls DrawPixel

	add		r2, #1			//Moves the y-coordinate down
	cmp		r2, r4			//Compares the y-coordinate with the buttom most point
	blt		lineVLoop		//Ends loop when they are equal

	mov		r3, r5			//Rasaves the address into r3
	pop		{r4, r5, lr}
	bx		lr

//------------------------------------Draws the "Arm" part of the player character----------------------
.global DrawArms
DrawArms:
	push		{r4, r5, r6, lr}
	
	ldr		r4, [r3, #16]		//Loads the Size from the given address into r4
	ldr		r5, [r3, #20]		//Sets r5 to the Arm length

	sub		r1, r4			//Moves one size unit to the left
	sub		r2, r4			//Moves one size unit up

	bl		DrawVLine		//Draws the "Hand" on the left side

	lsr		r4, #1			//Douples the size unit
	sub		r2, r4			//Moves Back to Center (y-coordinate)

ArmLoop:
	bl		DrawHLine		//Draws a horizontal line the same length as the hand
	sub		r5, #1			//Dec the arm-length 
	cmp		r5, #0			//Compares the arm length to 0 (to see if done drawing)
	bne		ArmLoop			//Breaks branch when arm is done being drawn

	sub		r2, r4			//Moves up one size unit to start drawing right "Hand"

	bl		DrawVLine		//Draws right hand

	pop		{r4, r5, r6, lr}
	bx		lr

//------------------------------------Draws the "Arm" part of the enemy charaters----------------------
.global DrawEArms
DrawEArms:
	push		{r4, r5, r6, lr}
	
	ldr		r4, [r3, #16]		//Loads the Size from the given address into r4
	ldr		r5, [r3, #20]		//Sets r5 to the Arm length


	sub		r1, r4			//Moves x-coordinate to the left one size unit
	
	add		r2, r4, lsr #1		//Moves y-coordinate two size units down

	bl		DrawVLine		//Draws left hand
	
	sub		r2, r4, lsr #1		//Centers the y-coordinate
	sub		r2, #2			//Fine tunes location to draw horizontal line

ArmELoop:
	bl		DrawHLine		//Draws arm of length size unit
	sub		r5, #1			//Decs the arm length 
	cmp		r5, #0			//Stops drawing arm when done
	bne		ArmELoop

	add		r2, #2
	sub		r2, r4, lsr #1

	bl		DrawVLine



	pop		{r4, r5, r6, lr}
	bx		lr




//-----------------------------Draws a Square-----------------------------------------------------------------
.global DrawBlock


DrawBlock:

	push		{r4, r5, r6, lr}

	mov		r5, r3			//Stores the Address of SquareVariables in r5 for use in method

	ldr		r0, [r5]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r5, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r5, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r5, #16]		//Loads the Size from SquareVariables into r4
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	add		r4, r2			//Calculates the lowest vertical point of the box

boxLoop:

	mov		r1, r6			//Resets the X-coordinate to start new line

	bl		DrawHLine		//Calls the DrawHLine function

	add		r2, #1
	cmp		r2, r4
	blt		boxLoop

	pop		{r4, r5, r6, lr}
	bx		lr


//--------------------------Draws a triangle with a point that faces upward-------------------
.global DrawTriangleUp
DrawTriangleUp:

	push		{r4, r5, r6, r7, lr}

	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	mov		r7, r4			//Set counter for offeset to 0
	mov		r4, #1			

triangleUpLoop:

	sub		r1, r6, r4, lsr #1
	str		r4, [r3, #16]

	bl		DrawHLine		//Calls the DrawHLine function

	add		r4, #1
	add		r2, #1
	cmp		r4, r7
	blt		triangleUpLoop

	mov		r1, r6
	str		r7, [r3, #16]

	pop		{r4, r5, r6, r7, lr}
	bx		lr

//---------------------------Draws a triangle with a point that faces downward---------------------
.global DrawTriangleDown
DrawTriangleDown:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	mov		r7, r4
	mov		r8, r2

triangleDownLoop:

	sub		r1, r6, r4, lsr #1
	str		r4, [r3, #16]

	bl		DrawHLine		//Calls the DrawHLine function

	sub		r4, #1
	add		r2, #1
	cmp		r4, #0
	bgt		triangleDownLoop

	mov		r1, r6
	add		r1, r7
	str		r8, [r3, #8]
	str		r1, [r3, #4]
	str		r7, [r3, #16]


	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr


//----------------------Draws the Player-------------------------------------------------------------
.global DrawPlayer
DrawPlayer:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r3, =PlayerVariables
	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r1			//Save the initial X-Coordinate into r6
	mov		r7, r4			//Set counter for offeset to 0
	mov		r8, r4			//Set counter for offeset to 0
	mov		r4, #1

playerUpLoop:

	sub		r1, r6, r4, lsr #1
	str		r4, [r3, #16]

	bl		DrawHLine		//Calls the DrawHLine function

	add		r4, #2
	add		r2, #1
	cmp		r4, r7
	blt		playerUpLoop
	


	mov		r7, #1			//Set counter for offeset to 0

playerDownLoop:

	sub		r1, r6, r4, lsr #1
	str		r4, [r3, #16]

	bl		DrawHLine		//Calls the DrawHLine function

	sub		r4, #2
	add		r2, #1
	cmp		r4, r7
	bgt		playerDownLoop

	str		r8, [r3, #16]
	
	bl		DrawArms

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr


//-------------------------Draws the King Enemy facing upward----------------------------------
.global DrawKing	
DrawKing:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial X-Coordinate into r6
	mov		r7, r1
	
	bl		DrawTriangleUp
	
	add		r1, r4
	mov		r2, r6

	bl		DrawTriangleUp

	add		r1, r4
	mov		r2, r6

 	bl		DrawTriangleUp

	mov		r2, r6
	mov		r1, r7
	bl		DrawEArms

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr

//--------------------------Draws the Queen Enemy facing upward-----------------------------------------
.global DrawQueen	
DrawQueen:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial X-Coordinate into r6
	mov		r7, r1
	
	bl		DrawTriangleUp
	
	add		r1, r4
	mov		r2, r6

	bl		DrawTriangleUp

	
	mov		r2, r6
	mov		r1, r7
	bl		DrawEArms

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr


//------------------------Draws the Jack Enemy facing upward---------------------------------------------
.global DrawJack	
DrawJack:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial X-Coordinate into r6
	mov		r7, r1
	
	bl		DrawTriangleUp
	
	mov		r2, r6
	mov		r1, r7
	bl		DrawEArms

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr

//-----------------------Draws the King Enemy facing downward----------------------------------------
.global DrawDKing	
DrawDKing:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial Y-Coordinate into r6
	mov		r7, r1			//Saves the initial X-Coordinate into r7
	
	bl		DrawTriangleDown
	
	add		r1, r4
	mov		r2, r6

	bl		DrawTriangleDown

	add		r1, r4
	mov		r2, r6

 	bl		DrawTriangleDown

	sub		r2, r6, r4
	add		r2, #1
	mov		r1, r7
	bl		DrawEArms

	str		r6, [r3, #8]
	str		r7, [r3, #4]

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr

//----------------------------Draws the Queen Enemies facing downward----------------------------
.global DrawDQueen	
DrawDQueen:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial Y-Coordinate into r6
	mov		r7, r1			//Saves the initial X-Coordinate 
	
	bl		DrawTriangleDown
	
	add		r1, r4
	mov		r2, r6

	bl		DrawTriangleDown

	
	sub		r2, r6, r4
	add		r2, #1
	mov		r1, r7
	bl		DrawEArms

	str		r6, [r3, #8]
	str		r7, [r3, #4]

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr


//--------------------------Draws the Jack Enemy facing downward--------------------------------------
.global DrawDJack	
DrawDJack:

	push		{r4, r5, r6, r7, r8, lr}

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	mov		r6, r2			//Save the initial X-Coordinate into r6
	mov		r7, r1
	
	bl		DrawTriangleDown
	
	sub		r2, r6, r4
	add		r2, #1
	mov		r1, r7
	bl		DrawEArms

	str		r6, [r3, #8]
	str		r7, [r3, #4]

	pop		{r4, r5, r6, r7, r8, lr}
	bx		lr

//--------------------------Draws multiple squares to create a bush---------------------------------------
.global DrawBush
DrawBush:
	push	{r4, r5, r6, r7, r8, lr}

	mov	r6, r0
	mov	r7, r1
	ldr	r0, [r3]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #8]
	ldr	r8, [r3, #20]

	mov	r5, r1	

checkBush:

	cmp	r8, #0
	ble	doneBush

	bl	DrawBlock
	str	r1, [r3, #4]

	sub	r8, #1
	
	bal	checkBush

doneBush:
	str	r5, [r3, #4]
	mov	r0, r6
	mov	r1, r7

	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr



	

	
