`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:27 02/13/2018 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(clk, reset, PED, uphdnl, count); 

	// signal declarations
	input clk, reset, PED, uphdnl;
	output reg [7:0] count;
	
	// count register
	always @(posedge clk, posedge reset) 
		if (reset)         count <= 8'b0; else
		if (PED &  uphdnl) count <= count + 8'b1; else 
		if (PED & !uphdnl) count <= count - 8'b1;			
endmodule
