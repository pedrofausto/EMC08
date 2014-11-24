read design  -Golden  -sensitive -Verilog2K /home/student/EMC08/digital_A/baud_rate/design/rtl_v/baud_rate.v
read library -Revised -sensitive -Liberty   -Statetable /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
read design  -Revised -sensitive -Verilog2K /home/student/EMC08/digital_A/baud_rate/design/stuctural_v/baud_rate_netlist.v

set system mode setup
set rule handling RTL1.5b -ignore
set rule handling DIR6.1  -ignore
set rule handling HRC1.4  -ignore

set rule handling HRC3.5b -ignore
set rule handling RTL14   -ignore

set system mode lec
add renaming rule rule0 "\/U\$1" "" -map -revised

set system mode setup
set flatten model -seq_constant 

set system mode lec
add compare points -all

map key points

compare

