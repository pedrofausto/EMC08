<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_top.e
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
// Keywords: int - interrupt, phy - physical, bfm - bus functional mode, 
// mon - monitor, phy - physical, env - environment, sig - signal map,
// sync - synchronizer
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
import int_types;

// base class that instance the input signals
import int_signal_type;

// import int_method_types;
import int_phy;

// header and interface to the files
import int_mon_h;
import int_bfm_i_h;
import int_bfm_o_h;
import int_sig_h;
import int_agent_h;
import int_sync_h;
import int_env_h;

// files that overwrite the headers
import int_mon;
import int_functional_model;
import int_bfm_i;
import int_bfm_o;
import int_sig;
import int_agent;
import int_sync;
import int_env;

// create the sequence
import int_seq;
   
// connect the drivers and sequences
import int_connect_seq;
import int_lib;

'>
