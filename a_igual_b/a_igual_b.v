module a_igual_b #(
    parameter inputsize = 8
)(A, B, clk, reset, enable, ab_out);

input reset;
input enable;
input clk;
input [0:inputsize - 1] A;
input [0:inputsize - 1] B;
output reg ab_out;

always @ (posedge clk) begin

    if (reset) begin
        ab_out <= 1'bz;
    end

    if (enable) begin
        if (A == B) begin
        ab_out <= 1;
        end else begin
        ab_out <= 0;
        end
    end

end

endmodule