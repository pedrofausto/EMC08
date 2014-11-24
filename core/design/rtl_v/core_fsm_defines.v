// State machine parameters in gray coding to prevent combinational glicthes
parameter STATE_RESET        = 3'b100; // Reset state. Initialize registers
                                       // and memories.
parameter STATE_DECODE_1     = 3'b000; // Fetch instruction state from memory.
                                       // Ask to memory for the next instrunc.
parameter STATE_DECODE_2     = 3'b001; // Ask the register control sub-module to
                                       // read/write to the SFR.
parameter STATE_EXECUTION    = 3'b011; // Ask the ALU sub-module to do its work.
parameter STATE_WRITE_BACK   = 3'b010; // Decide if the PC must be changed or 
                                       // remain the same.
                                       //Register bank select
   parameter BANK_0 = 2'd0;
   parameter BANK_1 = 2'd1;
   parameter BANK_2 = 2'd2;
   parameter BANK_3 = 2'd3;

// Register number select
   parameter REG_R0 = 3'd0;
   parameter REG_R1 = 3'd1;
   parameter REG_R2 = 3'd2;
   parameter REG_R3 = 3'd3;
   parameter REG_R4 = 3'd4;
   parameter REG_R5 = 3'd5;
   parameter REG_R6 = 3'd6;
   parameter REG_R7 = 3'd7;
   
// Addresses of SFR Registers  (BYTEs and BITs) 
   parameter SFR_DPL            = 8'h82;
   parameter SFR_DPH            = 8'h83;
   parameter SFR_A              = 8'hE0;
   parameter SFR_B              = 8'hF0;
   parameter SFR_SP             = 8'h81;
   parameter SFR_IP             = 8'hB8;
      parameter SFR_IP_0        = 8'hB8;
      parameter SFR_IP_1        = 8'hB9;
      parameter SFR_IP_2        = 8'hBA;
      parameter SFR_IP_3        = 8'hBB;
      parameter SFR_IP_4        = 8'hBC;
      parameter SFR_IP_5        = 8'hBD;
      parameter SFR_IP_6        = 8'hBE;
   parameter SFR_IE             = 8'hA8;
      parameter SFR_IE_0        = 8'hA8;
      parameter SFR_IE_1        = 8'hA9;
      parameter SFR_IE_2        = 8'hAA;
      parameter SFR_IE_3        = 8'hAB;
      parameter SFR_IE_4        = 8'hAC;
      parameter SFR_IE_5        = 8'hAD;
      parameter SFR_IE_6        = 8'hAE;
      parameter SFR_IE_7        = 8'hAF;
   parameter SFR_PSW            = 8'hD0;      
      parameter SFR_PSW_P       = 8'hD0;
      parameter SFR_PSW_OV      = 8'hD2;
      parameter SFR_PSW_RS0     = 8'hD3;
      parameter SFR_PSW_RS1     = 8'hD4;
      parameter SFR_PSW_F0      = 8'hD5;
      parameter SFR_PSW_AC      = 8'hD6;
      parameter SFR_PSW_CY      = 8'hD7;
   parameter SFR_P0             = 8'h80;
      parameter SFR_P0EN        = 8'hC0;
   parameter SFR_P1             = 8'h90;
      parameter SFR_P1EN        = 8'hC8;
   parameter SFR_P2             = 8'hA0;
      parameter SFR_P2EN        = 8'hE8;
   parameter SFR_P3             = 8'hB0;
      parameter SFR_P3EN        = 8'hF8;
   parameter SFR_P4             = 8'hAF;
      
   
         
                                                                        
                                      
     
// Interrupt vector parameters
   parameter INT_NONE           = 3'd0; // 
   parameter INT_IE0            = 3'd1; // 
   parameter INT_TF0            = 3'd2; // 
   parameter INT_IE1            = 3'd3; // 
   parameter INT_TF1            = 3'd4; // 
   parameter INT_TF2            = 3'd5; // 
   parameter INT_RI_TI          = 3'd6; // 
   parameter INT_TXRX           = 3'd7; // 
   
   
// rd and wr flags parameters
   parameter ON                 = 1'b0;
   parameter OFF                = 1'b1;
   parameter EN                 = 1'b1;
   parameter DIS                = 1'b0;
   parameter BIT                = 1'b1;
   parameter BYTE               = 1'b0;
   
   
   