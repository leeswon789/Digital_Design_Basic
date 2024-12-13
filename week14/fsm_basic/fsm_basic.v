`timescale 1ns / 1ps
module fsm_basic (
	clk, 
	rst_n, 
	in_run, 
	out_done
);

// port declaration
input clk;
input rst_n;
input in_run; 
output out_done;

// local parameter
localparam IDLE = 2'b00;
localparam RUN  = 1'b01;
localparam DONE = 2'b10;

// internal vars to store state
reg [1:0] current_state;
reg [1:0] next_state;

// internal signal
wire is_done = 1'b1; // later to be fixed

// modeling #1 : Upadate state
always @(posedge clk, negedge rst_n) 
begin
	if (~rst_n)
	begin
		current_state <= IDLE;
	end
	else
	begin
		current_state <= next_state;
	end
end

// modeling #2 : Get next state
always @(current_state, in_run, is_done) 
begin
	case(current_state)
		IDLE: if(in_run)
				next_state <= RUN;
		RUN	: if(is_done)
				next_state <= DONE;
			  else
				next_state <= RUN;
		DONE : next_state <= IDLE;
		default : next_state <= IDLE;
	endcase
end

// modeling #3 : Get ouput
reg out_done;
always @(current_state) 
begin
	if(current_state == DONE)
		out_done <= 1'b1;
	else
		out_done <= 1'b0;
end
	
endmodule
