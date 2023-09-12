`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:32 12/28/2017 
// Design Name: 
// Module Name:    BEEXT 
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
module BEEXT(
    input [5:0] op,
    input [1:0] two,
    output [3:0] EX
    );
	 assign EX = (op==43)?4'b1111:
					 (op==40&&two==0)?4'b0001:
					 (op==40&&two==1)?4'b0010:
					 (op==40&&two==2)?4'b0100:
					 (op==40&&two==3)?4'b1000:
					 (op==41&&two[1]==0)?4'b0011:
					 (op==41&&two[1]==1)?4'b1100:4'b0;


endmodule
