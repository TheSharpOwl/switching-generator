module matrix_power
#(parameter N, K)
(
	in_mat,
	in_exp,
	out_mat
);

input [0: N * N - 1] in_mat;
input [K - 1: 0] in_exp;

output [0: N * N - 1] out_mat;

wire [0: N * N - 1] inter_mul[0: K];
wire [0: N * N - 1] inter_res[0: K];
wire [0: N * N - 1] inter_mux_out[0: K];
wire [0: N * N - 1] iden;

identity_matrix #(N) iden_inst(iden);

assign out_mat = inter_res[K];

genvar i;

generate
	assign inter_mul[0] = in_mat;
	assign inter_res[0] = iden;
	for (i = 0; i < K; i = i + 1)
	begin
		matrix_mul #(N) inter_mul_calc(inter_mul[i], inter_mul[i], inter_mul[i + 1]);
		multiplexer #(N * N) inter_mux(iden, inter_mul[i], in_exp[i], inter_mux_out[i]);
		matrix_mul #(N) inter_res_calc(inter_res[i], inter_mux_out[i], inter_res[i + 1]);
	end
endgenerate

endmodule
