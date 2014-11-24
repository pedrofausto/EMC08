<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_bfm_i.e
// Module Name : TOP
// Author :  Harney Abrahim
// E-mail :  diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, bfm - bus functional mode
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
// Include Files: top_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_bfm_i_h;

extend top_bfm_i_u {
     //////////////////// INPUT PORTS  ///////////////////////////////
   !p_top_reset_i: inout simple_port of bit;
   
   !p_top_p0_y_i: inout simple_port of uint(bits:8);
   !p_top_p1_y_i: inout simple_port of uint(bits:8);
   !p_top_p2_y_i: inout simple_port of uint(bits:8);
   !p_top_p3_y_i: inout simple_port of uint(bits:8);
   
   !p_top_ea_b_i: inout simple_port of bit;
   
   !p_top_pht_i: inout simple_port of bit;

   !p_baud_rate: inout simple_port of bit;
   !p_sfr_ren: inout simple_port of bit;
   !p_sfr_es:  inout simple_port of bit;

   event baud_rate_fall is (fall(p_baud_rate$)@sim);
   event rx_event is (rise(p_sfr_ren$)@sim or rise(p_sfr_es$)@sim);
   event sfr_ren_rise is (rise(p_sfr_ren$)@sim);
   event sfr_es_rise is (rise(p_sfr_es$)@sim);
   
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: top_signal_type;

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
   send_pkt(in_pkt: top_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
      var period: int = 25;
      
      case sys.feature {
         feature_core: {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait [1100] * cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         }; //end feature core
         -----------------------------------------------
         feature_interrupt {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
         
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait [1100] * cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         };// end feature_interrupt
         -----------------------------------------------
         feature_ports {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
         
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait [1100] * cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         };// end feature_interrupt
         -----------------------------------------------
         feature_serial {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == TRANSMISSION) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait cycle;
               } else if (in_pkt.pkt_kind == RECEPTION_MODE2) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i;
                  sys.data=in_pkt.top_rx_data;
                  wait @rx_event;
                  if (p_sfr_ren$==1) {
                     wait @sfr_es_rise;
                  } else {
                     wait @sfr_ren_rise;
                  };
                  outf("RX Data: 0%08b\n01",in_pkt.top_rx_data);
                  wait @baud_rate_fall;
                  p_top_p3_y_i$[0:0] = 0;
                  for i from 0 to 7 {
                     wait @baud_rate_fall;
                     p_top_p3_y_i$[0:0] = in_pkt.top_rx_data[i:i];
                  };
                  wait @baud_rate_fall;
                  p_top_p3_y_i$[0:0] = 0;
                  wait @baud_rate_fall;
                  p_top_p3_y_i$[0:0] = 1;
                  wait [100]*cycle;
               } else if (in_pkt.pkt_kind == RECEPTION_MODE0) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i;
                  sys.data=in_pkt.top_rx_data;
                  wait @rx_event;
                  if (p_sfr_ren$==1) {
                     wait @sfr_es_rise;
                  } else {
                     wait @sfr_ren_rise;
                  };
                  outf("RX Data: %08b\n",in_pkt.top_rx_data);
                  for i from 0 to 7 {
                     wait @baud_rate_fall;
                     p_top_p3_y_i$[0:0] = in_pkt.top_rx_data[i:i];
                  };
                  wait [100]*cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         };// end feature_interrupt
         -----------------------------------------------
      }; //end case feature

      
   }; //end send_pkt
};

'>
