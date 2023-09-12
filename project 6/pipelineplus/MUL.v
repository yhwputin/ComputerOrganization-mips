`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:29 01/01/2018 
// Design Name: 
// Module Name:    MUL 
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
module MUL(
    input [31:0] ind1,
    input [31:0] ind2,
    input [1:0] mulop,
	 input clk,
	 input reset,
	 input m,
	 input d,
    output [31:0] hi,
	 output [31:0] lo,
	 output hiw,
	 output low,
	 output b
    );
	 reg [1:0] op;
	 reg [63:0] out,outu;
	 reg [31:0] div,divu,mod,modu;
	 integer start = 0,busy = 0;
	 always @(posedge clk)begin
		if(reset)begin
			out <= 0;
			outu <= 0;
			div <= 0;
			divu <= 0;
			mod <= 0;
			modu <= 0;	
			op <= 0;
		end
		else if(start==0&&m==1&&busy==0)begin
			op <= mulop;
			start = 1;
			out <= $signed(ind1)*$signed(ind2);
			outu <= ind1*ind2;
			busy = 6;
		end
		else if(start==0&&d==1&&busy==0)	begin
			op <= mulop;
			div <= $signed(ind1)/$signed(ind2);
			divu <= ind1/ind2;
			mod <= $signed(ind1)%$signed(ind2);
			modu <= ind1%ind2;
			busy = 11;
			start = 1;
		end
		else if(busy>0)begin
			busy = busy-1;
			start = 0;
		end
    end
	 assign hiw = (busy==1)?1:0;
	 assign low = (busy==1)?1:0;
	 assign b = (busy==0)?1:0;
	 assign hi =  (op==2'b00&&busy==1)? out[63:32]:
					  (op==2'b01&&busy==1)? outu[63:32]:
					  (op==2'b10&&busy==1)? mod:
					  (op==2'b11&&busy==1)? modu:32'b0;
	 assign lo =  (op==2'b00&&busy==1)? out[31:0]:
					  (op==2'b01&&busy==1)? outu[31:0]:
					  (op==2'b10&&busy==1)? div:
					  (op==2'b11&&busy==1)? divu:32'b0;

endmodule
