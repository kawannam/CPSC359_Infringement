	.section .text
.global InitializeBullets
InitializeBullets:

	push	{r3-r6, lr}
	
	mov	r6, r0

//Player Bullets----------------------------------------------------------------------------------
	ldr		r3, =Bullet0		//Gets the Address of the given variable
	str		r6, [r3]		//Sets the frame buffer for the above variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #30			//Stores bullet length into r5
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 30
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet1		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #30			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 30
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

//Enemy Bullets----------------------------------------------------------------------------------
	ldr		r3, =Bullet2		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet3		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet4		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet5		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet6		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet7		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet8		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet9		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet10		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet11		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet12		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet13		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet14		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet15		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet16		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet17		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)

	ldr		r3, =Bullet18		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	ldr		r3, =Bullet19		//Gets the Address of the given variable
	mov		r4, #0			//Stores 0 into R4
	mov		r5, #20			//Stores bullet length into r5
	str		r6, [r3]		//Sets the frame buffer for the above variable
	str		r4, [r3, #4]		//Bullet X-coor = 0
	str		r4, [r3, #8]		//Bullet Y-coor = 0
	str		r4, [r3, #12]		//Bullet Colour = Black
	str		r5, [r3, #16]		//Bullet size = 20
	str		r4, [r3, #20]		//Bullet life flag = 0 (DEAD)


	pop		{r3-r6, lr}
	bx		lr

