module regs#(parameter DATASIZE = 8) (clk, rst, instr, data_in, data_out);

input clk;
input rst;
input [4:0] data_in;
input [7:0] instr;
output [DATASIZE - 1: 0] data_out;

[3:0] registers [1:0];

//always para lectura de datos

always @(posedge clk) begin
    case (instr[7:5])
        0:  begin
                if (instr[0] == 0) begin
                    registers [0] = data_in;
                end else begin
                    registers [1] = data_in;
                end

            end
        1: ;
        2: ;
        3: ;
        4: ;
        5: ;
        6: begin    if (data_in[4] == 0) begin
                        registers [0] = data_in[3:0];
                    end else begin
                        registers [1] = data_in[3:0];
                    end
            end
        7: ;
        default: ;
    endcase
end

// always para escritura de datos
// los registros deben enviar datos, entonces, cuando el modulo
// esté en enviar datos (read), se debe declarar que las salidas
// del sistema se envíen a los respectivos outputs

always @(posedge clk) begin
    data_out == 
end