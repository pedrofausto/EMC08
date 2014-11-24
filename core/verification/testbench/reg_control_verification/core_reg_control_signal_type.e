<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_signal_type.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 04/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      04-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register cotrol, phy - physical
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
// the DUT
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: post_generate()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

// signal type 
type core_reg_control_signal_type_kind_t: [RESET];
    
type struction_set_t:[NOP, MOV];


struct core_reg_control_signal_type like any_sequence_item {
   
   
   // input reset
   reset: bit;
  
   // signal type
   pkt_kind: core_reg_control_signal_type_kind_t;
  
   struction: struction_set_t;
   
   //keep  (pkt_kind == MODE2_BR32) => (sm0 == 1 && smod == 0 && reset == 1 && core_reg_control_start == 0);
    
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
