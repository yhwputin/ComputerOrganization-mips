module alu ( a, b , alu_ctr , alu_out , zero ); // alu
    input  [31:0] a , b   ;   // input data a and b
    input  [2:0]  alu_ctr ;   // alu_ctr to control the calculation
    output [31:0] alu_out ;   // result data output
    output        zero    ;   // memory or i/o address
    
    wire    [31:0] alu_out;
    wire    [31:0] sub , add , ori , slt , sltu ;
    
    assign        add = a + b           ;
    assign        sub = a - b           ;
    assign        ori = a | b           ;
    assign        slt = {31'b0,sub[31]} ;
    assign        sltu= (a < b)   ? 1   :
                                    0   ;               
    //whether a equals b               
    assign        zero = !(|sub) ;
    
    mux_5_32b MUX_alu (.a0(add) , .a1(sub) , .a2(ori) , .a3(slt) , .a4(sltu) , .ch(alu_ctr) , .out(alu_out) );
    
endmodule