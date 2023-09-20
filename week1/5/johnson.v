`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 23:06:17
// Design Name: 
// Module Name: johnson
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


module johnson(
    input clk,
    input rst,
    output ext1,ext2,ext3,ext4,
    input fstfr
    );
    reg s1,s2,s3,s4;
    always@(posedge clk,negedge rst)begin
       if(rst==1'b0)begin 
        s1<=1'b0;
        s2<=1'b0;
        s3<=1'b0;
        s4<=1'b0;
        end
        else begin
            s1<=fstfr;
            s2<=s1;
            s3<=~s2;
            s4<=~s3;
            s1<=s4;
        end
    end
    assign ext1=s1;
    assign ext2=s2;
    assign ext3=s3;
    assign ext4=s4;
endmodule
