`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:12 12/11/2017 
// Design Name: 
// Module Name:    reg4 
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
module reg4(clk,reset,irw,ird,pc4w,pc4d,aow,aod,drw,drd,pc8w,pc8d,pcw,pcd,hiw,hid,low,lod);
	input clk,reset;
	input [31:0] irw,pc4w,aow,drw,pc8w,pcw,hiw,low;
	output [31:0] ird,pc4d,aod,drd,pc8d,pcd,hid,lod;
	reg [31:0] ir,pc4,ao,dr,pc8,pc,hi,lo;
	assign ird = ir;
	assign pc4d = pc4;
	assign pc8d = pc8;
	assign aod = ao;
	assign drd = dr;
	assign hid = hi;
	assign lod = lo;
	assign pcd = pc;
	always @(posedge clk)begin
		if(reset)begin
			ir <= 0;
			pc4 <= 0;
			pc8 <= 0;
			hi <= 0;
			lo <= 0;
			ao <= 0;
			dr <= 0;
			pc <= 0; 
		end
		else begin
			ir <= irw;
			pc4 <= pc4w;
			pc8 <= pc8w;
			ao <= aow;
			hi <= hiw;
			lo <= low;
			dr <= drw;
			pc <= pcw;
		end
	end
endmodule

