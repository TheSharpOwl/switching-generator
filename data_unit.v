module data_unit
#(parameter M)
(
	clk,
	ctrl,
	b_lfsr_set,
	b_trans_1_mat_set,
	b_trans_2_mat_set,
	set,
	out
);

input clk;
input ctrl;
input [0: M - 1] b_lfsr_set;
input [0: M * M - 1] b_trans_1_mat_set;
input [0: M * M - 1] b_trans_2_mat_set;
input set;

output out;

reg [0: M * M - 1] b_trans_1_mat;
reg [0: M * M - 1] b_trans_2_mat;
wire [0: M - 1] b_trans_1_out;
wire [0: M - 1] b_trans_2_out;
wire [0: M - 1] mux_out;
reg [0: M - 1] b_lfsr;

vector_transform #(M) b_trans_1(b_trans_1_mat, b_lfsr, b_trans_1_out);
vector_transform #(M) b_trans_2(b_trans_2_mat, b_lfsr, b_trans_2_out);

multiplexer #(M) mux(b_trans_1_out, b_trans_2_out, ctrl, mux_out);

assign out = b_lfsr[M - 1];

always@(posedge set)
begin
	b_trans_1_mat <= b_trans_1_mat_set;
	b_trans_2_mat <= b_trans_2_mat_set;
	b_lfsr <= b_lfsr_set;
end

always@(posedge clk)
begin
	b_lfsr <= mux_out;
end

endmodule
