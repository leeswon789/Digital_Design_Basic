`timescale 1ns / 1ps

module tb_sn54ls32 () ;
wire o_1Y	;
wire o_2Y	;
wire o_3Y	;
wire o_4Y	;
reg i_1A	;
reg i_1B	;
reg i_2A	;
reg i_2B	;
reg i_3A	;
reg i_3B	;
reg i_4A	;
reg i_4B	;

SN54LS32 DUT
( 	
	.o_1Y(o_1Y), 
	.o_2Y(o_2Y), 
	.o_3Y(o_3Y), 
	.o_4Y(o_4Y),
	.i_1A(i_1A), 
	.i_1B(i_1B), 
	.i_2A(i_2A), 
	.i_2B(i_2B), 
	.i_3A(i_3A), 
	.i_3B(i_3B), 
	.i_4A(i_4A), 	
	.i_4B(i_4B)
);

initial begin

 
i_1A = 1'b0; i_1B = 1'b0;

#10 
i_1A = 1'b0; i_1B = 1'b1;

#10
i_1A = 1'b1; i_1B = 1'b0;

#10
i_1A = 1'b1; i_1B = 1'b1;

#70
$finish;

end 

endmodule 
