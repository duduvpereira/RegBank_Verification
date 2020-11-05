vcom testbench.vhd

vsim -novopt -wlf /tmp/testbench -wlfdeleteonquit work.reg_bank_tb

do /home/vlsi1_g07/T2/wave.do
run 2800 ns

