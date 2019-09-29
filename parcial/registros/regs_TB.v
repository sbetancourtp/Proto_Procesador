
module regs_TB;

reg main_enable;//
reg sys_clk_i; //
reg rst; //
reg [7:0]instr;
reg [7:0]data_in;

regs att(.main_enable(main_enable),.clk(sys_clk_i),.rst(rst),.instr(instr),.data_in(data_in));

initial begin
main_enable = 1;
sys_clk_i = 0;
rst = 1;
#2;
rst = 0;
instr = 8'b11000001; // guardar un uno en reg0
data_in = 8'b00000001;// dato que viene del módulo save
#2;
instr = 8'b11010001; // guardar un uno en reg1
data_in = 8'b00010001; //dato que viene del módulo save
#2;
instr = 8'b00000100; //sumar reg0 y reg1, asignando reg0 a A y reg1 a B
data_in = 8'b00000010;//resultado retornado del módulo suma
#8;
rst = 1; //reinicio todo(no funciona)
#2;
rst = 0;
instr = 8'b11000011; // guardar un tres en reg0
data_in = 8'b00000011; //dato que viene del módulo save
#2;
instr = 8'b11010011; // guardar un tres en reg1
data_in = 8'b00010011; //dato que viene del módulo save
#2;
instr = 8'b00010000; //sumar, asignando reg1 a A (bit [4]) y reg0 a B (bit [3])
data_in = 8'b00000110; //dato retornado del módulo suma
#2;
end

always sys_clk_i = #1 ~sys_clk_i;

	
initial begin: TEST_CASE
     $dumpfile("regs_TB.vcd");
     $dumpvars(-1, att);
     #(1000000) $finish;
   end

endmodule //

