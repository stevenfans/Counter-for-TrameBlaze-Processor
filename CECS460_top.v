`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//========================================================================
// 	File name: <CECS460_top.v>														//
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
module CECS460_top(reset, clk, button, switch ,anode, cathode);

// inputs 
input reset, clk, button, switch; 

// outputs
output [7:0] anode;
output [6:0] cathode; 

// wire delcarations
wire reset_s, db_pd, pd_sr, loader;
wire [15:0] ld_out;  // ouptut from the 16-bit loadable register

// wires for input/outputs to the engine
wire sr_blaze, ws_blaze, rd_blaze, int_blaze, ack_blaze;
wire [15:0] out_blaze,  port_blaze;

AISO		aiso	  (.clk(clk), .reset(reset), .reset_s(reset_s));

debounce deb     (.clk_in(clk), .reset(reset_s), .sw(button), .PO(db_pd));

ped		pos_edge(.clk(clk), .reset(reset_s), .level(db_pd), .tick(pd_sr));

SRQ_FLOP	 srq	  (.clk(clk), .reset(reset_s), .S(pd_sr), .R(ack_blaze), .Q(sr_blaze));

tramelblaze_top tramelBlaze (.CLK(clk), .RESET(reset_s), 
									  .IN_PORT(switch), .INTERRUPT(sr_blaze), 
									  .OUT_PORT(out_blaze), .PORT_ID(port_blaze), 
									  .READ_STROBE(rd_blaze),.WRITE_STROBE(ws_blaze), 
									  .INTERRUPT_ACK(ack_blaze));
									  
comparator check (.clk(clk), .reset(reset_s), .write_strobe(ws_blaze), .port_id(port_blaze), 
						.ld(loader));
									  
LD_REG load_reg	(.clk(clk), .reset(reset_s), .load(loader),      
						 .D(out_blaze), .Q(ld_out)); 
						 
Display_controller display (.clk(clk), .reset(reset_s), 
									 .d0(ld_out[3:0]), .d1(ld_out[7:4]), .d2(ld_out[11:8]),
									 .d3(ld_out[15:12] ), .d4(4'b0), .d5(4'b0), .d6(4'b0), .d7(4'b0),
									 .anodes(anode), .hex_out(cathode));



endmodule
