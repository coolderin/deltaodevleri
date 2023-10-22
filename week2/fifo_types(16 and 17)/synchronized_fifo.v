`timescale 1ns / 1ps
module synchronized_fifo(
    input [7:0] din,
    input clk,win_en,rout_en,
    output reg [7:0] dout,
    output empty,full
    );
    reg [7:0] fifo_memory [255:0];
    reg empty_status,full_status;
    reg [7:0] addr_in,addr_out;
    reg [9:0] fifo_counter;
    initial begin
        addr_in=0;
        addr_out=0;
    end
    always@(posedge clk)begin
        full_status=(fifo_counter==256);
        empty_status=(fifo_counter==0);
    end
    assign full=full_status;
    assign empty=empty_status;
    always@(posedge clk)begin
        if(win_en&&!full_status)begin
            fifo_memory[addr_in]<=din;
            fifo_counter=fifo_counter+1'b1;
            addr_in=addr_in+1'b1;
        end
        if(rout_en&&!empty_status)begin
            dout<=fifo_memory[addr_out];
            fifo_counter=fifo_counter-1'b1;
            addr_out=addr_out+1'b1;
            addr_in=addr_in-1'b1;
        end
    end
endmodule
