module npc ( pc , npc_sel , zero , imme , rs ,  npc , pc_4 ); // calculate the next pc
    input  [25:0]   imme        ;           // clock and reset
    input  [31:0]   pc          ;           // next pc input
    input  [31:0]   rs          ;           // data in the $rs
    input  [2:0]    npc_sel     ;           // instr type
    input           zero        ;           // ctrl the operation
    output [31:0]   npc         ;           // ouput pc 
    output [31:0]   pc_4        ; 
    
    wire   [31:0]   npc , pc_4                    ;
    wire   [15:0]   offset                        ;
    
    assign  offset  = imme[15:0]                  ;           // set the offset   
    assign  pc_4    = pc + 4                      ;           // ouput pc+4 
    
    parameter       R  =  3'b000,           // R_type
                    BEQ=  3'b001,           // BEQ_type
                    J  =  3'b010,           // J_type
                    JR =  3'b011,           // JR_type
                    BNE=  3'b100;           // BNE_type        
    
    assign  npc     = (npc_sel == R)         ?  pc_4                      :
                      ((npc_sel == BEQ && zero) || (npc_sel == BNE && !zero)) ?  pc_4 + {{14{offset[15]}},offset,2'b0}:
                      (npc_sel == J)         ?  {pc[31:28],imme,2'b0}     :
                      (npc_sel == JR)        ?  rs                        :
                                                pc_4                      ;
endmodule