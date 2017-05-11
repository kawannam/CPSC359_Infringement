.global Initialize	
Initialize:


	push		{r3, r4, r5, r6, lr}

	mov		r6, r0			//Saves the frame buffer value in r6

//Bullets----------------------------------------------------------------------------------
	
	bl		InitializeBullets

//Bushes--------------------------------------------------------------------------------------
	
	bl		InitializeBushes
	
//Enemies---------------------------------------------------------------------------------

	bl		InitializeEnemies

//Player----------------------------------------------------------------------------------
	ldr		r3, =PlayerVariables	//Gets the Address of the given variable
	str		r6, [r3]		//Sets the frame buffer for the above variable
	
	ldr		r4, =500		//Sets the X-coor to 500
	str		r4, [r3, #4]

	ldr		r4, =390		//Sets the Y-coor to 390
	str		r4, [r3, #8]
	
	ldr		r4, =0x6677		//Sets the colour for player
	str		r4, [r3, #12]

	ldr		r4, =30			//Sets the size of Player
	str		r4, [r3, #16]

	ldr		r4, =2			//Sets the Arm-length of player
	str		r4, [r3, #20]

	ldr		r4, =100		//Initial score
	str		r4, [r3, #24]

	bl		DrawPlayer		//Draws the above variable

//Names and Title-------------------------------------------------------------------------

	ldr	r3, =GameName			//Writes the name of the game
	ldr	r0, =20				//At the bottom lefthand corner
	ldr	r1, =742			//During game play
	ldr	r2, =0xFFFF
	bl	WriteWord

	ldr	r3, =Youssef			//Writes Youssefs name at the 
	ldr	r0, =150			//bottom left-hand corner
	ldr	r1, =742			//During game play
	ldr	r2, =0xFFFF
	bl	WriteWord

	ldr	r3, =Kendra			//Writes Kendras name in the buttom 
	ldr	r0, =345			//left-hand corner during game play
	ldr	r1, =742
	ldr	r2, =0xFFFF
	bl	WriteWord

//Timer------------------------------------------------------------------------------------
	bl		StartTimer		//Starts the timer for enemy motion
	bl		StartEShootTimer	//Starts the timer for enemy fire

	pop		{r3-r6, lr}	
	bx		lr



