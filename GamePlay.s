	.section .text
.global GamePlay
GamePlay:
	push		{r0-r9, lr}

GameLoop:
	bl		GameDelay

	ldr		r3, =PlayerVariables	//Gets the Address of PlayerVariables
	bl		GetInput		//Gets the input from the SNES controller
	bl		Pause			//Check if game is Pause
	bl		Shoot			//Shoots off new bullets
	bl		EShoot			//Enemy Shooting
	bl		BulletMotion		//Updates the location of "Alive" bullets
	bl		YouWin			//Check if Game is over
	ldr		r3, =PlayerVariables	//Gets the Address of PlayerVariables
	bl		Move			//Uses input to move main charater 
	bl		PrintScore		//Prints the current score on screen
	bl		CheckTimer		//Updates the location of the enemies

	b		GameLoop		//Loops while game is being played

	pop		{r0-r9, lr}
	bx		lr
