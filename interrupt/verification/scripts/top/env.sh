alias c 'cat /home/student/.branco; clear'
alias rm 'rm -i'
setenv SPECMAN_PATH /home/student/DFund-SBTUSER_6_1_1/Data/SBTBASIC/sbt_lib/
set autolist
source /home/student/EMC08/digital_A/.class_setup
source /home/student/DFund-ICC_6_2/Data/ICC_6_2/.class_setup
alias go 'c; irun -nbasync -gui -access +rwc -input "@source /home/student/EMC08/digital_A/interrupt/verification/scripts/restore.tcl" -snprerun "set check WARNING; test -seed=2; wave -event sys.env.agent_in.mon" /home/student/EMC08/digital_A/interrupt/verification/testbench/interrupt_tb.v /home/student/EMC08/digital_A/interrupt/design/rtl_v/interrupt.v -run -snload'
