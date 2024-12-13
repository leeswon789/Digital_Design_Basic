clean:
	rm -rf xceliue.d *.log *.history *.key 
	rm -rf worklib cds.lib hdl.var
	rm -rf *.lib *.shm

set:
	mkdir ./sn54ls32.lib
	touch ./cds.lib
	touch ./hdl.var
	chmod +x cds.lib
	chmod +x hdl.var
	echo "define SN54LS32_lib ./sn54ls32.lib" >> cds.lib
	echo "define WORK SN54LS32_lib" >> hdl.var

compile:
	xmvlog -MESS -linedebug ../src/*.v 

elab:
	xmelab -MESS -access +rwc tb_sn54ls32

sim:
	xmsim tb_sn54ls32 -gui

all: clean set compile elab sim
