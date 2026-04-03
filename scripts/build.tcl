if {[info exists ::env(TOP)]} {
    set top_module $::env(TOP)
} else {
    error "ERROR: Please specify top module with TOP="
}

set_part xc7k325tffg676-2

read_verilog [glob ./src/*.v]
read_xdc ./xdc/pins.xdc

if {[info exists ::env(TOP)]} {
    set top_module $::env(TOP)
} else {
    set top_module "main"
}

synth_design -top "$top_module" -part xc7k325tffg676-2

opt_design
place_design
route_design

write_bitstream -force ./build/output.bit

exit
