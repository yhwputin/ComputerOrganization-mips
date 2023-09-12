`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:28 12/10/2017 
// Design Name: 
// Module Name:    IM 
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
module IM(imadd,cod);
	input [31:0] imadd;
	output [31:0] cod;
	reg [31:0] ROM [4095:0];
	wire [31:0] add;
	initial begin
		$readmemh("code.txt",ROM);
	end		
	assign add = imadd-32'h00003000;
	assign cod = ROM[add[15:2]];

endmodule
