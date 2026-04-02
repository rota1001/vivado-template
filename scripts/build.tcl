set_part xc7k325tffg676-2

read_verilog [glob ./src/*.v]
read_xdc ./xdc/pins.xdc

if {[info exists ::env(MAIN_TOP)]} {
    set main_top $::env(MAIN_TOP)
} else {
    set main_top "main"
}

synth_design -top "$main_top" -part xc7k325tffg676-2

opt_design
place_design
route_design

write_bitstream -force ./build/output.bit

exit
