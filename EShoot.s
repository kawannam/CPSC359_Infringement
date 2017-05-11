.section .text


.global EShoot
EShoot:
	push	{r0, r1, r2, lr}

Jack0Shoot:
	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack0Variables	//Gets Enemy address
	ldr		r2, =Bullet2		//Gets Enemy's Bullet Address
	bl		CheckEShootU
Jack1Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack1Variables	//Gets Enemy address
	ldr		r2, =Bullet3		//Gets Enemy's Bullet Address
	bl		CheckEShootU


Jack2Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack2Variables	//Gets Enemy address
	ldr		r2, =Bullet4		//Gets Enemy's Bullet Address
	bl		CheckEShootU

Jack3Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack3Variables	//Gets Enemy address
	ldr		r2, =Bullet5		//Gets Enemy's Bullet Address
	bl		CheckEShootU

Jack4Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack4Variables	//Gets Enemy address
	ldr		r2, =Bullet6		//Gets Enemy's Bullet Address
	bl		CheckEShootU
Jack5Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack5Variables	//Gets Enemy address
	ldr		r2, =Bullet7		//Gets Enemy's Bullet Address
	bl		CheckEShootU

Jack6Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack6Variables	//Gets Enemy address
	ldr		r2, =Bullet11		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Jack7Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack7Variables	//Gets Enemy address
	ldr		r2, =Bullet12		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Jack8Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack8Variables	//Gets Enemy address
	ldr		r2, =Bullet13		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Jack9Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack9Variables	//Gets Enemy address
	ldr		r2, =Bullet14		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Jack10Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack10Variables	//Gets Enemy address
	ldr		r2, =Bullet15		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Jack11Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Jack11Variables	//Gets Enemy address
	ldr		r2, =Bullet16		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Queen0Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Queen0Variables	//Gets Enemy address
	ldr		r2, =Bullet8		//Gets Enemy's Bullet Address
	bl		CheckEShootU

Queen1Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Queen1Variables	//Gets Enemy address
	ldr		r2, =Bullet9		//Gets Enemy's Bullet Address
	bl		CheckEShootU

Queen2Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Queen2Variables	//Gets Enemy address
	ldr		r2, =Bullet17		//Gets Enemy's Bullet Address
	bl		CheckEShootD

Queen3Shoot:

	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =Queen3Variables	//Gets Enemy address
	ldr		r2, =Bullet18		//Gets Enemy's Bullet Address
	bl		CheckEShootD

King0Shoot:
	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =King0Variables	//Gets Enemy address
	ldr		r2, =Bullet10		//Gets Enemy's Bullet Address
	bl		CheckEShootU

King1Shoot:
	ldr		r1, =0x20003004		//Gets Clock Address
	ldr		r0, [r1]		//Gets Clock time

	ldr		r1, =King1Variables	//Gets Enemy address
	ldr		r2, =Bullet19		//Gets Enemy's Bullet Address
	bl		CheckEShootD


	pop	{r0, r1, r2, lr}
	bx	lr

//-----------------------------------------------------
CheckEShootD:

	push 	{r3, r4, r5, lr}
						//r0- Clock time
						//r1- Character Variables Address 
						//r2- Bullet Number Address

	ldr	r4, [r1, #32]			//Loads TimeToShoot
	cmp	r0, r4
	blt	endEShootD

	ldr	r3, [r1, #24]
	cmp	r3, #0
	ble	endEShootD

	ldr	r5, [r2, #20]			//Gets the value (0 or 1) to see if the bullet is in use
	cmp	r5, #1				//Checks if the bullet is in use
	beq	endEShootD			//Branches over shooting if the bullet already exits
	
	mov	r5, #1				//Bullet shot value in r5
	str	r5, [r2, #20]			//Changes InUse to 1
	bl	initEBulletD			//Draws the initial bullet

endEShootD:	
	pop	{r3, r4, r5, lr}
	bx	lr


initEBulletD:
	push	{r3-r6, lr}
						//r1 Enemy Variables
						//r2 Bullet Variables

	mov	r6, r1	

	ldr	r3, [r1, #4]			//Gets the X-coordinate of PlayerVariables
	ldr	r4, [r1, #8]			//Gets the Y-coordinate of PlayerVariables
	ldr	r0, [r1]

	
	ldr	r5, =0xFF99			//Sets r5 to the colour you want the bullet to be
	add	r4, #15				//Adds an offset to the bullet to shoot out buttom peek

	str	r3, [r2, #4]			//Sets X-coordinate of the bullet to that of the PlayerVariable
	str	r4, [r2, #8]			//Sets Y-coordinate of the bullet to that of the PlayerVariable
	str	r5, [r2, #12]			//Sets the bullet colour to the given colour

	mov	r1, r3
	mov	r2, r4
	mov	r3, r6
		
	bl	DrawVLine			//Draws the bullet

	pop	{r3-r6, lr}
	bx	lr

//--------------------------------------------------------------------
CheckEShootU:

	push 	{r3, r4, r5, lr}
						//r0- Clock time
						//r1- Character Variables Address 
						//r2- Bullet Number Address

	ldr	r4, [r1, #32]			//Loads TimeToShoot
	cmp	r0, r4
	blt	endEShootU

	ldr	r3, [r1, #24]
	cmp	r3, #0
	ble	endEShootU

	ldr	r5, [r2, #20]			//Gets the value (0 or 1) to see if the bullet is in use
	cmp	r5, #1				//Checks if the bullet is in use
	beq	endEShootU			//Branches over shooting if the bullet already exits
	
	mov	r5, #1				//Bullet shot value in r5
	str	r5, [r2, #20]			//Changes InUse to 1
	bl	initEBulletU			//Draws the initial bullet

endEShootU:	
	pop	{r3, r4, r5, lr}
	bx	lr


initEBulletU:
	push	{r3-r6, lr}
						//r1 Enemy Variables
						//r2 Bullet Variables

	mov	r6, r1	

	ldr	r3, [r1, #4]			//Gets the X-coordinate of PlayerVariables
	ldr	r4, [r1, #8]			//Gets the Y-coordinate of PlayerVariables
	ldr	r0, [r1]

	
	ldr	r5, =0xFF99			//Sets r5 to the colour you want the bullet to be
	sub	r4, #15				//Adds an offset to the bullet to shoot out buttom peek

	str	r3, [r2, #4]			//Sets X-coordinate of the bullet to that of the PlayerVariable
	str	r4, [r2, #8]			//Sets Y-coordinate of the bullet to that of the PlayerVariable
	str	r5, [r2, #12]			//Sets the bullet colour to the given colour

	mov	r1, r3
	mov	r2, r4
	mov	r3, r6
		
	bl	DrawVLine			//Draws the bullet

	pop	{r3-r6, lr}
	bx	lr

