`timescale 1ns/1ns

module t_ex06;

	reg t_clk;
	reg t_rst_n;
	reg t_w;

	wire t_out;

	always begin
		#0  t_clk = 0;
		#10 t_clk = 1;
		#10;
	end

	ex06 ex06(.clk(t_clk), .rst_n(t_rst_n), .w(t_w), .out(t_out));

	initial begin
		#0   t_rst_n = 0; 
			 t_w = 0; // ST_A
		#20  t_rst_n = 1; 
			 t_w = 0; // ST_B
		#20  t_w = 1; // ST_F
		#20  t_w = 0; // ST_B
		#20  t_w = 0; // ST_C
		#20  t_w = 0; // ST_C
		#20  t_w = 1; // ST_F
		#20  t_rst_n = 0;
			 t_w = 0; // ST_A -> ST_A
		#40  t_rst_n = 1;
			 t_w = 0; // ST_B -> ST_C
		#40  t_w = 1; // ST_F
		#20  t_w = 1; // ST_F -> ST_F -> ST_F
		#60  t_w = 0; // ST_B
		#20  t_w = 0; // ST_C -> ST_C -> ST_C -> ST_C
		#80  t_w = 1; // ST_F
		#100 $finish;
	end

	initial begin
		$vcdplusfile ("Ex6_Waveform.vpd");
		$vcdpluson();
	end

endmodule
