`timescale 1ns / 1ps

module tb_sn54ls153;

// signal definition
wire 	out_1Y, out_2Y;	//output
reg 	sel1, sel0; // select
reg 	stb_1G_n, stb_2G_n; //strobe(active low)
reg 	in_1C0, in_1C1, in_1C2, in_1C3;	// data input to the first mux
reg 	in_2C0, in_2C1, in_2C2, in_2C3; // data input to the second mux

// DUT instantiation
SN54LS153 DUT (
	.o_1Y	(out_1Y		), 
	.o_2Y	(out_2Y		), 
	.i_B	(sel1		), 
	.i_A	(sel0		), 
	.i_1G	(stb_1G_n	), 
	.i_2G	(stb_2G_n	), 
	.i_1C0	(in_1C0		), 
	.i_1C1	(in_1C1		), 
	.i_1C2	(in_1C2		), 
	.i_1C3	(in_1C3		), 
	.i_2C0	(in_2C0		), 
	.i_2C1	(in_2C1		), 
	.i_2C2	(in_2C2		), 
	.i_2C3	(in_2C3		)
);
	
// task for repetitive work
task disp;
	begin
	$display
	(
		"$time=%0d", $time, " ns"
		, " strobe = |", stb_1G_n
		, " sel1 = ", sel1
		, " sel0 = |", sel0
		, " in_c0 = ", in_1C0
		, " in_c1 = ", in_1C1
		, " in_c2 = ", in_1C2
		, " in_c3 = |", in_1C3
		, " out = ", out_1Y
	);
	end
endtask

// input stimulus
initial begin
	
	stb_1G_n = 1'b1; sel1 = 1'b0; sel0 = 1'b0; in_1C0 = 1'b0; in_1C1 = 1'b0; in_1C2 = 1'b0; in_1C3 = 1'b0; #10; disp;
	
	stb_1G_n = 1'b0; sel1 = 1'b0; sel0 = 1'b0; in_1C0 = 1'b1; in_1C1 = 1'b0; in_1C2 = 1'b0; in_1C3 = 1'b0; #10; disp;
	
	stb_1G_n = 1'b0; sel1 = 1'b0; sel0 = 1'b1; in_1C0 = 1'b0; in_1C1 = 1'b1; in_1C2 = 1'b0; in_1C3 = 1'b0; #10; disp;
	
	stb_1G_n = 1'b0; sel1 = 1'b1; sel0 = 1'b0; in_1C0 = 1'b0; in_1C1 = 1'b0; in_1C2 = 1'b1; in_1C3 = 1'b0; #10; disp;
	
	stb_1G_n = 1'b0; sel1 = 1'b1; sel0 = 1'b1; in_1C0 = 1'b0; in_1C1 = 1'b0; in_1C2 = 1'b0; in_1C3 = 1'b1; #10; disp;
	$finish;
end

endmodule
