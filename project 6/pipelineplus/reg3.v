`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:52 12/10/2017 
// Design Name: 
// Module Name:    reg3 
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
module reg3(clk,reset,irm,pc4m,aom,rtm,irw,pc4w,aow,rtw,pc8m,pc8w,pcm,pcw,him,hirm,hm,lorm,lm,lom,hiw,hirw,hw,lorw,lw,low);
	input clk;
	input reset;
	input [31:0] irm,pc4m,aom,rtm,pc8m,pcm;
	input [31:0] hirm,lorm,him,lom;
	input hm,lm;
	output [31:0] hirw,lorw,hiw,low;
	output hw,lw;
   output [31:0] irw,pc4w,aow,rtw,pc8w,pcw;
	reg [31:0] ir,pc4,ao,rt,pc8,pc,hi,lo,hir,lor;
	reg h,l;
	assign irw = ir;
	assign pc4w = pc4;
	assign pc8w = pc8;
	assign aow = ao;
	assign rtw = rt;
	assign hiw = hi;
	assign low = lo;
	assign hw = h;
	assign lw = l;
	assign hirw = hir;
	assign lorw = lor;
	assign pcw = pc;
	always @(posedge clk)begin
		if(reset)begin
			ir <= 0;
			pc4 <= 0;
			ao <= 0;
			rt <= 0;
			hi <= 0;
			lo <= 0;
			h <= 0;
			l <= 0;
			hir <= 0;
			lor <= 0;
			pc8 <= 0;
			pc <= 0;
		end
		else begin
			ir <= irm;
			pc4 <= pc4m;
			pc8 <= pc8m;
			ao <= aom;
			hi <= him;
			lo <= lom;
			h <= hm;
			l <= lm;
			hir <= hirm;
			lor <= lorm;
			pc <= pcm;
			rt <= rtm;
		end
	end
endmodule
