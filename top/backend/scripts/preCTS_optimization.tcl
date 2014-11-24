reportcongestarea -outfile reports/trial_route_congestion.rpt

extractRC
rcOut -spef parasitics/EMC08_preCTS.spef

timeDesign -preCTS -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_preCTS -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_preCTS -outDir timingReports

setOptMode -effort high -leakagePowerEffort none -yieldEffort none -simplifyNetlist false -setupTargetSlack 0.5 -holdTargetSlack 0.5 -maxDensity 0.95 -drcMargin 0 -usefulSkew true

optDesign -preCTS -setup -drv

extractRC
rcOut -spef parasitics/EMC08_preCTS_opt.spef

timeDesign -preCTS -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_preCTS_opt -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_preCTS_opt -outDir timingReports

