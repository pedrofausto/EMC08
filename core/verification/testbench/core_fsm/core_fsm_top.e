<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_top.e
// Module Name : Core_FSM
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, phy - physical, bfm - bus functional mode, 
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
import core_fsm_types;

// base class that instance the input signals
import core_fsm_signal_type;

// import core_fsm_method_types;
import core_fsm_phy;

// header and interface to the files
import core_fsm_mon_h;
import core_fsm_bfm_i_h;
import core_fsm_bfm_o_h;
import core_fsm_sig_h;
import core_fsm_agent_h;
import core_fsm_sync_h;
import core_fsm_env_h;

// files that overwrite the headers
import core_fsm_mon;
import core_fsm_reference_model;
import core_fsm_bfm_i;
import core_fsm_bfm_o;
import core_fsm_sig;
import core_fsm_agent;
import core_fsm_sync;
import core_fsm_env;

// create the sequence
import core_fsm_seq;
   
// connect the drivers and sequences
import core_fsm_connect_seq;
import core_fsm_lib;

'>
