`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:42 12/11/2017 
// Design Name: 
// Module Name:    control2 
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
module control2(
    input [5:0] op,
    input [5:0] fun,
	 output memwrite
	 );
	 wire sw,sb,sh;
	 assign sb = op==40;
	 assign sh = op==41;
 	 assign sw = op==43;
	 assign memwrite = (sw||sb||sh);

endmodule
