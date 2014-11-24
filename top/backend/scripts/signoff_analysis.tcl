isExtractRCModeSignoff
extractRC
rcOut -spef parasitics/EMC08_signoff.spef

clearClockDomains
setClockDomains -all

timeDesign -signoff -si -reportOnly -pathReports -drvReports -slackReports -numPaths 50 -prefix EMC08_signOff -outDir timingReports

clearClockDomains
setClockDomains -all

timeDesign -signoff -si -hold -reportOnly -pathReports -slackReports -numPaths 50 -prefix EMC08_signOff -outDir timingReports