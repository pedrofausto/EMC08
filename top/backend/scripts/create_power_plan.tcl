addRing -spacing_bottom 2 -width_left 8 -width_bottom 8 -width_top 8 -spacing_top 2 -layer_bottom MET5 -center 1 -stacked_via_top_layer METTP -width_right 8 -around core -jog_distance 0.315 -offset_bottom 0.315 -layer_top MET5 -threshold 0.315 -offset_left 0.315 -spacing_right 2 -spacing_left 2 -offset_right 0.315 -offset_top 0.315 -layer_right METTP -nets {GND VDD } -stacked_via_bottom_layer MET1 -layer_left METTP

selectInst EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_rom
addRing -spacing_bottom 2 -width_left 8 -width_bottom 8 -width_top 8 -left 0 -top 0 -spacing_top 2 -layer_bottom MET5 -stacked_via_top_layer METTP -width_right 8 -around selected -jog_distance 0.315 -offset_bottom 18 -bl 1 -layer_top MET5 -br 1 -threshold 0.315 -right 0 -offset_left 0.315 -spacing_right 2 -spacing_left 2 -type block_rings -offset_right 0.315 -offset_top 0.315 -layer_right METTP -nets {GND VDD } -stacked_via_bottom_layer MET1 -layer_left METTP

deselectAll

selectInst EMC_TOP_INSTANCE/CORE_INSTANCE/mem_ctrl/internal_ram
addRing -lt 1 -spacing_bottom 2 -width_left 8 -width_bottom 8 -width_top 8 -top 0 -spacing_top 2 -layer_bottom MET5 -stacked_via_top_layer METTP -width_right 8 -around selected -jog_distance 0.315 -offset_bottom 18 -bottom 0 -layer_top MET5 -threshold 0.315 -right 0 -offset_left 50.0975 -spacing_right 2 -lb 1 -spacing_left 2 -type block_rings -offset_right 0.315 -offset_top 0.315 -layer_right METTP -nets {GND VDD } -stacked_via_bottom_layer MET1 -layer_left METTP

addStripe -block_ring_top_layer_limit METTP -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit MET5 -number_of_sets 1 -stacked_via_top_layer METTP -padcore_ring_top_layer_limit METTP -start_from right -spacing 2 -xleft_offset 216.3750 -xright_offset 216.040 -merge_stripes_value 0.315 -layer METTP -block_ring_bottom_layer_limit MET5 -width 8 -nets {GND VDD } -stacked_via_bottom_layer MET1

addStripe -block_ring_top_layer_limit METTP -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit MET5 -number_of_sets 1 -stacked_via_top_layer METTP -padcore_ring_top_layer_limit METTP -spacing 2 -xleft_offset 216.040 -xright_offset 216.040 -merge_stripes_value 0.315 -layer METTP -block_ring_bottom_layer_limit MET5 -width 8 -nets {GND VDD } -stacked_via_bottom_layer MET1

addStripe -block_ring_top_layer_limit METTP -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit MET4 -number_of_sets 4 -ybottom_offset 75.64 -stacked_via_top_layer METTP -padcore_ring_top_layer_limit METTP -spacing 2 -merge_stripes_value 0.315 -direction horizontal -layer MET5 -block_ring_bottom_layer_limit MET4 -ytop_offset 345.13 -width 8 -nets {GND VDD } -stacked_via_bottom_layer MET1

sroute -jogControl { preferWithChanges differentLayer }
