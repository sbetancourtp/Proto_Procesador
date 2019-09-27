module regs#(parameter DATASIZE = 8) (main_enable, clk, rst, instr, data_in, out_A, out_B);

input main_enable;
input clk;
input rst;
input [4:0] data_in;
input [7:0] instr;
output reg [DATASIZE - 1: 0] out_A;
output reg [DATASIZE - 1: 0] out_B;

reg [3:0] registers [1:0];

//always principal

always @(posedge clk) begin
    
    if (rst) begin
        registers[0] = 0;
        registers[1] = 0;
    end

    if (main_enable) begin
        case (instr[7:5])
            0:  begin
                    if (instr[4] == instr[3]) begin
                        out_A = registers[0];
                        out_B = registers[1];
                    end else begin
                        if (instr[4] == 0) begin
                            out_A = registers[0];
                        end else begin
                            out_A = registers[1];
                        end

                        if (instr[3] == 0) begin
                            out_B = registers[0];
                        end else begin
                            out_B = registers[1];
                        end
                    end

                    if (instr[2] == 0) begin
                        registers[0] = data_in;
                    end else begin
                        registers[1] = data_in;
                    end
                end
    //       1: ;
    //       2: ;
    //       3: ;
    //       4: ;
    //       5: ;
            6:  begin
                    if (data_in[4] == 0) begin
                        registers [0] = data_in[3:0];
                    end else begin
                        registers [1] = data_in[3:0];
                    end
                end
    //       7: ;
            default: begin registers [0] = 0; registers [1] = 0; end
        endcase
    end
end

/*
issues: tener claro cómo es el uso de las igualdades síncronas y asíncronas
no está muy claro cómo es el uso de los de los if's para lectura y escritura en el sumador

*/

endmodule