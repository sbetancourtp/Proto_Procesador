module comp_cero #(
    parameter inputsize = 8
)(A, enable, clock, comp_out);

input enable;
input clock;
input [0:inputsize - 1] A;
output reg comp_out;

always @ (posedge clock) begin

    if (enable) begin
        if (A == 0) begin
        comp_out <= 1;
        end else begin
        comp_out <= 0;
        end
    end

end

endmodule