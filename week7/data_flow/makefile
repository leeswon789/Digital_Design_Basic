clean: 
	rm -rf xcelium.d *.log *.history *.key
	rm -rf worklib cds.lib hdl.var
	rm -rf *.lib *.shm
set:
	mkdir ./worklib
	touch ./cds.lib
	touch ./hdl.var
	chmod +x cds.lib
	chmod +x hdl.var
	echo "define MUX4X1_lib ./worklib" >> cds.lib
	echo "define WORK MUX4X1_lib" >> hdl.var

compile:
	echo "----------Compile source files----------"
	xmvlog -MESS -linedebug ./*.v
	echo "----------End of compilation----------"

elab: 
	echo "----------Elaboration Design in the WORK library----------"
	xmelab -MESS -access +rwc tb_mux4x1
	echo "----------End of Elaboration----------"

sim: 
	echo "----------Simulation in GUI mode----------"
	xmsim -MESS tb_mux4x1 -gui
	echo "----------End of Simulation + Start GUI"

all: clean set compile elab sim
