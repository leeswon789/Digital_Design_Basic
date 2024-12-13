`timescale 1ns / 1ps
module tb_initial ();

reg x, y, a, b, m;

// #1 block
initial 	      //t=0
	m = 1'b0;

// #2  block
initial begin 	      //t=0 
	a = 1'b0;     //a=0
	b = 1'b0;     //b=0
	#5 a = 1'b1;  //t=5
	#25 b = 1'b0; //t=30
	#10 a = 1'b0; //t=40
end

// #3 block
initial begin 	      //t=0
	x = 1'b0;     //x=0
	y = 1'b0;     //y=0
	#10 x = 1'b0; //t=5
	#25 y = 1'b1; //t=30
end

// #4 block;
initial 	     //t=0
	#50 $finish; //t=50

endmodule
