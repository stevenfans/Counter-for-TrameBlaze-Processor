`timescale 1ns / 1ps
//========================================================================
// 	File name: <ad_mux.v>      													//
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
module ad_mux(d0, d1, d2, d3, d4, d5, d6, d7, sel, y);
		
		//signal declarations
		input [3:0] d0, d1, d2, d3, d4, d5, d6, d7;
		input [2:0] sel;

		output reg [3:0] y;

		always @ *
			case(sel)
				3'b000: y = d0;
				3'b001: y = d1;
				3'b010: y = d2;
				3'b011: y = d3;
				3'b100: y = d4;
				3'b101: y = d5;
				3'b110: y = d6;
				3'b111: y = d7;
					default: y = d1;
			endcase 

endmodule
