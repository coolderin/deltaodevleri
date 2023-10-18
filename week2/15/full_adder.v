`timescale 1ns / 1ps
module full_adder(
    input a,b,cin,
    output cout,sum_out);
    assign {cout,sum_out}=a+b+cin;
endmodule

