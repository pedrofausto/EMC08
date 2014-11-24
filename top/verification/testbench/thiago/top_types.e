<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_types.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.top
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module
// -----------------------------------------------------------------------------
// Purpose: Create the types for environment
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
extend sys {feature: feature_kind_t};
extend sys {testcase: testcase_kind_t};
extend sys {data: uint(bits:8)};

type feature_kind_t: [feature_reset,feature_ports,  feature_timers, feature_mem_ram, feature_serial, feature_interrupt,  feature_core];

type testcase_kind_t: [testcase1, testcase2, testcase3, testcase4, testcase5, testcase6, testcase7, testcase8];

type top_env_name_t: [TOP, TOP_IN, TOP_OUT];



'>