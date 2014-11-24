reportcongestarea -outfile reports/trial_route_congestion.rpt

extractRC
rcOut -spef reports/preCTS/EMC08_preCTS.spef

timeDesign -preCTS -idealClock -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_preCTS -outDir reports/preCTS

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix EMC08_preCTS -outDir reports/preCTS