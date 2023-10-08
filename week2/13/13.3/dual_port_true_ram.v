`timescale 1ns / 1ps
module dual_port_true_ram#(parameter RAM_WIDTH=16,RAM_DEPTH=1024)(
    input clk,
    input wr_ena,wr_enb,
    input rd_ena,rd_enb,
    input [clogb2(RAM_WIDTH-1)-1:0] addra,addrb,
    input [RAM_WIDTH-1:0] dina,dinb,
    output reg [RAM_WIDTH-1:0] douta,doutb
    );
    localparam NO_CHANGE=2'b00;
    localparam READ_FIRST=2'b01;
    localparam WRITE_FIRST=2'b10;
    reg [RAM_WIDTH-1:0] store [RAM_DEPTH-1:0];
    reg [1:0] state;
    reg [1:0] before_stage;
    reg rd_priority;
    localparam IDLE=2'b11;
    always@(posedge clk)begin//port a
    case(state)
        READ_FIRST:
            begin
                douta<=store[addra];
                doutb<=store[addrb];
                store[addra]<=dina;
                store[addrb]<=dinb;
                before_stage<=state;
            end
        WRITE_FIRST:
            begin
                store[addra]<=dina;
                store[addrb]<=dinb;
                douta<=store[addra];
                doutb<=store[addrb];
             before_stage<=state;
            end
        NO_CHANGE:
            begin
                if(state==2'b01)begin
                    state<=2'b01;
                end   
                else if(state==2'b10) begin
                    state<=2'b10;
                end
            end 
            
    endcase
    end
    function integer clogb2;
    input integer value;
    begin
    for(clogb2=0;clogb2>0;clogb2=clogb2+1)begin
    value=value>>1;
    end
    end
    endfunction
endmodule
