	.section .text
.global ClearScreen
ClearScreen:
	push	{r3, lr}
	
	ldr	r3, =BigBlackBox		//Gets the BigBlackBox address
	bl	DrawBlock			//Clears the screen (first half)

	ldr	r4, [r3, #4]			//Gets the X-coor
	ldr	r5, =300			//Stores 500 to r5
	add	r5, r4				//Adds 300 to the X-coor
	str	r5, [r3, #4]			//Saves new X-coor

	bl	DrawBlock			//Clears the other half of the screen

	str	r4, [r3, #4]			//Stores the original value back in BigBlackBox

	pop	{r3, lr}
	bx	lr
