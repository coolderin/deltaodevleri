`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 23:14:54
// Design Name: 
// Module Name: simulation_fibonacci
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


module simulation_fibonacci();
    reg clk,reset;
    wire [31:0] ext;
    fibonacci fb(.clk(clk),.rst(reset),.cikis(ext));
    initial begin
        clk=0;
        forever begin #10 clk=~clk; end
        
        #1000
        $finish;
    end
endmodule
