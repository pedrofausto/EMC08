<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_types.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt
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

type int_env_name_t: [INT, INT_IN, INT_OUT];

type int_signal_type_kind: [
                            PKT_NOP,  
                            PKT_RAND_IE,  
                            PKT_RAND_IP,  
                            PKT_RAND_SCON,  
                            PKT_RAND_TCON,  
                            PKT_RAND_TCON2
                           ];
    
type int_signal_type_bit_kynd: [
                            PKT_RAND_INTEXT,  
                            PKT_RAND_RDY,  
                            PKT_RAND_NA,
                            PKT_BIT_NOP,
                            PKT_RESET
                            ];
type flag_t: [DIS, EN];

type interrupt_t: [ NONE, IE0, TF0, IE1, TF1, TF2, RI_TI, TXRX];

type interrupt_priority_t: [PRIORITY_NONE, PRIORITY_0, PRIORITY_1];

type feature_t:    [
                    FEATURE_F1_V1, 
                    FEATURE_F1_V2, 
                    FEATURE_F2_V1,
                    FEATURE_F3_V1,
                    FEATURE_F4_V1
                    ];

type feature_f1_v1_t: [
                    INT_NONE_ERROR, 
                    INT_OTHER,
                    INT_NONE_OK
                   ];
type feature_int_t: [
                    INT_NONE, 
                    INT_IE0, 
                    INT_TF0, 
                    INT_IE1, 
                    INT_TF1, 
                    INT_TF2, 
                    INT_RI_TI, 
                    INT_TXRX,
                    INT_OTHER
                   ];
                   
type feature_f1_v2_t: [
                    INT_TF2_ERROR, 
                    INT_TXRX_ERROR,
                    INT_RI_TI_ERROR, 
                    INT_TF1_ERROR, 
                    INT_IE1_ERROR, 
                    INT_TF0_ERROR, 
                    INT_IE0_ERROR,
                    INT_TXRX_OK, 
                    INT_TF2_OK, 
                    INT_RI_TI_OK, 
                    INT_TF1_OK, 
                    INT_IE1_OK, 
                    INT_TF0_OK, 
                    INT_IE0_OK
                   ];

type feature_f2_v1_t: [
                    INT_NONE_ERROR,
                    INT_TF2_ERROR, 
                    INT_TXRX_ERROR,
                    INT_RI_TI_ERROR, 
                    INT_TF1_ERROR, 
                    INT_IE1_ERROR, 
                    INT_TF0_ERROR, 
                    INT_IE0_ERROR,
                    INT_TXRX_OK, 
                    INT_TF2_OK, 
                    INT_RI_TI_OK, 
                    INT_TF1_OK, 
                    INT_IE1_OK, 
                    INT_TF0_OK, 
                    INT_IE0_OK,
                    INT_NONE_OK
                   ];   
                   
type feature_f3_v1_t: [
                    IE0_LEVEL_ERROR,
                    IE1_LEVEL_ERROR,
                    IE0_TRANSITION_ERROR,
                    IE1_TRANSITION_ERROR,
                    IE0_LEVEL_OK,
                    IE1_LEVEL_OK,
                    IE0_TRANSITION_OK,
                    IE1_TRANSITION_OK
                   ];

type feature_f4_v1_t: [
                    RESET_OK,
                    RESET_ERROR
                   ];
'>