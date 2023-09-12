`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:26 12/12/2017 
// Design Name: 
// Module Name:    M1 
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
module M1(A,B,sel,C);
	input [31:0] A;
	input [31:0] B;
	input sel;
	output [31:0] C;
	assign C = (sel==0)?A:B;


endmodule
