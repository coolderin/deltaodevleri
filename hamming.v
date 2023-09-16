`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2023 16:30:39
// Design Name: 
// Module Name: hamming
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


module hamming(
    input [255:0] hex1,
    input [255:0] hex2,
    output[255:0] ext
    );
    integer i,j;
    reg[255:0] xor_cikis;
    reg[255:0] topla;
    always@(*)begin
    xor_cikis<=hex1^hex2;
    
    for(i=0;i<256;i=i+1)begin
    if(xor_cikis[i]==1'b1)begin
        topla<=topla+1;
    end
    end
    end
    assign ext=topla;
endmodule
