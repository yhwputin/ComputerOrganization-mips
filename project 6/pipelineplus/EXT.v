`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:18 12/10/2017 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] inputdata,
    input [1:0] extop,
    output [31:0] outputdata
    );
	 wire [31:0] signdata,highextend,lowextend;
	 assign signdata = {{16{inputdata[15]}},inputdata};
	 assign highextend = {{16{1'b0}},inputdata};
	 assign lowextend = {inputdata,{16{1'b0}}};
	 assign outputdata = (extop==2'b00)?highextend:
								(extop==2'b01)?lowextend:
								(extop==2'b10)?signdata:0;

endmodule
