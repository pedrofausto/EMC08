<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_signal_type.e
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
// Keywords: int - interrupt, phy - physical
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

struct int_signal_type like any_sequence_item {
   // inputs
   int_rdy_i:    bit;
   int_na_i:     bit; 
   int_ext_i_b:  uint(bits:2);
   reset_b:      bit;
   
   
   // SFR Registers Inputs - BITS: 7 |  6  |  5  |  4  |  3  |  2  |  1  |  0
   reg_ie_i:     uint(bits:8); // EA |ETXRX| ET2 |  ES | ET1 | EX1 | ET0 | EX0
   reg_ip_i:     uint(bits:7); //  - |PTXRX| PT2 |  PS | PT1 | PX1 | PT0 | PX0
   reg_scon_i:   uint(bits:2); //  - |  -  |  -  |  -  |  -  |  -  | TI  | RI 
   reg_tcon_i:   uint(bits:6); //  - |  -  | TF1 | TF0 | IE1 | IT1 | IE0 | IT0
   reg_tcon2_i:  uint(bits:2); //  - |  -  |  -  |  -  |  -  |  -  |TXRXF| TF2

   // IE - Interrupt Enable flags
   // IP - Interrupt priority flags
   // SCON - TI / RI - transmit / receive interrupt flag (cleared by hardware)
   // TCON - TFi - timer overflow flags, IEi - External Int edge flag, 
   //        ITi - Especify falling edge / low level triggered external int 
   // TCON2 - TXRX interrupt flag, TF2 - timer 2 overflow flag
   
   // int_reg_clr_o - flag sent to reg control to set write in regs (decode1 st)
   
   
   // signal type
   pkt_kind:       int_signal_type_kind;
   pkt_bit_kind:   int_signal_type_bit_kynd;
  
   keep soft reg_ie_i[7:7] == select {
         95: 1'b1; // EA enable  95%
         5 : 1'b0; // EA disable 05%
   };
   
                  
 
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
