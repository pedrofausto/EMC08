set_attribute library /ddk/XFABC018/synopsys/xc018/MOSLP/D_CELLS_JI_MOSLP_typ_1_80V_25C.lib
read_hdl -v2001 core_alu.v
set_attribute hdl_track_filename_row_col true /
elaborate
synthesize -to_mapped
write_hdl > netlist_alu.v
cd /designs/core_alu/

report gates > report_gates.txt
report sequential > report_sequential.txt
report area > report_area.txt
report power > report_power.txt
report timing > report_timing.txt
report sequential
