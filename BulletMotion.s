.section .text

/*
 * This File is responsible for moving all the bullets, it will also make calls to
 * the collision checker to check if the bullets collided with any game objects
 * at any point in their motion
 *
 *
 */





.global BulletMotion
BulletMotion:

	push	{r1, r2, r3, r4, r5, r6, r7, lr}

//--------------------------------------------------------------------------------------------

MoveBullet0:
	ldr	r3, =Bullet0			//Gets the address of Bullet0
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet0
	cmp	r5, #0				//Checks to see if Bullet0 is in use
	beq	MoveBullet1			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet0
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet0 to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet0			//Bullet Address
	str	r6, [r3, #12]			//Sets the colour of Bullet0 back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet0 (Probs redundant)
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet0 (Pribs redundant)
	add	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate


	bl	BushCollideD			//Check for collisions
	ldr	r3, =Bullet0			//Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet0
	cmp	r5, #0				//Checks to see if Bullet0 is in use after collision check
	beq	MoveBullet1			//Branches over motion if there was collision

	bl	CheckCollideD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet0
	cmp	r5, #0				//Checks to see if Bullet0 is in use after collision check
	beq	MoveBullet1			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet0

	ldr	r3, =Bullet0			//Bullet Address
	ldr	r2, [r3, #8]			//Probs redun
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads Max Y-Value
	sub	r7, #30				//Subtracts 30 from max value (Boundary)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet1			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet0			//Bullet Address			
	ldr	r4, =0x0000			//Black Color
	str	r4, [r3, #12]			//Changes bullet color to black

	ldr	r1, [r3, #4]			//Bullet x coord
	ldr	r2, [r3, #8]			//Bullet y coord
	bl	DrawVLine			//Blacks out bullet

	mov	r6, #0				//Zero value into r6
	str	r6, [r3, #20]			//Changes bullet inUse? value to 0

//--------------------------------------------------------------------------------------------
MoveBullet1:
	ldr	r3, =Bullet1			//Gets the address of Bullet1
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet1
	cmp	r5, #0				//Checks to see if Bullet1 is in use
	beq	MoveBullet2			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet1
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet1
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet1
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet1 to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet1			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet1 back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet1 (Probs redundant)
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet1 (Pribs redundant)
	sub	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCollideU			//Check for collisions
	ldr	r3, =Bullet1			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet2			//Branches over motion if there was collision


	bl	CheckCollideU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet0 is in use after collision check
	beq	MoveBullet2			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet1			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//Bullet y coord
	mov	r7, #20				//Value for top of screen
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to Y coord of top boundary
	bgt	MoveBullet2			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet1			//Gets the address of Bullet1
	ldr	r4, =0x0000			//Black color in r4
	str	r4, [r3, #12]			//changes color of Bullet1 to black
	
	ldr	r1, [r3, #4]			//x coord of bullet
	ldr	r2, [r3, #8]			//y coord of bullet
	bl	DrawVLine			//blacks out bullet1

	mov	r6, #0				//0 into r6
	str	r6, [r3, #20]			//changes inUse? value of bullet to 0

//----------------------------------------------------------------------------------
MoveBullet2:
	ldr	r3, =Bullet2			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet3			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet2			//Probs super redundant
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE1				//Check for collisions
	ldr	r3, =Bullet2			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet3			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet3			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet2			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//y coord of bullet
	mov	r7, #20				//Value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to top boundary
	bgt	MoveBullet3			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet2			//Gets the address of Bullet
	ldr	r4, =0x0000			//Black color in r4
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//y coord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//changes inUse? value of bullet to 0

//----------------------------------------------------------------------------------
MoveBullet3:
	ldr	r3, =Bullet3			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet4			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet3			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE2				//Check for collisions
	ldr	r3, =Bullet3			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet0 is in use after collision check
	beq	MoveBullet4			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet4			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet3			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//y coord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to top boundary
	bgt	MoveBullet4			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet3			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet4:
	ldr	r3, =Bullet4			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet5			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet4			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE3				//Check for collisions
	ldr	r3, =Bullet4			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet5			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet5			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet4			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to top boundary
	bgt	MoveBullet5			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet4			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet5:
	ldr	r3, =Bullet5			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet6			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet5			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet0 back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE4				//Check for collisions
	ldr	r3, =Bullet5			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet6			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet6			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet5			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	bgt	MoveBullet6			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet5			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//zero in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet6:
	ldr	r3, =Bullet6			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet7			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet6			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE5				//Check for collisions
	ldr	r3, =Bullet6			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet7			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet7			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet6			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet0 to max Y value
	bgt	MoveBullet7			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet6			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet7:
	ldr	r3, =Bullet7			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet8			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet7			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE6				//Check for collisions
	ldr	r3, =Bullet7			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet8			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet8			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet7			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	bgt	MoveBullet8			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet7			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet8:
	ldr	r3, =Bullet8			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet9			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet8			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet0 back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE7				//Check for collisions
	ldr	r3, =Bullet8			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet9			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet9			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet8			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet0 to max Y value
	bgt	MoveBullet9			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet8			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet9:
	ldr	r3, =Bullet9			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet10			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet9			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE8				//Check for collisions
	ldr	r3, =Bullet9			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet10			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet10			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet9			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	bgt	MoveBullet10			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet9			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//0 in r6
	str	r6, [r3, #20]			//bullet no longer in use

//---------------------------------------------------------------------------
MoveBullet10:
	ldr	r3, =Bullet10			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet11			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet10			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	sub	r2, #1				//Add 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE9				//Check for collisions
	ldr	r3, =Bullet10			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet11			//Branches over motion if there was collision

	bl	CheckCollidePU			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet11			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet10			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	mov	r7, #20				//value for top boundary
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	bgt	MoveBullet11			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet10			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet
	
	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//--------------------------------------------------------------------------------
MoveBullet11:
	ldr	r3, =Bullet11			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet12			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet11			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE10			//Check for collisions
	ldr	r3, =Bullet11			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet12			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet12			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet11			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet12			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet11			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black
	
	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------
MoveBullet12:
	ldr	r3, =Bullet12			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet13			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet12			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE11			//Check for collisions
	ldr	r3, =Bullet12			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet13			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet13			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet12			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet13			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet12			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet13:
	ldr	r3, =Bullet13			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet14			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet13			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE12			//Check for collisions
	ldr	r3, =Bullet13			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet14			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet14			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet13			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet14			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet13			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet14:
	ldr	r3, =Bullet14			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet15			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet14			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE13			//Check for collisions
	ldr	r3, =Bullet14			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet15			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet15			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet14			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet15			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet14			//Gets the address of Bullet	
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//------------------------------------------------------------
MoveBullet15:
	ldr	r3, =Bullet15			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet16			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet15			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE14			//Check for collisions
	ldr	r3, =Bullet15			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet16			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet16			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet15			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet16			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet15			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//---------------------------------------------------------
MoveBullet16:
	ldr	r3, =Bullet16			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet17			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet16			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE15			//Check for collisions
	ldr	r3, =Bullet16			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet17			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet17			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet16			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet17			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet16			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet17:
	ldr	r3, =Bullet17			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet18			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet17			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE16			//Check for collisions
	ldr	r3, =Bullet17			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet18			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet18			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet17			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet18			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet17			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet18:
	ldr	r3, =Bullet18			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	MoveBullet19			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet18			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE17			//Check for collisions
	ldr	r3, =Bullet18			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet19			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	MoveBullet19			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet18			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	MoveBullet19			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet18			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black

	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use

//----------------------------------------------------------------------------------
MoveBullet19:
	ldr	r3, =Bullet19			//Gets the address of Bullet
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use
	beq	endBullet			//Branches over motion if it is not
	
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]			//Gets the Colour from Bullet
	
	ldr	r4, =0x0000			//Sets r4 as Black
	str	r4, [r3, #12]			//Changes the Colour of Bullet to Black

	bl	DrawVLine			//Draws black over existing bullet
	
	ldr	r3, =Bullet19			//Gets the address of Bullet
	str	r6, [r3, #12]			//Sets the colour of Bullet back to the original
	ldr	r1, [r3, #4]			//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]			//Gets the Y-coordinate from Bullet
	add	r2, #1				//sub 1 to the Y-coordinate 
	str	r2, [r3, #8]			//Update the value of the Y-coordinate

	bl	BushCE18			//Check for collisions
	ldr	r3, =Bullet19			//Load Bullet Address
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	endBullet			//Branches over motion if there was collision

	bl	CheckCollidePD			//Check for collisions
	ldr	r5, [r3, #20]			//Gets the inUse? value of Bullet
	cmp	r5, #0				//Checks to see if Bullet is in use after collision check
	beq	endBullet			//Branches over motion if there was collision

	bl	DrawVLine			//Draw new Bullet

	ldr	r3, =Bullet19			//Gets the address of Bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	ldr	r4, =GreatestY			//Gets the Address of the constant for the greatest Y-value
	ldr	r7, [r4]			//Loads said value into r7 (767)
	
	cmp	r2, r7				//Compares the Y-coor of Bullet to max Y value
	blt	endBullet			//Branches to endbullet if Y-coor is still in screen

	ldr	r3, =Bullet19			//Gets the address of Bullet
	ldr	r4, =0x0000			//sets r4 to black
	str	r4, [r3, #12]			//changes color of bullet to black
	
	ldr	r1, [r3, #4]			//xcoord of bullet
	ldr	r2, [r3, #8]			//ycoord of bullet
	bl	DrawVLine			//blacks out bullet

	mov	r6, #0				//r6 = 0
	str	r6, [r3, #20]			//bullet no longer in use


endBullet:					//End of Bullet motion

	pop	{r1, r2, r3, r4, r5, r6, r7, lr}
	bx	lr
