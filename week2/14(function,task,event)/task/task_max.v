  module max_top(
    input [7:0] d1,
    input [7:0] d2,
    input [7:0] son);
   task max;
   input [7:0] data1;
   input [7:0] data2;
   output [7:0] result;
   begin
      if (data1 > data2) begin
         result = data1;
      end else begin
         result = data2;
      end
      end
   endtask
   endmodule