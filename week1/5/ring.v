`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2023 00:13:46
// Design Name: 
// Module Name: ring
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


module ring(
    input cls,clk,i,
    output reg d1,d2,d3,d4,q
    );
    always@(posedge clk,negedge cls)begin
       if(cls==1'b0)begin
        d1<=0;
        d2<=0;
        d3<=0;
        d4<=0;
       end
       else begin
        d1<=!d4;
        d2<=d1;
        d3<=d2;
        d4<=d3;
        end
    end
endmodule
