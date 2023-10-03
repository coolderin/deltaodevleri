`timescale 1ns / 1ps
module moore_fsm_4states(
    input in,clk,
    output reg out
    );
    reg [2:0] state;
    localparam S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
    always@(posedge clk)begin
             casez({in,state})
             {1'b1,S0}:
             begin
                state<=S1;
                out=0;
             end
             {1'b1,S1}:
             begin
                state<=S1;
                out=0;
             end
             {1'b0,S1}:
             begin
                state<=S2;
                out=0;
             end
             {1'b1,S2}:
             begin
                state<=S3;
                out=0;
             end
             {1'b0,S2}:
             begin
                state<=S0;
                out=0;
             end
             {1'b1,S3}:
             begin
                state<=S4;
                out=1;
             end
             {1'b0,S3}:
             begin
                state<=S2;
                out=0;
             end
             {1'b1,S4}:
             begin
                state<=S1;
                out=0;
             end
             {1'b0,S4}:
             begin
                state<=S2;
                out=0;
             end
             endcase
    end
endmodule
