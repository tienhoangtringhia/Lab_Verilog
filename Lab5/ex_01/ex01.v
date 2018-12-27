module ex01_a(s, u, v, w, x, y, m);

	parameter MUX_WIDTH = 3;

	input [MUX_WIDTH-1:0] s;
	input u;
	input v;
	input w;
	input x;
	input y;
	output m;

	wire uv;   
	wire wx; 
	wire uvwx_s1; 

	assign uv = s[0] ? v : u ;
	assign wx = s[0] ? x : w ;
	assign uvwx_s1 = s[1] ? wx : uv ;
	assign m = s[2] ? y : uvwx_s1 ;

endmodule


module ex01_b(s, u, v, w, x, y, m);

	parameter MUX_WIDTH = 3;
	parameter DATA_WIDTH = 1;

	input  [MUX_WIDTH-1:0] s;
	input  [DATA_WIDTH-1:0] u;
	input  [DATA_WIDTH-1:0] v;
	input  [DATA_WIDTH-1:0] w;
	input  [DATA_WIDTH-1:0] x;
	input  [DATA_WIDTH-1:0] y;

	output [DATA_WIDTH-1:0] m;

	reg    [DATA_WIDTH-1:0] m;

	always @(*)
	begin
		case(s)
			3'b000: begin
				m = u;
			end
			3'b001: begin
				m = v;
			end
			3'b010: begin
				m = w;
			end
			3'b011: begin
				m = x;
			end
			default: begin
				m = y;
			end
		endcase
	end

endmodule


module ex01_c(s, u, v, w, x, y, m);

	parameter MUX_WIDTH = 3;
	parameter DATA_WIDTH = 3;

	input  [MUX_WIDTH-1:0] s;

	input  [DATA_WIDTH-1:0] u;
	input  [DATA_WIDTH-1:0] v;
	input  [DATA_WIDTH-1:0] w;
	input  [DATA_WIDTH-1:0] x;
	input  [DATA_WIDTH-1:0] y;

	output [DATA_WIDTH-1:0] m;

	reg    [DATA_WIDTH-1:0] m;

	always @(*)
	begin
		case(s)
			3'b000: begin
				m = u;
			end
			3'b001: begin
				m = v;
			end
			3'b010: begin
				m = w;
			end
			3'b011: begin
				m = x;
			end
			default: begin
				m = y;
			end
		endcase
	end

endmodule
