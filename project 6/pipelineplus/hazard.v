`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:35 12/10/2017 
// Design Name: 
// Module Name:    hazard 
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
`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define fun 5:0
module hazard(busy,ird,ire,irm,irw,pcen,irden,ireclr,hie,loe,FORWARDRSD,FORWARDRTD,FORWARDRSE,FORWARDRTE,FORWARDJR,FORWARDRTM,inadd);
	input [31:0] ird;
	input [31:0] ire;
	input [31:0] irm;
	input [31:0] irw;
	input [4:0] inadd;
	input busy;
	output pcen;
	output irden;
	output ireclr;
	output [3:0] FORWARDRSD,FORWARDRTD;
	output [2:0] FORWARDRSE,FORWARDRTE;
	output FORWARDRTM;
	output [3:0] FORWARDJR;
	output [1:0] hie,loe;
	wire [5:0] opd,fund,ope,fune,opm,funm,opw,funw;
	wire calrd,calid,ld,std,bed,bd,jalrd,jald,jrd,mdd,mtd,mfd,bld;
   wire calre,calie,le,ste,bee,be,jalre,jale,jre,mde,mte,mfe,ble;
	wire calrm,calim,lm,stm,bem,bm,jalrm,jalm,jrm,mdm,mtm,mfm,blm;
	wire calrw,caliw,lw,stw,bew,bw,jalrw,jalw,jrw,mdw,mtw,mfw,blw;
	wire stall,stallb,stallcalr,stallcali,stallld,stallsts,stallbl,stalljr,stallbe,stallmd,stalljalr,stallmult;
	assign opd = ird[`op];
	assign fund = ird[`fun];
	assign ope = ire[`op];
	assign fune = ire[`fun];
	assign opm = irm[`op];
	assign funm = irm[`fun];
	assign opw = irw[`op];
	assign funw = irw[`fun];
	assign calrd = (opd==0&&(fund==33||fund==35||fund==32||fund==34||fund==0||fund==2||fund==3||fund==4||fund==6||fund==7||fund==36||fund==37||fund==38||fund==39||fund==42||fund==43));
	assign calid = opd==13||opd==15||opd==8||opd==9||opd==12||opd==14||opd==10||opd==11;
	assign ld = opd==35||opd==32||opd==33||opd==36||opd==37;
 	assign std = opd==43||opd==40||opd==41;
	assign bed = opd==4||opd==5;
	assign bd = opd==4||opd==5||(opd==6||ird[`rt]==0)||(opd==1||ird[`rt]==1)||(opd==1||ird[`rt]==0)||(opd==7||ird[`rt]==0);
	assign jrd = opd==0&&fund==8;
	assign bld = opd==24;
	assign jalrd = opd==0&&fund==9;
	assign jald = opd==3;
	assign mdd = opd==0&&(fund==24||fund==25||fund==26||fund==27);
	assign mtd = opd==0&&(fund==17||fund==19);
	assign mfd = opd==0&&(fund==16||fund==18);
	assign calre = (ope==0&&(fune==33||fune==35||fune==32||fune==34||fune==0||fune==2||fune==3||fune==4||fune==6||fune==7||fune==36||fune==37||fune==38||fune==39||fune==42||fune==43));
	assign calie = ope==13||ope==15||ope==8||ope==9||ope==12||ope==14||ope==10||ope==11;
	assign le = ope==35||ope==32||ope==33||ope==36||ope==37;
 	assign ste = ope==43||ope==40||ope==41;
	assign bee = ope==4||ope==5;
	assign be = ope==4||ope==5||(ope==6||ire[`rt]==0)||(ope==1||ire[`rt]==1)||(ope==1||ire[`rt]==0)||(ope==7||ire[`rt]==0);
	assign jre = ope==0&&fune==8;
	assign jalre = ope==0&&fune==9;
	assign jale = ope==3;
	assign ble = ope==24;
	assign mde = ope==0&&(fune==24||fune==25||fune==26||fune==27);
	assign mte = ope==0&&(fune==17||fune==19);
	assign mfe = ope==0&&(fune==16||fune==18);
   assign calrm = (opm==0&&(funm==33||funm==35||funm==32||funm==34||funm==0||funm==2||funm==3||funm==4||funm==6||funm==7||funm==36||funm==37||funm==38||funm==39||funm==42||funm==43));
	assign calim = opm==13||opm==15||opm==8||opm==9||opm==12||opm==14||opm==10||opm==11;
	assign lm = opm==35||opm==32||opm==33||opm==36||opm==37;
 	assign stm = opm==43||opm==40||opm==41;
	assign bem = opm==4||opm==5;
	assign bm = opm==4||opm==5||(opm==6||irm[`rt]==0)||(opm==1||irm[`rt]==1)||(opm==1||irm[`rt]==0)||(opm==7||irm[`rt]==0);
	assign jrm = opm==0&&funm==8;
	assign jalrm = opm==0&&funm==9;
	assign blm = opm==24;
	assign jalm = opm==3;
	assign mdm = opm==0&&(funm==24||funm==25||funm==26||funm==27);
	assign mtm = opm==0&&(funm==17||funm==19);
	assign mfm = opm==0&&(funm==16||funm==18);
	assign calrw = (opw==0&&(funw==33||funw==35||funw==32||funw==34||funw==0||funw==2||funw==3||funw==4||funw==6||funw==7||funw==36||funw==37||funw==38||funw==39||funw==42||funw==43));
	assign caliw = opw==13||opw==15||opw==8||opw==9||opw==12||opw==14||opw==10||opw==11;
	assign lw = opw==35||opw==32||opw==33||opw==36||opw==37;
 	assign stw = opw==43||opw==40||opw==41;
	assign bew = opw==4||opw==5;
	assign bw = opw==4||opw==5||(opw==6||irw[`rt]==0)||(opw==1||irw[`rt]==1)||(opw==1||irw[`rt]==0)||(opw==7||irw[`rt]==0);
	assign jrw = opw==0&&funw==8;
	assign jalrw = opw==0&&funw==9;
	assign blw = opw==24;
	assign jalw = opw==3;
	assign mdw = opw==0&&(funw==24||funw==25||funw==26||funw==27);
	assign mtw = opw==0&&(funw==17||funw==19);
	assign mfw = opw==0&&(funw==16||funw==18);
	assign stallb = (bd&&calre&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0))||(bd&&calie&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0))||(bd&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0))||(bd&&lm&&(ird[`rs]==irm[`rt]&&ird[`rs]!=0));
	assign stallbl = (bld&&calre&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)||(ird[`rt]==ire[`rd]&&ird[`rt]!=0))||(bld&&calie&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0))||(bld&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0))||(bld&&lm&&(ird[`rs]==irm[`rt]&&ird[`rs]!=0)||(ird[`rt]==irm[`rt]&&ird[`rt]!=0));
	assign stallbe = (bed&&calre&&((ird[`rt]==ire[`rd]&&ird[`rt]!=0)))||(bed&&calie&&(ird[`rt]==ire[`rt]&&ird[`rt]!=0))||(bed&&le&&(ird[`rt]==ire[`rt]&&ird[`rt]!=0))||(bed&&lm&&(ird[`rt]==irm[`rt]&&ird[`rt]!=0));
	assign stallcalr = calrd&&le&&((ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0));
	assign stallcali = calid&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0);		
	assign stallld = ld&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0);
	assign stallsts = std&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0);
	assign stallmult = (mdd||mtd||mfd)&&(~busy||mde);
	assign stallmd = mdd&&le&&((ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0));
	assign stalljalr = (jalrd&&calre&&((ird[`rs]==ire[`rd]&&ird[`rs]!=0)))||(jalrd&&calie&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0))||(jalrd&&le&&(ird[`rs]==ire[`rt]&&ird[`rs]!=0))||(jalrd&&lm&&(ird[`rs]==irm[`rt]&&ird[`rs]!=0));
	assign stalljr = (jrd&&calre&&((ird[`rs]==ire[`rd]&&ird[`rs]!=0)||(ird[`rt]==ire[`rd]&&ird[`rt]!=0)))||(jrd&&calie&&((ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0)))||(jrd&&le&&((ird[`rs]==ire[`rt]&&ird[`rs]!=0)||(ird[`rt]==ire[`rt]&&ird[`rt]!=0)))||(jrd&&lm&&((ird[`rs]==irm[`rt]&&ird[`rs]!=0)||(ird[`rt]==irm[`rt]&&ird[`rt]!=0)));
   assign stall = stallbl||stallb||stallcalr||stallcali||stallld||stallsts||stalljr||stallbe||stallmd||stalljalr||stallmult;
	assign pcen = ~stall;
	assign irden = ~stall;
	assign ireclr = stall;
	assign FORWARDRSD	= (bd||bld)&&jale&&(ird[`rs]==31)?1:
							  (bd||bld)&&(jalre||ble)&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)?1:
							  (bd||bld)&&(ope==0&&fune==16)&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)?2:
							  (bd||bld)&&(ope==0&&fune==18)&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)?3:
							  (bd||bld)&&calrm&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?4:
							  (bd||bld)&&calim&&(ird[`rs]==irm[`rt]&&ird[`rs]!=0)?4:	
							  (bd||bld)&&jalm&&(ird[`rs]==31)?5:	
							  (bd||bld)&&(jalrm||blm)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?5:
							  (bd||bld)&&(opm==0&&funm==16)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?6:
							  (bd||bld)&&(opm==0&&funm==18)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?7:
							  (bd||bld)&&(calrw||jalrw||blw)&&(ird[`rs]==inadd&&ird[`rs]!=0)?8:
							  (bd||bld)&&caliw&&(ird[`rs]==inadd&&ird[`rs]!=0)?8:
							  (bd||bld)&&(opw==0&&funw==16)&&(ird[`rs]==inadd&&ird[`rs]!=0)?8:
							  (bd||bld)&&(opw==0&&funw==18)&&(ird[`rs]==inadd&&ird[`rs]!=0)?8:
							  (bd||bld)&&lw&&(ird[`rs]==inadd&&ird[`rs]!=0)?8:
							  (bd||bld)&&jalw&&(ird[`rs]==31)?8:0;
	assign FORWARDJR = (jrd||jalrd)&&(ope==0&&fune==16)&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)?1:
							 (jrd||jalrd)&&(ope==0&&fune==18)&&(ird[`rs]==ire[`rd]&&ird[`rs]!=0)?2:
							 (jrd||jalrd)&&jalm&&(ird[`rs]==31)?5:
							 (jrd||jalrd)&&calrm&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?4:
							 (jrd||jalrd)&&calim&&(ird[`rs]==irm[`rt]&&ird[`rs]!=0)?4:	
							 (jrd||jalrd)&&(jalrm||blm)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?5:
                      (jrd||jalrd)&&(opm==0&&funm==16)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?6:
							 (jrd||jalrd)&&(opm==0&&funm==18)&&(ird[`rs]==irm[`rd]&&ird[`rs]!=0)?7:
							 (jrd||jalrd)&&(calrw||jalrw||blw)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							 (jrd||jalrd)&&caliw&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							 (jrd||jalrd)&&(opw==0&&funw==16)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							 (jrd||jalrd)&&(opw==0&&funw==18)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							 (jrd||jalrd)&&lw&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							 (jrd||jalrd)&&jalw&&(ird[`rt]==31)?8:0;
	assign FORWARDRTD	= (bed||bld)&&jale&&(ird[`rt]==31)?1:
							  (bed||bld)&&(jalre||ble)&&(ird[`rt]==ire[`rd]&&ird[`rt]!=0)?1:
							  (bed||bld)&&(ope==0&&fune==16)&&(ird[`rt]==ire[`rd]&&ird[`rt]!=0)?2:
							  (bed||bld)&&(ope==0&&fune==18)&&(ird[`rt]==ire[`rd]&&ird[`rt]!=0)?3:
							  (bed||bld)&&calrm&&(ird[`rt]==irm[`rd]&&ird[`rt]!=0)?4:
							  (bed||bld)&&calim&&(ird[`rt]==irm[`rt]&&ird[`rt]!=0)?4:	
							  (bed||bld)&&jalm&&(ird[`rt]==31)?5:	
							  (bed||bld)&&(jalrm||blm)&&(ird[`rt]==irm[`rd]&&ird[`rt]!=0)?5:
							  (bed||bld)&&(opm==0&&funm==16)&&(ird[`rt]==irm[`rd]&&ird[`rt]!=0)?6:
							  (bed||bld)&&(opm==0&&funm==18)&&(ird[`rt]==irm[`rd]&&ird[`rt]!=0)?7:
							  (bed||bld)&&(calrw||jalrw||blw)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							  (bed||bld)&&caliw&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							  (bed||bld)&&(opw==0&&funw==16)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							  (bed||bld)&&(opw==0&&funw==18)&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							  (bed||bld)&&lw&&(ird[`rt]==inadd&&ird[`rt]!=0)?8:
							  (bed||bld)&&jalw&&(ird[`rt]==31)?8:0;
	assign FORWARDRSE	= (calre||calie||le||ste||mte||mde)&&calrm&&(ire[`rs]==irm[`rd]&&ire[`rs]!=0)?1:
							  (calre||calie||le||ste||mte||mde)&&calim&&(ire[`rs]==irm[`rt]&&ire[`rs]!=0)?1:	
							  (calre||calie||le||ste||mte||mde)&&jalm&&(ire[`rs]==31)?2:
							  (calre||calie||le||ste||mte||mde)&&(jalrm||blm)&&(ire[`rs]==irm[`rd]&&ire[`rs]!=0)?2:
							  (calre||calie||le||ste||mte||mde)&&(opm==0&&funm==16)&&(ire[`rs]==irm[`rd]&&ire[`rs]!=0)?3:
							  (calre||calie||le||ste||mte||mde)&&(opm==0&&funm==18)&&(ire[`rs]==irm[`rd]&&ire[`rs]!=0)?4:
							  (calre||calie||le||ste||mte||mde)&&(calrw||jalrw||blw)&&(ire[`rs]==inadd&&ire[`rs]!=0)?5:
							  (calre||calie||le||ste||mte||mde)&&(opw==0&&funw==16)&&(ire[`rs]==inadd&&ire[`rs]!=0)?5:
							  (calre||calie||le||ste||mte||mde)&&(opw==0&&funw==18)&&(ire[`rs]==inadd&&ire[`rs]!=0)?5:
							  (calre||calie||le||ste||mte||mde)&&caliw&&(ire[`rs]==inadd&&ire[`rs]!=0)?5:
							  (calre||calie||le||ste||mte||mde)&&lw&&(ire[`rs]==inadd&&ire[`rs]!=0)?5:
							  (calre||calie||le||ste||mte||mde)&&jalw&&(ire[`rs]==31)?5:0;
	assign FORWARDRTE	= (calre||ste||mde)&&calrm&&(ire[`rt]==irm[`rd]&&ire[`rt]!=0)?1:
							  (calre||ste||mde)&&calim&&(ire[`rt]==irm[`rt]&&ire[`rt]!=0)?1:	
							  (calre||ste||mde)&&jalm&&(ire[`rt]==31)?2:
							  (calre||ste||mde)&&(jalrm||blm)&&(ire[`rt]==irm[`rd]&&ird[`rt]!=0)?2:
							  (calre||ste||mde)&&(opm==0&&funm==16)&&(ire[`rt]==irm[`rd]&&ire[`rt]!=0)?3:
							  (calre||ste||mde)&&(opm==0&&funm==18)&&(ire[`rt]==irm[`rd]&&ire[`rt]!=0)?4:
							  (calre||ste||mde)&&(calrw||jalrw||blw)&&(ire[`rt]==inadd&&ire[`rt]!=0)?5:
							  (calre||ste||mde)&&(opw==0&&funw==16)&&(ire[`rt]==inadd&&ire[`rt]!=0)?5:
							  (calre||ste||mde)&&(opw==0&&funw==18)&&(ire[`rt]==inadd&&ire[`rt]!=0)?5:
							  (calre||ste||mde)&&caliw&&(ire[`rt]==inadd&&ire[`rt]!=0)?5:
							  (calre||ste||mde)&&lw&&(ire[`rt]==inadd&&ire[`rt]!=0)?5:
							  (calre||ste||mde)&&jalw&&(ire[`rt]==31)?5:0;
	assign FORWARDRTM	= stm&&(calrw||jalrw||blw)&&(irm[`rt]==inadd&&irm[`rt]!=0)?1:
							  stm&&(opw==0&&funw==16)&&(irm[`rt]==inadd&&irm[`rt]!=0)?1:
							  stm&&(opw==0&&funw==18)&&(irm[`rt]==inadd&&irm[`rt]!=0)?1:
							  stm&&caliw&&(irm[`rt]==inadd&&irm[`rt]!=0)?1:
							  stm&&lw&&(irm[`rt]==inadd&&irm[`rt]!=0)?1:
							  stm&&jalw&&(irm[`rt]==31)?1:0;
	assign hie = (ope==0&&fune==16)&&(opm==0&&funm==17)&&(ire[`rs]==irm[`rd]&&ire[`rt]!=0)?1:
				    (ope==0&&fune==16)&&(opw==0&&funw==17)&&(ire[`rs]==inadd&&ire[`rs]!=0)?2:0;
	assign loe = (ope==0&&fune==18)&&(opm==0&&funm==19)&&(ire[`rs]==irm[`rd]&&ire[`rt]!=0)?1:
				    (ope==0&&fune==18)&&(opw==0&&funw==19)&&(ire[`rs]==inadd&&ire[`rs]!=0)?2:0;
endmodule



