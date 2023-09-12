module bitwise_xor(out,i0,i1);
       parameter N=32;
       output [N-1:0] out;
       input   [N-1:0] i0,i1;
       //assign out = i0+i1;
       genvar i;
       for(i=0;i<N;i=i+1)
               xor g1(out[i],i1[i],i0[i]);
endmodule
