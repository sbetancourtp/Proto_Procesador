module hardware#(parameter DATASIZE = 8) (clk, instr, regA, regB, main_enable, to_reg, to_leds);

input clk;
input [7:0] instr;
input [DATASIZE - 1:0] regA;
input [DATASIZE - 1:0] regB;
input main_enable;
output reg [7:0]to_reg;
output reg [7:0]to_leds;

reg [7:0]enable;

always @(posedge clk) begin
    
    //decodificador
    case (instr[7:5])
        0: enable <= 8'b00000001;
        1: enable <= 8'b00000010;
        2: enable <= 8'b00000100;
        3: enable <= 8'b00001000;
        4: enable <= 8'b00010000;
        5: enable <= 8'b00100000;
        6: enable <= 8'b01000000;
        7: enable <= 8'b10000000;
        default: enable = 0;
    endcase

    //sumador

    if (enable[0] == 1) begin
        to_reg = regA + regB;
    end

    if (enable[6] == 1) begin
        to_reg = {3'b0,instr[4:0]};
    end


end

endmodule