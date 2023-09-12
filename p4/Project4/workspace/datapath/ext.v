module ext ( din , ext_op , dout ); // cpu i
    input  [15:0] din     ;     // input data 
    input  [1:0]  ext_op  ;     // ext_op to control the extension  
    output [31:0] dout    ;     // result data output
    wire   [31:0] dout    ;
                                                   
    wire    [31:0] z_ext , s_ext , shift ;
    assign    z_ext = {16'b0,din} ;
    assign    s_ext = {{16{din[15]}}, din}  ;
    assign    shift = {din,16'b0} ;
    
    mux_3_32b MUX_ext(.a0(z_ext) , .a1(s_ext) , .a2(shift) , .ch(ext_op) , .out(dout));
    
endmodule