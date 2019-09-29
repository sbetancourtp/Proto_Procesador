module regs#(parameter DATASIZE = 8) (main_enable, clk, rst, instr, data_in, out_A, out_B);

input main_enable;
input clk;
input rst;
input [7:0] data_in;
input [7:0] instr;
output reg [DATASIZE - 1: 0] out_A;
output reg [DATASIZE - 1: 0] out_B;

reg [7:0] registers [1:0];

//always principal

always @(posedge clk) begin
    
    if (rst) begin  //reset
        registers[0] <= 0;
        registers[1] <= 0;
        out_A <= 0;
        out_B <= 0;
    end

    if (main_enable) begin  //main_enable: si está en cero apaga todo, para cambiar de instrucción y luego se prende
        case (instr[7:5])
            0:  begin //caso cero: operación suma
                    if (instr[4] == instr[3]) begin //si el bit 4 y el bit 3 de la instrucción son iguales, deja asignado
                        out_A <= registers[0];       // a las salidas A y B los valores de los registros
                        out_B <= registers[1];       // tal cual como estan
                        
                        if (instr[2] == 0) begin      //no es posible comprobar si este if funciona, para probarlo toca
                            registers[0] <= data_in[3:0]; //conectar el módulo suma
                        end else begin
                            registers[1] <= data_in[3:0];
                        end

                    end else begin
                                                
                        if (instr[4] == 0) begin  // si no son iguales, se le asignaran valores a A y B
                            out_A <= registers[0]; // dependiendo de la combinacion que tengan estos bits
                        end else begin
                            out_A <= registers[1];
                        end

                        if (instr[3] == 0) begin
                            out_B <= registers[0];
                        end else begin
                            out_B <= registers[1];
                        end

                        if (instr[2] == 0) begin      //el bit 2 de la instrucción decide a qué registro se le va a 
                            registers[0] <= data_in[3:0];   // asignar el resultado de la suma
                        end else begin
                            registers[1] <= data_in[3:0];
                        end

                    end
                end
    //       1: ;
    //       2: ;
    //       3: ;
    //       4: ;
    //       5: ;
            6:  begin //caso 6: instrucción save
                    if (data_in[4] == 0) begin        //el bit 4 decide en qué registro se va a guardar la información de entrada
                        registers [0] <= data_in[3:0]; // que llega desde los últimos 4 bits de la instrucción
                    end else begin
                        registers [1] <= data_in[3:0];
                    end
                end
    //       7: ;
            default: begin registers [0] <= 0; registers [1] <= 0; end //en default los registros se reinician
        endcase
    end
end


/*
ISSUES
--no está muy claro cómo es el uso de los de los if's para lectura y escritura en el sumador
*/

endmodule