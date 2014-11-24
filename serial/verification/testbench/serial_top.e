<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_top.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 06/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      06-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, phy - physical, bfm - bus functional mode, 
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
import serial_types;

// base class that instance the input signals
import serial_signal_type;

// import serial_method_types;
import serial_phy;

// header and interface to the files
import serial_mon_h;
import serial_bfm_i_h;
import serial_bfm_o_h;
import serial_sig_h;
import serial_agent_h;
import serial_sync_h;
import serial_env_h;

// files that overwrite the headers
import serial_mon;
import serial_reference_model;
import serial_bfm_i;
import serial_bfm_o;
import serial_sig;
import serial_agent;
import serial_sync;
import serial_env;

// create the sequence
import serial_seq;
   
// connect the drivers and sequences
import serial_connect_seq;
import serial_lib;

'>
