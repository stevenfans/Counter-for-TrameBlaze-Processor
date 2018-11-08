`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <AISO.v>																//
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
module AISO(clk, reset, reset_s );

	//signal declarations
	input wire clk, reset;
	output wire reset_s;
	
	reg [1:0] sync;
	
	assign reset_s = ~sync[0];
	
	// flop
	always @(posedge reset, posedge clk)
		if(reset) sync = 2'b0;
		else sync = {1'b1, sync[1]};

endmodule 
