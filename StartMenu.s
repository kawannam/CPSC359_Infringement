	.section .text
.global StartMenu
StartMenu:
	push	{r0-r9, lr}


	bl	DrawMenu		//Draws Background Box for the menu

//-----------------Draws the Welcome Message-----------------------------------

	ldr	r3, =StartWord		//Loads the StartWords address
	ldr	r0, =455		//Sets the X-coor for the StartWords
	ldr	r1, =350		//Sets the Y-coor for the StartWords
	ldr	r2, =0x00FF		//Sets the Colour for StartWords
	bl	WriteWord		//Calls the function that draws the characters

	ldr	r3, =GameName		//Loads the GameName address
	ldr	r0, =445		//Sets the X-coor for the GameName
	ldr	r1, =370		//Sets the Y-coor for the GameName
	ldr	r2, =0x00FF		//Sets the Colour for GameName
	bl	WriteWord		//Calls the function that draws the characters

	ldr	r3, =Youssef		//Loads the Youssef address
	ldr	r0, =410		//Sets the X-coor for the Youssef
	ldr	r1, =420		//Sets the Y-coor for the Youssef
	ldr	r2, =0x00FF		//Sets the Colour for Youssef
	bl	WriteWord		//Calls the function that draws the characters

	ldr	r3, =Kendra		//Loads the Kendra address
	ldr	r0, =410		//Sets the X-coor for the Kendra
	ldr	r1, =440		//Sets the Y-coor for the Kendra
	ldr	r2, =0x00FF		//Sets the Colour for Kendra
	bl	WriteWord		//Calls the function that draws the characters


//---------------Waits for the user to click Any Button to start Game---------------

AnyButton:

	ldr	r6, =0xFFFF			//Sets the value for no input into r6
notPressed:
	bl	GetInput			//Calls the function that checks user input
	ldr	r4, =InputValue			//Gets the input address
	ldr	r5, [r4]			//Gets the User input
	cmp	r5, r6				//Compares user input with No input
	beq	notPressed			//Loops until they are not equal

	bl	releaseButtons			//Branches to a function that waits until the pressed button has been realeased 

	bl	ClearScreen			//Blacks out the screen
	bl	Initialize			//Draws all objects in their starting postions and states
	b	GamePlay			//Starts the game loop


noPause: 
	pop	{r0-r9, lr}
	bx	lr











