extractRC
rcOut -spef parasitics/EMC08_postRoute.spef

timeDesign -postRoute -si -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_postRoute -outDir timingReports


timeDesign -postRoute -si -hold -reportOnly -pathReports -slackReports -numPaths 50 -prefix EMC08_postRoute -outDir timingReports

setOptMode -effort high -leakagePowerEffort none -yieldEffort none -simplifyNetlist false -setupTargetSlack 0.5 -holdTargetSlack 0.5 -maxDensity 0.95 -drcMargin 0 -usefulSkew true

optDesign -postRoute -hold -setup -drv
optDesign -postRoute -hold -setup -incr

extractRC
rcOut -spef parasitics/EMC08_postRoute_opt.spef


timeDesign -postRoute -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_postRoute_opt -outDir timingReports

timeDesign -postRoute -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_postRoute_opt -outDir timingReports

