`timescale 1ns/1ns

module t_ex03;

	reg t_clk;
	reg t_rst_n;
	reg t_ena;

	wire t_trigger;

	always begin
		#0  t_clk = 0;
		#10 t_clk = 1;
		#10;
	end

	ex03 ex03_01(.clk(t_clk), .rst_n(t_rst_n), .ena(t_ena), .trigger(t_trigger));

	initial begin
		#0  t_rst_n = 0;
			t_ena = 0;
		#20 t_rst_n = 1;
			t_ena = 0;
		#20 t_ena = 1;
		#200 t_rst_n = 0;
    #20 t_rst_n = 1; 
    #20 t_ena = 0;
		#20 t_ena = 1;
		#180 t_ena = 0;
		#20 t_ena = 1;
		#160 t_ena = 0;
		#20 t_ena = 1;
		#140 t_ena = 0;
		#20 t_ena = 1;
		#120 t_ena = 0;
		#20 t_ena = 1; 
		#100 t_ena = 0;	
		#20 t_ena = 1;
		#80 t_ena = 0;
		#20 t_ena = 1; 
		#60 t_ena = 0;
		#20 t_ena = 1; 
		#40 t_ena = 0;
		#20 t_ena = 1;
		#20 t_ena = 0;
		#20 t_rst_n = 0;
			t_ena = 0;
		#20 t_rst_n = 1;
			t_ena = 0;
		#20 $finish;
	end

	initial begin
		$vcdplusfile ("Ex3_WaveForm.vpd");
		$vcdpluson();
	end

endmodule
