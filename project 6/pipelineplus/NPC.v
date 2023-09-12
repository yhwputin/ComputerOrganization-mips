`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:51:26 12/10/2017 
// Design Name: 
// Module Name:    NPC 
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
module NPC(pc,npc_sel,ra,npc,index,zero,xiaoe,dae,rt);
	input [31:0] pc;
	input [3:0] npc_sel;
	input zero,xiaoe,dae;
	input [25:0] index;
	input [31:0] ra;
	input [31:0] rt;
	output [31:0] npc;
	wire [31:0] npc;
	wire [15:0] offset; 
	assign offset = index[15:0];
	assign npc = ((npc_sel==4'b0001)&&zero)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0001)&&!zero)? pc + 4:
					 ((npc_sel==4'b0010)&&!zero)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0010)&&zero)? pc + 4:
					 ((npc_sel==4'b0011)&&dae)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0011)&&!dae)? pc + 4:
					 ((npc_sel==4'b0100)&&xiaoe)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0100)&&!xiaoe)? pc + 4:
					 ((npc_sel==4'b0101)&&!xiaoe)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0101)&&xiaoe)? pc + 4:
					 ((npc_sel==4'b0110)&&!dae)? pc + {{14{offset[15]}},offset,2'b0}:
					 ((npc_sel==4'b0110)&&dae)? pc + 4:
					 (npc_sel==4'b0111)?{pc[31:28],index,2'b0}:
					 ((npc_sel==4'b1001)&&xiaoe)? rt:
					 ((npc_sel==4'b1001)&&!xiaoe)? pc + 4:
					 (npc_sel==4'b1000)? ra:pc;
	
endmodule
