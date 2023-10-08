`timescale 1ns / 1ps
module single_port_ram#(parameter RAM_WIDTH=16,RAM_DEPTH=1024)
(input clk,rst,//essential things of storage devices
input wd_en,rd_en, //write and read enabler
input [clogb2(RAM_DEPTH-1)-1:0]addr,//address 
input [RAM_WIDTH-1:0] din, //data_in
output reg [RAM_WIDTH-1:0] dout); //data_out

(*ram_style="block"*)
reg [RAM_WIDTH-1:0] store [RAM_DEPTH-1:0];
integer i;
always@(posedge clk,negedge rst)begin
    if(rst==1'b0)begin
      for(i=0;i<RAM_DEPTH;i=i+1)begin
        store[i][RAM_WIDTH-1:0]<={{RAM_WIDTH{1'b0}}};
      end 
    end
    else begin
        if(wd_en==1'b1)begin
            store[addr]<=din;
        end
        if(rd_en==1'b1)begin
            dout<=store[addr];
        end
    end
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

