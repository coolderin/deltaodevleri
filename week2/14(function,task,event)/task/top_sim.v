module top;
   reg [7:0] data1;
   reg [7:0] data2;
   reg [7:0] result;
    
 
   max_top m1(data1, data2, result);
   
   initial begin
    #5
      data1 = 8'd42;
      data2 = 8'd57;
      m1.max(data1, data2, result);//task 14.2 (task)
      $display("Max value is %d", result);
      #10$finish;
   end
endmodule




