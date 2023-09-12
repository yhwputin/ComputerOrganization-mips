onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_cpu/clk
add wave -noupdate /testbench_cpu/rst
add wave -noupdate -radix hexadecimal /testbench_cpu/My_CPU/PC
add wave -noupdate -radix hexadecimal /testbench_cpu/My_CPU/My_IM/dout
add wave -noupdate /testbench_cpu/My_CPU/My_GPR/writereg
add wave -noupdate /testbench_cpu/My_CPU/My_GPR/we
add wave -noupdate -radix hexadecimal /testbench_cpu/My_CPU/My_GPR/register
add wave -noupdate -radix hexadecimal /testbench_cpu/My_CPU/My_DM/addr
add wave -noupdate /testbench_cpu/My_CPU/My_DM/we
add wave -noupdate -radix hexadecimal /testbench_cpu/My_CPU/My_DM/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {545 ns} 0}
configure wave -namecolwidth 245
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1280 ns}
