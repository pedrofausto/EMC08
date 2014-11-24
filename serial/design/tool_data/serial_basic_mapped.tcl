#### Template Script for RTL->Gate-Level Flow (generated from RC v07.20-s009_1) 

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"
########################################################
## Include TCL utility scripts..
########################################################
include load_etc.tcl

##############################################################################
## Preset global variables and attributes
##############################################################################
set DESIGN serial_top

set SYN_EFF medium
set MAP_EFF high

set TIME_SCALE 1ns/1ps

set _OUTPUTS_PATH {../outputs}
set _LOG_PATH {../logs}
set _REPORTS_PATH {../reports}
set _VCD_PATH  {../vcd}

set_attribute library /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
#set_attribute information_level 7 /
set_attribute hdl_track_filename_row_col true

# Baseline RTL
#set FILE_LIST {
#../rtl/receiver/serial_rx.v \
#../rtl/receiver/rx_control/serial_rx_control.v \
#../rtl/receiver/serial_input_shifter_reg/serial_rx_input_shifter_reg.v \
#../rtl/receiver/detector/serial_rx_detector.v \
#../rtl/transmitter/serial_tx.v \
#../rtl/transmitter/tx_control/serial_tx_control.v \
#../rtl/serial_top.v#
#}
set FILE_LIST {
../rtl/serial_top.v
}

####################################################################
## Load Design
####################################################################
read_hdl -v2001 $FILE_LIST

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration
#check_design -unresolved

ungroup -flatten -all
####################################################################################################
## Synthesizing to gates
synthesize -to_mapped -eff $MAP_EFF 

######################################################################################################
## write Encounter file set (verilog, SDC, config, etc.)
######################################################################################################
##write_encounter design -basename <path & base filename> -lef <lef_file(s)>

report area > $_REPORTS_PATH/${DESIGN}_area_mapped.rpt
report gates > $_REPORTS_PATH/${DESIGN}_gates_mapped.rpt
report sequential > $_REPORTS_PATH/${DESIGN}_fflops_mapped.rpt
#report power   > $_REPORTS_PATH/${DESIGN}_power_basic.rpt

#write -m  > ${_OUTPUTS_PATH}/${DESIGN}_basic.hvsyn
#write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_basic.sdc
#write_script > ${_OUTPUTS_PATH}/${DESIGN}_basic.script
write_hdl -m > ${_OUTPUTS_PATH}/${DESIGN}_basic.v

write_hdl -m > ../gates/${DESIGN}_basic_mapped.v
