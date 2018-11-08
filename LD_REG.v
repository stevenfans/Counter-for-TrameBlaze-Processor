`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <LD_REG.v>															//
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
module LD_REG(clk, reset, load, D, Q);

input clk, reset, load;
input [15:0] D; 
output reg [15:0] Q; 

always @(posedge clk, posedge reset)
		if (reset) Q <= 16'b0; else
		if(load)	  Q <= D; 
		else 		  Q <= Q;

endmodule
