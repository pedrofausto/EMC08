#irun -gui -debug -top tb_PORT$1_F$2 Port_TOP.v Port_func.v Port_func4.v Feature$2_Port$1.v -coverage all -covtest test_f$2_p$1 -covoverwrite

irun -gui -debug -top tb_ports_verification ports_verification.v Port_TOP.v -coverage all -covtest Test_Verification_Ports -covoverwrite