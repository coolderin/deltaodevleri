module function_event_task_main#(parameter N=16)(
    input [N-1:0] inp,
    output [7:0] oup
);
    reg [7:0] oup_reg;
    
    always @(inp) begin
        oup_reg = how_many_zero(N, inp);
    end

    function integer how_many_zero;
        input integer length;
        input [N-1:0] imp;
        integer cnt;
        integer result; // Sonucu tutacak deðiþken
        begin
            cnt = 0;
            result = 0; // Sonuç deðiþkenini sýfýrla
            for (cnt = 0; cnt < length; cnt = cnt + 1) begin
                if (imp[cnt] == 1'b0) begin
                    result = result + 1'b1;
                end
            end
            how_many_zero = result; // Sonucu döndür
        end
    endfunction

    assign oup = oup_reg;
endmodule
