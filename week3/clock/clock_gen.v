// oscillation
`timescale 1ns / 1ps // delay + precision

module clock_gen();
	reg clk;

	always
	   #5 clk = ~clk; // 5ns togle -> 10ns
	
	initial begin // t = 0;
	   clk = 1'b0;

	#100
	$finish;

	end

	endmodule
