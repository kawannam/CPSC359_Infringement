.section .text
.global CheckCollideP

CheckCollideP:


.global CheckCollidePU
//------------------------------Up Collisions--------------------------------
CheckCollidePU:

	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	
	ldr	r1, [r3, #4]		//x coord
	ldr	r2, [r3, #8]		//y coord
	ldr	r4, [r3, #16]		//bullet length	
	
	ldr	r5, =PlayerVariables	//Player address

	ldr	r6, [r5, #8]		//Player ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet
	bgt	NoColliU
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet
	blt	NoColliU		//no collision

	ldr	r6, [r5, #4]		//Player xcoord
	sub	r6, #20			//leftmost point of Player
	cmp	r6, r1			//compare xcoord of bullet and Player
	bgt	NoColliU		//No Collision
	add	r6, #50			//rightmost point of Player
	cmp	r6, r1			//compare xcoord of bullet and Player
	blt	NoColliU		//No Collision

	ldr	r6, [r5, #24]		//Player Life variable
	sub	r6, #10			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	ble	YouDead




	mov	r6, #0			//new value for bullet inuse
	str	r6, [r3, #20]		//update bullet inuse

//Black out Bullet
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet back to the original

NoColliU:
	pop	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	bx	lr

//--------------------------Down Collisions-------------------------------------------
.global CheckCollidePD
CheckCollidePD:

	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	
	ldr	r1, [r3, #4]		//x coord
	ldr	r2, [r3, #8]		//y coord
	ldr	r4, [r3, #16]		//bullet length	
	
	ldr	r5, =PlayerVariables	//Player address

	ldr	r6, [r5, #8]		//Player ycoord bottom
	add	r6, #20			//top of Player
	cmp	r6, r2			//compare ycoord of bullet
	blt	NoColliD
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet
	bgt	NoColliD		//no collision

	ldr	r6, [r5, #4]		//Player xcoord
	sub	r6, #20			//leftmost point of Player
	cmp	r6, r1			//compare xcoord of bullet and Player
	bgt	NoColliD		//No Collision
	add	r6, #50			//rightmost point of Player
	cmp	r6, r1			//compare xcoord of bullet and Player
	blt	NoColliD		//No Collision

	ldr	r6, [r5, #24]		//Player Life variable
	sub	r6, #10			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	ble	YouDead

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r3, #20]		//update bullet inuse

//Black out Bullet
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet back to the original

NoColliD:
	pop	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	bx	lr
