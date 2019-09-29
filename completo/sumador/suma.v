module suma #(INPUTSIZE = 8)(active , data_in, result_suma, done_suma );

input [INPUTSIZE-1:0] data_in;
input active;

output reg  [3:0] result_suma;
output reg done_suma;

reg [3:0] A;
reg [3:0] B;

always @(*) begin
	if (active) begin
		A <= data_in[7:4];
		B <= data_in[3:0];
		result_suma <= A + B;
		done_suma <= 1'b1;
	end else begin
		done_suma <= 1'b0;
	end
end
	
endmodule
