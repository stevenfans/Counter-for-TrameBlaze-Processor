`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <ped.v>																//
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
module ped(clk, reset, level, tick);

	input wire clk, reset;
	input wire level;
	output wire tick;
	
	//signal declaration
	reg delay; 
	
	// delayt register
	always @ (posedge clk, posedge clk)
		if(reset) delay <= 1'b0;
		else 		 delay <= level;
	
	//decoding logic
	assign tick = ~delay & level;

endmodule
 