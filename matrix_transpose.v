module matrix_transpose
#(parameter N)
(
	in_mat,
	out_mat
);

input [0: N * N - 1] in_mat;

output [0: N * N - 1] out_mat;

genvar i, j;

generate
	for (i = 0; i < N; i = i + 1)
		for (j = 0; j < N; j = j + 1)
			assign out_mat[i * N + j] = in_mat[j * N + i];
endgenerate

endmodule
