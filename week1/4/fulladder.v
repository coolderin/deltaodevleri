`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2023 18:14:44
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input s1,
    input s2,
    input cin,
    output cout,
    output sum
    );
    wire cout1_ext,sum1_ext;
    and a1(sum1_ext,s1,s2);
    xor x1(cout1_ext,s1,s2);
    and a2(cout,cout1_ext,cin);
    xor x2(sum,sum1_ext,cin);
endmodule
