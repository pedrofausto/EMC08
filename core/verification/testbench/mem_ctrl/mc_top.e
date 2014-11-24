<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_top.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Group all files in order to organize the environment
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
// Include Files: mc_*.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

--package EMC08_project;

import evc_util/e/evc_util_top;
import vt_util/e/vt_util_top;

// types of packets (IN or OUT)
import mc_types;

// base class that instance the input signals
import mc_packet_type;

// import mc_method_types;
import mc_phy;

// header and interface to the files
import mc_mon_h;
import mc_bfm_i_h;
import mc_bfm_o_h;
import mc_sig_h;
import mc_agent_h;
import mc_sync_h;
import mc_env_h;

// files that overwrite the headers
import mc_mon;
import mc_reference_model;
import mc_bfm_i;
import mc_bfm_o;
import mc_sig;
import mc_agent;
import mc_sync;
import mc_env;

// create the sequence
import mc_seq;
   
// connect the drivers and sequences
import mc_connect_seq;
import mc_lib;

'>
