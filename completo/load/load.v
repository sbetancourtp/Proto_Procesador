module load #(
    parameter input_size = 8
    )(datos, dato_out, enable, done);

input enable;
input [0: input_size -1] datos;
output reg [0:3] dato_out;
output reg done;

always @(*) begin

    if (enable) begin
        dato_out <= datos[0:3];
        done <= 0;
    end else begin
        done <= 1;
    end

end

endmodule