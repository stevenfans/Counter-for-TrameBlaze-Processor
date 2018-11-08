`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <CECS460top_testbench.v>											//
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

module CECS460_testbench;

	// Inputs
	reg reset;
	reg clk;
	reg button;
	reg switch;

	// Outputs
	wire [7:0] anode;
	wire [6:0] cathode;

	// Instantiate the Unit Under Test (UUT)
	CECS460_top uut (
		.reset(reset), 
		.clk(clk), 
		.button(button), 
		.switch(switch), 
		.anode(anode), 
		.cathode(cathode)
	);
	
always #5 clk = ~clk; 

// pushing button with delay
always #20000000 button = ~button;

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		button = 0;
		switch = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0; 
		button = 1;
	

	end
      
endmodule

