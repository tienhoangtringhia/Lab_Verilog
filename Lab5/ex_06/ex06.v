module ex06 (clk, rst_n, w, out);

	input clk;
	input rst_n;
	input w;

	output out;

	parameter ST_A = 2'b00;
	parameter ST_B = 2'b01;
	parameter ST_C = 2'b10;
	parameter ST_F = 2'b11;

	reg  out;

	reg  [1:0] next_state;
	reg  [1:0] state;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			state <= ST_A;
		end
		else begin
				if(state != next_state) begin
			state <= next_state;
				end
		end
	end

	always @(*) begin
		case (state)
			ST_A: begin
				next_state = w ? ST_F : ST_B;
			end
			ST_B: begin
				next_state = w ? ST_F : ST_C;
			end
			ST_C: begin
				next_state = w ? ST_F : ST_C;
			end
			ST_F: begin
				next_state = w ? ST_F : ST_B;
			end
			default: begin
				next_state = ST_A;
			end
		endcase
	end

	reg [7:0] STATE_CHAR;
	
	always @*begin
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
        ST_F: begin
                STATE_CHAR = "F";
        end
        default: begin
                STATE_CHAR = "X";
        end
    endcase
	end

	always @(*) begin
		case (state)
			ST_C, ST_F: begin
				out =  1'b1;
			end
			default: begin
				out =  1'b0;
			end
		endcase
	end

endmodule
