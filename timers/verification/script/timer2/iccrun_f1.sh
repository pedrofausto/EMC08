
source /home/student/DFund-SBTUSER_6_1_1/Data/SBTBASIC/.class_setup

source /home/student/DFund-ICC_6_2/Data/ICC_6_2/.class_setup


irun -nbasync -gui -access rwc tmr2_test_f1.e ./rtl_t2/*.v -coverage all -covtest tmr2_cov_test_f1 -input "@source restore.tcl"  -run


#irun -gui -snload tmr2_test_f1.e ./rtl_t2/*.v -access r -snprerun "wave event; set check WARNING; test" -sv -coverage all -covtest tmr2_cov_test -input "@source restore.tcl" #-covoverwrite


