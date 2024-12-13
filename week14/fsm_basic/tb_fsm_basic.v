`timescale 1ns / 1ps
module tb_fsm_basic ();

reg clk;
reg rst_n;
reg in_run;
wire out_done; // connected to the output

// DUT instantiation
fsm_basic DUT (
	.clk(clk), 
	.rst_n(rst_n), 
	.in_run(in_run), 
	.out_done(out_done)
);

// generate clock
always #5 clk = ~clk;

// apply stimulus
initial begin
// init(t=0)
$display("INIT value: [%d]", $time);
	rst_n <= 1'b1;
	clk <= 1'b0;
	in_run <= 1'b0;

// reset ON(async)
#200
	$display("Reset ON: [%d]", $time);
	rst_n <= 1'b0;
#10
	rst_n <= 1'b1;
#10
@(posedge clk); // t=225ns
$display("RUN!: [%d]", $time);
	in_run <= 1'b1;
@(posedge clk); // t=235ns
	in_run <= 1'b0;

#200 // t=435ns
$display("DONE!: [%d]", $time);
$finish;
end



	
endmodule
