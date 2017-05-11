	.section .text

.global WriteWord
WriteWord:

	push	{r4-r9, lr}
	
	mov	r6, r1
	mov	r4, r3
	mov	r5, #0
	mov	r7, r2

WordLoop:
	ldrb	r3, [r4, r5]
	cmp	r3, #0x0
	beq	end

	mov	r1, r6

	bl	DrawChar
	add	r5, #1
	add	r0, #10
	mov	r2, r7
	b	WordLoop
end:
	pop	{r4-r9, lr}
	bx	lr

.global DrawContinue
DrawContinue:

	push		{r0, r1, r3, lr}
	ldr		r0, =450
	ldr		r1, =350
	ldr		r3, =ContinueWord
	bl		WriteWord
	pop		{r0, r1, r3, lr}
	bx		lr

.global DrawRestart
DrawRestart:
	push		{r0, r1, r3, lr}
	ldr		r0, =450
	ldr		r1, =400
	ldr		r3, =RestartWord
	bl		WriteWord
	pop		{r0, r1, r3, lr}
	bx		lr


.global DrawEnd
DrawEnd:
	push		{r0, r1, r3, lr}
	ldr		r0, =450
	ldr		r1, =450
	ldr		r3, =EndWord
	bl		WriteWord
	pop		{r0, r1, r3, lr}
	bx		lr

.global DrawPauseWord
DrawPauseWord:
	push		{r0, r1, r3, lr}
	ldr		r0, =440
	ldr		r1, =270
	ldr		r3, =PauseMenuWord
	bl		WriteWord
	pop		{r0, r1, r3, lr}
	bx		lr


