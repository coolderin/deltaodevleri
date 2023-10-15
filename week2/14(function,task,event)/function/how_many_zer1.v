`timescale 1ns / 1ps
module testbench;
    reg [15:0] sayilar;
    wire [7:0] sonuc;
    
    function_event_task_main#(.N(16)) fsr1(.inp(sayilar) ,.oup(sonuc));

    initial begin
        #10
        sayilar = 16'b0101010101010101;
        $display("%d",sonuc);

        #40
        $finish;
    end
endmodule