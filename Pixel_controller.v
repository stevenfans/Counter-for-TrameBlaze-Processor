`timescale 1ns / 1ps
//========================================================================
// 	File name: <Pixel_controller.v>												//
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
module Pixel_controller(clk, reset, anodes, select, tick);
	
	// signal declarations
	input 		 	  clk, reset, tick;
	output reg [7:0] anodes;
	output reg [2:0] select;
	
	reg[2:0] p_s, n_s;
	
	// present state combo
	always @ (p_s)
		case (p_s)
			3'b000: n_s = 3'b001;
			3'b001: n_s = 3'b010;
			3'b010: n_s = 3'b011;
			3'b011: n_s = 3'b100;
			3'b100: n_s = 3'b101;
			3'b101: n_s = 3'b110;
			3'b110: n_s = 3'b111;
			3'b111: n_s = 3'b000;
		endcase
	
	// state register
	always @ (posedge clk or posedge reset)
		if (reset == 1)
			p_s = 3'b000;
		else 
				if (tick) p_s = n_s;
					else p_s = p_s;
			
	// next state register for the lights
	always @ (p_s)
		case (p_s)
			3'b000:  {anodes, select} = 11'b11111110_000;
			3'b001:  {anodes, select} = 11'b11111101_001;
			3'b010:  {anodes, select} = 11'b11111011_010;
			3'b011:  {anodes, select} = 11'b11110111_011;
			3'b100:  {anodes, select} = 11'b11101111_100;
			3'b101:  {anodes, select} = 11'b11011111_101;
			3'b110:  {anodes, select} = 11'b10111111_110;
			3'b111:  {anodes, select} = 11'b01111111_111;
			default:	{anodes, select} = 11'b11111111_000;
		endcase
endmodule 