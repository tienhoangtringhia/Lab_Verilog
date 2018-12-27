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
	reg [2:0] t_data;
	reg t_clk;

	assign s = t_s; 
	assign u = t_data; 
	assign v = t_data; 
	assign w = t_data; 
	assign x = t_data; 
	assign y = t_data; 
  
  always begin
        #0 t_clk = 0;
        #10 t_clk = 1;
        #10;
  end

	ex02 ex02 (.s(s), .u(u), .v(v), .w(w), .x(x), .y(y), .clk(t_clk), .led7_out(led));

	initial begin
		# 20 t_s = 3'b000;
			 t_data = 3'b000;
		# 20 t_data = 3'b001;
		# 20 t_data = 3'b010;
		
		# 20 t_s = 3'b001;
			 t_data = 3'b011;
		# 20 t_data = 3'b100;
		# 20 t_data = 3'b101;
		
		# 20 t_s = 3'b010;
			 t_data = 3'b110;
		# 20 t_data = 3'b111;
		# 20 t_data = 3'b000;
		
		# 20 t_s = 3'b011;
			 t_data = 3'b001;
		# 20 t_data = 3'b010;
		# 20 t_data = 3'b011;
		
		# 20 t_s = 3'b100;
			 t_data = 3'b100;
		# 20 t_data = 3'b101;
		# 20 t_data = 3'b110;
		
		# 20 t_s = 3'b101;
			 t_data = 3'b111;
		# 20 t_data = 3'b000;
		# 20 t_data = 3'b001;
		
		# 20 t_s = 3'b110;
			 t_data = 3'b010;
		# 20 t_data = 3'b011;
		# 20 t_data = 3'b100;
		
		# 20 t_s = 3'b111;
			 t_data = 3'b101;
		# 20 t_data = 3'b110;
		# 20 t_data = 3'b111;
		
		# 40 $finish;
	end

	initial begin
			$vcdplusfile ("Ex2_WaveForm.vpd");
			$vcdpluson();
	end

endmodule
