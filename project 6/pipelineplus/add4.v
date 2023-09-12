`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:55 12/11/2017 
// Design Name: 
// Module Name:    add4 
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
module add4(
    input [31:0] inputadd,
    output [31:0] outputadd
    );
	 assign outputadd = inputadd + 4;


endmodule
