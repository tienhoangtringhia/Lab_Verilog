module ex03 (ena, clk, rst_n, trigger);

	input clk;
	input rst_n;
	input ena;

	output trigger;

	wire [3:0] w_ena;
	wire [3:0] w_q;

	assign w_ena[0] = ena;

	d_ff d_ff_01(.clk(clk), .rst_n(rst_n), .d(w_ena[0]), .q(w_q[0]) );
	assign w_ena[1] = w_ena[0] && w_q[0];
	
	d_ff d_ff_02(.clk(clk), .rst_n(rst_n), .d(w_ena[1]), .q(w_q[1]) );
	assign w_ena[2] = w_ena[1] && w_q[1];
	
	d_ff d_ff_03(.clk(clk), .rst_n(rst_n), .d(w_ena[2]), .q(w_q[2]) );
	assign w_ena[3] = w_ena[2] && w_q[2];
	
	d_ff d_ff_04(.clk(clk), .rst_n(rst_n), .d(w_ena[3]), .q(w_q[3]) );
	
	assign trigger = w_q[3];

endmodule


module d_ff (clk, rst_n, d, q);

	input clk;
	input rst_n;
	input d;

	output q;

	reg q;

	always @(posedge clk or negedge rst_n) 
	begin
		if (!rst_n) begin
			q <= 0;
		end
		else begin
			q <= d;
		end
	end

endmodule
