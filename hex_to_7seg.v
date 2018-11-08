`timescale 1ns / 1ps
//========================================================================
// 	File name: <hex_to_7seg.v> 													//
//																								//	
// 	Created by Steven Phan on 2/14/18											//
//		Copyright 2018 Steven Phan. All rights reserved.						//
//																								//
//																								//
//		In submitting this file for class work at CSULB							//	
//		I am confirming that this is my work and the work						//	
// 	of no one else. In subinmitting this code I acknowledge that		//
//		plagiarism in student project work is subject to dismissal 			//
// 	from the class.																	//
//========================================================================

module hex_to_7seg(state, hex_out);
  
	//signal  declaration 
	input  [3:0] state;
   output reg [6:0] hex_out;
	
	always @ (*)
		case ( state )     // hex
			4'b0000: {hex_out} = 7'b0000001; // 0
			4'b0001: {hex_out} = 7'b1001111; // 1
			4'b0010: {hex_out} = 7'b0010010; // 2
			4'b0011: {hex_out} = 7'b0000110; // 3
			4'b0100: {hex_out} = 7'b1001100; // 4
			4'b0101: {hex_out} = 7'b0100100; // 5
			4'b0110: {hex_out} = 7'b0100000; // 6
			4'b0111: {hex_out} = 7'b0001111; // 7
			4'b1000: {hex_out} = 7'b0000000; // 8
			4'b1001: {hex_out} = 7'b0000100; // 9
			4'b1010: {hex_out} = 7'b0001000; // A
			4'b1011: {hex_out} = 7'b1100000; // b
			4'b1100: {hex_out} = 7'b0110001; // C
			4'b1101: {hex_out} = 7'b1000010; // d
			4'b1110: {hex_out} = 7'b0110000; // E
			4'b1111: {hex_out} = 7'b0111000; // F
				default: {hex_out} = 7'b1111111; //default 
		endcase
endmodule 
