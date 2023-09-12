`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:55 12/11/2017 
// Design Name: 
// Module Name:    control3 
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
module control3(
	input [5:0] op,
   input [5:0] fun,
	input [31:0] ins,
	output regwrite,
	output [2:0]memtoreg,
	output [1:0]regdst,
	output [2:0]loadcontrol,
	output hiwrite,
	output lowrite
    );
	wire lb,lbu,lh,lhu,lw,add,addu,sub,subu,sll,srl,sra,sllv,srlv,srav,andi,ori,xori,nori,addi,addiu,andiu,oriu,xoriu,lui,slt,slti,sltiu,sltu,jal,jalr;
	wire mtlo,mthi,mflo,mfhi;
	wire blezalr;
	assign blezalr = op==24;
	assign mflo = op==0&&fun==18;
	assign mfhi = op==0&&fun==16;
	assign mtlo = op==0&&fun==19;
	assign mthi = op==0&&fun==17;
	assign lb = op==32;
	assign lbu = op==36;
	assign lh = op==33;
	assign lhu = op==37;
	assign lw = op==35;
	assign add = op==0&&fun==32;
	assign addu = op==0&&fun==33;
	assign sub = op==0&&fun==34;
	assign subu = op==0&&fun==35;
	assign sll = op==0&&fun==0;
	assign srl = op==0&&fun==2;
	assign sra = op==0&&fun==3;
	assign sllv = op==0&&fun==4;
	assign srlv = op==0&&fun==6;
	assign srav = op==0&&fun==7;
	assign andi = op==0&&fun==36;
	assign ori = op==0&&fun==37;
	assign xori = op==0&&fun==38;
	assign nori = op==0&&fun==39;
	assign addi = op==8;
	assign addiu = op==9;
	assign andiu = op==12;
	assign oriu = op==13;
	assign xoriu = op==14;
	assign lui = op==15;
	assign slt = op==0&&fun==42;
	assign slti = op==10;
	assign sltiu = op==11;
	assign sltu = op==0&&fun==43;
	assign jal = op==3;
	assign jalr = op==0&&fun==9;
	assign regdst = (blezalr||mfhi||mflo||add||addu||sub||subu||sll||srl||sra||sllv||srlv||srav||andi||ori||xori||nori||slt||sltu||jalr)?2'b01:
						 (jal)?2'b10:2'b00;
   assign regwrite = (blezalr||mflo||mfhi||lb||lbu||lh||lhu||lw||add||addu||sub||subu||srl||sra||sllv||srlv||srav||andi||ori||xori||nori||addi||addiu||andiu||oriu||xoriu||lui||slt||slti||sltiu||sltu||jal||jalr)?1:
							(sll&&ins!=32'h00000000)?1:0;
	assign memtoreg = (lb||lbu||lh||lhu||lw)?3'b001:
							(blezalr||jal||jalr)?3'b010:
							(mfhi)?3'b011:
							(mflo)?3'b100:3'b000;
	assign loadcontrol = (lb)?3'b000:
								(lbu)?3'b001:
								(lh)?3'b010:
								(lhu)?3'b011:
								(lw)?3'b100:3'b101;
	assign hiwrite = mthi;
	assign lowrite = mtlo;
endmodule
