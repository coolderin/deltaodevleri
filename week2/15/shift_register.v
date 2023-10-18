module shift_register(
    input [7:0]in,
    output reg out,
    input clk,rst,load,enable
    );
    reg [7:0] girisi;
    initial begin
        girisi=8'b00000000;
    end
   always@(posedge clk)begin
    if(enable)begin
        if(load)begin
            girisi<=in;
        end
        else begin
            out<=girisi[0];
            girisi=girisi>>1;
        end
    end
   end
endmodule