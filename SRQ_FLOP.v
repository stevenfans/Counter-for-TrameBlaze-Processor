`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <SRQ_FLOP.v>															//
//																								//	
// 	Created by Steven Phan on 9/18/18											//
//		Copyright 2018 Steven Phan. All rights reserved.						//
//																								//
//																								//
//		In submitting this file for class work at CSULB							//	
//		I am confirming that this is my work and the work						//	
// 	of no one else. In subinmitting this code I acknowledge that		//
//		plagiarism in student project work is subject to dismissal 			//
// 	from the class.																	//
//////////////////////////////////////////////////////////////////////////////////
module SRQ_FLOP(clk, reset,S, R, Q);

// inputs
input clk, reset, S, R; 

// outputs
output reg Q; 

// loadable register 
// when S is 1, Q gets 1
// When R is 1, Q gets 0
// otherwise Q gets Q

always @ (posedge clk, posedge reset)
	if(reset) Q <= 1'b0; else
	if (S)  	 Q <= 1'b1; else
	if (R)	 Q <= 1'b0; else
				 Q <= Q; 

endmodule
