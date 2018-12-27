`timescale 1ns/1ns

	module t_ex05;
	reg [3:0] a;
	reg [3:0] b;

	wire [7:0] p;

	ex05 ex05_01(.m(a), .q(b), .p(p));

	initial begin
		#0  a = 0;
			b = 0;
		#50 a = 1;
			b = 0;
		#50 a = 2;    
		    b = 6;
		#50 a = 1;
			b = 8;
		#50 a = 1;
			b = 1;
		#50 a = 7;
			b = 2;
		#50 a = 4;
			b = 5;
		#50 a = 1;
			b = 8;
		#50 a = 3;
			b = 6;
		#50 a = 8;
			b = 7;
		#50 a = 8;
			b = 8;
		#50 a = 10;
			b = 7;
		#50 a = 11;
			b = 9;
		#50 a = 14;
			b = 10;
		#50 a = 15;
			b = 0;
		#50 a = 4;
			b = 11;
		#50 a = 15;
			b = 15;
		#50 $finish;    
	end

	initial begin
		$vcdplusfile ("Ex5_Waveform.vpd");
		$vcdpluson();
	end

endmodule
