`timescale 1ns/1ns

module t_ex07;

	reg t_clk;
	reg t_rst_n;
	reg t_w;

	wire t_out;

	always begin
		#0  t_clk = 0;
		#10 t_clk = 1;
		#10;
	end

	ex07 ex07(.clk(t_clk), .rst_n(t_rst_n), .w(t_w), .out(t_out));

	initial begin
		#0   t_rst_n = 0;
			 t_w = 0; // ST_A
		#20  t_rst_n = 1;
			 t_w = 0; // ST_B
		#20  t_w = 0; // ST_C
		#20  t_w = 1; // ST_F
		#20  t_w = 0; // ST_B -> ST_C
		#40  t_w = 1; // ST_F
		#20  t_w = 0; // ST_B -> ST_C -> ST_D 
		#60  t_w = 1; // ST_F
		#20  t_w = 0; // ST_B -> ST_C -> ST_D -> ST_E
		#80  t_w = 0; // ST_E
		#20  t_rst_n = 0;
			 t_w = 1; // ST_A -> ST_A
		#40  t_rst_n = 1;
			 t_w = 1; // ST_F
		#20  t_w = 0; // ST_B 
		#20  t_w = 1; // ST_F -> ST_G
		#40  t_w = 0; // ST_B
		#20  t_w = 1; // ST_F -> ST_G -> ST_H
		#60  t_w = 0; // ST_B
		#20  t_w = 1; // ST_F -> ST_G -> ST_H -> ST_I
		#80  t_w = 1; // ST_I -> ST_I -> ST_I
		#60 $finish;
	end

	initial begin
		$vcdplusfile ("Ex7_Waveform.vpd");
		$vcdpluson();
	end

endmodule
