module ex04 (a, b, cin, s, cout);

	input [3:0] a;
	input [3:0] b;
	input cin;

	output [3:0] s;
	output cout;

	wire   [4:0] c;

	assign c[0] = cin;

	f_adder f_adder_01(.a(a[0]), .b(b[0]), .c_in(c[0]), .s(s[0]), .c_out(c[1]));
	f_adder f_adder_02(.a(a[1]), .b(b[1]), .c_in(c[1]), .s(s[1]), .c_out(c[2]));
	f_adder f_adder_03(.a(a[2]), .b(b[2]), .c_in(c[2]), .s(s[2]), .c_out(c[3]));
	f_adder f_adder_04(.a(a[3]), .b(b[3]), .c_in(c[3]), .s(s[3]), .c_out(c[4]));

	assign cout = c[4];

endmodule


module f_adder(a, b, c_in, s, c_out);

	input a;
	input b;
	input c_in;

	output s;
	output c_out;

	assign s = a ^ b ^ c_in;
	assign c_out = (a & b)|(b & c_in)|(a & c_in);

endmodule
