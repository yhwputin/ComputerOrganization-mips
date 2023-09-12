module ctrl ( instr , regdst , alusrc , memtoreg , memwrite , regwrite , npc_sel , ext_op , alu_ctr);          // controller i
    input  [31:0]  instr ;                          // opcode and funct to control
    output        alusrc ,  regwrite , memwrite  ;                //  ouput control signal
    output [1:0]  memtoreg ,regdst , ext_op ; //  ouput control signal
    output [2:0]  npc_sel , alu_ctr ;
    wire   [5:0]  opcode , funct , rt , hint  ; 
    assign  opcode = instr[31:26];
    assign  funct  = instr[5:0];
    assign  hint   = instr[10:6];
    assign  rt     = instr[20:16];
    
    // instruction decode
    wire addu = (opcode == 6'h00) & (funct == 6'h21); // addu
    wire subu = (opcode == 6'h00) & (funct == 6'h23); // subu
    wire jr   = (opcode == 6'h00) & (funct == 6'h08); // jr
    wire slt  = (opcode == 6'h00) & (funct == 6'h2a); // slt
    wire slti = (opcode == 6'h0a);                    // slti
    wire sltu = (opcode == 6'h00) & (funct == 6'h2b); // sltu
    wire sltiu= (opcode == 6'h0b);                    // sltiu
    wire addi = (opcode == 6'h08);                    // addi
    wire addiu= (opcode == 6'h09);                    // addiu
    wire ori  = (opcode == 6'h0d);                    // ori
    wire lw   = (opcode == 6'h23);                    // lw
    wire sw   = (opcode == 6'h2b);                    // sw
    wire beq  = (opcode == 6'h04);                    // beq
    wire bne  = (opcode == 6'h05);                    // bne
    wire bgez = (opcode == 6'h01) & (rt == 5'h01)    ;// bgez
    wire bgtz = (opcode == 6'h07);                    // bgtz
    wire lui  = (opcode == 6'h0f);                    // lui
    wire j    = (opcode == 6'h02);                    // j
    wire jal  = (opcode == 6'h03);                    // jal
    
    //output control signal
    wire [1:0]  memtoreg ,regdst , ext_op ;
    wire [2:0]  npc_sel , alu_ctr ;
    assign  regdst      =  jal                                ?   2'b10 :
                          (addu || subu || slt || sltu )      ?   2'b01 :
                                                                  2'b00 ;
    assign  alusrc      = (addu || subu || beq || jr || slt || bne || sltu )  ?   0     :
                                                                                  1     ;
    assign  memtoreg    = jal                                 ?   2'b10 :
                          lw                                  ?   2'b01 :
                                                                  2'b00 ;
    assign  regwrite    = (sw || beq || j || jr || bne )      ?   0     :
                                                                  1     ;
    assign  npc_sel     = beq                                 ?   3'b001:
                          (j  ||  jal )                       ?   3'b010:
                          jr                                  ?   3'b011:
                          bne                                 ?   3'b100:
                                                                  3'b000;
    assign  memwrite    = sw                                  ?   1     :
                                                                  0     ;
    assign  ext_op      = lui                                 ?   2'b10 :
                          ori                                 ?   2'b00 :
                                                                  2'b01 ;
    assign  alu_ctr     = (slt || slti )                      ?   3'b011 :
                          (ori  ||  lui )                     ?   3'b010 :
                          (subu ||  beq || bne )              ?   3'b001 :
                          (sltu || sltiu )                    ?   3'b100 : 
                                                                  3'b000 ;
endmodule                                                              