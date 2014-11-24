<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_top.e
// Module Name : Timer 0
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.tmr0, diga19@emc08.tmr0
// -----------------------------------------------------------------------------
// Review(s) : 06/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      06-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: 
// -----------------------------------------------------------------------------
// Purpose: Organize the include files
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

package EMC08_projetc;

import evc_util/e/evc_util_top;
import vt_util/e/vt_util_top;

// types of packets (IN or OUT)
import tmr2_types;


//import tmr2_define.e ;

// base class that instance the input signals
import tmr2_signal;

// import br_method_types;
import tmr2_phy;

import tmr2_define.e ;

// header and interface to the files
import tmr2_mon_h;
import tmr2_bfm_i_h;
import tmr2_bfm_o_h;
import tmr2_sig_h;
import tmr2_agent_h;
import tmr2_sync_h;
import tmr2_env_h;

// files that overwrite the headers
import tmr2_mon;
import tmr2_reference_model;
import tmr2_bfm_i;
import tmr2_bfm_o;
import tmr2_sig;
import tmr2_agent;
import tmr2_sync;
import tmr2_env;

//import tmr2_sig_internal.e;

import tmr2_bfm_pht.e;

// create the sequence
import tmr2_seq;
   
// connect the drivers and sequences
import tmr2_connect_seq;
import tmr2_lib;

'>
