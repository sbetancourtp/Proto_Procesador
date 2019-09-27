
module deco_TB;

reg [0:2] deco_in;

deco att(.deco_in(deco_in));

initial begin
deco_in = 3'b000;
#3;
deco_in = 3'b001;
#3;
deco_in = 3'b010;
#3;
deco_in = 3'b011;
#3;
deco_in = 3'b100;
#3;
deco_in = 3'b101;
#3;
end
	
initial begin: TEST_CASE
     $dumpfile("deco_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

