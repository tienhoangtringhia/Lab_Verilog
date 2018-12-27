module ex07 (clk, rst_n, w, out);

	input clk;
	input rst_n;
	input w;

	output out;

	parameter ST_A = 4'b1111;
	parameter ST_B = 4'b0000;
	parameter ST_C = 4'b0001;
	parameter ST_D = 4'b0010;
	parameter ST_E = 4'b0011;
	parameter ST_F = 4'b1000;
	parameter ST_G = 4'b1001;
	parameter ST_H = 4'b1010;
	parameter ST_I = 4'b1011;

	reg  out;

	reg  [4:0] next_state;
	reg  [4:0] state;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			state <= ST_A;
		end
		else begin
			if(state!=next_state) begin
				state <= next_state;
			end
		end
	end

	always @(*) begin
		case(state)
			ST_A: begin
				next_state = w ? ST_F : ST_B;
			end
			ST_B,ST_C,ST_D: begin
				next_state = w ? ST_F : (state + 1'b1);
			end
			ST_F,ST_G,ST_H: begin
				next_state = w ? (state + 1'b1) : ST_B;
			end
			ST_E: begin
				next_state = w ? ST_F : ST_E;
			end
			ST_I: begin
				next_state = w ? ST_I : ST_B;
			end
			default: begin
				next_state = ST_A;
			end
		endcase
	end

	reg [7:0] STATE_CHAR;

	always@*begin
		case(state)
			ST_A: begin
					STATE_CHAR = "A";
			end
			ST_B: begin
					STATE_CHAR = "B";
			end
			ST_C: begin
					STATE_CHAR = "C";
			end
			ST_D: begin
					STATE_CHAR = "D";
			end
			ST_E: begin
					STATE_CHAR = "E";
			end
			ST_F: begin
					STATE_CHAR = "F";
			end
			ST_G: begin
					STATE_CHAR = "G";
			end
			ST_H: begin
					STATE_CHAR = "SH";
			end
			ST_I: begin
					STATE_CHAR = "I";
			end
			default: begin
					STATE_CHAR = "X";
			end
		endcase
	end
	
	always @(*) begin
		case(state)
			ST_I,ST_E: begin
				out =  1'b1;
			end
			default: begin
				out =  1'b0;
			end
		endcase
	end

endmodule
