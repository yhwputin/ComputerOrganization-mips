`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:46 12/10/2017 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [31:0] address,
	 input [31:0] add,
	 input [31:0] inputdata,
    input clk,
	 input [3:0] EX,
    input reset,
    input memwrite,
    output [31:0] outputdata
    );
	 reg [31:0] RAM [4095:0];
	 wire da;
	 integer i;
	 initial begin
		for(i = 0;i<4095;i = i+1)
			RAM[i] = 0;
	 end
	 assign outputdata = RAM[address[15:2]];
	 always @(posedge clk)begin
		if(reset)
			for(i = 0;i<4096;i = i+1)
				RAM[i] = 0;
		else 
			if(memwrite)begin
				if(EX==1)
					RAM[address[15:2]][7:0] = inputdata[7:0];
				if(EX==2)
					RAM[address[15:2]][15:8] = inputdata[7:0];
				if(EX==4)
					RAM[address[15:2]][23:16] = inputdata[7:0];
				if(EX==8)
					RAM[address[15:2]][31:24] = inputdata[7:0];
				if(EX==3)
					RAM[address[15:2]][15:0] = inputdata[15:0];
				if(EX==12)
					RAM[address[15:2]][31:16] = inputdata[15:0];
				if(EX==15)
					RAM[address[15:2]] = inputdata;
				$display("%d@%h: *%h <= %h", $time,add,{address[31:2],2'b0},RAM[address[15:2]]);
			end
	 end

endmodule
