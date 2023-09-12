`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:57:17 01/02/2018
// Design Name:   MUL
// Module Name:   D:/Computer composition course design/project 6/pipelineplus/ttt.v
// Project Name:  pipelineplus
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ttt;

	// Inputs
	reg [31:0] ind1;
	reg [31:0] ind2;
	reg [1:0] mulop;
	reg clk;
	reg m;
	reg d;

	// Outputs
	wire [31:0] hi;
	wire [31:0] lo;

	// Instantiate the Unit Under Test (UUT)
	MUL uut (
		.ind1(ind1), 
		.ind2(ind2), 
		.mulop(mulop), 
		.clk(clk), 
		.m(m), 
		.d(d),
		.hi(hi), 
		.lo(lo)
	);

	initial begin
		// Initialize Inputs
		ind1 = -3;
		ind2 = 5;
		mulop = 0;
		clk = 0;
		m = 1;
		d = 0;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
   always #5 clk = ~clk;  
endmodule

