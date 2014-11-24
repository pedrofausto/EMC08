<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_bfm_i.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: int_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_bfm_i_h;

extend int_bfm_i_u {
   // instance the ports used in bfm in
   !RESET_i_p     : inout simple_port of bit         ;
   !INT_EXT_p     : inout simple_port of uint(bits:2);
   !INT_RDY_p     : inout simple_port of bit         ;
   !INT_NA_i_p    : inout simple_port of bit         ;
   !INT_CM_i_p    : inout simple_port of bit         ;
   !REG_IE_i_p    : inout simple_port of uint(bits:8);
   !REG_IP_i_p    : inout simple_port of uint(bits:7);
   !REG_SCON_i_p  : inout simple_port of uint(bits:2);
   !REG_TCON_i_p  : inout simple_port of uint(bits:6);
   !REG_TCON2_i_p : inout simple_port of uint(bits:2);
   !INT_VECT_o_p  : inout simple_port of uint(bits:3);
   !REG_TCON_o_p  : inout simple_port of uint(bits:4);
   !REG_TCON2_o_p : inout simple_port of uint(bits:2);
   !REG_CLR_o_p   : inout simple_port of bit         ;
   
   !some_delay: uint(bits:10);
   keep some_delay >= 50;
   
   event cm_rise_e    is rise (INT_CM_i_p$)@sim;
   
   // create cycle machine stimuli
   drive_cm() @clock_e is only {
      
      var cm_count:     bit = 1;       
      while TRUE 
      {
         cm_count = ~cm_count;
         if (cm_count == 1) 
         {
            wait delay(1);
            INT_CM_i_p$    = 0;
         } else 
         {
            wait delay(1);
            INT_CM_i_p$    = 1;
         };
          wait [1] * cycle;
      };
   };
   
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: int_signal_type;
      
     var cm_count:     bit = 1;       

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
   
 
   // function to send signal packets to the DUT
   send_pkt(in_pkt: int_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences

      wait cycle @cm_rise_e;
      wait delay(1);
      
        if (in_pkt.pkt_kind == PKT_RAND_IE) 
         {
            REG_IE_i_p$    = in_pkt.reg_ie_i;
        };
        
        if (in_pkt.pkt_kind == PKT_RAND_IP) 
         {
            REG_IP_i_p$    = in_pkt.reg_ip_i;
        };
        
        if (in_pkt.pkt_kind == PKT_RAND_SCON) 
         {
            REG_SCON_i_p$  = in_pkt.reg_scon_i;
        };
        
        if (in_pkt.pkt_kind == PKT_RAND_TCON) 
         {
            REG_TCON_i_p$  = in_pkt.reg_tcon_i;
        };
        
        if (in_pkt.pkt_kind == PKT_RAND_TCON2) 
         {
            REG_TCON2_i_p$ = in_pkt.reg_tcon2_i;
        };
        
        if (in_pkt.pkt_kind == PKT_NOP) 
         {
        
        };
        
        if (in_pkt.pkt_bit_kind == PKT_RAND_INTEXT) 
        {
            INT_EXT_p$     = in_pkt.int_ext_i_b;
           // wait [2] * cycle;
        };
        
        
         if (in_pkt.pkt_bit_kind == PKT_RAND_RDY) 
         {
            INT_RDY_p$     = 1'b1;
            wait [2] * cycle;
            INT_RDY_p$     = 1'b0;
         };
        
        if (in_pkt.pkt_bit_kind == PKT_RAND_NA) 
         {
            INT_NA_i_p$    = 1'b1;
            wait [2] * cycle;
            INT_NA_i_p$    = 1'b0;
        };
        
        if (in_pkt.pkt_bit_kind == PKT_BIT_NOP) 
         {
           // wait [2] * cycle;
        };
        
        if (in_pkt.pkt_bit_kind == PKT_RESET) 
      {
            RESET_i_p$     = 1'b0;
            INT_EXT_p$     = 2'b11;
            INT_RDY_p$     = 1'b0;
            INT_NA_i_p$    = 1'b0;
            REG_IE_i_p$    = 8'h0;
            REG_IP_i_p$    = 7'h0;
            REG_SCON_i_p$  = 2'h0;
            REG_TCON_i_p$  = 6'h0;
            REG_TCON2_i_p$ = 2'h0;
            wait [1] * cycle;
            gen some_delay;
            wait delay(some_delay);
            RESET_i_p$     = 1'b1; 
        };
        
        
//        if (in_pkt.pkt_kind == PKT_RAND_) 
//         {
//            RESET_i_p$     = in_pkt.reset_b;
//            INT_EXT_p$     = in_pkt.int_ext_i_b;
//            INT_RDY_p$     = in_pkt.int_rdy_i;
//            INT_NA_i_p$    = in_pkt.int_na_i;
//            REG_IE_i_p$    = in_pkt.reg_ie_i;
//            REG_IP_i_p$    = in_pkt.reg_ip_i;
//            REG_SCON_i_p$  = in_pkt.reg_scon_i;
//            REG_TCON_i_p$  = in_pkt.reg_tcon_i;
//            REG_TCON2_i_p$ = in_pkt.reg_tcon2_i;
//            wait [2] * cycle;
//        };
        
        

   };
};

'>
