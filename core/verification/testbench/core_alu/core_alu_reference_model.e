<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_reference_model.e
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
// Keywords: alu - aritmetic and logic unit
// -----------------------------------------------------------------------------
// Purpose: Reference model to the alu in the Core block. This model reproduce
// the behaviour in the specification. According to this reference model the DUT 
// will be verified
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: reference_model()
// Include Files: core_alu_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend core_alu_mon_u {
   ref_core_alu_opcode : core_alu_signal_type_kind;
   ref_core_alu_enable : bit;

   //reference_model ant values
   ref_core_alu_enable_ant : bit;
   ref_core_alu_op1_ant    : uint(bits:8);
   ref_core_alu_op2_ant    : uint(bits:8);
   ref_core_alu_opcode_ant : uint(bits:5);
   
   reference_model() @clock_e is also {
      out ("STARTING REFERENCE MODEL...");
   
      //reference_model result output
      var ref_core_alu_result : uint(bits:16);

      // reference_model carry output
      var ref_core_alu_cy_out : bit;

      // reference_model acumulator output
      var ref_core_alu_ac_out : bit;

      // reference_model overflow output
      var ref_core_alu_ov_out : bit;

      // auxiliar variables
      var ref_core_alu_cy          : uint(bits:8);
      var ref_core_alu_cy_temp     : uint(bits:8);
      var ref_core_alu_result_temp : uint(bits:8);
      var ref_core_alu_oper1_temp  : uint(bits:8);
      var ref_core_alu_oper2_temp  : uint(bits:8);
      var ref_core_alu_cy_in_aux   : uint(bits:8);
      var cont                     : uint(bits:3);

      wait @enable;

      while (TRUE) {
         if ((ref_core_alu_enable_ant != CORE_ALU_ENABLE_p$) or
             (ref_core_alu_op1_ant    != CORE_ALU_OPER1_p$)  or
             (ref_core_alu_op2_ant    != CORE_ALU_OPER2_p$)  or
             (ref_core_alu_opcode_ant != CORE_ALU_OPCODE_p$)) {
	 if (CORE_ALU_ENABLE_p$ == 1) {
            // ----------------------------------------------------------------
            ref_core_alu_enable = 1;
            // ----------------------------------------------------------------
            case CORE_ALU_OPCODE_p$ {
               0  : { // ALU_NONE
                  ref_core_alu_opcode = ALU_NONE;
                  ref_core_alu_result = 0;
                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               1  : { // ALU_ADD
                  ref_core_alu_opcode      = ALU_ADD;
                  ref_core_alu_result[7:0] = CORE_ALU_OPER1_p$ + CORE_ALU_OPER2_p$;

                  ref_core_alu_cy[0:0] = CORE_ALU_OPER1_p$[0:0] & CORE_ALU_OPER2_p$[0:0];
                  for cont from 1 to 7 do {
                     ref_core_alu_cy[cont:cont] = 
                        (ref_core_alu_cy[cont-1:cont-1] & CORE_ALU_OPER1_p$[cont:cont]) | 
                        (ref_core_alu_cy[cont-1:cont-1] & CORE_ALU_OPER2_p$[cont:cont]) | 
                        (CORE_ALU_OPER1_p$[cont:cont]   & CORE_ALU_OPER2_p$[cont:cont]);
                  };

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = ref_core_alu_cy[3:3];
                  ref_core_alu_cy_out       = ref_core_alu_cy[7:7];
                  ref_core_alu_ov_out       = ref_core_alu_cy[6:6] ^ ref_core_alu_cy[7:7];
               };
               //--------------------------------------------------------------
               2  : { // ALU_INC
                  ref_core_alu_opcode      = ALU_INC;
                  ref_core_alu_result[7:0] = CORE_ALU_OPER1_p$ + CORE_ALU_OPER2_p$;

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out       = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out       = CORE_ALU_OV_IN_p$; 
               };
               //--------------------------------------------------------------
               3  : { // ALU_ADDC
                  ref_core_alu_opcode      = ALU_ADDC;
                  ref_core_alu_result_temp[7:0] = CORE_ALU_OPER1_p$ + CORE_ALU_OPER2_p$;

                  ref_core_alu_cy[0:0] = CORE_ALU_OPER1_p$[0:0] & CORE_ALU_OPER2_p$[0:0];
                  for cont from 1 to 7 do {
                     ref_core_alu_cy[cont:cont] = 
                        (ref_core_alu_cy[cont-1:cont-1] & CORE_ALU_OPER1_p$[cont:cont]) | 
                        (ref_core_alu_cy[cont-1:cont-1] & CORE_ALU_OPER2_p$[cont:cont]) | 
                        (CORE_ALU_OPER1_p$[cont:cont]   & CORE_ALU_OPER2_p$[cont:cont]);
                  };

                  ref_core_alu_result[7:0] = ref_core_alu_result_temp[7:0] + CORE_ALU_CY_IN_p$;

                  ref_core_alu_cy_in_aux    = CORE_ALU_CY_IN_p$;
                  ref_core_alu_cy_temp[0:0] = ref_core_alu_result_temp[0:0] & ref_core_alu_cy_in_aux[0:0];
                  for cont from 1 to 7 do {
                     ref_core_alu_cy_temp[cont:cont] = 
                        (ref_core_alu_cy_temp[cont-1:cont-1] & ref_core_alu_result_temp[cont:cont]) | 
                        (ref_core_alu_cy_temp[cont-1:cont-1] & ref_core_alu_cy_in_aux[cont:cont]) | 
                        (ref_core_alu_result_temp[cont:cont] & ref_core_alu_cy_in_aux[cont:cont]);
                  };

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = ref_core_alu_cy[3:3] | ref_core_alu_cy_temp[3:3];
                  ref_core_alu_cy_out       = ref_core_alu_cy[7:7] | ref_core_alu_cy_temp[7:7];
                  ref_core_alu_ov_out       = (ref_core_alu_cy[6:6] | ref_core_alu_cy_temp[6:6]) ^
                                              (ref_core_alu_cy[7:7] | ref_core_alu_cy_temp[7:7]);
               };
               //--------------------------------------------------------------
               4  : { // ALU_SUB
                  ref_core_alu_opcode           = ALU_SUB;
                  ref_core_alu_cy_in_aux        = CORE_ALU_CY_IN_p$;
                  ref_core_alu_result_temp[7:0] = CORE_ALU_OPER1_p$ - ref_core_alu_cy_in_aux;

                  ref_core_alu_cy = 0;
                  ref_core_alu_cy[0:0] = (1 ^ CORE_ALU_OPER1_p$[0:0]) & ref_core_alu_cy_in_aux[0:0];
                  for cont from 1 to 7 do {
                     if ((ref_core_alu_cy[cont-1:cont-1] != 0) and 
                         (CORE_ALU_OPER1_p$[cont:cont]   == 0)) {
                        ref_core_alu_cy[cont:cont] = 1;
                     };
                  };

                  ref_core_alu_result[7:0] = ref_core_alu_result_temp[7:0] - CORE_ALU_OPER2_p$;

                  ref_core_alu_cy_temp = 0;
                  ref_core_alu_cy_temp[0:0] = (1 ^ ref_core_alu_result_temp[0:0]) & CORE_ALU_OPER2_p$[0:0];
                  for cont from 1 to 7 do {
                     if (ref_core_alu_cy_temp[cont-1:cont-1] == 0) {
                        if ((ref_core_alu_result_temp[cont:cont] == 0) and 
                            (CORE_ALU_OPER2_p$[cont:cont]        == 1)) {
                           ref_core_alu_cy_temp[cont:cont] = 1;
                        };
                     } else {
                        if (ref_core_alu_result_temp[cont:cont] == 0) {
                           ref_core_alu_cy_temp[cont:cont] = 1;
                        } else {
                           if (CORE_ALU_OPER2_p$[cont:cont] == 1) {
                              ref_core_alu_cy_temp[cont:cont] = 1;
                           };
                        };
                     };
                  };

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = ref_core_alu_cy[3:3] | ref_core_alu_cy_temp[3:3];
                  ref_core_alu_cy_out       = ref_core_alu_cy[7:7] | ref_core_alu_cy_temp[7:7];
                  ref_core_alu_ov_out       = (ref_core_alu_cy[6:6] | ref_core_alu_cy_temp[6:6]) ^
                                              (ref_core_alu_cy[7:7] | ref_core_alu_cy_temp[7:7]);
               };
               //--------------------------------------------------------------
               5  : { // ALU_DEC
                  ref_core_alu_opcode       = ALU_DEC;
                  ref_core_alu_result       = CORE_ALU_OPER1_p$ - CORE_ALU_OPER2_p$;
                  //ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out       = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out       = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               6  : { // ALU_MUL
                  ref_core_alu_opcode = ALU_MUL;
                  ref_core_alu_result = CORE_ALU_OPER1_p$ * CORE_ALU_OPER2_p$;
                  ref_core_alu_ac_out = 0;
                  ref_core_alu_cy_out = 0;

                  if (ref_core_alu_result > 255) {
                     ref_core_alu_ov_out = 1;
                  } else {
                     ref_core_alu_ov_out = 0;
                  };
               };
               //--------------------------------------------------------------
               7  : { // ALU_DIV
                  ref_core_alu_opcode = ALU_DIV;
                  if (CORE_ALU_OPER2_p$ == 0) {
                     ref_core_alu_result = 0;
                     ref_core_alu_ov_out = 1;
                  } else {
                     ref_core_alu_result[15:8] = CORE_ALU_OPER1_p$ / CORE_ALU_OPER2_p$;
                     ref_core_alu_result[7:0]  = CORE_ALU_OPER1_p$ % CORE_ALU_OPER2_p$;
                     ref_core_alu_ov_out = 0;
                  };

                  ref_core_alu_ac_out = 0;
                  ref_core_alu_cy_out = 0;
               };
               //--------------------------------------------------------------
               8  : { // ALU_DA
                  ref_core_alu_opcode = ALU_DA;
                  if (CORE_ALU_OPER1_p$[3:0] > 9) {
                     ref_core_alu_result[3:0] = CORE_ALU_OPER1_p$[3:0] + 6;
                     ref_core_alu_ac_out      = 1;
                  } else {
                     ref_core_alu_ac_out      = CORE_ALU_AC_IN_p$;
                     if (CORE_ALU_AC_IN_p$ == 1)  {
                        ref_core_alu_result[3:0] = CORE_ALU_OPER1_p$[3:0] + 6;
                     } else {
                        ref_core_alu_result[3:0] = CORE_ALU_OPER1_p$[3:0];
                     };
                  };
                  if (CORE_ALU_OPER1_p$[7:4] > 9) {
                     ref_core_alu_result[7:4] = CORE_ALU_OPER1_p$[7:4] + 6 + ref_core_alu_ac_out;
                     ref_core_alu_cy_out      = 1;
                  } else {
                     ref_core_alu_cy_out      = CORE_ALU_CY_IN_p$;
                     if (CORE_ALU_CY_IN_p$ == 1)  {
                        ref_core_alu_result[7:4] = CORE_ALU_OPER1_p$[7:4] + 6 + ref_core_alu_ac_out;
                     } else {
                        ref_core_alu_result[7:4] = CORE_ALU_OPER1_p$[7:4] + ref_core_alu_ac_out;
                     };
                  };

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ov_out       = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               9  : { // ALU_AND
                  ref_core_alu_opcode       = ALU_AND;
                  ref_core_alu_result[7:0]  = CORE_ALU_OPER1_p$ & CORE_ALU_OPER2_p$;
		  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               10 : { // ALU_XOR
                  ref_core_alu_opcode       = ALU_XOR;
                  ref_core_alu_result[7:0]  = CORE_ALU_OPER1_p$ ^ CORE_ALU_OPER2_p$;
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               11 : { // ALU_OR
                  ref_core_alu_opcode       = ALU_OR;
                  ref_core_alu_result[7:0]  = CORE_ALU_OPER1_p$ | CORE_ALU_OPER2_p$;
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               12 : { // ALU_RL
                  ref_core_alu_opcode = ALU_RL;
                  for cont from 0 to 6 do {
                     ref_core_alu_result[cont+1:cont+1] = CORE_ALU_OPER1_p$[cont:cont];
                  };
                  ref_core_alu_result[0:0]  = CORE_ALU_OPER1_p$[7:7];
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               13 : { // ALU_RLC
                  ref_core_alu_opcode = ALU_RLC;
                  for cont from 0 to 6 do {
                     ref_core_alu_result[cont+1:cont+1] = CORE_ALU_OPER1_p$[cont:cont];
                  };
                  ref_core_alu_result[0:0]  = CORE_ALU_CY_IN_p$;
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_cy_out = CORE_ALU_OPER1_p$[7:7];
                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               14 : { // ALU_RR
                  ref_core_alu_opcode = ALU_RR;
                  for cont from 1 to 7 do {
                     ref_core_alu_result[cont-1:cont-1] = CORE_ALU_OPER1_p$[cont:cont];
                  };
                  ref_core_alu_result[7:7]  = CORE_ALU_OPER1_p$[0:0];
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               15 : { // ALU_RRC
                  ref_core_alu_opcode = ALU_RRC;
                  for cont from 1 to 7 do {
                     ref_core_alu_result[cont-1:cont-1] = CORE_ALU_OPER1_p$[cont:cont];
                  };
                  ref_core_alu_result[7:7]  = CORE_ALU_CY_IN_p$;
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_cy_out = CORE_ALU_OPER1_p$[0:0];
                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               16 : { // ALU_CPL
                  ref_core_alu_opcode       = ALU_CPL;
                  ref_core_alu_result       = ~CORE_ALU_OPER1_p$;
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               17 : { // ALU_COMP
                  ref_core_alu_opcode = ALU_COMP;
                  if (CORE_ALU_OPER1_p$ == CORE_ALU_OPER2_p$) {
                     ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                     ref_core_alu_result[7:0] = 1;
                  } else {
                     ref_core_alu_result = 0;
                     if (CORE_ALU_OPER1_p$ < CORE_ALU_OPER2_p$) {
                        ref_core_alu_cy_out = 1;
                     } else {
                        ref_core_alu_cy_out = 0;
                     };
                  };

                  ref_core_alu_result[15:8] = 0;
                  ref_core_alu_ac_out       = CORE_ALU_AC_IN_p$;
                  ref_core_alu_ov_out       = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               18 : { // ALU_SWAP
                  ref_core_alu_opcode       = ALU_SWAP;
                  ref_core_alu_result[7:4]  = CORE_ALU_OPER1_p$[3:0];
                  ref_core_alu_result[3:0]  = CORE_ALU_OPER1_p$[7:4];
                  ref_core_alu_result[15:8] = 0;

                  ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
                  ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
                  ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
               };
               //--------------------------------------------------------------
               default: { // unreconized opcode
                  ref_core_alu_opcode = ALU_DISABLE;
                  ref_core_alu_result = 0;
                  ref_core_alu_ac_out = 0;
                  ref_core_alu_cy_out = 0;
                  ref_core_alu_ov_out = 0;
               };
               //--------------------------------------------------------------
            };
         } else {
            ref_core_alu_enable = 0;
            ref_core_alu_opcode = ALU_DISABLE;
            ref_core_alu_result = 0;
            ref_core_alu_ac_out = CORE_ALU_AC_IN_p$;
            ref_core_alu_cy_out = CORE_ALU_CY_IN_p$;
            ref_core_alu_ov_out = CORE_ALU_OV_IN_p$;
         };
         //--------------------------------------------------------------------
         emit coverEnable;
         emit coverOperation;
         //--------------------------------------------------------------------
         if (ref_core_alu_result != CORE_ALU_RESULT_p$ or 
             ref_core_alu_ac_out != CORE_ALU_AC_OUT_p$ or
             ref_core_alu_cy_out != CORE_ALU_CY_OUT_p$ or
             ref_core_alu_ov_out != CORE_ALU_OV_OUT_p$) {

            out ("OPER1      -> ", CORE_ALU_OPER1_p$);
            out ("OPER2      -> ", CORE_ALU_OPER2_p$);
            out ("RESULT     -> ", CORE_ALU_RESULT_p$);
            out ("REF_RESULT -> ", ref_core_alu_result);
            out ("------------------");
            out ("AC_IN      -> ", CORE_ALU_AC_IN_p$);
            out ("AC         -> ", CORE_ALU_AC_OUT_p$);
            out ("REF_AC     -> ", ref_core_alu_ac_out);
            out ("-");
            out ("CY_IN      -> ", CORE_ALU_CY_IN_p$);
            out ("CY         -> ", CORE_ALU_CY_OUT_p$);
            out ("REF_CY     -> ", ref_core_alu_cy_out);
            out ("-");
            out ("OV_IN      -> ", CORE_ALU_OV_IN_p$);
            out ("OV         -> ", CORE_ALU_OV_OUT_p$);
            out ("REF_OV     -> ", ref_core_alu_ov_out);
            out ("------------------");
            out ("RESULT[15:8]     -> ", CORE_ALU_RESULT_p$[15:8]);
            out ("REF_RESULT[15:8] -> ", ref_core_alu_result[15:8]);
            out ("RESULT[7:0]      -> ", CORE_ALU_RESULT_p$[7:0]);
            out ("REF_RESULT[7:0]  -> ", ref_core_alu_result[7:0]);
            out ("----------------------------------");
         };
         //--------------------------------------------------------------------
         check that (ref_core_alu_result == CORE_ALU_RESULT_p$);
         check that (ref_core_alu_ac_out == CORE_ALU_AC_OUT_p$);
         check that (ref_core_alu_cy_out == CORE_ALU_CY_OUT_p$);
         check that (ref_core_alu_ov_out == CORE_ALU_OV_OUT_p$);
	 };
         //--------------------------------------------------------------------
         ref_core_alu_enable_ant = CORE_ALU_ENABLE_p$;
         ref_core_alu_op1_ant    = CORE_ALU_OPER1_p$;
         ref_core_alu_op2_ant    = CORE_ALU_OPER2_p$;
         ref_core_alu_opcode_ant = CORE_ALU_OPCODE_p$;
         //--------------------------------------------------------------------
         wait cycle;
      };
   };
   //--------------------------------------------------------------------------
   event coverOperation;
   cover coverOperation is {
      item ref_core_alu_opcode;
   };
   //--------------------------------------------------------------------------
   event coverEnable;
   cover coverEnable is {
      item ref_core_alu_enable;
   };
   //--------------------------------------------------------------------------
};

'>
