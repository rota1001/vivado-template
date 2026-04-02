TEST_BENCH=main_tb

build:
	mkdir -p build
	vivado -mode batch -source scripts/build.tcl -nolog -nojournal

flash:
	vivado -mode batch -source scripts/program.tcl -nolog -nojournal

sim:
	cd build && xvlog ../src/*.v ../tb/*.v && \
		xelab -debug typical -top $(TEST_BENCH) -snapshot $(TEST_BENCH)_snap && \
		xsim $(TEST_BENCH)_snap -tclbatch ../scripts/sim.tcl

clean:
	rm build/*

.PHONY: build flash sim
