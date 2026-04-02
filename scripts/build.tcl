set_part xc7k325tffg676-2

read_verilog [glob ./src/*.v]
read_xdc ./xdc/pins.xdc

synth_design -top main -part xc7k325tffg676-2

opt_design
place_design
route_design

write_bitstream -force ./build/output.bit

exit
