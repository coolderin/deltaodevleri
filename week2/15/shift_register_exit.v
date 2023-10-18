`timescale 1ns / 1ps
module shift_register_exit(
    input clk,rst,in,enable,
    output reg [8:0] out
    );
    always@(posedge clk)begin
        if(enable)begin
            if(rst)begin
                out<=9'b000000000;
            end
            else begin
                out[0]<=in;
                out=out<<1;
            end
        end
    end
endmodule
