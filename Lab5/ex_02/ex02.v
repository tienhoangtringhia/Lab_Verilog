module ex02 (s, u, v, w, x, y, clk, led7_out);

	parameter MUX_WIDTH = 3;
	parameter DATA_WIDTH = 3;

	input [MUX_WIDTH-1:0] s;
	input [DATA_WIDTH-1:0] u;
	input [DATA_WIDTH-1:0] v;
	input [DATA_WIDTH-1:0] w;
	input [DATA_WIDTH-1:0] x;
	input [DATA_WIDTH-1:0] y;
  input clk;

	output [6:0] led7_out;

	wire [DATA_WIDTH-1:0] m;
	wire [DATA_WIDTH-1:0] led7_in;

	mux_5 #(.DATA_WIDTH(3)) 
		mux_5_01 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .m(m));

	signal signal (.clk(clk), .d(m), .qa(led7_in));

	led7_segment_decoder led7_segment_decoder (.in(led7_in), .out(led7_out));

endmodule


module signal (clk, d, qa);

	input clk;
	input [2:0] d;
	
	output [2:0] qa;
	
	reg [2:0] qa;
	
	initial
	begin
		qa = 3'b000;
	end
	
	always @(posedge clk)
	begin
		qa <= d;
	end

endmodule


module mux_5 (s, u, v, w, x, y, m);

	parameter MUX_WIDTH = 3;
	parameter DATA_WIDTH = 3;
	
	input [MUX_WIDTH-1 :0] s;
	input [DATA_WIDTH-1:0] u;
	input [DATA_WIDTH-1:0] v;
	input [DATA_WIDTH-1:0] w;
	input [DATA_WIDTH-1:0] x;
	input [DATA_WIDTH-1:0] y;

	output [DATA_WIDTH-1:0] m;

	reg [DATA_WIDTH-1:0] m;

	always @(*)
	begin
		case(s)
			3'b000: begin
				m <= u;
			end
			3'b001: begin
				m <= v;
			end
			3'b010: begin
				m <= w;
			end
			3'b011: begin
				m <= x;
			end
			default: begin
				m <= y;
			end
		endcase
	end

endmodule


module led7_segment_decoder (in , out);

	input  [2:0]in;

	output [6:0]out;

	reg    [6:0]out;

	always @(*)
	begin
		case(in)
			3'b000: begin
				out = 7'b0111111;
			end
			3'b001: begin
				out = 7'b0000110;
			end
			3'b010: begin
				out = 7'b1011011;
			end
			3'b011: begin
				out = 7'b1001111;
			end
			3'b100: begin
				out = 7'b1100110;
			end
			3'b101: begin
				out = 7'b1101101;
			end
			3'b110: begin
				out = 7'b1111101;
			end
			3'b111: begin
				out = 7'b0000111;
			end
			default: begin
				out = 7'b0000000;
			end
		endcase
	end

endmodule
