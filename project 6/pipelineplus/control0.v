`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:48 12/12/2017 
// Design Name: 
// Module Name:    control0 
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
module control0(op,rt,fun,npc_sel,extop,mu);
	input [5:0] op;
	input [5:0] fun;
	input [4:0] rt;
	output [3:0] npc_sel;
	output [1:0] extop;
	output mu;
	wire beq,bne,bgez,blez,bgtz,bltz,jal,jr,jalr,j;
	wire lb,lbu,lh,lhu,lw,sb,sh,sw,addi,addiu,andi,ori,xori,lui,slti,sltiu;
	wire blezalr;
	assign beq = op==4;
	assign bne = op==5;
	assign blezalr = op==24;
	assign blez = op==6;
	assign bgez = op==1&&rt==1;
	assign bltz = op==1&&rt==0;
	assign bgtz = op==7;
	assign j = op==2;
	assign jal = op==3;
	assign jalr = op==0&&fun==9;
	assign jr = op==0&&fun==8;
	assign lb = op==32;
	assign lbu = op==36;
	assign lh = op==33;
	assign lhu = op==37;
	assign lw = op==35;
	assign sb = op==40;
	assign sh = op==41;
	assign sw = op==43;
	assign addi = op==8;
	assign addiu = op==9;
	assign andi = op==12;
	assign ori = op==13;
	assign xori = op==14;
	assign lui = op==15;
	assign slti = op==10;
	assign sltiu = op==11;
	assign npc_sel = (beq==1)?4'b0001:
						  (bne==1)?4'b0010:
						  (bgez==1)?4'b0011:
						  (blez==1)?4'b0100:
						  (bgtz==1)?4'b0101:
						  (bltz==1)?4'b0110:
						  (jal==1||j==1)?4'b0111:
						  (jr==1||jalr==1)?4'b1000:
						  (blezalr==1)?4'b1001:4'b0000;
	assign extop = (lb||lbu||lh||lhu||lw||sb||sh||sw||addi||addiu||slti||sltiu)?2'b10:
						(lui)?2'b01:
						(andi||ori||xori)?2'b00:2'b11;
	assign mu = (npc_sel==0)?0:1;

endmodule
