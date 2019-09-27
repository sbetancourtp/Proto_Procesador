
module complemento_TB;

reg [0:7] A;
reg clock;
reg enable;

complemento att(.A(A),.enable(enable),.clock(clock));

initial begin
clock = 0;
enable = 1;
A = 8'b11111111;

#3;
A = 8'b00000000;

#3;
A = 8'b1;

#3;
A = 8'b0;

#3;
enable = 0;

#3;
A = 8'b1;

#3;
end

always clock = #1 ~clock;

	
initial begin: TEST_CASE
     $dumpfile("complemento_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

