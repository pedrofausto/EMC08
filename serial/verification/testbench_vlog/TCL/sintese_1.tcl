  set_attribute lib_search_path /ddk/XFABC018/synopsys/xc018/MOSLP/
  set_attribute library D_CELLSL_MOSLP_slow_1_62V_125C.lib 
  read_hdl -v2001 /home/student/EMC08/digital_A/serial/design/rtl_v/transmitter/serial_tx.v 
  elaborate
  synthesize -to_mapped
  set_attribute hdl_track_filename_row_col true /
  report sequential -hier
  report gates
  
  