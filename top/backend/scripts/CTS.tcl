setCTSMode -traceDPinAsLeaf false -traceIoPinAsLeaf false -routeClkNet true -routeGuide true -topPreferredLayer 4 -bottomPreferredLayer 3 -routeNonDefaultRule {} -useLefACLimit false -routeShielding {} -opt true -optAddBuffer true -moveGate true -useHVRC true -fixLeafInst true -fixNonLeafInst true -verbose false -reportHTML false -addClockRootProp false -nameSingleDelim false -honorFence false -useLibMaxFanout false -useLibMaxCap false
getClockMeshMode -quiet
setFillerMode -reset
setFillerMode -corePrefix FILLER -createRows 1 -doDRC 1 -deleteFixed 1 -ecoMode 0
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -drouteStartIteration default
setOptMode -effort high -leakagePowerEffort none -yieldEffort none -simplifyNetlist false -setupTargetSlack 0 -holdTargetSlack 0 -maxDensity 0.95 -drcMargin 0 -usefulSkew false
setPlaceMode -reset
setPlaceMode -congEffort high -timingDriven 0 -modulePlan 1 -doCongOpt 0 -clkGateAware 0 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 1 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setScanReorderMode -reset
setScanReorderMode -skipMode skipNone -clkAware false -defInForce false -allowSwapping false -keepHierPorts false
setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection true -uniquifyCellNamesPrefix false
setTieHiLoMode -reset
setTieHiLoMode -honorDontTouch false
setTrialRouteMode -highEffort false -floorPlanMode false -detour true -maxRouteLayer 6 -minRouteLayer 1 -handlePreroute true -autoSkipTracks false -handlePartition false -handlePartitionComplex false -useM1 false -keepExistingRoutes false -ignoreAbutted2TermNet false -pinGuide true -honorPin false -selNet {} -selNetOnly {} -selMarkedNet false -selMarkedNetOnly false -ignoreObstruct true -PKS false -updateRemainTrks false -ignoreDEFTrack false -printWiresOnRTBlk false -usePagedArray false -routeObs true -routeGuide {} -blockageCostMultiple 1 -maxDetourRatio 0
clockDesign -specFile config/emc08.ctstch -outDir clockReports -fixedInstBeforeCTS
isExtractRCModeSignoff
