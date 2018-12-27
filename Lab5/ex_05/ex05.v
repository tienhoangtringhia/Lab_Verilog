module ex05 (m, q, p);

	input [3:0] m;
	input [3:0] q;

	output [7:0] p;

	wire [4:0]c_in[0:4];
	wire [4:0]m_in[0:4];

	assign m_in[0][4:0] = 5'b00000;
	
	assign c_in[0][0] = 1'b0;
	m_adder m_adder_01(.a(m[0]), .b(q[0]), .m_in(m_in[0][1]), .c_in(c_in[0][0]), .m_out(m_in[1][0]), .c_out(c_in[0][1]));
	m_adder m_adder_02(.a(m[0]), .b(q[1]), .m_in(m_in[0][2]), .c_in(c_in[0][1]), .m_out(m_in[1][1]), .c_out(c_in[0][2]));
	m_adder m_adder_03(.a(m[0]), .b(q[2]), .m_in(m_in[0][3]), .c_in(c_in[0][2]), .m_out(m_in[1][2]), .c_out(c_in[0][3]));
	m_adder m_adder_04(.a(m[0]), .b(q[3]), .m_in(m_in[0][4]), .c_in(c_in[0][3]), .m_out(m_in[1][3]), .c_out(c_in[0][4]));
	assign m_in[1][4] = c_in[0][4];
	assign p[0] = m_in[1][0];
		
	assign c_in[1][0] = 1'b0;
	m_adder m_adder_05(.a(m[1]), .b(q[0]), .m_in(m_in[1][1]), .c_in(c_in[1][0]), .m_out(m_in[2][0]), .c_out(c_in[1][1]));
	m_adder m_adder_06(.a(m[1]), .b(q[1]), .m_in(m_in[1][2]), .c_in(c_in[1][1]), .m_out(m_in[2][1]), .c_out(c_in[1][2]));
	m_adder m_adder_07(.a(m[1]), .b(q[2]), .m_in(m_in[1][3]), .c_in(c_in[1][2]), .m_out(m_in[2][2]), .c_out(c_in[1][3]));
	m_adder m_adder_08(.a(m[1]), .b(q[3]), .m_in(m_in[1][4]), .c_in(c_in[1][3]), .m_out(m_in[2][3]), .c_out(c_in[1][4]));
	assign m_in[2][4] = c_in[1][4];
	assign p[1] = m_in[2][0];

	assign c_in[2][0] = 1'b0;
	m_adder m_adder_09(.a(m[2]), .b(q[0]), .m_in(m_in[2][1]), .c_in(c_in[2][0]), .m_out(m_in[3][0]), .c_out(c_in[2][1]));
	m_adder m_adder_10(.a(m[2]), .b(q[1]), .m_in(m_in[2][2]), .c_in(c_in[2][1]), .m_out(m_in[3][1]), .c_out(c_in[2][2]));
	m_adder m_adder_11(.a(m[2]), .b(q[2]), .m_in(m_in[2][3]), .c_in(c_in[2][2]), .m_out(m_in[3][2]), .c_out(c_in[2][3]));
	m_adder m_adder_12(.a(m[2]), .b(q[3]), .m_in(m_in[2][4]), .c_in(c_in[2][3]), .m_out(m_in[3][3]), .c_out(c_in[2][4]));
	assign m_in[3][4] = c_in[2][4];
	assign p[2] = m_in[3][0];

	assign c_in[3][0] = 1'b0;
	m_adder m_adder_13(.a(m[3]), .b(q[0]), .m_in(m_in[3][1]), .c_in(c_in[3][0]), .m_out(m_in[4][0]), .c_out(c_in[3][1]));
	m_adder m_adder_14(.a(m[3]), .b(q[1]), .m_in(m_in[3][2]), .c_in(c_in[3][1]), .m_out(m_in[4][1]), .c_out(c_in[3][2]));
	m_adder m_adder_15(.a(m[3]), .b(q[2]), .m_in(m_in[3][3]), .c_in(c_in[3][2]), .m_out(m_in[4][2]), .c_out(c_in[3][3]));
	m_adder m_adder_16(.a(m[3]), .b(q[3]), .m_in(m_in[3][4]), .c_in(c_in[3][3]), .m_out(m_in[4][3]), .c_out(c_in[3][4]));
	assign m_in[4][4] = c_in[3][4];
	assign p[3] = m_in[4][0];
	
	assign p[4] = m_in[4][1];
	assign p[5] = m_in[4][2];
	assign p[6] = m_in[4][3];
	assign p[7] = m_in[4][4];

endmodule


module m_adder(a, b, m_in, c_in, m_out, c_out);

	input a;
	input b;
	input m_in;
	input c_in;

	output m_out;
	output c_out;
	
	wire c;
	assign c = a & b; 

	assign m_out = c ^ m_in ^ c_in;
	assign c_out = (c & m_in)|(m_in & c_in)|(c_in & c);

endmodule
