`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 23:10:54
// Design Name: 
// Module Name: fibonacci
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


module fibonacci(
        input clk,rst,
        output [31:0]cikis 
    );
    reg [31:0] suan,birdegisken;
    initial begin
        suan=0;
        birdegisken=1;
    end
    always@(posedge clk,negedge rst)begin  
        if(rst==1'b1)begin
            suan=0;
            birdegisken=1;
        end
        else begin
            suan<=suan+birdegisken;
            birdegisken<=suan;
        end
        
    end
    assign cikis=suan;
endmodule
