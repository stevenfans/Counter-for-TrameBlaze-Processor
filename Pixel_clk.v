`timescale 1ns / 1ps
//========================================================================
// 	File name: <Pixel_clk.v>	    												//
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
module Pixel_clk(clk_in, reset, tick) ;

	// signal delcartions
	input clk_in, reset ;
	output tick ;

	//FOR THE TICKER
	reg [9:0] count;
	reg [9:0] n_count;
	assign tick = count == 1000; //
	
	// STATE REGISTER
	// generates a 10ns tick
	always @ (posedge clk_in, posedge reset)
		if(reset) count <= 10'b0; //
		else 	  count <= n_count;
		
	always @(*)
		n_count = (tick) ? 10'b0: count + 10'b1;
	
endmodule
