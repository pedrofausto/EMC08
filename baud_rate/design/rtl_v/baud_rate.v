// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: baud_rate_func.v
// Module Name: Baud Rate
// Author: Dino Cassel
// E-mail: dino.diga8@emc08.br
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 0.1 20/08/2010 Initial version
// 0.2 23/08/2010 Cycle start bit logic modified
// 0.3 24/08/2010 Baud-rate output inverted
// 0.4 27/08/2010 Four rates for mode RS232 communication added and
//                entry for reset baud-rate in mode 2
// 1.0 31/08/2010 All synthesizer and lec warnings revised
// 1.1 10/09/2010 Machine Cycle modified
// -------------------------------------------------------------------
// Description
// This file implements the basic functions of baud rate module.
// The output in reset mode is 0. Problem with baud-rate shift 
// solucioned.
// -------------------------------------------------------------------
// NAME: baud rate module
// TYPE: function file
// -------------------------------------------------------------------
// PURPOSE: baud rate generation for serial module.
// -------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME : RANGE : DESCRIPTION : DEFAULT : UNITS :
// n.a.       : n.a.  : n.a.        : n.a.    : n.a.  :
// -------------------------------------------------------------------

`timescale 1 ns / 10 ps

module baud_rate (
                  system_clk_i,
                  system_rst_i_b,
                  baud_rate_scon_sm0_i,
                  baud_rate_scon_sm1_i,
                  baud_rate_scon_sm2_i,
                  baud_rate_pcon_smod_i,
                  baud_rate_pcon_rs232_i,
//                   baud_rate_clear_counter_i,
                  baud_rate_cm_o,
                  baud_rate_br_trans_o,
                  baud_rate_br_o
                 );

`include "/home/student/EMC08/digital_A/baud_rate/design/rtl_v/baud_rate_defines.def"

input  wire system_clk_i;              // main system clock
input  wire system_rst_i_b;            // system reset
input  wire baud_rate_scon_sm0_i;      // serial mode
input  wire baud_rate_scon_sm1_i;      // communication rate in RS232 mode
input  wire baud_rate_scon_sm2_i;      // communication rate in RS232 mode
input  wire baud_rate_pcon_smod_i;     // baud rate duplicator
input  wire baud_rate_pcon_rs232_i;    // RS232 mode
// input  wire baud_rate_clear_counter_i; // reset baud-rate in mode 2
output reg  baud_rate_cm_o;            // cycle machine output
output reg  baud_rate_br_trans_o;      // output baud rate 16 times faster of br output, in mode 2
output reg  baud_rate_br_o;            // output baud rate

reg [4:0] baud_rate_counter;             // counter for baud-rate generation
reg [1:0] baud_rate_trans_counter;       // counter for baud-rate transition generation
reg [5:0] baud_rate_width;               // width baud-rate - max 64
reg [4:0] baud_rate_RS232_width;         // width baud-rate counter in mode 2 - max 64
reg [4:0] baud_rate_RS232_counter;       // counter for reset baud-rate in mode 2
reg [4:0] baud_rate_RS232_trans_counter; // counter for reset baud-rate transition in mode 2
//reg        baud_rate_mode_2_start;        // baud-rate in mode 2 start - search br_trans posedge
//reg        baud_rate_mode_2_work;         // baud-rate in mode 2 work

// ----------------------------------------------------------------------------
// BAUD-RATE BLOCK
// ----------------------------------------------------------------------------
always @(posedge system_clk_i)
begin
   if (system_rst_i_b == 1'b0)
   begin
      baud_rate_cm_o                <= 1'b0;
      baud_rate_br_trans_o          <= 1'b0;
      baud_rate_br_o                <= 1'b0;

      baud_rate_counter             <= 5'd0;
      baud_rate_trans_counter       <= 2'd0;
      baud_rate_RS232_counter       <= 5'd0;
      baud_rate_RS232_trans_counter <= 5'd0;

      baud_rate_width               <= 6'd0;
      baud_rate_RS232_width         <= 5'd0;

//      baud_rate_mode_2_start        <= 1'b0;
//      baud_rate_mode_2_work         <= 1'b1;
   end // reset
   else
   begin
      // ----------------------------------------------------------------------
      // MODE DEFINITION
      // ----------------------------------------------------------------------
      if (baud_rate_scon_sm0_i == 1'b0)
      begin
         baud_rate_width       <= {5'b0, CYCLE_MACHINE_WIDTH};
         baud_rate_RS232_width <= 5'd0;
      end // sm0 == 0
      else
      begin
         if (baud_rate_pcon_smod_i == 1'b1)
         begin
            baud_rate_width       <= 6'd31;
            baud_rate_RS232_width <= 5'd0;
         end // smod == 1
         else
         begin
            baud_rate_width <= 6'd63;
            if (baud_rate_pcon_rs232_i == 1'b1)
            begin
               case ({baud_rate_scon_sm1_i, baud_rate_scon_sm2_i})
                  MODE_9600:   baud_rate_RS232_width <= COUNTER_9600;
                  MODE_19200:  baud_rate_RS232_width <= COUNTER_19200;
                  MODE_57600:  baud_rate_RS232_width <= COUNTER_57600;
                  MODE_115200: baud_rate_RS232_width <= COUNTER_115200;
               endcase
            end // mode RS232 active
            else
            begin
               baud_rate_RS232_width <= 5'd0;
            end // else mode RS232 active
         end // smod == 0
      end // sm0 == 1
      // ----------------------------------------------------------------------
      // CYCLE MACHINE GENERATOR
      // ----------------------------------------------------------------------
      baud_rate_cm_o <= baud_rate_cm_o + 1'b1;
      // ----------------------------------------------------------------------
      // BAUD-RATE GENERATOR
      // ----------------------------------------------------------------------
      if (baud_rate_scon_sm0_i == 1'b1)
      begin
         // -------------------------------------------------------------------
         // BAUD-RATE TRANS GENERATOR
         // -------------------------------------------------------------------
         if ({4'b0000, baud_rate_trans_counter} >= (((baud_rate_width - 6'd31) / 6'd2) / 6'd16))
         begin
            if (baud_rate_RS232_trans_counter < baud_rate_RS232_width)
            begin
               baud_rate_RS232_trans_counter <= baud_rate_RS232_trans_counter + 5'd1;
               baud_rate_br_trans_o          <= baud_rate_br_trans_o;
            end // counter in RS232 mode
            else
            begin
               baud_rate_RS232_trans_counter <= 5'd0;
               baud_rate_trans_counter       <= 2'd0;
               baud_rate_br_trans_o          <= baud_rate_br_trans_o + 1'b1;
            end // else counter in RS232 mode
         end // baud-reate transition sets
         else
         begin
            if (baud_rate_RS232_trans_counter < baud_rate_RS232_width)
            begin
               baud_rate_RS232_trans_counter <= baud_rate_RS232_trans_counter + 5'd1;
               baud_rate_br_trans_o          <= baud_rate_br_trans_o;
            end // counter in RS232 mode
            else
            begin
               baud_rate_RS232_trans_counter <= 5'd0;
               baud_rate_trans_counter       <= baud_rate_trans_counter + 2'd1;
               baud_rate_br_trans_o          <= baud_rate_br_trans_o;
            end // else counter in RS232 mode
         end // else baud-reate transition sets
         // -------------------------------------------------------------------
//          if (baud_rate_clear_counter_i == 1'b1) // starting mode 2
//          begin
//             baud_rate_counter       <= 5'd0;
//             baud_rate_RS232_counter <= 5'd0;
//             baud_rate_mode_2_start  <= 1'b1; // starting search for posedge br_trans
//             baud_rate_mode_2_work   <= 1'b0;
// 
//             baud_rate_br_o <= 1'b0;
//          end // clear counter active
//          // -------------------------------------------------------------------
//          else
//          begin
//             if (baud_rate_mode_2_start == 1'b1) // search posedge br_trans
//             begin
//                if (({4'b0000, baud_rate_trans_counter} >= (((baud_rate_width - 6'd31) / 6'd2) / 6'd16)) &&
//                    (baud_rate_br_trans_o == 1'b0))
//                begin
//                  if (baud_rate_RS232_trans_counter < baud_rate_RS232_width)
//                   begin
//                      baud_rate_counter       <= 5'd0;
//                      baud_rate_RS232_counter <= 5'd0;
//                      baud_rate_mode_2_start  <= 1'b1;
//                      baud_rate_mode_2_work   <= 1'b0;
//  
//                      baud_rate_br_o <= 1'b0;
//                    end
//                    else
//                    begin
//                      baud_rate_counter       <= 5'd0;
//                      baud_rate_RS232_counter <= 5'd0;
//                      baud_rate_mode_2_start  <= 1'b0;
//                      baud_rate_mode_2_work   <= 1'b1;
// 
//                      baud_rate_br_o <= 1'b0;
//                    end
//                end // if posedge br_trans is true
//                else
//                begin
//                   baud_rate_counter       <= 5'd0;
//                   baud_rate_RS232_counter <= 5'd0;
//                   baud_rate_mode_2_start  <= 1'b1;
//                   baud_rate_mode_2_work   <= 1'b0;
// 
//                   baud_rate_br_o <= 1'b0;
//                end // if posedge br_trans is false
//             end // search posedge br_trans
//             else // working
//             begin
//                if (baud_rate_mode_2_work == 1'b1)
//                begin
//                   baud_rate_mode_2_start <= 1'b0;
//                   baud_rate_mode_2_work  <= 1'b1;
                  // ----------------------------------------------------------
                  // BAUD-RATE GENERATOR IN MODE 2
                  // ----------------------------------------------------------
                  if ({1'b0, baud_rate_counter} >= ((baud_rate_width - 6'd1) / 6'd2))
                  begin
                     if (baud_rate_RS232_counter < baud_rate_RS232_width)
                     begin
                        baud_rate_RS232_counter <= baud_rate_RS232_counter + 5'd1;
                        baud_rate_br_o          <= baud_rate_br_o;
                     end // counter in RS232 mode
                     else
                     begin
                        baud_rate_RS232_counter <= 5'd0;
                        baud_rate_counter       <= 5'd0;
                        baud_rate_br_o          <= baud_rate_br_o + 1'b1;
                     end // else counter in RS232 mode
                  end // cycle machine counter
                  else
                  begin
                     if (baud_rate_RS232_counter < baud_rate_RS232_width)
                     begin
                        baud_rate_RS232_counter <= baud_rate_RS232_counter + 5'd1;
                        baud_rate_br_o          <= baud_rate_br_o;
                     end // counter in RS232 mode
                     else
                     begin
                        baud_rate_RS232_counter <= 5'd0;
                        baud_rate_counter       <= baud_rate_counter + 5'd1;
                        baud_rate_br_o          <= baud_rate_br_o;
                     end // else counter in RS232 mode
                  end // else cycle machine counter
                  // ----------------------------------------------------------
//                end
//                else
//                begin
//                   baud_rate_counter       <= 5'd0;
//                   baud_rate_RS232_counter <= 5'd0;
//                   baud_rate_mode_2_start  <= 1'b0;
//                   baud_rate_mode_2_work   <= 1'b0;
// 
//                   baud_rate_br_o <= 1'b0;
//                end
//             end // working
//          end // else clear_counter == 1
      end // mode 2 (sm0 == 1)
      else
      begin
         // -------------------------------------------------------------------
         // BAUD-RATE GENERATOR IN MODE 0
         // -------------------------------------------------------------------
         baud_rate_trans_counter       <= 2'd0;
         baud_rate_RS232_trans_counter <= 5'd0;
//          baud_rate_mode_2_start        <= 1'b0;
//          baud_rate_mode_2_work         <= 1'b1;

         baud_rate_br_trans_o <= 1'b0;
         baud_rate_br_o       <= baud_rate_br_o + 1'b1; // baud-rate generator in mode 1
      end // else mode 2 - mode 1 (sm0 == 0)
      // ----------------------------------------------------------------------
   end // else reset
end // always

endmodule
