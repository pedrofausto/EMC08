setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
setNanoRouteMode -quiet -routeTdrEffort 5
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
trialRoute -handlePreroute
setCteReport
writeDesignTiming .timing_file.tif
setNanoRouteMode -quiet -routeSiEffort {}
routeDesign -globalDetail