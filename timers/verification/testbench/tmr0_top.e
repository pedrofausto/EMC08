<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr0_top.e
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
import tmr0_types;

// base class that instance the input signals
import tmr0_signal;

// import br_method_types;
import tmr0_phy;

// header and interface to the files
import tmr0_mon_h;
import tmr0_bfm_i_h;
import tmr0_bfm_o_h;
import tmr0_sig_h;
import tmr0_agent_h;
import tmr0_sync_h;
import tmr0_env_h;

// files that overwrite the headers
import tmr0_mon;
import tmr0_reference_model;
import tmr0_bfm_i;
import tmr0_bfm_o;
import tmr0_sig;
import tmr0_agent;
import tmr0_sync;
import tmr0_env;

// create the sequence
import tmr0_seq;
   
// connect the drivers and sequences
import tmr0_connect_seq;
import tmr0_lib;

'>
