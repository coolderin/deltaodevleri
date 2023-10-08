`timescale 1ns / 1ps
//i understand false all the way i should use fsm
module cipher_detector(
    input [15:0] cipher_show, //paragraph3
    input [3:0] seq_read, //paragraph4 (i dont understand we have many ciphered inputs and in the example we can't set 4 bits to input one by one)
    input ready_to_read, //paragraph5
    input clk,rst,
    output reg collected,
    output [7:0] sum
    );
    localparam NO_FIND=3'b000;
    localparam ONE_FIND=3'b001;
    localparam TWO_FIND=3'b010;
    localparam THREE_FIND=3'b011;
    localparam FOUR_FIND=3'b100;
    reg [3:0]cip_1,cip_2,cip_3,cip_4;
    reg [7:0] sum_registry;
    reg [2:0] state;
    always@(posedge clk,negedge rst)begin
    if(ready_to_read==1'b1)begin
    if(rst==1'b0)begin
        state<=3'b000;
        sum_registry<=7'b0000000;
    end
    else begin
        while(collected!=1'b1)begin
        case(state)
        NO_FIND:
            if(seq_read==cipher_show[3:0]||seq_read==cipher_show[7:4]||seq_read==cipher_show[11:8]||seq_read==cipher_show[15:12])begin
                state<=ONE_FIND;
                sum_registry<=sum_registry+seq_read;
            end
            else begin
                state<=NO_FIND;
                sum_registry<=sum_registry+seq_read;
            end
         ONE_FIND:
            if(seq_read==cipher_show[3:0]||seq_read==cipher_show[7:4]||seq_read==cipher_show[11:8]||seq_read==cipher_show[15:12])begin
                state<=TWO_FIND;
                sum_registry<=sum_registry+seq_read;
            end
            else begin
                state<=NO_FIND;
                sum_registry<=sum_registry+seq_read;
            end
         TWO_FIND:
            if(seq_read==cipher_show[3:0]||seq_read==cipher_show[7:4]||seq_read==cipher_show[11:8]||seq_read==cipher_show[15:12])begin
                state<=THREE_FIND;
                sum_registry<=sum_registry+seq_read;
            end
            else begin
                state<=NO_FIND;
                sum_registry<=sum_registry+seq_read;
            end
         THREE_FIND:
          if(seq_read==cipher_show[3:0]||seq_read==cipher_show[7:4]||seq_read==cipher_show[11:8]||seq_read==cipher_show[15:12])begin
                state<=FOUR_FIND;
                collected<=1'b1;
                sum_registry<=sum_registry+seq_read;
            end
            else begin
                state<=NO_FIND;
                sum_registry<=sum_registry+seq_read;
            end
        endcase
        end//end of while  
    end//end of else begin
    end
    else begin
        sum_registry<=7'h0000000;
        collected<=0;
    end
    end
    assign sum=sum_registry;
endmodule
