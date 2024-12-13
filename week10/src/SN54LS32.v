`timescale 1ns / 1ps

module SN54LS32 (
//port list
	o_1Y,
	o_2Y,
	o_3Y,
	o_4Y,
	i_1A,
	i_1B,
	i_2A,
	i_2B,
	i_3A,
	i_3B,
	i_4A,
	i_4B,
);

//port declaration
output o_1Y, o_2Y, o_3Y, o_4Y ;
input i_1A, i_1B, i_2A, i_2B, i_3A, i_3B, i_4A, i_4B;

//modeling

assign o_1Y = i_1A | i_1B;
assign o_2Y = i_2A | i_2B;
assign o_3Y = i_3A | i_3B;
assign o_4Y = i_4A | i_4B;

endmodule
