<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_top.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, phy - physical, 
// bfm - bus functional mode, mon - monitor, phy - physical, env - environment,
// sig - signal map, sync - synchronizer
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
import core_alu_types;

// base class that instance the input signals
import core_alu_signal_type;

// import core_alu_method_types;
import core_alu_phy;

// header and interface to the files
import core_alu_mon_h;
import core_alu_bfm_i_h;
import core_alu_bfm_o_h;
import core_alu_sig_h;
import core_alu_agent_h;
import core_alu_sync_h;
import core_alu_env_h;

// files that overwrite the headers
import core_alu_mon;
import core_alu_reference_model;
import core_alu_bfm_i;
import core_alu_bfm_o;
import core_alu_sig;
import core_alu_agent;
import core_alu_sync;
import core_alu_env;

// create the sequence
import core_alu_seq;
   
// connect the drivers and sequences
import core_alu_connect_seq;
import core_alu_lib;

'>
