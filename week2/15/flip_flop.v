module flip_flop(
    input in,clk,rst,
    output reg out);
    always@(posedge clk,negedge rst)begin 
        if(rst==1'b0)begin
            out<=0;
        end else begin
            out<=in;
        end
    end
endmodule