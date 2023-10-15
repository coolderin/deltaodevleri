`timescale 1ns / 1ps
module event_triggers(
    );
    reg rst,clk;
    event reset_trigger,reset_done_trigger;
    
    always begin
        #5 clk=~clk;
    end
    
    initial begin
        rst=0;
        clk=0;
    end
    
    initial begin
        forever begin
            @(reset_trigger);
                rst=1;
                #20 rst=0;
                -> reset_done_trigger;
        end
    end
    initial begin
    
    #10 
    ->reset_trigger;
    forever begin
        @(reset_done_trigger);
            
    end
    end
endmodule
