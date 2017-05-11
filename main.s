.section    .init
.globl     _start

_start:
    b       main
    
.section .text

main:
    mov     sp, #0x8000
	
	bl		EnableJTAG

	bl		InitFrameBuffer		//Init Frame Buffer

	cmp		r0, #0			//branch to the halt loop if there was an error initializing the framebuffer
	beq		haltLoop$

	ldr		r1, =FrameBufferThing	//FrameBuffer address
	str		r0, [r1]		//Store address in r0

	bl		StartMenu		//Branch to start menu

	bl		Initialize		//Draws all the characters
						//Initializes their frame buffers
						//Starts the movement timer for enemies
	bl		GamePlay		//Game loop


.global haltLoop$
haltLoop$:
	b		haltLoop$


.section .data

//--------------------------------MAIN CHARACTER VARIABLES---------------------------------
.global PlayerVariables
PlayerVariables:
	.int 0, 500, 390, 0x6677, 30, 2, 100		//Frambuffer, X, Y, Colour, SIZE, Arm-length, life

//--------------------------------BOTTON SCREEN ENEMIES------------------------------------
.global King0Variables
King0Variables:
	.int 0, 500, 715, 0x9902, 20, 4, 3, 70000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Queen0Variables
Queen0Variables:
	.int 0, 300, 715, 0x99FF, 20, 3, 2, 900000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Queen1Variables
Queen1Variables:
	.int 0, 700, 715, 0x99FF, 20, 3, 2, 900000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack0Variables
Jack0Variables:
	.int 0, 250, 640, 0x9988, 20, 2, 1, 1000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack1Variables
Jack1Variables:
	.int 0, 350, 640, 0x9988, 20, 2, 1, 2000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack2Variables
Jack2Variables:
	.int 0, 450, 640, 0x9988, 20, 2, 1, 3000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack3Variables
Jack3Variables:
	.int 0, 550, 640, 0x9988, 20, 2, 1, 4000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack4Variables
Jack4Variables:
	.int 0, 650, 640, 0x9988, 20, 2, 1, 5000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack5Variables
Jack5Variables:
	.int 0, 750, 640, 0x9988, 20, 2, 1, 6000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot

//----------------------------------TOP SCREEN ENEMIES---------------------------------------
.global King1Variables
King1Variables:
	.int 0, 500, 75, 0x9902, 20, 4, 3, 70000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Queen2Variables
Queen2Variables:
	.int 0, 300, 75, 0x99FF, 20, 3, 2, 900000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Queen3Variables
Queen3Variables:
	.int 0, 700, 75, 0x99FF, 20, 3, 2, 900000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack6Variables
Jack6Variables:
	.int 0, 250, 150, 0x9988, 20, 2, 1, 10000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack7Variables
Jack7Variables:
	.int 0, 350, 150, 0x9988, 20, 2, 1, 20000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack8Variables
Jack8Variables:
	.int 0, 450, 150, 0x9988, 20, 2, 1, 30000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack9Variables
Jack9Variables:
	.int 0, 550, 150, 0x9988, 20, 2, 1, 40000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack10Variables
Jack10Variables:
	.int 0, 650, 150, 0x9988, 20, 2, 1, 50000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot
.global Jack11Variables
Jack11Variables:
	.int 0, 750, 150, 0x9988, 20, 2, 1, 60000000, 0	//Frambuffer, X, Y, Colour, SIZE, Arm-length, life, ShootDelay, TimeToShoot

//----------------------------------BREAKABLE OBJECTS------------------------------------
.global Bush1
Bush1:
	.int 0, 100, 350, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life
.global Bush2
Bush2:
	.int 0, 500, 350, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life
.global Bush3
Bush3:
	.int 0, 900, 350, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life
.global Bush4
Bush4:
	.int 0, 100, 450, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life
.global Bush5
Bush5:
	.int 0, 500, 450, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life
.global Bush6
Bush6:
	.int 0, 900, 450, 0x6644, 20, 4		//Framebuffer, X, Y, Colour, SIZE, life


//-------------------------------------PLAYER BULLETS-------------------------------------------
.global Bullet0
Bullet0:					//For PLAYER's DOWN SHOT
	.int 0, 20, 20, 0x0000, 30, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet1
Bullet1:					//For PLAYER's UP SHOT 
	.int 0, 20, 20, 0x0000, 30, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?

//-------------------------------------DENEMY BULLETS-------------------------------------------
.global Bullet2
Bullet2:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet3
Bullet3:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet4
Bullet4:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet5
Bullet5:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet6
Bullet6:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet7
Bullet7:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet8
Bullet8:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet9
Bullet9:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet10
Bullet10:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?

//-------------------------------------UENEMY BULLETS-------------------------------------------
.global Bullet11
Bullet11:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet12
Bullet12:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet13
Bullet13:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet14
Bullet14:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet15
Bullet15:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet16
Bullet16:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet17
Bullet17:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet18
Bullet18:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?
.global Bullet19
Bullet19:
	.int 0, 20, 20, 0x0001, 20, 0		//Framebuffer, X, Y, Colour, SIZE, inUse?




//----------------------------------GLOBAL VARIABLES---------------------------------

.global InputValue
InputValue:
	.word 0xFFFF				//Snes controller input
.global TimeToMove
TimeToMove:
	.int 0					//Save when the next time for the enemies to move is
.global	MenuSelection				
MenuSelection:					//Saves what the user will select if they hit A in their current location
	.int 0

//----------------------------------CONSTANTS----------------------------------------
.global BigBlackBox
BigBlackBox:
	.int 0, 15, 15, 0x0000, 742		//Nothing, X, Y, SIZE

.global LittleBlackBox
LittleBlackBox:
	.int 0, 892, 744, 0x0000, 20		//Nothing, X, Y, SIZE
.global LittleBlackBox1
LittleBlackBox1:
	.int 0, 912, 744, 0x0000, 20		//Nothing, X, Y, SIZE


.global MenuBox
MenuBox:
	.int 0, 350, 250, 0x7774, 300		//Nothing, X, Y, SIZE
.global OuterMenuBox
OuterMenuBox:
	.int 0, 340, 240, 0x3333, 320		//Nothing, X, Y, SIZE
.global TimeDelay
TimeDelay:
	.int 200000				//The time between when the enemies move

.global GreatestX
GreatestX:
	.int 1000				//The left-most point on the screen
.global GreatestY
GreatestY:
	.int 728				//The bottom-most point on the screen
.global GameDelayTime
GameDelayTime:
	.int 2500
.global FrameBufferThing
FrameBufferThing:
	.int 0

//--------------------------------Words-----------------------------------------------
.global StartWord
StartWord:
	.asciz "Welcome To:"			//For the Start screen

.global ContinueWord
ContinueWord:
	.asciz "Continue"			//For the pause screen
.global RestartWord
RestartWord:
	.asciz "Restart"			//For the pause screen
.global EndWord
EndWord:
	.asciz "End Game"			//For the pause screen
.global PauseMenuWord
PauseMenuWord:
	.asciz "Pause Menu"			//For the pause menu
.global EndMessage
EndMessage:
	.asciz "You have failed your people"	//For the Loss screen
.global TryAgainMessage
TryAgainMessage:
	.asciz "Do you dare try again?"		//For the end of the game
.global WinMessage
WinMessage:
	.asciz "You have saved us all"		//For the win screen
.global ScoreWord
ScoreWord:
	.asciz "Score: "			//For Game screen
.global Youssef
Youssef:
	.asciz "By: Youssef Ibrahim"		//For start screen and game screen
.global Kendra
Kendra:
	.asciz "& Kendra Wannamaker"		//For start screen and game screen
.global GameName
GameName:
	.asciz "Infringement"			//For start screen and game screen






