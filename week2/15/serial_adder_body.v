`timescale 1ns / 1ps
module serial_adder_body(
    input [7:0] a,b,reset,start,clk,
    output [8:0] out
    );
    wire a_out;
    wire b_out;
    wire ff_out;
    wire fader_out;
    wire fader_out_cout;
    wire reset_out,load_out,enable_out;
    control_fsm cfsm1(.start(start),.reset(reset),.clk(clk),.reset_out(reset_out),.enable(enable),.load(load_out));
    shift_register a_in(.in(a),.out(a_out),.clk(clk),.rst(reset_out),.load(load_out),.enable(enable_out));
    shift_register b_in(.in(b),.out(b_out),.clk(clk),.rst(reset_out),.load(load_out),.enable(enable_out));
    full_adder fader(.a(a_out),.b(b_out),.cin(ff_out),.sum_out(fader_out),.cout(fader_out_cout));
    flip_flop ff(.in(fader_out_cout),.out(ff_out),.clk(clk),.rst(reset));
    shift_register_exit s_r_x(.in(fader_out),.out(out),.clk(clk),.rst(reset),.enable(enable_out));
endmodule