`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:04 01/03/2018 
// Design Name: 
// Module Name:    MU3 
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
module MU3(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [1:0] op,
    output [31:0] D
    );
	 assign D = (op==0)?A:
					(op==1)?B:C;

endmodule
