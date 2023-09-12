`include    ".\\head_mips.v"
module im_4k ( addr , dout )  ;         // instruction memory
    input [11:2]  addr  ;               //  address bus
    output [31:0] dout  ;               // 32-bit memory output

    // control signals
    reg     [31:0] rom [`ROM_SIZE:0]  ; // instr memory
    assign          dout = rom[addr]  ; // output data
endmodule