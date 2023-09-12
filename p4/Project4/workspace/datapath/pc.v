`include  ".\\head_mips.v"
module pc ( clk, rst , npc , pc);     // program counter
    input       clk , rst ;           // clock and reset
    input  [31:0]   npc   ;           // next pc input
    output [31:0]   pc    ;           // ouput pc 
    reg    [31:0]   pc    ; 

    always  @(posedge clk or posedge rst)
        if(rst)
          pc  <=  `FIRST_PC ;         //reset the pc to 0x0000_3000
        else
          pc  <=  npc ;               //output next pc
endmodule