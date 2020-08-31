// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// (LOOP)
// @i = 16384
// if (@KBD > 0) {
//     goto BLACK
// } else {
//     goto WHITE
// }
//
// (WHITE)
// @color = 0
// goto PAINT
//
// (BLACK)
// @color = -1
// goto PAINT
//
// (PAINT)
// while (@i < 24575) {
//     RAM[@i] = @color
//     @i = @i + 1        
// }
// goto @LOOP

(LOOP)
	@8192
	D=A
	@i
	M=D // @i = 16384

	@KBD
	D=M

	@BLACK
	D;JGT

	@WHITE
	D;JEQ

(WHITE)
	@color
	M=0   // Set to white
	@PAINT
	0;JMP // goto @PAINT

(BLACK)
	@color
	M=-1  // set to black
	@PAINT
	0;JMP // goto @PAINT

(PAINT)
	@color
	D=M
	@i
	A=M
	M=D   // RAM[@i] = @color

	@i
	D=M
	D=D+1
	@i
	M=D   // @i = @i + 1

	D=M
	@24575
	D=A-D
	@LOOP
	D;JLT // if (@i < 24575); goto @LOOP

	@PAINT
	0;JMP // goto @PAINT
