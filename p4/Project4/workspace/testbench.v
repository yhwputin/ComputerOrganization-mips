`include    ".\\head_mips.v"

module testbench_cpu() ;
    reg             clk, rst ;
    
    // instantiate the MiniUART module
    mips My_CPU( .clock(clk), .reset(rst) ) ;// instantiate mips
    
    //
    initial begin
        sys_reset ;                       // reset
        test2 ;
        $stop ;
    end
      
    // generate clock  
    always  
        #(`CYCLE/2) clk = ~clk ;
    
    // task to reset
    task    sys_reset;
      begin
        clk     = 0 ;
        rst     = 1 ;
        #(`CYCLE*0.6) rst = 0;
      end
    endtask
    
    // task to test
    task    test1 ;      
        begin
            $readmemh ("code.txt",My_CPU.My_IM.rom )  ;
            $display  ("rom loaded  successfully")  ;
            $readmemh ("data.txt",My_CPU.My_DM.ram )  ;
            $display  ("ram loaded  successfully")  ;
            #23000  ;
        end
    endtask
    
    // task to test
    task    test2 ;
        begin    
            $readmemh ("My_test.txt",My_CPU.My_IM.rom )  ;
            $display  ("rom loaded  successfully")  ;
            $readmemh ("My_data.txt",My_CPU.My_DM.ram )  ;
            $display  ("ram loaded  successfully")  ;
            #54800  ;
        end        
    endtask
                
    // Display the output
    initial
    begin
      $display("\n  TIME    PC    INSTR   OPCODE    DATA  ");
      $monitor($time,,"%h  %h  %b  %h",My_CPU.PC , My_CPU.INSTR , My_CPU.INSTR[31:26] , My_CPU.RD2)  ;
    end
        
endmodule