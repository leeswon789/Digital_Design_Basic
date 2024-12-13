compile:
	xmvlog -MESS -linedebug ./*.v

elab:
	xmelab -MESS -access rwc clock_gen

sim:
	xmsim clock_gen -gui

all: compile elab sim 
	
