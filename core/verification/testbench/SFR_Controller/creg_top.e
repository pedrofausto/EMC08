<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_top.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, phy - physical, bfm - bus functional mode, 
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
import creg_types;

// base class that instance the input signals
import creg_signal_type;

// import creg_method_types;
import creg_phy;

// header and interface to the files
import creg_mon_h;
import creg_bfm_i_h;
import creg_bfm_o_h;
import creg_sig_h;
import creg_agent_h;
import creg_sync_h;
import creg_env_h;

// files that overwrite the headers
import creg_define;
import creg_mon;
import creg_reference_model;
import creg_bfm_i;
import creg_bfm_o;
import creg_sig;
import creg_agent;
import creg_sync;
import creg_env;

// create the sequence
import creg_seq;
   
// connect the drivers and sequences
import creg_connect_seq;
import creg_lib;

'>
