placeInstance EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_rom 287.28 773.51 R90

placeInstance EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_ram 841.06 775.85 R0

addHaloToBlock 15.0 38.34 15.0 15.0 EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_ram

addHaloToBlock 15.0 36.0 105.0 15.0 EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_rom


createRouteBlk 287.28 773.427 722.978 1007.0

deselectAll
selectRouteBlk 287.2800 773.4250 722.9800 1007.0000 defLayerBlkName 3
setSelectedRouteBlk 287.28 773.425 722.98 1007.0 defLayerBlkName {{1 } {2 } {V2 } {3 } {V3 } {4 } {V4 } {5 } {V5 } {6 } {V6 }} Undefined

createRouteBlk 841.06 775.851 1006.998 1007.0

selectRouteBlk 841.0600 775.8500 1007.000 1007.0000 defLayerBlkName 3
setSelectedRouteBlk 841.06 775.85 1007.0 1007.0 defLayerBlkName {{1 } {2 } {V2 } {3 } {V3 } {4 } {V4 } {5 } {V5 } {V6 }} Undefined

cutRow