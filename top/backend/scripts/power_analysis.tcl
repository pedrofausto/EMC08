readActivityFile -format VCD synthesis/structural_v/emc_top_netlist.vcd

reportPower -outfile powerReports/EMC08_static_power.rpt -clockNetwork all -sort { total }

autoFetchDCSources VDD

savePadLocation -file powerReports/VDD.pp

probePower

updatePower -irDropAnalysis average -vcd synthesis/structural_v/emc_top_netlist.vcd -vcdTop EMC08 -pad powerReports/VDD.pp -start 0.0 -report powerReports/EMC08_power.rpt -reportInstancePower powerReports/EMC08_instance.power -timeUnit ps -mode floorplan VDD
