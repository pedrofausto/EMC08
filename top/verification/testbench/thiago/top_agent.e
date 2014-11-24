<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_agent.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, sig - signal map, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: Class that connect the monitor at signal map, and BFM`s signals
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: connect_pointers()
// Include Files: top_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_agent_h;

extend top_agent_u {
   connect_pointers() is also {    
   
   mon.p_top_reset_i       = sig.p_top_reset_i;
   
   //////////// INPUTS ///////////////////////////////
   mon.p_top_p0_y_i        = sig.p_top_p0_y_i;
   mon.p_top_p1_y_i        = sig.p_top_p1_y_i;
   mon.p_top_p2_y_i        = sig.p_top_p2_y_i;
   mon.p_top_p3_y_i        = sig.p_top_p3_y_i;
   
   mon.p_top_ea_b_i        = sig.p_top_ea_b_i;
   
   mon.p_top_pht_i         = sig.p_top_pht_i;

   /////////////////// OUTPUTS ///////////////////
   mon.p_top_p0_en_o       = sig.p_top_p0_en_o;  
   mon.p_top_p1_en_o       = sig.p_top_p1_en_o;  
   mon.p_top_p2_en_o       = sig.p_top_p2_en_o;  
   mon.p_top_p3_en_o       = sig.p_top_p3_en_o;  
   
   mon.p_top_p0_a_o        = sig.p_top_p0_a_o;  
   mon.p_top_p1_a_o        = sig.p_top_p1_a_o; 
   mon.p_top_p2_a_o        = sig.p_top_p2_a_o;  
   mon.p_top_p3_a_o        = sig.p_top_p3_a_o;  
   mon.p_top_p4_a_o        = sig.p_top_p4_a_o;  
   
   mon.p_top_psen_b_o      = sig.p_top_psen_b_o; 

   mon.p_serial_tx         = sig.p_serial_tx; 
   mon.p_sfr_wr_data       = sig.p_sfr_wr_data; 
   mon.p_port3_0           = sig.p_port3_0; 
   mon.p_port3_1           = sig.p_port3_1; 
   mon.p_baud_rate         = sig.p_baud_rate;  

   mon.p_sfr_ren           = sig.p_sfr_ren;
   mon.p_sfr_es            = sig.p_sfr_es;

 
   };

   // when CORE_FSM_IN than map the signal between signal map and monitor
   when ACTIVE TOP_IN top_agent_u {
      connect_pointers() is also {    
      
         bfm.p_top_reset_i       = sig.p_top_reset_i;
   
         //////////// INPUTS ///////////////////////////////
         bfm.p_top_p0_y_i        = sig.p_top_p0_y_i;
         bfm.p_top_p1_y_i        = sig.p_top_p1_y_i;
         bfm.p_top_p2_y_i        = sig.p_top_p2_y_i;
         bfm.p_top_p3_y_i        = sig.p_top_p3_y_i;
         
         bfm.p_top_ea_b_i        = sig.p_top_ea_b_i;
         
         bfm.p_top_pht_i         = sig.p_top_pht_i;
         bfm.p_baud_rate         = sig.p_baud_rate; 
         bfm.p_sfr_ren           = sig.p_sfr_ren;
         bfm.p_sfr_es            = sig.p_sfr_es;

      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   //when ACTIVE TOP_OUT top_agent_u {
   //   connect_pointers() is also {
    
   //   };
   //};
};

'>
