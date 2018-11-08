`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:20:46 09/19/2018
// Design Name:   CECS460_top
// Module Name:   D:/CECS 460 Labs/Lab_1_ise/CECS460_top_tb.v
// Project Name:  Lab_1_ise
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CECS460_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CECS460_top_tb;

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

	integer i;
	
always #5 clk = ~clk; 

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		button = 0;
		switch = 0;
		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		switch = 1; 
		#100; 	
			
		/*	begin
			
				// run for 10 button presses
			//	for (i= 0; i < 10; i=i+1) begin
					button = 1; // press button
					#10000000;  // 10 ms 
					button = 0; // unpress button
					#10000000;
			//	end
			end*/
	end
      
endmodule

