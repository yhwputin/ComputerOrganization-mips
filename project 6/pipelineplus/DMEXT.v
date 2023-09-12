`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:35 12/28/2017 
// Design Name: 
// Module Name:    DMEXT 
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
module DMEXT(
    input [31:0] data,
    input [2:0] dmop,
	 input [1:0] a,
    input [31:0] outdata
    );
	 assign outdata = (dmop==0&&a==0)?{{24{data[7]}},data[7:0]}:
							(dmop==0&&a==1)?{{24{data[15]}},data[15:8]}:
							(dmop==0&&a==2)?{{24{data[23]}},data[23:16]}:
							(dmop==0&&a==3)?{{24{data[31]}},data[31:24]}:
							(dmop==1&&a==0)?{{24{1'b0}},data[7:0]}:
							(dmop==1&&a==1)?{{24{1'b0}},data[15:8]}:
							(dmop==1&&a==2)?{{24{1'b0}},data[23:16]}:
							(dmop==1&&a==3)?{{24{1'b0}},data[31:24]}:
							(dmop==2&&a[1]==0)?{{16{data[15]}},data[15:0]}:
							(dmop==2&&a[1]==1)?{{16{data[31]}},data[31:16]}:
							(dmop==3&&a[1]==0)?{{16{1'b0}},data[15:0]}:
							(dmop==3&&a[1]==1)?{{16{1'b0}},data[31:16]}:
							(dmop==4)?data:32'b0;
endmodule
