	.section .text
.global InitializeEnemies
InitializeEnemies:
	push	{r3-r6, lr}

//Bottom Screen Enemies------------------------------------------------------------------------

//--------------------------------------------King0Variables-----------------------------------
 	
	ldr		r3, =King0Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	mov		r4, #500
	str		r4, [r3, #4]		//X-Coor
	ldr		r4, =715
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9902
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #3
	str		r4, [r3, #24]		//Life
	ldr		r4, =70000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	
						
	bl		DrawKing		//Draws the above variable

//--------------------------------------Queen0Variables----------------------------------------

	ldr		r3, =Queen0Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	mov		r4, #300
	str		r4, [r3, #4]		//X-Coor
	ldr		r4, =715
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x99FF
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #3
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #2
	str		r4, [r3, #24]		//Life
	ldr		r4, =900000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawQueen		//Draws the above variable

//-------------Queen1Variables----------------------------------------

	ldr		r3, =Queen1Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	mov		r4, #700
	str		r4, [r3, #4]		//X-Coor
	ldr		r4, =715
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x99FF
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #3
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #2
	str		r4, [r3, #24]		//Life
	ldr		r4, =900000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	
	
bl		DrawQueen		//Draws the above variable


//--------------------------------------Jack0Variables----------------------------------------

	ldr		r3, =Jack0Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	mov		r4, #250
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =1000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawJack		//Draws the above variable

//-------------Jack1Variables----------------------------------------

	ldr		r3, =Jack1Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =350
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =2000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot
	
	bl		DrawJack		//Draws the above variable


//--------------------------------------Jack2Variables----------------------------------------

	ldr		r3, =Jack2Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =450
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =3000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawJack		//Draws the above variable

//--------------------------------------Jack3Variables----------------------------------------

	ldr		r3, =Jack3Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	ldr		r4, =550
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =4000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawJack		//Draws the above variable


//---------------Jack4Variables----------------------------------------
	ldr		r3, =Jack4Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =650
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =5000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawJack		//Draws the above variable

//--------------Jack5Variables----------------------------------------
	ldr		r3, =Jack5Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =750
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #640
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =6000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawJack		//Draws the above variable
	
//-------------------------------------------Top Screen Enemies---------------------------------
//----------------------------------------------------------------------------------------------

//--------------King1Variables----------------------------------------

 	ldr		r3, =King1Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	mov		r4, #500
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #75
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9902
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #4
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #3
	str		r4, [r3, #24]		//Life
	ldr		r4, =70000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDKing		//Draws the above variable

//--------------Queen2Variables----------------------------------------

	ldr		r3, =Queen2Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	mov		r4, #300
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #75
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x99FF
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #3
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #2
	str		r4, [r3, #24]		//Life
	ldr		r4, =900000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDQueen		//Draws the above variable

//--------------Queen3Variables----------------------------------------

	ldr		r3, =Queen3Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	mov		r4, #700
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #75
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x99FF
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #3
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #2
	str		r4, [r3, #24]		//Life
	ldr		r4, =900000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDQueen		//Draws the above variable

//--------------Jack6Variables----------------------------------------
	ldr		r3, =Jack6Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	mov		r4, #250
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =1000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable
	
//--------------Jack7Variables-------------------------------------
	ldr		r3, =Jack7Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	ldr		r4, =350
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =20000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable

//--------------Jack8Variables----------------------------------------

	ldr		r3, =Jack8Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	ldr		r4, =450
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =30000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable

//--------------Jack9Variables-------------------------------------

	ldr		r3, =Jack9Variables	//Gets the Address of the given variable
	
	str		r6, [r3]		//FrameBuffer
	ldr		r4, =550
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =40000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable

	bl		DrawDJack		//Draws the above variable


//--------------Jack10Variables-------------------------------------

	ldr		r3, =Jack10Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =650
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =5000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable


//--------------Jack11Variables-------------------------------------

	ldr		r3, =Jack11Variables	//Gets the Address of the given variable

	str		r6, [r3]		//FrameBuffer
	ldr		r4, =750
	str		r4, [r3, #4]		//X-Coor
	mov		r4, #150
	str		r4, [r3, #8]		//Y-Coor
	ldr		r4, =0x9988
	str		r4, [r3, #12]		//Colour
	mov		r4, #20
	str		r4, [r3, #16]		//SIZE
	mov		r4, #2
	str		r4, [r3, #20]		//Arm-length
	mov		r4, #1
	str		r4, [r3, #24]		//Life
	ldr		r4, =6000000
	str		r4, [r3, #28]		//Shoot Delay
	mov		r4, #0
	str		r4, [r3, #32]		//TimeToShoot	

	bl		DrawDJack		//Draws the above variable

	pop		{r3-r6, lr}
	bx		lr

