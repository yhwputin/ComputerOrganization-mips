module gpr ( clk , rst , readreg1 , readreg2 , writereg , we , writedata , readdata1 , readdata2 )  ;         // instruction memory
    input   [4:0]   readreg1 , readreg2 , writereg  ;   //  reg bus
    input           we                              ;   // write enable
    input           clk , rst                       ;   // clock,reset
    input  [31:0]   writedata                       ;   // in data
    output [31:0]   readdata1 , readdata2           ;   // out data
    wire   [31:0]   readdata1 , readdata2           ;   // out data

    // general program registers
    reg     [31:0]  register [0:31]   ;                 // 32bit*32
    integer         i                 ;                 // logic variable
    
    assign    readdata1     =  register[readreg1]   ;   //  output data
    assign    readdata2     =  register[readreg2]   ;
    
    always @(posedge clk or posedge rst)
      begin
        if(rst)                                         // reset register data to zero
          for(i = 0;i < 32;i = i + 1)
            case(i) 
              28  :   register[i]  <=  32'h0000_1800 ;
              29  :   register[i]  <=  32'h0000_2ffc ;
              default:        register[i]  <=  32'b0 ;
            endcase 
        else  if(we)
            register[writereg]  <=  writedata ;           //  write in data
      end
endmodule