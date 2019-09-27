
module comp_cero_TB;

reg [0:7] A;
reg clock;
reg enable;

comp_cero att(.A(A),.enable(enable),.clock(clock));

initial begin
enable = 1;
clock = 0;
A = 0;
#3;
A = 1;
#3;
A = 0;
#3;
A = 6;
#3;
enable = 0;
A = 0;
#3;
A = 6;
#3;
end

always clock = #1 ~clock;

	
initial begin: TEST_CASE
     $dumpfile("comp_cero_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

