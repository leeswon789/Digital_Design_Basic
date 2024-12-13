`timescale 1ns / 1ps

module SN54LS153 (
	// port list
	o_1Y	, 	//out out	
	o_2Y	, 
	i_B	, 	// select
	i_A	, 
	i_1G	, 	//strobe(active low)
	i_2G	, 
	i_1C0	, 	//input for 0_1Y
	i_1C1	, 
	i_1C2	, 
	i_1C3	, 
	i_2C0	,  	//input for 0_2Y
	i_2C1	, 
	i_2C2	, 
	i_2C3


);
//port declaration
output 	o_1Y		;
output 	o_2Y		;
input 	i_B		;
input 	i_A		;
input 	i_1G		;
input 	i_2G		;
input 	i_1C0		;
input 	i_1C1		;
input 	i_1C2		;
input 	i_1C3		;
input 	i_2C0		;
input 	i_2C1		;
input 	i_2C2		;
input 	i_2C3		;


// modeling(data flow: SOP)
assign o_1Y = ( ~i_B & ~i_A & i_1C0 & ~i_1G ) |
			  ( ~i_B & i_A  & i_1C1 & ~i_1G ) |
			  ( i_B  & ~i_A & i_1C2 & ~i_1G ) |
			  ( i_B  & i_A  & i_1C3 & ~i_1G ) ;

assign o_2Y = ( ~i_B & ~i_A & i_2C0 & ~i_2G ) |
			  ( ~i_B & i_A  & i_2C1 & ~i_2G ) |
			  ( i_B  & ~i_A & i_2C2 & ~i_2G ) |
			  ( i_B  & i_A  & i_2C3 & ~i_2G ) ;



endmodule
