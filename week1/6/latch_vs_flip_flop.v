module flip_flop (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    reg [15:0] q_n;
        
    integer i;
    always@(posedge clk)begin//senkronize olmasi icin negedge resetn yazilmadi
        	if(resetn==1'b0)begin
            q_n<=1'b0;
            end
        else begin
            if(byteena[1]==1)begin
                q_n[15:8]=d[15:8]; 
            end
            if (byteena[0]==1)begin
                q_n[7:0]=d[7:0];
            end
        end
    end
    assign q=q_n;
endmodule

module latch(
    input[15:0]d,
    input resetn,
    input [1:0] byteena,
    output [15:0]q);
    
    reg [15:0] q_n;
    always@(*)begin
    if(byteena[1]==1)begin
        q_n[15:7]=d[15:7];
    end
    if(byteena[0]==1)begin
        q_n[7:0]=d[7:0];
    end
    end
    assign q=q_n;
    endmodule
