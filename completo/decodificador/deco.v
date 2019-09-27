module deco (deco_in, deco_out);

input  [0:2] deco_in;
output [0:4] deco_out;

assign deco_out =   (deco_in == 3'b000) ? 5'b00000:
                    (deco_in == 3'b001) ? 5'b00001:
                    (deco_in == 3'b010) ? 5'b00010:
                    (deco_in == 3'b011) ? 5'b00100:
                    (deco_in == 3'b100) ? 5'b01000:
                    (deco_in == 3'b101) ? 5'b10000:5'b00000;
                
endmodule