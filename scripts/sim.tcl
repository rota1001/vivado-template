log_wave -recursive *

open_vcd wave.vcd

log_vcd [get_objects *]

run all

close_vcd

exit
