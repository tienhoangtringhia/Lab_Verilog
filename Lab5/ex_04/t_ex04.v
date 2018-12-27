`timescale 1ns/1ns

module t_ex04;

	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	wire [3:0] s;
	wire cout;

	ex04 ex04_01(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

	initial begin
		#0  cin = 0;
			a = 0;
			b = 0;
		#20 a = 1;
			b = 0;
		#20 a = 0;
			b = 1;
		#20 a = 1;
			b = 1;
		#20 a = 1;    
			b = 2;
		#20 a = 3;
			b = 4;
		#20 a = 5;
			b = 6;
		#20 a = 7;
			b = 8;
		#20 a = 9;
			b = 10;
		#20 a = 11;
			b = 12;
		#20 a = 13;
			b = 14;
		#20 a = 15;
			b = 15;
		#20 cin = 1;
			a = 0;
			b = 0;
		#20 a = 1;
			b = 0;
		#20 a = 0;
			b = 1;
		#20 a = 1;
			b = 1;
		#20 a = 1;    
			b = 2;
		#20 a = 3;
			b = 4;
		#20 a = 5;
			b = 6;
		#20 a = 7;
			b = 8;
		#20 a = 9;
			b = 10;
		#20 a = 11;
			b = 12;
		#20 a = 13;
			b = 14;
		#20 a = 15;
			b = 15;
		#20  $finish;    
	end

	initial begin
		$vcdplusfile ("Ex4_Waveform.vpd");
		$vcdpluson();
	end

endmodule
