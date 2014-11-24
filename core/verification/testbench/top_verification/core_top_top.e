<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_top.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, phy - physical, bfm - bus functional 
// model, mon - monitor, phy - physical, env - environment, sig - signal map,
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
import core_top_types;

// base class that instance the input signals
import core_top_signal_type;

// import core_top_method_types;
import core_top_phy;

// header and interface to the files
import core_top_mon_h;
import core_top_bfm_i_h;
import core_top_bfm_o_h;
import core_top_sig_h;
import core_top_agent_h;
import core_top_sync_h;
import core_top_env_h;

// files that overwrite the headers
import core_top_mon;
import core_top_reference_model;
import core_top_bfm_i;
import core_top_bfm_o;
import core_top_sig;
import core_top_agent;
import core_top_sync;
import core_top_env;

// create the sequence
import core_top_seq;
   
// connect the drivers and sequences
import core_top_connect_seq;
import core_top_lib;

import core_top_write_mem;

'>
