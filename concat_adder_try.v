`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2023 18:33:38
// Design Name: 
// Module Name: concat_adder_try
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


module concat_adder_try(
    input s1,s2,s3,s4,cin,
    output sum,cout
    );
    //plan s1+s2 s3+s4+cin
    wire s1_cout_ext,s1_sum1_ext;
    nbit n1(s1,s2,s1_cout_ext,s1_sum1_ext);
    wire s3_cout_ext,s3_sum2_ext;
    fulladder an(s3,s4,cin,s3_cout_ext,s3_sum2_ext);
    assign sum=s3_sum2_ext;
    assign cout=s3_cout_ext;
endmodule
