.section .text

.global Move
Move:
	push	{r4, r5, r6, r7, r8, r9, lr}

CheckL:
	ldr	r5, =InputValue				//Gets input from SNES
	ldr	r8, [r5]				//Stores SNES input into r8
	ldr	r5, =0x0200				//Makes a bit mask for JoyLeft
	and	r8, r5					//AND SNES input with bitmask
	ldr	r5, =0x0000				//Loads 0 into r5
	cmp	r5, r8					//Compares AND of SNES bitmask with 0

	bne	CheckR					//Branches to check RightJoy


	ldr	r6, [r3, #12]				//Gets the colour of player
	ldr	r7, =0x0000				//Sets r7 to the colour black
	str	r7, [r3, #12]				//Makes player black
	bl	DrawPlayer				//Clears player from screen

	ldr	r1, [r3, #4]				//Gets the X-coor from player variables

	sub	r1, #1

	ldr	r9, =GreatestX
	ldr	r5, [r9]

	cmp	r1, #25
	bgt	allGoodLeft
	
	mov	r1, r5

allGoodLeft:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]

	
	bl	DrawPlayer

CheckR:	
	ldr	r5, =InputValue
	ldr	r8, [r5]
	ldr	r5, =0x0100
	and	r8, r5
	ldr	r5, =0x0000
	cmp	r5, r8

	cmp	r5, r8

	bne	noMotion


	ldr	r6, [r3, #12]
	ldr	r7, =0x0000
	str	r7, [r3, #12]
	bl	DrawPlayer

	ldr	r1, [r3, #4]

	add	r1, #1

	ldr	r9, =GreatestX
	ldr	r5, [r9]

	cmp	r1, r5
	blt	allGoodRight

	mov	r1, #25

allGoodRight:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]
	
	bl	DrawPlayer
	

noMotion:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr

.global KingMotion
	
KingMotion:
	push	{r4, r5, r6, r7, r8, r9, lr}	
	
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #12]

	ldr	r7, =0x0000

	str	r7, [r3, #12]
	
	bl	DrawKing

	ldr	r1, [r3, #4]
	add	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]
	sub	r5, r4

	cmp	r1, r5
	blt	KingGoodRight

	mov	r1, #25

KingGoodRight:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]
	
	bl	DrawKing
	
	pop	{r4, r5, r6, r7,r8, r9, lr}
	bx	lr

.global QueenMotion
QueenMotion:
	push	{r4, r5, r6, r7, r8, r9, lr}	
	
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #12]

	ldr	r7, =0x0000

	str	r7, [r3, #12]
	
	bl	DrawQueen

	ldr	r1, [r3, #4]
	add	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]
	sub	r5, r4

	cmp	r1, r5
	blt	QueenGoodRight

	mov	r1, #25

QueenGoodRight:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]
	
	
	bl	DrawQueen
	
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr

.global JackMotion
JackMotion:
	push	{r4, r5, r6, r7, lr}	
	
	ldr	r1, [r3, #4]		//jack x pos
	ldr	r4, [r3, #16]		//jack size
	ldr	r6, [r3, #12]		//jack colour

	ldr	r7, =0x0000		//black color
	
	str	r7, [r3, #12]		//redraw
	bl	DrawJack		//redraw

	ldr	r1, [r3, #4]
	add	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]
	sub	r5, r4

	cmp	r1, r5
	blt	JackGoodRight

	mov	r1, #25

JackGoodRight:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]
	
	bl	DrawJack
	
	pop	{r4, r5, r6, r7, lr}
	bx	lr

//-------------------------------------------
.global DKingMotion
	
DKingMotion:
	push	{r4, r5, r6, r7, r8, r9, lr}	
	
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #12]

	ldr	r7, =0x0000

	str	r7, [r3, #12]
	
	bl	DrawDKing

	ldr	r1, [r3, #4]
	sub	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]

	cmp	r1, #25
	bgt	KingGoodLeft
	
	mov	r1, r5

KingGoodLeft:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]
	
	bl	DrawDKing
	
	pop	{r4, r5, r6, r7,r8, r9, lr}
	bx	lr

.global DQueenMotion
DQueenMotion:
	push	{r4, r5, r6, r7, r8, r9, lr}	
	
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #12]

	ldr	r7, =0x0000

	str	r7, [r3, #12]
	
	bl	DrawDQueen

	ldr	r1, [r3, #4]
	sub	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]

	cmp	r1, #25
	bgt	QueenGoodLeft
	
	mov	r1, r5

QueenGoodLeft:	
	str	r1, [r3, #4]
	str	r6, [r3, #12]

	bl	DrawDQueen
	
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr

.global DJackMotion
DJackMotion:
	push	{r4, r5, r6, r7, lr}	
	
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #12]

	ldr	r7, =0x0000

	str	r7, [r3, #12]
	
	bl	DrawDJack

	ldr	r1, [r3, #4]
	sub	r1, r4

	ldr	r9, =GreatestX
	ldr	r5, [r9]

	cmp	r1, #25
	bgt	JackGoodLeft
	
	mov	r1, r5

JackGoodLeft:
	
	str	r1, [r3, #4]
	str	r6, [r3, #12]

	
	bl	DrawDJack
	
	pop	{r4, r5, r6, r7, lr}
	bx	lr


