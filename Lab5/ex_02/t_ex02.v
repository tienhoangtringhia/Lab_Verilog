`timescale 1ns/1ns

module t_ex02;

	wire [2:0] s; 
	wire [2:0] u; 
	wire [2:0] v; 
	wire [2:0] w; 
	wire [2:0] x; 
	wire [2:0] y; 
	wire [6:0] led; 
	
	reg [2:0] t_s;
	reg [6:0] t_data;
	reg t_clk;

	assign s = t_s; 
	assign u = t_data[2:0]; 
	assign v = t_data[3:1]; 
	assign w = t_data[4:2];  
	assign x = t_data[5:3];  
	assign y = t_data[6:4]; 
  
  always begin
        #0 t_clk = 0;
        #10 t_clk = 1;
        #10;
  end

	ex02 ex02 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .clk(t_clk), .led7_out(led));

	initial begin
		# 20 t_s = 3'b000;
			 t_data = 7'b1011000;
		# 20 t_data = 7'b1110001;
		# 20 t_data = 7'b1100010;
		
		# 20 t_s = 3'b001;
			 t_data = 7'b0010110;
		# 20 t_data = 7'b1101001;
		# 20 t_data = 7'b1001011;
		
		# 20 t_s = 3'b010;
			 t_data = 7'b0011000;
		# 20 t_data = 7'b0011110;
		# 20 t_data = 7'b1100010;
		
		# 20 t_s = 3'b011;
			 t_data = 7'b1001110;
		# 20 t_data = 7'b1010001;
		# 20 t_data = 7'b0011100;
		
		# 20 t_s = 3'b100;
			 t_data = 7'b1001010;
		# 20 t_data = 7'b1011111;
		# 20 t_data = 7'b1101001;
		
		# 20 t_s = 3'b101;
			 t_data = 7'b1110011;
		# 20 t_data = 7'b1101010;
		# 20 t_data = 7'b1010011;
		
		# 20 t_s = 3'b110;
			 t_data = 7'b1000110;
		# 20 t_data = 7'b0111010;
		# 20 t_data = 7'b0101101;
		
		# 20 t_s = 3'b111;
			 t_data = 7'b0010101;
		# 20 t_data = 7'b0001101;
		# 20 t_data = 7'b1110110;
		
		# 40 $finish;
	end

	initial begin
			$vcdplusfile ("Ex2_WaveForm.vpd");
			$vcdpluson();
	end

endmodule
