module matrix_mul
#(parameter N)
(
	in_mat_1,
	in_mat_2,
	out_mat
);

input [0: N * N - 1] in_mat_1;
input [0: N * N - 1] in_mat_2;

output [0: N * N - 1] out_mat;

wire [0: N * N -  1] in_mat_2_transpose;

matrix_transpose #(N) helper(in_mat_2, in_mat_2_transpose);

genvar i, j;

generate
	for (i = 0; i < N; i = i + 1)
	begin
		for (j = 0; j < N; j = j + 1)
		begin
			assign out_mat[i * N + j] = ^ (in_mat_1[i * N: (i + 1) * N - 1] & in_mat_2_transpose[j * N: (j + 1) * N - 1]);
		end
	end
endgenerate


endmodule
