`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:41 12/10/2017 
// Design Name: 
// Module Name:    reg2 
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
module reg2(clk,reset,ire,pc4e,rse,rte,exte,irm,pc4m,rsm,rtm,extm,pc8e,pc8m,pce,pcm,hie,him,loe,lom);
	input clk,reset;
	input [31:0] ire;
	input [31:0] pce;
	input [31:0] pc4e;
	input [31:0] rse;
	input [31:0] rte;
	input [31:0] exte;
	input [31:0] pc8e;
	output [31:0] pc8m;
	output [31:0] irm;
	output [31:0] pc4m;
	output [31:0] rsm;
	output [31:0] rtm;
	input [31:0] hie,loe;
	output [31:0] him,lom;
	output [31:0] extm;
	output [31:0] pcm;
	reg [31:0] ir,pc4,rs,rt,ext,pc8,pc,hi,lo;
	assign irm = ir;
	assign pc4m = pc4;
	assign pc8m = pc8;
	assign rsm = rs;
	assign him = hi;
	assign lom = lo;
	assign rtm = rt;
	assign extm = ext;
	assign pcm = pc;
	always @(posedge clk)begin
		if(reset)begin
			ir <= 0;
			rt <= 0;
			rs <= 0;
			pc4 <= 0;
			hi <= 0;
			lo <= 0;
			pc8 <= 0;
			ext <= 0;
			pc <= 0;
		end
		else begin
			ir <= ire;
			rt <= rte;
			rs <= rse;
			pc4 <= pc4e;
			hi <= hie;
			lo <= loe;
			pc8 <= pc8e;
			ext <= exte;
			pc <= pce;
		end
	end
endmodule
