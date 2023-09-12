`include    ".\\head_mips.v"
module dm_4k ( addr, din , we , clk , dout )  ;       // data memory
    input [11:2]  addr   ;                             //  address bus
    input [31:0]  din   ;                             //  32-bit input data
    input         we    ;                             //  memory write enable
    input         clk   ;                             //  clock and reset
    output [31:0] dout  ;                             // 32-bit memory output

    reg  [31:0] ram [0:`RAM_SIZE]  ;                  // data memory

    assign  dout = ram[addr] ;                        // output data
    
    always  @(posedge clk)
      begin
        if(we)
          ram[addr] <=  din ;                         //write data in memory when we is effective
      end
endmodule