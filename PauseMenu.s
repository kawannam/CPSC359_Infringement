	.section .text
//.global PauseMenu
//PauseMenu:



.global DrawMenu	
DrawMenu:
	push	{r0-r7, lr}

	ldr		r3, =OuterMenuBox

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	add		r4, r2			//Calculates the lowest vertical point of the box

OuterMenuLoop:

	mov		r1, r6			//Resets the X-coordinate to start new line

	bl		DrawHLine		//Calls the DrawHLine function

	add		r2, #1
	cmp		r2, r4
	blt		OuterMenuLoop


	ldr		r3, =MenuBox

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	add		r4, r2			//Calculates the lowest vertical point of the box

InnerMenuLoop:

	mov		r1, r6			//Resets the X-coordinate to start new line

	bl		DrawHLine		//Calls the DrawHLine function

	add		r2, #1
	cmp		r2, r4
	blt		InnerMenuLoop

	pop	{r0-r7, lr}
	bx	lr	


.global ClearMenu
ClearMenu:
	push	{r0-r7, lr}

	ldr		r3, =OuterMenuBox

	ldr		r0, [r3]		//Loads the FrameBuffer from SquareVariables into r0
	ldr		r1, [r3, #4]		//Loads the X-coordinate from SquareVariables into r1
	ldr		r2, [r3, #8]		//Loads the Y-coordinate from SquareVariables into r2
	ldr		r5, [r3, #12]
	ldr		r4, [r3, #16]		//Loads the Size from SquareVariables into r4

	ldr		r7, =0x0000
	str		r7, [r3, #12]		
	
	mov		r6, r1			//Save the initial X-Coordinate into r6
	add		r4, r2			//Calculates the lowest vertical point of the box

ClearMenuLoop:

	mov		r1, r6			//Resets the X-coordinate to start new line

	bl		DrawHLine		//Calls the DrawHLine function

	add		r2, #1
	cmp		r2, r4
	blt		ClearMenuLoop

	str		r5, [r3, #12]

	ldr		r3, =PlayerVariables
	bl		DrawPlayer

	ldr		r3, =Bush2
	bl		DrawBush

	ldr		r3, =Bush5
	bl		DrawBush

	pop		{r0-r7, lr}
	bx		lr

