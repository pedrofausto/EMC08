<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_types.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate
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

type tmr2_env_name_t :  [TMR2, TMR2_IN, TMR2_OUT]                       ;

type feature_t       :  [FEAT_1, FEAT_2, FEAT_3, FEAT_4]                ;

type acg_state_t     :  [ACG_RESET, ACG_STATE1, ACG_STATE2,ACG_STATE3]  ;

type feature_f1_t    :  [RESET_OK, RESET_ERROR]                         ;

type feature_f2_t    :  [ACR_INC_OK, ACR_INC_ERROR]                     ;

type feature_f3_t    :  [DFO_OK, DFO_ERROR]                             ;

type feature_f4_t    :  [EDGE_OK, EDGE_ERROR]                           ;

'>