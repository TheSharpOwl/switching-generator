module switching_generator
#(parameter N, M)
(
	clk,
	out
);

input clk;

output out;

wire [0: N - 1] a_lfsr_set;
wire ctrl_set;
wire ctrl_out;

control_unit #(N) ctrl(clk, a_lfsr_set, ctrl_set, ctrl_out);

wire [0: M - 1] b_lfsr_set;
wire [0: M * M - 1] b_trans_1_mat_set;
wire [0: M * M - 1] b_trans_2_mat_set;
wire data_set;

data_unit #(M) data(clk, ctrl_out, b_lfsr_set, b_trans_1_mat_set, b_trans_2_mat_set, data_set, out);

endmodule
