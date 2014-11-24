  set_attribute lib_search_path /ddk/XFABC018/synopsys/xc018/MOSLP/
  set_attribute library D_CELLSL_MOSLP_slow_1_62V_125C.lib
#  set_attribute avoid true OAI212
  read_hdl -v2001 /home/student/EMC08/digital_A/timers/design/rtl_v/top_timer2.v
  elaborate
  read_vcd /home/student/EMC08/digital_A/timers/design/vcd/timer2_vcd.vcd
  set REP_PATH ./Reports
  report messages > $REP_PATH/messages_1.txt
  read_sdc ./constraints/black.sdc
  set_attr hdl_track_filename_row_col true /

#------------------- INSERINDO CLOCK GATING ------------------------------------

  set_attribute lp_insert_clock_gating true /
  
  set_attribute lp_clock_gating_style latch "blackjack"
  set_attribute lp_clock_gating_max_flops 18 /des*/*
  set_attribute lp_clock_gating_min_flops 1 /des*/*
  set_attr lp_power_unit mW / 
  
  #set_attribute retime true black_netlist.v
  
  set_attribute lp_power_analysis_effort high /
  
  set_attribute dft_scan_style muxed_scan /
  define_dft shift_enable -active high -create_port scan_enable
  define_dft test_mode -active high -create_port test_mode
  define_dft scan_chain -name chain1 -create_ports -sdi tdi -sdo tdo

#---------------- GENERIC -----------------------------------------------------
    
  set_attribute map_timing true
  elaborate
  synthesize -to_generic
  
  set REPORT_PATH ./Reports/generic
  check_dft_rules
  check_dft_rules     > $REPORT_PATH/black_dft_rules_gen.txt
  report timing       > $REPORT_PATH/timing_gen.txt
  report power        > $REPORT_PATH/power_gen.txt
  report area         > $REPORT_PATH/area_gen.txt
  report messages     > $REPORT_PATH/messages_gen.txt
  
#---------------- MAPPED ------------------------------------------------------
  
  
  synthesize -to_mapped -effort medium
  set REPORT_PATH ./Reports/mapped
  
  check_dft_rules     > $REPORT_PATH/black_dft_rules_map.txt
  report timing       > $REPORT_PATH/timing_map.txt
  report power        > $REPORT_PATH/power_map.txt
  report area         > $REPORT_PATH/area_map.txt
  report messages     > $REPORT_PATH/messages_map.txt

  fix_dft_violations -clock -test_mode test_mode -test_clock_pin clk
  connect_scan_chains -auto_create_chains
  
  
#---------------- INCREMENTAL -------------------------------------------------
  
  
  synthesize -incremental -effort high
  set REPORT_PATH ./Reports/incremental
  
  
  write_hdl > ./netlist/black_netlist.v
  write_sdc > ./sdc/black_sdc.sdc

  
  report dft_registers > $REPORT_PATH/dft_registers_inc.txt
  report gates         > $REPORT_PATH/gates_inc.txt
  report messages      > $REPORT_PATH/messages_inc.txt
  report summary       > $REPORT_PATH/summary_inc.txt
  report clock_gating  > $REPORT_PATH/black_clkgating_inc.txt
  report qor           > $REPORT_PATH/black_qor2b_inc.txt
  
  report timing   > $REPORT_PATH/timing_inc.rpt
  report area     > $REPORT_PATH/area_inc.rpt
  report power    > $REPORT_PATH/power_inc.rpt
  report messages > $REPORT_PATH/messages_inc.rpt
  
  #set_attribute hdl_track_filename_row_col true /
  #report sequential > sequential.txt
  
  
  #irun -access rwc -gui /home/student/blackjack3/c35b4/*.v black_netlist.v t_blackjack.v &

