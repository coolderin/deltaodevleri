`timescale 1ns / 1ps
module control_fsm(
    input start,reset,clk,
    output reg reset_out,load,enable
    );
    reg [1:0] status;
    localparam IDLE_STATUS=2'b00;
    localparam RESET_STATUS=2'b01;
    localparam LOAD_STATUS=2'b10;
    localparam ENABLE_STATUS=2'b11;
    initial begin
        status=IDLE_STATUS;
    end
    always@(posedge clk)begin
        case(status)
            IDLE_STATUS:
                if(start==1'b1)begin                
                    status<=ENABLE_STATUS;
                end
            ENABLE_STATUS:
                if(reset==1'b1)begin
                    status<=RESET_STATUS;
                end
                else if(start==1'b1)begin
                    status<=LOAD_STATUS;
                end
             LOAD_STATUS:
                 load=1'b1;
             RESET_STATUS:
                 reset_out=1'b1;
        endcase
    end
endmodule
