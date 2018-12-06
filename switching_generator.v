module switching_generator//the switching generator
#(parameter N, M)
(
	clk,
	seed,
	set,
	out
);

input clk;
input set;
input[0: N + 3 * M - 1] seed;

output out;

reg [0: M * M - 1] M1;
reg [0: M * M - 1] M2;

wire [0: M * M - 1] data_trans_seed1;
wire [0: M * M - 1] data_trans_seed2;

wire data_ctrl;

matrix_power #(M, M) mp1
(
	M1,
	seed[N + M: N + 2 * M - 1],
	data_trans_seed1
);

matrix_power #(M, M) mp2
(
	M2,
	seed[N + 2 * M: N + 3 * M - 1],
	data_trans_seed2
);

control_unit #(N) cu_inst
(
	clk,
	seed[0: N - 1],
	set,
	data_ctrl
);

data_unit #(M) du_inst
(
	clk,
	data_ctrl,
	seed[N: N + M - 1],
	data_trans_seed1,
	data_trans_seed2,
	set,
	out
);


endmodule