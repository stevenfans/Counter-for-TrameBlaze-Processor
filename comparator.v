`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <comparator.v>														//
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
//////////////////////////////////////////////////////////////////////////////////
module comparator(clk, reset, write_strobe, port_id, ld);

	// inputs
	input clk, reset, write_strobe; 
	input [15:0] port_id; 
	
	// outputs
	output ld; 
		 
	// load gets the compartor of port id and write strobe
	assign ld = ((port_id == 16'b0001) & write_strobe);

endmodule

