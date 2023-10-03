`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 16:40:07
// Design Name: 
// Module Name: mealy_fsm_4states
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


module mealy_fsm_4states(
    input rst,clk,in,
    output reg out
    );
    localparam S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
    reg [1:0] states;
    initial begin
        states<=S0;
    end
    always@(posedge clk,negedge rst)begin
        if(rst==1'b0)begin
            states<=S0;
        end
        else begin
            casez({in,states})
               {1'b1,S0}:
               begin
                    states<=S1;
                    out=0;
               end 
               {1'b0,S0}:
               begin
                    states<=S0;
                    out=0;
               end
               {1'b1,S1}:
               begin
                    states<=S1;
                    out=0;
               end
               {1'b0,S1}:
               begin
                    states<=S2;
                    out=0;
               end
               {1'b1,S2}:
               begin
                    states<=S3;
                    out=0;
               end
               {1'b0,S2}:
                begin
                    states<=S0;
                    out=0;
                end
                {1'b1,S3}:
                begin
                    states<=S1;
                    out=1;
                end
                {1'b0,S3}:
                begin
                    states<=S2;
                    out=0;
                end     
            endcase   
        end
        
    
    end
endmodule
