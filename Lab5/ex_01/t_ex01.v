`timescale 1ns/1ns

module t_ex01;

	wire [2:0] s; 
	wire u; 
	wire v; 
	wire w; 
	wire x; 
	wire y; 
	wire m_a;
	wire m_b;
	wire [2:0] m_c;
	wire [2:0] u_c; 
	wire [2:0] v_c; 
	wire [2:0] w_c; 
	wire [2:0] x_c; 
	wire [2:0] y_c; 
	
	reg [2:0] t_s;
	reg [6:0] t_data;

	assign s = t_s; 
	assign u = t_data[0]; 
	assign v = t_data[1]; 
	assign w = t_data[2]; 
	assign x = t_data[3]; 
	assign y = t_data[4]; 

	assign u_c = t_data[2:0]; 
	assign v_c = t_data[3:1]; 
	assign w_c = t_data[4:2]; 
	assign x_c = t_data[5:3]; 
	assign y_c = t_data[6:4]; 

	ex01_a ex01_a_01 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .m(m_a));


	ex01_b #(.DATA_WIDTH(1)) 
		ex01_b_01 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .m(m_b));


	ex01_c #(.DATA_WIDTH(3)) 
		ex01_c_01 (.s(s), .u(u_c), .v(v_c), .w(w_c), .x(x_c), .y(y_c), .m(m_c));

	initial begin
		# 10 t_s = 3'b000;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000001;
		# 10 t_data = 7'b1110001;
		# 10 
		# 10 t_s = 3'b001;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000010;
		# 10 t_data = 7'b1100011;
		# 10 t_s = 3'b010;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000011;
		# 10 t_data = 7'b1000111;
		# 10 t_s = 3'b011;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000100;
		# 10 t_data = 7'b0001111;
		# 10 t_s = 3'b100;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000101;
		# 10 t_data = 7'b0011110;
		# 10 t_s = 3'b101;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000110;
		# 10 t_data = 7'b0111100;
		# 10 t_s = 3'b110;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000111;
		# 10 t_data = 7'b1111000;
		# 10 t_s = 3'b111;
			 t_data = 7'b0000000;
		# 10 t_data = 7'b0000001;
		# 10 t_data = 7'b1110001;
		
		# 20 $finish;
	end

	initial begin
		$vcdplusfile ("Ex01_Waveform.vpd");
		$vcdpluson();
	end

endmodule
