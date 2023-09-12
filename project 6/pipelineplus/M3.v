`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:18 12/12/2017 
// Design Name: 
// Module Name:    M3 
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
module M3(
    input [4:0] A,
    input [4:0] B,
    input [4:0] C,
    input [1:0] sel,
    output [4:0] D
    );
	 assign D = (sel==0)?A:
					(sel==1)?B:C;


endmodule
