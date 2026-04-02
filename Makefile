build:
	mkdir -p build
	vivado -mode batch -source scripts/build.tcl -nolog -nojournal

flash:
	vivado -mode batch -source scripts/program.tcl -nolog -nojournal

clean:
	rm build/*

.PHONY: build flash
