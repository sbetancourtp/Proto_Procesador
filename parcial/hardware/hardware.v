module hardware#(parameter DATASIZE = 8) (clk, instr, regA, regB, main_enable, to_reg, to_leds);

input clk;
input [7:0] instr;
input [DATASIZE - 1:0] regA;
input [DATASIZE - 1:0] regB;
input main_enable;
output reg to_reg;
output reg to_leds;


endmodule