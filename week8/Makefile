clean: 
	rm -rf cds.lib hdl.var *.lib waves.shm *.log *.key
set: 
	touch cds.lib hdl.var
	mkdir ./SN54LS153.lib
	echo "define SN54LS153_lib ./SN54LS153.lib" >> ./cds.lib
	echo "define WORK SN54LS153_lib" >> ./hdl.var
compile:
	xmvlog -MESS -linedebug ./*v
elab:
	xmelab -MESS -access rwc tb_sn54ls153

sim:
	xmsim -MESS tb_sn54ls153


all: clean set compile elab sim
