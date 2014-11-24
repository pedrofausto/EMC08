<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_top.e
// Module Name : TOP
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, phy - physical, bfm - bus functional mode, 
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
import top_types;

// base class that instance the input signals
import top_signal_type;

// import top_method_types;
import top_phy;

// header and interface to the files
import top_mon_h;
import top_bfm_i_h;
import top_bfm_o_h;
import top_sig_h;
import top_agent_h;
import top_sync_h;
import top_env_h;

// files that overwrite the headers
import top_mon;
//import top_functional_model;
import top_functional_model_interrupt;
import top_functional_model_serial;
import top_functional_model_core;
import top_functional_model_timers;
import top_functional_model_ports;

import top_bfm_i;
import top_bfm_o;
import top_sig;
import top_agent;
import top_sync;
import top_env;

// create the sequence
import top_seq;
   
// connect the drivers and sequences
import top_connect_seq;
import top_lib;

'>
