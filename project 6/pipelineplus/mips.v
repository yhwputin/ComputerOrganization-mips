`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:36 12/13/2017 
// Design Name: 
// Module Name:    mips 
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
module mips(clk,reset);
	input clk;
	input reset;
	wire clk,reset;
	wire [31:0] p1,p2,p3,p4,p5,p6;
	wire d1;
	wire [31:0] hda,lda,hda1,lda1;
	wire [31:0] r1,r2,r3,r4;
	wire [31:0] re1,re2;
	wire [31:0] se1,se2,se3,se4;
	wire [31:0] t1,t2,t3,t4,t5;
	wire [31:0] ts1;
	wire [4:0] a1;
	wire [31:0] a2;
	wire [31:0] u1,u2,u3,u4,u5,u6;
	wire [31:0] s1,s2,s3,s4;
	wire [31:0] m1,m2,m3,m4;
	wire [31:0] hrm,lrm,hrw,lrw;
	wire zero,da,xiao;
	wire en,en2,clr,cc1,cc2;
	wire [2:0] h3,h4,memtoreg;
	wire h5,hbm,hbw,lbm,lbw;
	wire [2:0] lc;
	wire [3:0] h1,npc_sel,h2,h6;
	wire [31:0] b1,b2,b3,b4,b5,b6,hire,lore;
	wire [31:0] c1,c2,c3,c4,c5,c6,c7,c8;
	wire [3:0] ext,aluop;
	wire [1:0]regdst,extop,mulop,hh,ll;
	wire alusrc,regwrite,memwrite;
	wire m,d,hiw,low,bu,sop,hp,lp;
	assign zero = (b1==b2)?1:0;
	assign da = ($signed(b1)>=0)?1:0;
	assign xiao = ($signed(b1)<=0)?1:0;
	PC QPC(.clk(clk),.reset(reset),.inputadd(p6),.outputadd(p1),.en(en));
	IM QIM(.imadd(p1),.cod(p3));
	add4 qadd4(.inputadd(p1),.outputadd(p4));
	add4 qqadd4(.inputadd(p4),.outputadd(p5));
	reg1 qreg1(.clk(clk),.reset(reset),.pcd(p1),.pce(m1),.ird(p3),.pc4d(p4),.ire(r1),.pc4e(r2),.pc8d(p5),.pc8e(r3),.en(en2));
	GRF QGRF(.hiwrite(hp||hbw),.lowrite(lp||lbw),.hidata(hda),.lodata(lda),.hio(c1),.lio(c2),.inputadd1(r1[25:21]),.address(m4),.inputadd2(r1[20:16]),.outputdata1(re1),.outputdata2(re2),.regwrite(regwrite),.clk(clk),.reset(reset),.writeadd(a1),.writedata(a2));
	EXT QEXT(.inputdata(r1[15:0]),.extop(extop),.outputdata(r4));
	NPC QNPC(.rt(b2),.pc(r2),.npc_sel(npc_sel),.ra(b6),.npc(p2),.index(r1[25:0]),.zero(zero),.xiaoe(xiao),.dae(da));
	reg2 qreg2(.clk(clk),.hie(c1),.him(c3),.loe(c2),.lom(c4),.reset(reset||clr),.pce(m1),.pcm(m2),.ire(r1),.pc4e(r2),.rse(re1),.rte(re2),.exte(r4),.irm(s1),.pc4m(s2),.rsm(se1),.rtm(se2),.extm(s4),.pc8e(r3),.pc8m(s3));
	M1 QM1(.A(b4),.B(s4),.sel(alusrc),.C(se3));
	ALU QALU(.sop(sop),.s(s1[10:6]),.indata1(b3),.indata2(se3),.aluop(aluop),.outdata(se4));
	reg3 qreg3(.hirm(hrm),.lorm(lrm),.him(hda1),.lom(lda1),.hm(hbm),.lm(lbm),.hirw(hrw),.lorw(lrw),.hiw(c5),.low(c6),.hw(hbw),.lw(lbw),.clk(clk),.reset(reset),.pcm(m2),.pcw(m3),.irm(s1),.pc4m(s2),.aom(se4),.rtm(b4),.irw(t3),.pc4w(t4),.aow(t1),.rtw(t2),.pc8m(s3),.pc8w(t5));
	DM QDM(.EX(ext),.address(t1),.add(m3),.inputdata(b5),.clk(clk),.reset(reset),.memwrite(memwrite),.outputdata(ts1));
	BEEXT QBEEXT(.op(t3[31:26]),.two(t1[1:0]),.EX(ext));
	MUL QMUL(.ind1(b3),.ind2(se3),.mulop(mulop),.clk(clk),.reset(reset),.m(m),.d(d),.hi(hrm),.lo(lrm),.hiw(hbm),.low(lbm),.b(bu));
	reg4 qreg4(.clk(clk),.hiw(c5),.low(c6),.hid(c7),.lod(c8),.reset(reset),.pcw(m3),.pcd(m4),.irw(t3),.ird(u3),.pc4w(t4),.pc4d(u4),.aow(t1),.aod(u1),.drw(ts1),.drd(u2),.pc8w(t5),.pc8d(u5));
	DMEXT QDMEXT(.data(u2),.a(u1[1:0]),.dmop(lc),.outdata(u6));
	MU5 QM2(.A(u1),.B(u6),.C(u5),.D(c7),.E(c8),.op(memtoreg),.F(a2));
	M3 QM3(.A(u3[20:16]),.B(u3[15:11]),.C(5'b11111),.sel(regdst),.D(a1));
	hazard qhazard(.busy(bu),.hie(hh),.loe(ll),.ird(r1),.ire(s1),.irm(t3),.irw(u3),.pcen(en),.irden(en2),.ireclr(clr),.FORWARDRSD(h1),.FORWARDRTD(h2),.FORWARDJR(h6),.FORWARDRSE(h3),.FORWARDRTE(h4),.FORWARDRTM(h5),.inadd(a1));
	MU9 MRSD(.A(re1),.B(s3),.C(c3),.D(c4),.E(t1),.F(t5),.G(c5),.H(c6),.I(a2),.op(h1),.J(b1));
	MU9 MRTD(.A(re2),.B(s3),.C(c3),.D(c4),.E(t1),.F(t5),.G(c5),.H(c6),.I(a2),.op(h2),.J(b2));
	MU6 MRSE(.A(se1),.B(t1),.C(t5),.D(c5),.E(c6),.F(a2),.op(h3),.G(b3));
	MU6 MRTE(.A(se2),.B(t1),.C(t5),.D(c5),.E(c6),.F(a2),.op(h4),.G(b4));
	MU9 MJRE(.A(re1),.B(c3),.C(c4),.D(s3),.E(t1),.F(t5),.G(c5),.H(c6),.I(a2),.op(h6),.J(b6));
	M1 MRTM(.A(t2),.B(a2),.sel(h5),.C(b5));
	MU3 MH(.A(c3),.B(c5),.C(c7),.op(hh),.D(hda1));
	MU3 ML(.A(c4),.B(c6),.C(c8),.op(ll),.D(lda1));
	M1 pcM1(.A(p4),.B(p2),.sel(d1),.C(p6));
	M1 MH1(.A(u1),.B(hrw),.sel(hbw),.C(hda));
	M1 ML1(.A(u1),.B(lrw),.sel(lbw),.C(lda));
	control0 qcontrol0(.op(r1[31:26]),.fun(r1[5:0]),.rt(r1[20:16]),.npc_sel(npc_sel),.extop(extop),.mu(d1));
	control1 qcontrol1(.op(s1[31:26]),.fun(s1[5:0]),.alusrc(alusrc),.aluop(aluop),.sop(sop),.m(m),.d(d),.mulop(mulop));
	control2 qcontrol2(.op(t3[31:26]),.fun(t3[5:0]),.memwrite(memwrite));
	control3 qcontrol3(.op(u3[31:26]),.ins(u3),.fun(u3[5:0]),.regwrite(regwrite),.memtoreg(memtoreg),.regdst(regdst),.loadcontrol(lc),.hiwrite(hp),.lowrite(lp));
endmodule


