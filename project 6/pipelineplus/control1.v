`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:33 12/11/2017 
// Design Name: 
// Module Name:    control1 
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
module control1(
    input [5:0] op,
    input [5:0] fun,
	 output alusrc,
	 output [1:0] mulop,
	 output m,d,
	 output [3:0]aluop,
	 output sop
	 );
	 wire mult,multu,div,divu;
	 wire mtlo,mthi;
	 wire lb,lbu,lh,lhu,lw,sb,sh,sw,add,addu,sub,subu,sll,srl,sra,sllv,srlv,srav,andi,ori,xori,nori,addi,addiu,andiu,oriu,xoriu,lui,slt,slti,sltiu,sltu;
	 assign lb = op==32;
	 assign lbu = op==36;
	 assign lh = op==33;
	 assign lhu = op==37;
	 assign lw = op==35;
	 assign sb = op==40;
	 assign sh = op==41;
	 assign sw = op==43;
	 assign mtlo = op==0&&fun==19;
	 assign mthi = op==0&&fun==17;
	 assign mult = op==0&&fun==24;
	 assign multu = op==0&&fun==25;
	 assign div = op==0&&fun==26;
	 assign divu = op==0&&fun==27;
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
	 assign alusrc = (lb||lbu||lh||lhu||lw||sb||sh||sw||addi||addiu||andiu||oriu||xoriu||lui||slti||sltiu);
	 assign aluop = (mthi||mtlo||lb||lbu||lh||lhu||lw||sb||sh||sw||add||addu||addi||addiu||lui)?4'b0000:
						 (sub||subu)?4'b0001:
						 (sll||sllv)?4'b0010:
						 (srl||srlv)?4'b0011:
						 (sra||srav)?4'b0100:
						 (andi||andiu)?4'b0101:
						 (ori||oriu)?4'b0110:
						 (xori||xoriu)?4'b0111:
						 nori?4'b1000:
						 (slt||slti)?4'b1001:
						 (sltiu||sltu)?4'b1010:4'b0000;
	 assign sop = (sll||srl||sra)?1:0;
	 assign mulop = (mult)?0:
						 (multu)?1:
						 (div)?2:
						 (divu)?3:0;
	 assign m = (mult||multu);
	 assign d = (div||divu);
endmodule
