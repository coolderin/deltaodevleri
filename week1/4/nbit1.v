`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2023 17:29:17
// Design Name: 
// Module Name: nbit1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nbit1(
    input sayi1,
    input sayi2,
    output cout,
    output sum
    );
    xor x1(sum,sayi1,sayi2);
    and a1(cout,sayi1,sayi2);
endmodule
