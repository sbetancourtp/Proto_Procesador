module r_shift_TB;

reg [0:7] A;
reg clock;
reg enable;

r_shift att(.A(A),.enable(enable),.clock(clock));

initial begin
clock = 1;
A = 8'b11111111;
enable = 1;
#3;

end

always clock = #1 ~clock;

	
initial begin: TEST_CASE
     $dumpfile("r_shift_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

