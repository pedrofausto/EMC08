verifyGeometry -offRGrid -antenna -report verifyReports/EMC08_geometry.rpt

verifyProcessAntenna -reportfile verifyReports/EMC08_antenna.rpt -leffile verifyReports/EMC08_antenna.lef -detailed -error 1000


setMetalFill -layer 1 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer 2 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer 3 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer 4 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer 5 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000
setMetalFill -layer 6 -windowSize 100.000 100.000 -windowStep 50.000 50.000 -minDensity 20.000 -maxDensity 80.000

verifyMetalDensity -reportfile verifyReports/EMC08_density.rpt

setViaFill -layer V12 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer V23 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer V34 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer V45 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00
setViaFill -layer V56 -windowSize 10.000 10.000 -windowStep 5.000 5.000 -minDensity 0.00 -maxDensity 30.00

verifyCutDensity -reportfile verifyReports/EMC08_cut_density.rpt

verifyConnectivity -type all -connectPadSpecialPorts -geomConnect -report verifyReports/EMC08_connectivity.rpt -error 1000 -warning 50