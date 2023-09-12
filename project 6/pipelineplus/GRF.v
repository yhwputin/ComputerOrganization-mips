`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:39 12/10/2017 
// Design Name: 
// Module Name:    GRF 
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
module GRF(inputadd1,hiwrite,lowrite,address,inputadd2,outputdata1,outputdata2,hio,lio,regwrite,clk,reset,writeadd,hidata,lodata,writedata);
	input [4:0] inputadd1;
	input [4:0] inputadd2;
	input clk;
	input reset;
	input [31:0] hidata,lodata;
	input hiwrite,lowrite;
	input regwrite;
	input [4:0] writeadd;
	input [31:0] address;
	input [31:0] writedata;
	output [31:0] outputdata1;
	output [31:0] outputdata2;
	output [31:0] hio;
	output [31:0] lio;
	reg [31:0] regfile [31:0];
	reg [31:0] hi,lo;
	integer i;
	always @(posedge clk)begin
		if(reset==1)begin
			for(i = 0;i<32;i = i+1)
				regfile[i] = 0;
			hi = 0;
			lo = 0;
		end
		else
			if(regwrite==1)begin
				regfile[writeadd] = writedata;
				$display("%d@%h: $%d <= %h",$time,address,writeadd,writedata);
			end
			if(hiwrite)begin
				hi = hidata;
				$display("%d@hi:<= %h",$time,hidata);
			end
			if(lowrite)begin
				lo = lodata;
				$display("%d@lo:<= %h",$time,lodata);
			end
	end
	assign outputdata1 = (inputadd1==0)?0:
								(inputadd1==writeadd&&regwrite==1)?writedata:regfile[inputadd1];
	assign outputdata2 = (inputadd2==0)?0:
								(inputadd2==writeadd&&regwrite==1)?writedata:regfile[inputadd2];
	assign hio = (hiwrite)?hidata:hi;
	assign lio = (lowrite)?lodata:lo;
endmodule
