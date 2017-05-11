.section .text

/*
 * This file checks for collisions with the bush objects
 *
 */

//----------------------------------------------------------------------------------
.global BushCollideU
BushCollideU:

	push	{r0, r1, lr}
	
	ldr	r0, =Bullet1		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet1		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet1		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision


	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global BushCollideD
BushCollideD:

	push	{r0, r1, lr}
	
	ldr	r0, =Bullet0		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet0		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet0		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision


	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE1
BushCE1:

	push	{r0, r1, lr}

	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet2		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE2
BushCE2:

	push	{r0, r1, lr}

	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet3		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE3
BushCE3:

	push	{r0, r1, lr}

	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet4		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE4
BushCE4:

	push	{r0, r1, lr}

	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet5		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE5
BushCE5:

	push	{r0, r1, lr}

	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet6		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE6
BushCE6:

	push	{r0, r1, lr}

	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet7		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE7
BushCE7:

	push	{r0, r1, lr}

	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet8		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE8
BushCE8:

	push	{r0, r1, lr}

	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet9		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE9
BushCE9:

	push	{r0, r1, lr}

	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideU		//Check for collision
	
	ldr	r0, =Bullet10		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideU		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE10
BushCE10:

	push	{r0, r1, lr}

	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet11		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE11
BushCE11:

	push	{r0, r1, lr}

	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet12		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE12
BushCE12:

	push	{r0, r1, lr}

	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet13		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE13
BushCE13:

	push	{r0, r1, lr}

	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet14		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE14
BushCE14:

	push	{r0, r1, lr}

	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet15		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE15
BushCE15:

	push	{r0, r1, lr}

	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet16		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE16
BushCE16:

	push	{r0, r1, lr}

	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet17		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE17
BushCE17:

	push	{r0, r1, lr}

	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet18		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------
.global	BushCE18
BushCE18:

	push	{r0, r1, lr}

	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush4		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush5		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush6		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush1		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush2		//Loads Bush Address
	bl	SingleCollideD		//Check for collision
	
	ldr	r0, =Bullet19		//Loads Bullet Address
	ldr	r1, =Bush3		//Loads Bush Address
	bl	SingleCollideD		//Check for collision

	pop	{r0, r1, lr}
	bx	lr

//----------------------------------------------------------------------------------

SingleCollideD:
	push	{r2, r3, r4, r5, r6, r7, r8, r9, lr}
								//r0- Bullet Address
								//r1- Bush Address
								
								//r5- X Bullet
								//r2- Y Bullet
								//r4- Bullet Length
								
								//r9- Bush Size
								//r6- Y Bush
								//r7- Bush Colour	
			
//------------------Check bullet Y---------------------------	

	ldr	r2, [r0, #8]		//y coord
	ldr	r4, [r0, #16]		//bullet length	

	ldr	r9, [r1, #16]		//Bush Size
	ldr	r6, [r1, #8]		//Bush ycoord bottom
	
	cmp	r6, r2			//compare ycoord of bullet
	bgt	NoBCol			//no collision

	add	r6, r9
	cmp	r6, r2			//compare ycoord of bullet
	blt	NoBCol			//no collision


//-------------------Check bullet X-----------------------------

	ldr	r6, [r1, #4]		//Bush xcoord

	ldr	r5, [r0, #4]		//x coord

	cmp	r6, r5			//compare xcoord of bullet and Player
	bgt	NoBCol			//No Collision

	add	r6, r9, lsl #2		//rightmost point of Player
	add	r6, r9			//rightmost point of Player
	cmp	r6, r5			//compare xcoord of bullet and Player
	blt	NoBCol			//No Collision

//---------------------Check if Bush is Dead-------------------------------------

	ldr	r6, [r1, #20]		//r6 = bush life
	cmp	r6, #0			//checks if bush life = 0
	ble	NoBCol			//branch to no collision if bush dead
	
 //---------------------There has been a Collision-----------------------

	ldr	r7, [r1, #12]		//Bush green color
	ldr	r6, =0x0000		//Black color
	str	r6, [r1, #12]		//store black in bush color

	mov	r3, r1			//Bush address
	bl	DrawBush		//black out bush
CheckThis:
	ldr	r6, [r1, #20]		//Bush size variable
	sub	r6, #1			//Decrement size
	str	r6, [r1, #20]		//store black in bush color

	str	r7, [r1, #12]		//Store bush color

	mov	r3, r1			//bush adress
	bl	DrawBush		//redraw bush

	mov	r6, r7			//Bush color

//--------------------Kill Bullet------------------------------------------

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inUse

	ldr	r1, [r0, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r0, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r3, =0x0000		//Sets r4 as Black
	str	r3, [r0, #12]		//Changes the Colour of Bullet0 to Black

	bl	DrawVLine		//Draws black over existing bullet


NoBCol:
	pop	{r2, r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr

//-------------------------------------------------------------------------

SingleCollideU:
	push	{r2, r3, r4, r5, r6, r7, r8, r9, lr}
								//r0- Bullet Address
								//r1- Bush Address
								
								//r5- X Bullet
								//r2- Y Bullet
								//r4- Bullet Length
								
								//r9- Bush Size
								//r6- Y Bush
								//r7- Bush Colour				
//------------------Check bullet Y---------------------------	
	ldr	r2, [r0, #8]		//y coord
	ldr	r4, [r0, #16]		//bullet length	

	ldr	r9, [r1, #16]		//Bush Size
	ldr	r6, [r1, #8]		//Bush ycoord bottom
	
	cmp	r6, r2			//compare ycoord of bullet
	blt	NoBColD			//No collision

	sub	r6, r9
	cmp	r6, r2			//compare ycoord of bullet
	bgt	NoBColD			//no collision


//-------------------Check bullet X-----------------------------
	ldr	r6, [r1, #4]		//Bush xcoord

	ldr	r5, [r0, #4]		//x coord

	cmp	r6, r5			//compare xcoord of bullet and Player
	bgt	NoBColD			//No Collision

	add	r6, r9, lsl #2		//rightmost point of Player
	add	r6, r9			//rightmost point of Player
	cmp	r6, r5			//compare xcoord of bullet and Player
	blt	NoBColD			//No Collision
//---------------------Bush is Dead-------------------------------------

	ldr	r6, [r1, #20]		//r6 = bush life
	cmp	r6, #0			//checks if bush is dead
	ble	NoBColD			//branch to no collision if bush is dead
	
 //---------------------There has been a Collision-----------------------

	ldr	r7, [r1, #12]		//Bush green color
	ldr	r6, =0x0000		//Black color
	str	r6, [r1, #12]		//store black in bush color

	mov	r3, r1			//bush address
	bl	DrawBush		//redraw bush

	ldr	r6, [r1, #20]		//Bush size variable
	sub	r6, #1			//Decrement size
	str	r6, [r1, #20]		//store black in bush color

	str	r7, [r1, #12]		//Store bush color

//	mov	r3, r1			//bush adress
	bl	DrawBush		//redraw bush

//--------------------Kill Bullet------------------------------------------
	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

	ldr	r1, [r0, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r0, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r3, =0x0000		//Sets r4 as Black
	str	r3, [r0, #12]		//Changes the Colour of Bullet0 to Black

	bl	DrawVLine		//Draws black over existing bullet


NoBColD:
	pop	{r2, r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr




