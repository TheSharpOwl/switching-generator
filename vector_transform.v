module vector_transform
#(parameter W)
(
	in_mat,
	in_vec,
	out_vec
);

input [0: W * W - 1] in_mat;
input [0: W - 1] in_vec;

output [0: W - 1] out_vec;

genvar row;
generate
	for (row = 0; row < W; row = row + 1)
	begin
		assign out_vec[row] = ^ (in_mat[W * row: W * (row + 1) - 1] & in_vec);
	end
endgenerate
endmodule
