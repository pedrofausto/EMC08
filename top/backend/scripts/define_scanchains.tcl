specifyscancell SDFFQX0 -in SD -out Q -scanClock CN -scanEnable SE
specifyscancell SDFFQX1 -in SD -out Q -scanClock CN -scanEnable SE
specifyscancell SDFFQX2 -in SD -out Q -scanClock CN -scanEnable SE
specifyscancell SDFFQX4 -in SD -out Q -scanClock CN -scanEnable SE

specifyScanChain emc_chain_15 -start EMC_PADS_INSTANCE/P_PORT1_6/Y -stop EMC_PADS_INSTANCE/P_PORT4_6/A
specifyScanChain emc_chain_01 -start EMC_PADS_INSTANCE/P_PORT0_0/Y -stop EMC_PADS_INSTANCE/P_PORT2_0/A
specifyScanChain emc_chain_02 -start EMC_PADS_INSTANCE/P_PORT0_1/Y -stop EMC_PADS_INSTANCE/P_PORT2_1/A
specifyScanChain emc_chain_03 -start EMC_PADS_INSTANCE/P_PORT0_2/Y -stop EMC_PADS_INSTANCE/P_PORT2_2/A
specifyScanChain emc_chain_04 -start EMC_PADS_INSTANCE/P_PORT0_3/Y -stop EMC_PADS_INSTANCE/P_PORT2_3/A
specifyScanChain emc_chain_05 -start EMC_PADS_INSTANCE/P_PORT0_4/Y -stop EMC_PADS_INSTANCE/P_PORT2_4/A
specifyScanChain emc_chain_06 -start EMC_PADS_INSTANCE/P_PORT0_5/Y -stop EMC_PADS_INSTANCE/P_PORT2_5/A
specifyScanChain emc_chain_07 -start EMC_PADS_INSTANCE/P_PORT0_6/Y -stop EMC_PADS_INSTANCE/P_PORT2_6/A
specifyScanChain emc_chain_08 -start EMC_PADS_INSTANCE/P_PORT0_7/Y -stop EMC_PADS_INSTANCE/P_PORT2_7/A

specifyScanChain emc_chain_09 -start EMC_PADS_INSTANCE/P_PORT1_0/Y -stop EMC_PADS_INSTANCE/P_PORT4_0/A
specifyScanChain emc_chain_10 -start EMC_PADS_INSTANCE/P_PORT1_1/Y -stop EMC_PADS_INSTANCE/P_PORT4_1/A
specifyScanChain emc_chain_11 -start EMC_PADS_INSTANCE/P_PORT1_2/Y -stop EMC_PADS_INSTANCE/P_PORT4_2/A
specifyScanChain emc_chain_12 -start EMC_PADS_INSTANCE/P_PORT1_3/Y -stop EMC_PADS_INSTANCE/P_PORT4_3/A
specifyScanChain emc_chain_13 -start EMC_PADS_INSTANCE/P_PORT1_4/Y -stop EMC_PADS_INSTANCE/P_PORT4_4/A
specifyScanChain emc_chain_14 -start EMC_PADS_INSTANCE/P_PORT1_5/Y -stop EMC_PADS_INSTANCE/P_PORT4_5/A
specifyScanChain emc_chain_16 -start EMC_PADS_INSTANCE/P_PORT1_7/Y -stop EMC_PADS_INSTANCE/P_PORT4_7/A

scanTrace -verbose -compLogic

scanReorder

defOut -floorplan -noStdCells -scanChain outputs/emc08.scan.def


