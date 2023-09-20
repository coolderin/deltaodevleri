module clock_divider(input d,clk,rst, output reg q);

reg q_not;
assign d=q_not;
always@(posedge clk,posedge rst)begin
    if(rst==1'b1)begin
        q<=1'b0;
    end
    else begin
        q<=d;
        q_not=~q;
    end
 end

endmodule