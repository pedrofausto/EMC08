<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_types.e
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
// Keywords: creg - registers controller
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

type creg_env_name_t: [CREG, CREG_IN, CREG_OUT];

type feature_kind:[FEATURE_F1_V1,
                   FEATUREF1_V2,
                   FEATUREF2,
                   FEATUREF2_V1,
                   FEATUREF3,
                   FEATUREF4];
type feature_f1_v1_t: [
                   CREG_NONE_ERROR, 
                   CREG_OTHER,
                   CREG_NONE_OK
                   ];
type feature_f4_v1_t: [
                    RESET_OK,
                    RESET_ERROR
                   ];
'>