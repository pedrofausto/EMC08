
source /home/student/DFund-SBTUSER_6_1_1/Data/SBTBASIC/.class_setup

source /home/student/DFund-ICC_6_2/Data/ICC_6_2/.class_setup

#irun -nbasync -gui -snload bc_test_f1.e *.v -access r


irun -nbasync -gui -access rwc /home/student/EMC08/digital_A/timers/verification/testbench/tmr0_test.e /home/student/EMC08/digital_A/timers/design/rtl_v/top_timers.v  /home/student/EMC08/digital_A/timers/verification/testbench/tmr1_tb.v -coverage all -covtest tmr1_cov_test -input "@source restore_timer0_1.tcl" -run


#irun -gui -snload tmr2_test_f1.e ./rtl_t2/*.v -access r -snprerun "wave event; set check WARNING; test" -sv -coverage all -covtest tmr2_cov_test -input "@source restore.tcl" #-covoverwrite


