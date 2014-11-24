<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_config.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, seq - sequence, env- environment
// -----------------------------------------------------------------------------
// Purpose: Instance the environment, specify the path of top module and setup 
// some configurations of specman
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: setup()
// Include Files: serial_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_top.e;

// top of the testbench hierarchy, sbt_env_u is instanced here.
extend sys 
{
   env: serial_env_u is instance;

   keep env.hdl_path() == "serial_top_tb_mode0";
   
    
   setup() is also
   {
      set_config(run, tick_max, 10000000000);
      //set_config(cover, mode, on_interactive);
   };
};

'>
