
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -nbasync -debug -gui -snload ram_test.e ram_memory_top.v SPRAM128X8.v +mpssession+SPECMAN26868 -input restore.tcl
#

set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 0
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 0
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves ram_memory_top.MEM_TOP.ADR ram_memory_top.MEM_TOP.ADR_ ram_memory_top.MEM_TOP.CLK ram_memory_top.MEM_TOP.CLK_ ram_memory_top.MEM_TOP.D ram_memory_top.MEM_TOP.D_ ram_memory_top.MEM_TOP.ENB ram_memory_top.MEM_TOP.ENB_ ram_memory_top.MEM_TOP.NOTIFY_ADR ram_memory_top.MEM_TOP.NOTIFY_REG ram_memory_top.MEM_TOP.NOTIFY_WEB ram_memory_top.MEM_TOP.NRWL ram_memory_top.MEM_TOP.OEB ram_memory_top.MEM_TOP.OEB_ ram_memory_top.MEM_TOP.Q ram_memory_top.MEM_TOP.QI ram_memory_top.MEM_TOP.QR ram_memory_top.MEM_TOP.RAM_matrix ram_memory_top.MEM_TOP.RW ram_memory_top.MEM_TOP.RWL ram_memory_top.MEM_TOP.TOK ram_memory_top.MEM_TOP.T_OK_ADR ram_memory_top.MEM_TOP.T_OK_Q ram_memory_top.MEM_TOP.T_OK_QI ram_memory_top.MEM_TOP.WEB ram_memory_top.MEM_TOP.WEBB ram_memory_top.MEM_TOP.WEB_ ram_memory_top.MEM_TOP.cleanWrite ram_memory_top.MEM_TOP.cleanWriteN ram_memory_top.MEM_TOP.enable ram_memory_top.MEM_TOP.enableMem ram_memory_top.MEM_TOP.possRead ram_memory_top.MEM_TOP.ramgnd ram_memory_top.MEM_TOP.ramgndi ram_memory_top.MEM_TOP.ramvdd ram_memory_top.MEM_TOP.rt ram_memory_top.MEM_TOP.supply_OK

simvision -input /home/student/Memories/SPRAM/environment/restore.tcl.svcf
