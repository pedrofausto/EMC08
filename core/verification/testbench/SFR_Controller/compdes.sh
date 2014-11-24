
irun -nbasync -gui -snload creg_test.e ./RTL/core_reg_ctrl_tb.v -access rwc -snprerun "set check WARNING; test" -input reg_wr.tcl -run
