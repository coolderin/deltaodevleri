module mux_ff(
    input bir,iki,uc,
    input clk,
    input l
    );
    reg w0,w1,w2,w3,w4;
    reg q_e_r,w1_reg,w2_reg;
    always@(posedge clk)begin
        case(l)
            0:w0=q_e_r;
            1:w0=bir;
        endcase
            w1_reg<=w0;
         case(l)
            0:w1=w1_reg;
            1:w1=iki;
        endcase
            w2_reg<=w1;
            w3=q_e_r^w2_reg;
        case(l)
            0:w4=w3;
            1:w4=uc;
        endcase
            q_e_r<=w4;
    end
        
endmodule
