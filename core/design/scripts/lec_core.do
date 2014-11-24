read library   -sensitive  -Statetable  -Liberty /home/student/EMC08/common_blocks/ROM/ROM4096X8/ROM4096X8_slow_1_62V_125C.lib   /home/student/EMC08/common_blocks/SRAM/SPRAM128X8/SPRAM128X8_slow_1_62V_125C.lib  /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_slow_1_62V_125C.lib

add notranslate modules ROM4096X8 -design
add notranslate modules SPRAM128X8 -design

read design /home/student/EMC08/digital_A/core/design/rtl_v/core.v -Verilog -Golden   -sensitive
read design  -Revised -sensitive -Verilog2K /home/student/EMC08/digital_A/core/design/rtl_v/core_netlist.v        

set rule handling DIR6.1 -Ignore
set rule handling RTL10 -Ignore
set rule handling RTL12 -Ignore
set rule handling HRC1.4  -ignore

set system mode lec
add renaming rule rule0 "\/U\$1" "" -map -revised
add compare points -all
compare
