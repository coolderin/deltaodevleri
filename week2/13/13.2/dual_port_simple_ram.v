/*`timescale 1ns / 1ps
module dual_port_semi_true_ram#(parameter RAM_WIDTH=16,RAM_DEPTH=1024)
(
    input clk,
    input wr_ena,rd_enb,
    input [clogb2(RAM_WIDTH-1)-1:0] addra,addrb,
    input [RAM_WIDTH-1:0] dina,
    output reg [RAM_WIDTH-1:0]doutb   
    );
localparam NO_CHANGE=2'b00;
localparam READ_FIRST=2'b01;
localparam WRITE_FIRST=2'b10;
(*ram_style="block"*)   
reg [RAM_WIDTH-1:0] store [RAM_DEPTH-1:0];

always@(posedge clk)begin
    if(wr_ena==1'b1)begin
        store[addra]<=dina;
    end
end    
always@(posedge clk)begin       
    if(rd_enb==1'b1)begin
        doutb<=store[addrb];
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
*/ //i made this comment bcuz i must add control unit and thanks to chatgpt it gave to me lets check
/*`timescale 1ns / 1ps
module dual_port_semi_true_ram#(parameter RAM_WIDTH=16, RAM_DEPTH=1024)
(
    input clk,
    input wr_ena, rd_enb,
    input [clogb2(RAM_WIDTH-1)-1:0] addra, addrb,
    input [RAM_WIDTH-1:0] dina,
    output reg [RAM_WIDTH-1:0] doutb   
);

localparam NO_CHANGE = 2'b00;
localparam READ_FIRST = 2'b01;
localparam WRITE_FIRST = 2'b10;
localparam IDLE = 2'b11; // Add an IDLE state

(*ram_style="block"*)   
reg [RAM_WIDTH-1:0] store [RAM_DEPTH-1:0];
reg [1:0] state; // State register

always @(posedge clk) begin
    case (state)
        READ_FIRST: begin
            if (rd_enb) begin
                doutb <= store[addrb];
                state <= WRITE_FIRST; // Switch to WRITE_FIRST after reading
            end
        end

        WRITE_FIRST: begin
            if (wr_ena) begin
                store[addra] <= dina;
                state <= NO_CHANGE; // Switch to NO_CHANGE after writing
            end
        end

        NO_CHANGE: begin
            if (rd_enb) begin
                doutb <= store[addrb];
            end
            if (wr_ena) begin
                store[addra] <= dina;
            end
        end

        IDLE: begin
            // Add an IDLE state to handle initialization or other scenarios
            state <= NO_CHANGE;
        end
    endcase
end

function integer clogb2;
input integer value;
begin
    for (clogb2 = 0; clogb2 > 0; clogb2 = clogb2 + 1) begin
        value = value >> 1;
    end
end
endfunction

initial begin
    state <= IDLE; // Initialize the state machine
end

endmodule
*/ //it has priority problem so i made again
`timescale 1ns / 1ps
module dual_port_semi_true_ram#(parameter RAM_WIDTH=16, RAM_DEPTH=1024)
(
    input clk,
    input wr_ena, rd_enb,
    input [clogb2(RAM_WIDTH-1)-1:0] addra, addrb,
    input [RAM_WIDTH-1:0] dina,
    output reg [RAM_WIDTH-1:0] doutb   
);

localparam NO_CHANGE = 2'b00;
localparam READ_FIRST = 2'b01;
localparam WRITE_FIRST = 2'b10;
localparam IDLE = 2'b11;

(*ram_style="block"*)   
reg [RAM_WIDTH-1:0] store [RAM_DEPTH-1:0];
reg [1:0] state;
reg rd_priority; // Flag to prioritize reads

always @(posedge clk) begin
    case (state)
        READ_FIRST: begin
            if (rd_enb && !wr_ena) begin
                doutb <= store[addrb];
                state <= WRITE_FIRST;
                rd_priority <= 1; // Set read priority
            end
        end

        WRITE_FIRST: begin
            if (wr_ena && !rd_enb) begin
                store[addra] <= dina;
                state <= NO_CHANGE;
                rd_priority <= 0; // Set write priority
            end
        end

        NO_CHANGE: begin
            if (rd_enb && rd_priority) begin
                doutb <= store[addrb];
            end
            if (wr_ena && !rd_priority) begin
                store[addra] <= dina;
            end
        end

        IDLE: begin
            state <= NO_CHANGE;
        end
    endcase
end

function integer clogb2;
input integer value;
begin
    for (clogb2 = 0; clogb2 > 0; clogb2 = clogb2 + 1) begin
        value = value >> 1;
    end
end
endfunction

initial begin
    state <= IDLE;
    rd_priority <= 0; // Initialize read priority to favor writes initially
end

endmodule


