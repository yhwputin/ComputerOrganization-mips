`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:07 01/03/2018 
// Design Name: 
// Module Name:    MU6 
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
module MU6(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [31:0] E,
    input [31:0] F,
    output [31:0] G,
    input [2:0] op
    );
	 assign G = (op==0)?A:
					(op==1)?B:
					(op==2)?C:
					(op==3)?D:
					(op==4)?E:F;

endmodule
