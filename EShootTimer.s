.section	.text


/* This function starts timer for all enemies
 * to determine when each one will shoot
 */


.global StartEShootTimer
StartEShootTimer:
	push		{r0, r1, r2, r3, r4, r5, lr}

	ldr		r0, =0x20003004			//Get the address for the clock
	ldr		r1, [r0]			//Gets the time from the clock

	ldr		r3, =Jack0Variables		//Loads the given Objects Address
	ldr		r4, [r3, #28]			//Gets the given objects wait time
	add		r2, r1, r4			//Adds the Objects wait time to the current time
	str		r2, [r3, #32]			//Store in the object the time in which it can next shoot

	ldr		r3, =Jack1Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack2Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack3Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack4Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack5Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack6Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack7Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack8Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack9Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]
	
	ldr		r3, =Jack10Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Jack11Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Queen0Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Queen1Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Queen2Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =Queen3Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =King0Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]

	ldr		r3, =King1Variables
	ldr		r4, [r3, #28]
	add		r2, r1, r4
	str		r2, [r3, #32]


	pop		{r0, r1, r2, r3, r4, r5, lr}
	bx		lr

