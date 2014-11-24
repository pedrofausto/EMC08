addRing -spacing_bottom 5 -width_left 5 -width_bottom 5 -width_top 5 -spacing_top 5 -layer_bottom MET5 -center 1 -stacked_via_top_layer METTP -width_right 5 -around core -jog_distance 0.315 -offset_bottom 0.315 -layer_top MET5 -threshold 0.315 -offset_left 0.315 -spacing_right 5 -spacing_left 5 -offset_right 0.315 -offset_top 0.315 -layer_right METTP -nets {GND VDD} -stacked_via_bottom_layer MET1 -layer_left METTP

sroute -blockPinConnectRingPinCorners -straightConnections { straightWithDrcClean } -layerChangeTopLayer 1

selectInst EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_ram
addRing -lt 1 -spacing_bottom 5 -width_left 5 -width_bottom 5 -snap_wire_center_to_grid Optimize -width_top 5 -top 0 -spacing_top 5 -layer_bottom MET5 -stacked_via_top_layer METTP -width_right 5 -around selected -jog_distance 0.315 -offset_bottom 10 -layer_top MET5 -br 1 -threshold 0.315 -right 0 -offset_left 10 -spacing_right 5 -spacing_left 5 -type block_rings -offset_right 10 -offset_top 10 -layer_right METTP -nets {GND VDD } -stacked_via_bottom_layer MET1 -layer_left METTP

selectInst EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_rom
addRing -spacing_bottom 5 -width_left 5 -width_bottom 5 -snap_wire_center_to_grid Optimize -width_top 5 -left 0 -top 0 -spacing_top 5 -layer_bottom MET5 -stacked_via_top_layer METTP -width_right 5 -around selected -jog_distance 0.315 -offset_bottom 10 -bl 1 -layer_top MET5 -threshold 0.315 -offset_left 10 -spacing_right 5 -spacing_left 5 -type block_rings -offset_right 10 -rt 1 -offset_top 10 -layer_right METTP -nets {GND VDD } -stacked_via_bottom_layer MET1 -layer_left METTP

addStripe -block_ring_top_layer_limit METTP -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit MET5 -number_of_sets 6 -stacked_via_top_layer METTP -padcore_ring_top_layer_limit METTP -spacing 5 -xleft_offset 50 -xright_offset 50 -merge_stripes_value 0.315 -layer METTP -block_ring_bottom_layer_limit MET5 -width 5 -nets {VDD GND} -stacked_via_bottom_layer MET1 -break_stripes_at_block_rings 1

sroute -jogControl { preferWithChanges differentLayer } -nets { GND VDD }
