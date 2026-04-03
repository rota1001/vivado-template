if {[info exists ::env(BUILD)]} {
    set build $::env(BUILD)
} else {
    error "ERROR: Please specify the build directory with BUILD="
}

open_hw_manager

connect_hw_server

open_hw_target

set fpga [lindex [get_hw_devices] 0]
current_hw_device $fpga

set_property PROGRAM.FILE "$build/output.bit" $fpga
program_hw_devices $fpga

close_hw_target
close_hw_manager
