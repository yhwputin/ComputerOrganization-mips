`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:44 12/09/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(indata1,indata2,aluop,outdata,s,sop);
	input [31:0] indata1;
	input [31:0] indata2;
	input [3:0] aluop;
	input sop;
	input [4:0] s;
	output [31:0] outdata;
	wire [4:0] sv;
	assign sv = (sop==0)?indata1[4:0]:s;
	wire [31:0]add,sub,ori,sll,srl,sra,andi,xori,nori,slt,sltu;
	assign add = indata1+indata2;
	assign sub = indata1-indata2;
	assign sll = indata2<<sv;
	assign srl = indata2>>sv;
	assign sra = $signed(indata2)>>>sv;
	assign andi = indata1&indata2;
	assign ori = indata1|indata2;
	assign xori = indata1^indata2;
	assign nori = ~(indata1|indata2);
	assign slt = ($signed(indata1)<$signed(indata2))?1:0;
   assign sltu = (indata1<indata2)?1:0;
	assign outdata = (aluop==4'b0000)?add:
						  (aluop==4'b0001)?sub:
						  (aluop==4'b0010)?sll:
						  (aluop==4'b0011)?srl:
						  (aluop==4'b0100)?sra:
						  (aluop==4'b0101)?andi:
						  (aluop==4'b0110)?ori:
						  (aluop==4'b0111)?xori:
						  (aluop==4'b1000)?nori:
						  (aluop==4'b1001)?slt:
						  (aluop==4'b1010)?sltu:0;
endmodule
