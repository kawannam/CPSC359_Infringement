.global GameDelay

//---------This function adds a slight delay in movements--------------
GameDelay:

	push	{r0, r1, r2, r3, r4, r5, lr}
	ldr	r0, =0x20003004			//Gets the address for the clock
	ldr	r1, [r0]			//Load the value of the current time

	ldr	r3, =GameDelayTime		//Gets the address for the amount of time for the game to wait
	ldr	r4, [r3]			//Load the amount the Game is to be delayed

	add	r2, r1, r4			//Adds wait time with current time

delayLoop:

	ldr	r0, =0x20003004			//This loop gets the clock input
	ldr	r1, [r0]			//and waits until the waiting time is over

	cmp	r2, r1
	bhi	delayLoop

	pop	{r0, r1, r2, r3, r4, r5, lr}
	bx	lr
