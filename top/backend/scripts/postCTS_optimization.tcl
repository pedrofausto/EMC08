extractRC
rcOut -spef parasitics/EMC08_postCTS.spef

timeDesign -postCTS -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_postCTS -outDir timingReports

timeDesign -postCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_postCTS -outDir timingReports

setOptMode -effort high -leakagePowerEffort none -yieldEffort none -simplifyNetlist false -setupTargetSlack 0.5 -holdTargetSlack 0.5 -maxDensity 0.95 -drcMargin 0 -usefulSkew true

optDesign -postCTS -setup -hold -drv

extractRC
rcOut -spef parasitics/EMC08_postCTS_opt.spef

timeDesign -postCTS -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_postCTS_opt -outDir timingReports

timeDesign -postCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_postCTS_opt -outDir timingReports

