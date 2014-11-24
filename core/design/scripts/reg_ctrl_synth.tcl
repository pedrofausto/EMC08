#### Template Script for RTL->Gate-Level Flow (generated from RC v08.10-s108_1) 

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


set DESIGN core_reg_ctrl
set SYN_EFF high
set MAP_EFF high
set DATE [clock format [clock seconds] -format "%m-%d"] 
## The following variables are used for diagnostic purposes only.
## They donot have any effect on the results of synthesis.
## Setting 'map_fancy_names' to 1 tells the tool to name the combinational
## cells based on the criteria that was used when selecting them.
set map_fancy_names 1

## Setting 'iopt_stats' to 1 prints out statistics during incremental
## optimization.
set iopt_stats 1

set_attribute optimize_constant_0_flops false
set_attribute hdl_track_filename_row_col true
set _OUTPUTS_PATH stuctural_v
set _LOG_PATH logs/$DESIGN
set _REPORTS_PATH reports/$DESIGN/${DATE}
set_attribute lib_search_path {                       \
   /ddk/XFABC018/synopsys/xc018/MOSLP                 \
} / 
set_attribute script_search_path {./scripts} /
set_attribute hdl_search_path {./rtl_v} /
##set_attribute wireload_mode <value> /
set_attribute information_level 7 /


###############################################################
## Library setup
###############################################################
set LIBRARY {
   D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
}


set_attribute library $LIBRARY
## PLE
##set_attribute lef_library <lef file(s)> /
##set_attribute cap_table_file <file> /
##set_attribute interconnect_mode ple /

##generates <signal>_reg[<bit_width>] format
#set_attribute hdl_array_naming_style %s\[%d\] /  

## Turn on TNS, affects global and incr opto
#set_attribute tns_opto true /

####################################################################
## Load Design
####################################################################

set FILE_LIST {
   core_reg_ctrl.v
}

read_hdl -v2001 $FILE_LIST
elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration

check_design -unresolved

####################################################################
## Constraints Setup
####################################################################

##read_sdc <file_name>
##puts "The number of exceptions is [llength [find /designs/$DESIGN -exception *]]"
#set_attribute force_wireload <wireload name> "/designs/$DESIGN"

if {![file exists ${_LOG_PATH}]} {
  file mkdir ${_LOG_PATH}
  puts "Creating directory ${_LOG_PATH}"
}

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}

report timing -lint

###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

## Uncomment to remove already existing costgroups before creating new ones.
## rm [find /designs/* -cost_group *]

if {[llength [all::all_seqs]] > 0} { 
  define_cost_group -name I2C -design $DESIGN
  define_cost_group -name C2O -design $DESIGN
  define_cost_group -name C2C -design $DESIGN
  path_group -from [all::all_seqs] -to [all::all_seqs] -group C2C -name C2C
  path_group -from [all::all_seqs] -to [all::all_outs] -group C2O -name C2O
  path_group -from [all::all_inps]  -to [all::all_seqs] -group I2C -name I2C
}

define_cost_group -name I2O -design $DESIGN
path_group -from [all::all_inps]  -to [all::all_outs] -group I2O -name I2O
foreach cg [find / -cost_group *] {
  report timing -cost_group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

####################################################################################################
## Synthesizing to generic 
####################################################################################################


synthesize -to_generic -eff $SYN_EFF
puts "Runtime & Memory after 'synthesize -to_generic'"
timestat GENERIC
report datapath > $_REPORTS_PATH/${DESIGN}_datapath_generic.rpt




## ungroup -threshold <value>

####################################################################################################
## Synthesizing to gates
####################################################################################################


synthesize -to_mapped -eff $MAP_EFF -no_incr
puts "Runtime & Memory after 'synthesize -to_map -no_incr'"
timestat MAPPED
report datapath > $_REPORTS_PATH/${DESIGN}_datapath_map.rpt

foreach cg [find / -cost_group *] {
  report timing -cost_group [list $cg] > $_REPORTS_PATH/${DESIGN}_[basename $cg]_post_map.rpt
}



##Intermediate netlist for LEC verification..
##write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v
##write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v -logfile ${_LOG_PATH}/rtl2intermediate.lec.log > ${_OUTPUTS_PATH}/rtl2intermediate.lec.do



#######################################################################################################
## Incremental Synthesis
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true /
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique> /

synthesize -to_mapped -eff $MAP_EFF -incr   
puts "Runtime & Memory after incremental synthesis"
timestat INCREMENTAL

foreach cg [find / -cost_group -null_ok *] {
  report timing -cost_group [list $cg] > $_REPORTS_PATH/${DESIGN}_[basename $cg]_post_incr.rpt
}

######################################################################################################
## write Encounter file set (verilog, SDC, config, etc.)
######################################################################################################


##write_encounter design -basename <path & base filename> -lef <lef_file(s)>
report area > $_REPORTS_PATH/${DESIGN}_area.rpt
report datapath > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
report gates > $_REPORTS_PATH/${DESIGN}_gates.rpt
report sequential > $_REPORTS_PATH/${DESIGN}_sequential.rpt
##write_design -basename ${_OUTPUTS_PATH}/${DESIGN}_m
write_hdl  > ${_OUTPUTS_PATH}/${DESIGN}_m.v
##write_script > ${_OUTPUTS_PATH}/${DESIGN}_m.script
##write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_m.sdc


#################################
### write_do_lec
#################################


##write_do_lec -golden_design ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do
##Uncomment if the RTL is to be compared with the final netlist..
##write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile ${_LOG_PATH}/rtl2final.lec.log > ${_OUTPUTS_PATH}/rtl2final.lec.do

puts "Final Runtime & Memory."
timestat FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

exit
