`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:36 01/03/2018 
// Design Name: 
// Module Name:    MU5 
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
module MU5(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [31:0] E,
    input [2:0] op,
    output [31:0] F
    );
	 assign F = (op==0)?A:
					(op==1)?B:
					(op==2)?C:
					(op==3)?D:E;


endmodule
