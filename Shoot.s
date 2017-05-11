.section .text

.global Shoot

Shoot:
	push	{r4, r5, r6, r7, r8, r9, lr}

CheckB:
	ldr	r5, =InputValue			//Gets the address of the SNES controller info
	ldr	r8, [r5]			//Gets the input from the SNES controller
	ldr	r5, =0x8000			//Creates a bitmask to isolate B
	and	r8, r5				// ANDs the bitmask and the input
	ldr	r5, =0x0000			//Sets r5 to 0
	cmp	r5, r8				//Compares the AND of the input and the bitmask to 0
	bne	CheckA				//Branches to CheckA if B is not pressed

	//Shoot Bullet Downward
	ldr	r3, =Bullet0			//Gets the Address of the bullet variable
	ldr	r9, [r3, #20]			//Gets the value (0 or 1) to see if the bullet is in use
	cmp	r9, #1				//Checks if the bullet is in use
	beq	CheckA				//Branches over shooting if the bullet already exits

	
	mov	r9, #1				//Bullet shot value in r9
	str	r9, [r3, #20]			//Changes InUse to 1
	bl	initBulletB			//Draws the initial bullet

CheckA:
	ldr	r5, =InputValue			//Gets the address of the SNES controller info
	ldr	r8, [r5]			//Gets the input from the SNES controller
	ldr	r5, =0x0080			//Creates a bitmask to isolate A
	and	r8, r5				// ANDs the bitmask and the input
	ldr	r5, =0x0000			//Sets r5 to 0
	cmp	r5, r8				//Compares the AND of the input and the bitmask to 0
	bne	noShoot				//Branches to noShoot if A is not pressed

	//Shoot Bullet Upward
	ldr	r3, =Bullet1			//Gets the Address of the bullet variable
	ldr	r9, [r3, #20]			//Gets the value (0 or 1) to see if the bullet is in use
	cmp	r9, #1				//Checks if the bullet is in use
	beq	noShoot				//Branches over shooting if the bullet already exits
	
	mov	r9, #1				//Bullet shot value in r9
	str	r9, [r3, #20]			//Changes InUse to 1
	bl	initBulletA			//Draws the initial bullet

noShoot: 
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr

initBulletB:
	push	{r1, r2, r4, r5, lr}

	ldr	r5, =PlayerVariables		//Gets the Address of PlayerVariables
	ldr	r1, [r5, #4]			//Gets the X-coordinate of PlayerVariables
	ldr	r2, [r5, #8]			//Gets the Y-coordinate of PlayerVariables

	ldr	r4, =0xFF66			//Sets r4 to the colour you want the bullet to be
	add	r2, #30				//Adds an offset to the bullet to shoot out buttom peek

	str	r1, [r3, #4]			//Sets X-coordinate of the bullet to that of the PlayerVariable
	str	r2, [r3, #8]			//Sets Y-coordinate of the bullet to that of the PlayerVariable
	str	r4, [r3, #12]			//Sets the bullet colour to the given colour

	bl	DrawVLine			//Draws the bullet

	pop	{r1, r2, r4, r5, lr}
	bx	lr

initBulletA:
	push	{r1, r2, r4, r5, lr}

	ldr	r5, =PlayerVariables		//Gets the Address of PlayerVariables
	ldr	r1, [r5, #4]			//Gets the X-coordinate of PlayerVariables
	ldr	r2, [r5, #8]			//Gets the Y-coordinate of PlayerVariables

	ldr	r4, =0xFF66			//Sets r4 to the colour you want the bullet to be
	sub	r2, #30				//Adds an offset to the bullet to shoot out buttom peek

	str	r1, [r3, #4]			//Sets X-coordinate of the bullet to that of the PlayerVariable
	str	r2, [r3, #8]			//Sets Y-coordinate of the bullet to that of the PlayerVariable
	str	r4, [r3, #12]			//Sets the bullet colour to the given colour

	bl	DrawVLine			//Draws the bullet

	pop	{r1, r2, r4, r5, lr}
	bx	lr




