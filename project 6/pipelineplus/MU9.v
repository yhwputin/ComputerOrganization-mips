`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:26 01/03/2018 
// Design Name: 
// Module Name:    MU9 
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
module MU9(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [31:0] E,
    input [31:0] F,
    input [31:0] G,
    input [31:0] H,
    input [31:0] I,
    input [31:0] J,
    input [3:0] op
    );
	 assign J = (op==0)?A:
					(op==1)?B:
					(op==2)?C:
					(op==3)?D:
					(op==4)?E:
					(op==5)?F:
					(op==6)?G:
					(op==7)?H:I;

endmodule
