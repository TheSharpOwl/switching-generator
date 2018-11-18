module control_unit 
#(parameter N)
(
	clk,
	a_lfsr_set,
	set,
	out
);

input clk;
input [0: N - 1] a_lfsr_set;
input set;

output out;

reg [0: N - 1] a_lfsr;
reg [0: N * N - 1] a_trans_mat;

wire [0: N - 1] a_trans_out;

vector_transform #(N) a_trans (a_trans_mat, a_lfsr, a_trans_out);

assign out  = a_lfsr[N - 1];

always@(posedge set)
begin
	a_lfsr = a_lfsr_set;
end

always@(posedge clk)
begin
	a_lfsr = a_trans_out;
end


endmodule
