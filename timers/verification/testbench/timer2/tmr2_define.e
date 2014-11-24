<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_define.e
// Module Name : Timer 0
// Author : Hugo Kakisaka, Marcelo Mamoru Ono
// E-mail : diga21@emc8.br, diga20@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords:
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to apply to
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

//  Scale => 1 cycle = 50 ns

   define `WIDTH_PHT_H           128 ;     // PHT Pulse Width At Logic Level 1  20
   
   define `SYSTEM_CLK            1   ;     // System Clock Cycle
   
   define `SYSTEM_CLK_PER        50  ;    // 50 ns Clock Cycle Period
      
   define `GLITCH_PULSES         10  ;    // Glitch Pulses Quantity (Cycles)  
   
   define `FALL_EDGE             0   ;    // Fall Edge Mode
   
   define `RISE_EDGE             1   ;    // Rise Edge Mode  
   
   
   define `PACKET_LENGTH         200 ;    // Packet Lenght in Cycles

'>
