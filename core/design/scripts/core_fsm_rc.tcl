set_attribute library /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
set_attribute hdl_track_filename_row_col true /
set_attribute lp_power_unit mW /
#set_attribute information_level 7 /

read_hdl -v2001 ../rtl_v/core_fsm.v
elaborate
synthesize -to_generic -effort high
synthesize -to_mapped -effort high
synthesize -incremental -effort high
cd /designs/core_fsm/
check_design
write_hdl > ../rtl_v/core_fsm_netlist.v

#report power > ../reports/power_basic.txt
report gates > ../reports/gates_optimized.txt
report area > ../reports/area_basic_optimized.txt
report sequential -hier
exit
