.section .text
.global CheckCollide

CheckCollide:

.global CheckCollideD

CheckCollideD:

	push	{r0-r9, lr}
	ldr	r0, =Bullet0		//address of bullet0
	
	ldr	r1, [r0, #4]		//x coord
	ldr	r2, [r0, #8]		//y coord
	ldr	r4, [r0, #16]		//bullet length	
	add	r2, r4			//bottom of bullet

//check Collisions with Jack0
	ldr	r5, =Jack0Variables	//Jack0 address

	ldr	r6, [r5, #8]		//Jack0 ycoord bottom
	add	r6, #20			//top of Jack0
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack1
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack1			//no collision
	

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack1			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack1			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack0Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack1
CJack1:
	ldr	r5, =Jack1Variables	//Jack1 address

	ldr	r6, [r5, #8]		//Jack1 ycoord bottom
	add	r6, #20			//top of Jack1
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack2
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack2			//no collision
	

	ldr	r6, [r5, #4]		//Jack1 xcoord
	sub	r6, #10			//leftmost point of Jack1
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	bgt	CJack2			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	blt	CJack2			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack1 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack1Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr


//check with Jack2
CJack2:
	ldr	r5, =Jack2Variables	//Jack1 address

	ldr	r6, [r5, #8]		//Jack1 ycoord bottom
	add	r6, #20			//top of Jack1
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack3
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack3			//no collision
	

	ldr	r6, [r5, #4]		//Jack1 xcoord
	sub	r6, #10			//leftmost point of Jack1
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	bgt	CJack3			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	blt	CJack3			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack1 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack2Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack3
CJack3:
	ldr	r5, =Jack3Variables	//Jack1 address

	ldr	r6, [r5, #8]		//Jack1 ycoord bottom
	add	r6, #20			//top of Jack1
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack4
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack4			//no collision
	

	ldr	r6, [r5, #4]		//Jack1 xcoord
	sub	r6, #10			//leftmost point of Jack1
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	bgt	CJack4			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	blt	CJack4			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack1 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack3Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack4
CJack4:
	ldr	r5, =Jack4Variables	//Jack1 address

	ldr	r6, [r5, #8]		//Jack1 ycoord bottom
	add	r6, #20			//top of Jack1
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack5
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack5			//no collision
	

	ldr	r6, [r5, #4]		//Jack1 xcoord
	sub	r6, #10			//leftmost point of Jack1
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	bgt	CJack5			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	blt	CJack5			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack1 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack4Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack5
CJack5:
	ldr	r5, =Jack5Variables	//Jack1 address

	ldr	r6, [r5, #8]		//Jack1 ycoord bottom
	add	r6, #20			//top of Jack1
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CQueen0
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CQueen0			//no collision
	

	ldr	r6, [r5, #4]		//Jack1 xcoord
	sub	r6, #10			//leftmost point of Jack1
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	bgt	CQueen0			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack1
	blt	CQueen0			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack1 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack5Variables	//Blacks out Jack
	bl	DrawJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check Collisions with Queen0
CQueen0:
	ldr	r5, =Queen0Variables	//Jack0 address

	ldr	r6, [r5, #8]		//Jack0 ycoord bottom
	add	r6, #20			//top of Jack0
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CQueen1
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CQueen1			//no collision
	

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CQueen1			//No Collision
	add	r6, #80			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CQueen1			//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadQ

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #10			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Queen0Variables	//Blacks out Jack
	bl	DrawQueen		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard


NotDeadQ:
	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check Collisions with Queen1
CQueen1:
	ldr	r5, =Queen1Variables	//Jack0 address

	ldr	r6, [r5, #8]		//Jack0 ycoord bottom
	add	r6, #20			//top of Jack0
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CKing0
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CKing0			//no collision
	

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CKing0			//No Collision
	add	r6, #80			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CKing0			//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadQ1

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #10			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Queen1Variables	//Blacks out Jack
	bl	DrawQueen		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

NotDeadQ1:

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check Collisions with King0
CKing0:
	ldr	r5, =King0Variables	//Jack0 address

	ldr	r6, [r5, #8]		//Jack0 ycoord bottom
	add	r6, #20			//top of Jack0
	cmp	r6, r2			//compare ycoord of bullet0
	blt	NoCollide
	sub	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	NoCollide			//no collision
	

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	NoCollide		//No Collision
	add	r6, #80			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	NoCollide		//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadK0

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #10			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =King0Variables	//Blacks out Jack
	bl	DrawKing		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

NotDeadK0:

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet0		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

.global CheckCollideU

CheckCollideU:

	push	{r0-r9, lr}
	ldr	r0, =Bullet1		//address of bullet1
	
	ldr	r1, [r0, #4]		//x coord
	ldr	r2, [r0, #8]		//y coord
	ldr	r4, [r0, #16]		//bullet length	
	

//check with Jack6
	ldr	r5, =Jack6Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack7
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack7			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack7			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack7			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack6Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack7
CJack7:
	ldr	r5, =Jack7Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack8
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack8			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack8			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack8			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack7Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack8
CJack8:
	ldr	r5, =Jack8Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack9
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack9			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack9			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack9			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack8Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack9
CJack9:
	ldr	r5, =Jack9Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack10
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack10			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack10			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack10			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack9Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack10
CJack10:
	ldr	r5, =Jack10Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CJack11
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CJack11			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CJack11			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CJack11			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack10Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Jack11
CJack11:
	ldr	r5, =Jack11Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CQueen2
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CQueen2			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CQueen2			//No Collision
	add	r6, #40			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CQueen2			//No Collision

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #5			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, [r5, #24]		//Jack0 Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Jack11Variables	//Blacks out Jack
	bl	DrawDJack		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Queen2
CQueen2:
	ldr	r5, =Queen2Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CQueen3
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CQueen3			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CQueen3			//No Collision
	add	r6, #80			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CQueen3			//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadQ2

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #10			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Queen2Variables	//Blacks out Jack
	bl	DrawDQueen		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

NotDeadQ2:

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with Queen3
CQueen3:
	ldr	r5, =Queen3Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	CKing1
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	CKing1			//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	CKing1			//No Collision
	add	r6, #80			//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	CKing1			//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadQ3

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #10			//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =Queen3Variables	//Blacks out Jack
	bl	DrawDQueen		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

NotDeadQ3:

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

//check with King1
CKing1:
	ldr	r5, =King1Variables	//Jack6 address

	ldr	r6, [r5, #8]		//Jack6 ycoord bottom
	cmp	r6, r2			//compare ycoord of bullet0
	bgt	NoCollide
	add	r6, #20
	cmp	r6, r2			//compare ycoord of bullet0
	blt	NoCollide		//no collision

	ldr	r6, [r5, #4]		//Jack0 xcoord
	sub	r6, #10			//leftmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	bgt	NoCollide		//No Collision
	add	r6, #120		//rightmost point of Jack0
	cmp	r6, r1			//compare xcoord of bullet0 and jack0
	blt	NoCollide		//No Collision

	ldr	r6, [r5, #24]		//Life variable
	sub	r6, #1			//Decrement life
	str	r6, [r5, #24]		//Store new life value
	cmp	r6, #0
	bne	NotDeadK1

	ldr	r6, =PlayerVariables
	ldr	r9, [r6, #24]		//Player Score
	add	r9, #100		//Increment Score
	str	r9, [r6, #24]		//Store new Score

	ldr	r6, =0x0000		//Black Color
	str	r6, [r5, #12]		//Stores Black in Jack
	ldr	r3, =King1Variables	//Blacks out Jack
	bl	DrawDKing		//Dead
	mov	r6, #0			//Graveyard pos
	str	r6, [r5, #4]		//x coord to graveyard
	str	r6, [r5, #8]		//y coord to graveyard

NotDeadK1:

	mov	r6, #0			//new value for bullet inuse
	str	r6, [r0, #20]		//update bullet inuse

//Black out Bullet
	ldr	r3, =Bullet1		//Probs super redundant
	ldr	r1, [r3, #4]		//Gets the X-coordinate from Bullet0
	ldr	r2, [r3, #8]		//Gets the Y-coordinate from Bullet0
	ldr	r6, [r3, #12]		//Gets the Colour from Bullet0
	ldr	r4, =0x0000		//Sets r4 as Black
	str	r4, [r3, #12]		//Changes the Colour of Bullet0 to Black
	bl	DrawVLine		//Draws black over existing bullet
	str	r6, [r3, #12]		//Sets the colour of Bullet0 back to the original

	pop	{r0-r9, lr}
	bx	lr

NoCollide:
	pop	{r0-r9, lr}
	bx	lr
	
