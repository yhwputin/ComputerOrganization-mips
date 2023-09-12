`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:27 12/10/2017 
// Design Name: 
// Module Name:    reg1 
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
module reg1(clk,reset,ird,pc4d,ire,pc4e,pc8d,pc8e,en,pcd,pce);
	input clk;
	input reset;
	input en;
	input [31:0] pcd;
	input [31:0] ird;
	input [31:0] pc4d;
	input [31:0] pc8d;
	output [31:0] pc8e;
	output [31:0] ire;
	output [31:0] pc4e;
	output [31:0] pce;
	reg [31:0] ir;
	reg [31:0] pc4;
	reg [31:0] pc8;
	reg [31:0] pc;
	assign pc4e = pc4;
	assign ire = ir;
	assign pc8e = pc8;
	assign pce = pc;
	always @(posedge clk)begin
		if(reset)begin
			pc4 <= 0;
			ir <= 0;
			pc8 <= 0;
			pc <= 0;
		end
		else begin
			if(en) begin
				pc4 <= pc4d;
				pc8 <= pc8d;
				ir <= ird;
				pc <= pcd;
			end
		end
	end
endmodule
