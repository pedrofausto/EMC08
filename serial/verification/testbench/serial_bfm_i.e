<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_bfm_i.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, bfm - bus functional mode
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
// Include Files: serial_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_bfm_i_h;

extend serial_bfm_i_u {
   
  !p_reset       : inout simple_port of bit           ;
  !p_br          : inout simple_port of bit           ;
  !p_br_trans    : inout simple_port of bit           ;
  !p_scon0_ri_i  : inout simple_port of bit           ;
  !p_scon1_ti_i  : inout simple_port of bit           ;
  !p_scon3_tb8   : inout simple_port of bit           ;
  !p_scon4_ren   : inout simple_port of bit           ;
  !p_scon7_mode  : inout simple_port of bit           ;
  !p_serial_tx   : inout simple_port of bit           ;
  !p_p3_0_i      : inout simple_port of bit           ;
  !p_data_sbuf_i : inout simple_port of uint(bits:8)  ;
   
  !p_p3en_0      : inout simple_port of bit           ;
  !p_p3en_1      : inout simple_port of bit           ;
  !p_p3_0_o      : inout simple_port of bit           ;
  !p_p3_1_o      : inout simple_port of bit           ;
  !p_scon0_ri_o  : inout simple_port of bit           ;
  !p_scon1_ti_o  : inout simple_port of bit           ;
  !p_scon3_rb8   : inout simple_port of bit           ;
  !p_data_sbuf_o : inout simple_port of uint(bits:8)  ;
  !p_clear_count : inout simple_port of bit           ;
  
  !rx_bit: bit;
   
  
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only 
   {
      // signal packet to be send to the DUT    
      var pkt: serial_signal_type;

      while TRUE 
      {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };

   
// --------------------------- BAUD RATE -------------------------------------------------

   br_2() @clock_e is only 
   {
      
      var cm_count:     bit = 1;       
      while TRUE 
      {
         cm_count = ~cm_count;
         if (cm_count == 1) 
         {
            wait delay(1);
            p_br$    = 0;
         } else 
         {
            wait delay(1);
            p_br$    = 1;
            emit br_clk_e;
         };
          if (baud_rate == BR_2)  { wait [1] * cycle;  };
          if (baud_rate == BR_32) { wait [32] * cycle; };
          if (baud_rate == BR_64) { wait [64] * cycle; };
      };
   };

//----------------------------------------------------------------------------------------
   
//      function to send signal packets to the DUT
   send_pkt(in_pkt: serial_signal_type) @clock_e is only
   {
    //   ports receive the signal from bfm according to the generated sequences
      if (in_pkt.pkt_kind == RESET) 
      {
         message(LOW, "in reset") ;
         p_reset$       = 0       ;
         p_scon0_ri_i$  = 0       ;
         p_scon1_ti_i$  = 0       ;
         p_scon3_tb8$   = 0       ;
         p_scon4_ren$   = 0       ;
         p_scon7_mode$  = 0       ;
         p_data_sbuf_i$ = 0       ;
         p_br$          = 0       ;
         wait [2] * cycle         ;

         p_reset$       = 1       ;
                  
//         out("out reset");
      };      
      
      if (in_pkt.pkt_kind == NO_RESET) 
      {
         out ("reset esta em: ", in_pkt.p_reset);
         if(in_pkt.p_reset == 0)
         {
            message(LOW, "ERRO DE SIMULACAO");
            dut_error();
         };
         wait [1];
         p_reset$       = in_pkt.p_reset      ;
         p_scon0_ri_i$  = in_pkt.p_scon0_ri_i ;
         p_scon1_ti_i$  = in_pkt.p_scon1_ti_i ;
         p_scon3_tb8$   = in_pkt.p_scon3_tb8  ;
         p_scon4_ren$   = 1  ;
         p_scon7_mode$  = 1 ;
         p_data_sbuf_i$ = in_pkt.p_data_sbuf_i;
    
         wait [ 2 ] * cycle;
         p_scon4_ren$   = 0 ;
         p_scon7_mode$  = 0 ;
         
         wait [400] * cycle;
     };
      
      
      if (in_pkt.pkt_kind == GEN_8B)
      {
            wait [2] * cycle @br_clk_e       ;
      
         for i from 0 to 7
         {
            wait cycle @br_clk_e          ;
            gen rx_bit                    ;
            p_p3_0_i$   = rx_bit          ;
            in_pkt.buffer_8[i:i] = rx_bit ;
         };
            p_data_sbuf_i$ = in_pkt.buffer_8[7:0];
         
         out("variavel: ", in_pkt.buffer_8);
      };
           
     
   };
};

'>
