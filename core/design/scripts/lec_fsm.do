read design /home/student/EMC08/digital_A/core/design/rtl_v/core_fsm.v -Verilog -Golden   -sensitive
read library -Revised -sensitive -Liberty   -Statetable /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
read design  -Revised -sensitive -Verilog2K /home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_netlist.v        

set rule handling DIR6.1 -Ignore
set rule handling RTL10 -Ignore
set rule handling RTL12 -Ignore
set rule handling HRC1.4  -ignore

set system mode lec
add renaming rule rule0 "\/U\$1" "" -map -revised
add compare points -all
compare
