module multiplexer
#(parameter W)
(
	in_vec_1,
	in_vec_2,
	in_select,
	out_vec
);

input [0: W - 1] in_vec_1;
input [0: W - 1] in_vec_2;
input in_select;

output [0: W - 1] out_vec;

assign out_vec = in_select ? in_vec_2 : in_vec_1;

endmodule
