
module a_igual_b_TB;

reg enable;
reg [0:7] A;
reg [0:7] B;
reg sys_clk_i;

a_igual_b att(.A(A),.enable(enable),.B(B),.clk(sys_clk_i));

initial begin
sys_clk_i = 0;
enable = 1;
A = 0;
B = 0;
#3;
A = 0;
B = 1;
#3;
A = 1;
B = 0;
#3;
A = 1;
B = 1;
#3;
enable = 0;
A = 0;
B = 1;
#3;
A = 1;
B = 0;
#3;
A = 1;
B = 1;
#3;
end

always sys_clk_i = #1 ~sys_clk_i;

	
initial begin: TEST_CASE
     $dumpfile("a_igual_b_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

