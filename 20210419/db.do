vcom CB4RE.vhd 

vsim -t ns cb4re 

add wave -ports * 
add wave -hex {Q{Q3 Q2 Q1 Q0}}
add wave -divider "internals"
add wave -internals *

force CLK 0,1 10 repeat 20
force RST 0
force CE 0
run 100 
force RST 1, 0 60
run 100
force CE 1, 0 300, 1 360
run 500
force RST 1, 0 60
ru 100