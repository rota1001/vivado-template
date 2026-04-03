TOP=main
TEST_BENCH=main_tb
BUILD=build
WORKDIR=$(shell pwd)

build:
	mkdir -p $(BUILD)
	TOP=$(TOP) vivado -mode batch -source scripts/build.tcl -nolog -nojournal

flash:
	BUILD=$(BUILD) vivado -mode batch -source scripts/program.tcl -nolog -nojournal

sim:
	cd $(BUILD) && xvlog $(WORKDIR)/src/*.v $(WORKDIR)/tb/*.v && \
		xelab -debug typical -top $(TEST_BENCH) -snapshot $(TEST_BENCH)_snap && \
		xsim $(TEST_BENCH)_snap -tclbatch $(WORKDIR)/scripts/sim.tcl

clean:
	rm build/*

.PHONY: build flash sim
