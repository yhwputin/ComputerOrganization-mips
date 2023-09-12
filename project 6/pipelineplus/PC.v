`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:11 12/09/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(clk,reset,inputadd,outputadd,en);
	input clk;
	input reset;
	input en;
	input [31:0]inputadd;
	output reg [31:0]outputadd;
	always @(posedge clk)begin
		if(reset==1)
			outputadd <= 32'h00003000;			
		else
			if(en==1)
				outputadd <= inputadd;
	end
endmodule
