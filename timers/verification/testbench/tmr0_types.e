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

type tmr0_env_name_t: [TMR0, TMR0_IN, TMR0_OUT];

type feature_t:			[FEAT_F1_V1,
								 FEAT_F2_V1,
								 FEAT_F4_V1
							//	 FEAT_2,
							//	 FEAT_3
								 ];
						 
type feature_f1_v1_t:	[
									FEAT_F1_V1_PASS,
									FEAT_F1_V1_FAIL
								];
								
type feature_f2_v1_t:	[
									FEAT_F2_V1_PASS,
									FEAT_F2_V1_FAIL
								];
								
type feature_f3_v1_t:	[
									FEAT_F3_V1_PASS,
									FEAT_F3_V1_FAIL
								];
								
type feature_f3_v2_t:	[
									FEAT_F3_V2_PASS,
									FEAT_F3_V2_FAIL
								];
								
type feature_f4_v1_t:	[
									FEAT_F4_V1_PASS,
									FEAT_F4_V1_FAIL
								];
								
type feature_f5_v1_t:	[
									FEAT_F5_V1_PASS,
									FEAT_F5_V1_FAIL
								];
								
type feature_f5_v2_t:	[
									FEAT_F5_V2_PASS,
									FEAT_F5_V2_FAIL
								];
								
type feature_f6_v1_t:	[
									FEAT_F6_V1_PASS,
									FEAT_F6_V1_FAIL
								];
								
type feature_f6_v2_t:	[
									FEAT_F6_V2_PASS,
									FEAT_F6_V2_FAIL
								];
								
type feature_f7_v1_t:	[
									FEAT_F7_V1_PASS,
									FEAT_F7_V1_FAIL
								];

'>