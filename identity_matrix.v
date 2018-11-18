module identity_matrix
#(parameter N)
(
	out_mat
);

output [0: N * N - 1] out_mat;

genvar i, j;

generate
	for (i = 0; i < N; i = i + 1)
	begin
		for (j = 0; j < N; j = j + 1)
		begin
			assign out_mat[i * N + j] = (i == j) ? 1 : 0;	
		end
	end
endgenerate

endmodule
