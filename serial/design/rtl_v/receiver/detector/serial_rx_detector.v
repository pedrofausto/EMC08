// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_detector.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/08/2010 Initial version
// 2.0 08/09/2010 Some bugs in sync were fixed
// 2.1 09/09/2010 unused signal removed
// 2.2 14/09/2010 bug fixed with the clock domains sync
// 2.3 24/09/2010 bug with the reset on different clock domains fixed
// 2.4 06/10/2010 created a signal to control the reception (shif_o)
// -------------------------------------------------------------------
// Description
// This file describes the implementation of the detector to be receiver
// used in the serail module of the EMC08 project. It implements the 
// 1-to-0 transition detector and the bit detector according to the
// specifications
// -------------------------------------------------------------------


module serial_rx_detector (
                           serial_rxd_data_i,
                           serial_br_trans_i,
                           serial_clear_count_i,
                           serial_clock_i,
                           serial_reset_i_b,
                           
                           serial_sample_detected_o,
                           serial_transition_detected_o, 	
                           serial_shift_o
                          ); 

//////////// Inputs and outputs /////////////////////////////////////////
input  serial_rxd_data_i;            //input data for reception
input  serial_br_trans_i;            //baud rate 16 times faster
input  serial_clear_count_i;         //sinchronizes the counter of bit detector
input  serial_clock_i;
input  serial_reset_i_b;

output serial_sample_detected_o;     //sample value determined by the bit detector
output serial_transition_detected_o; //a transition of 1-to-0 was found
output serial_shift_o;
//////////// Inputs and outputs data types //////////////////////////////
wire   serial_rxd_data_i;
wire   serial_br_trans_i;
wire   serial_clear_count_i;
wire   serial_clock_i;
wire   serial_reset_i_b;

//reg    shift_bit_detector;
reg    serial_sample_detected_o;
reg    serial_transition_detected_o;
reg    serial_shift_o;
///////////  Internal variable ///////////////////////////////////////////
reg[3:0] counter;
reg      aux_tran_det;   //auxiliar to transition detector
reg      aux2_tran_det;  //auxiliar 2 to transition detector
reg      aux_reset1;      //auxiliar que garante o serial_reset_i_b durante o serial_br_trans_i
reg      aux_reset2;      //auxiliar que garante o serial_reset_i_b durante o serial_br_trans_i
reg      aux1_bit_det;   //primeiro auxiliar para detecao do bit
reg      aux2_bit_det;   //segundo auxiliar para detecao do bit
reg      aux3_bit_det;   //terceiro auxiliar para detecao do bit

reg      clear;          // clear-count sync with serial_br_trans_i 
reg      clear_br;       // aux to clear count

wire     tran_det;       //aux to detect a transition
wire     bit_det;        //aux to detect the 7,8 e 9 bits in serial_br_trans_i domain

////////////////// CODE BEGIN ////////////////////////////////////////////

// 1-0 bord detector
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      aux_tran_det             <= 1'b0;
      aux2_tran_det            <= 1'b0;
      aux_reset1               <= 1'b1;
      //serial_sample_detected_o <= 1'b0;
      //counter                  <= 4'd0;
   end
   else
   begin
      if (aux_reset2 == 1'b1)
      begin
         aux_reset1             <= 1'b0;
      end
      aux_tran_det  <= serial_rxd_data_i;
      aux2_tran_det <= aux_tran_det;
   end
end

assign tran_det     = (!aux_tran_det && aux2_tran_det); 

// if occur a transition then set the output
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      serial_transition_detected_o <= 1'b0; 
   end
   else
   begin
      serial_transition_detected_o <= tran_det; 
   end     
end

// controls the counter according to br_trans
always @(posedge serial_br_trans_i)
begin
   if (aux_reset1 == 1'b1)
   begin
      aux_reset2  <= 1'b1;
      counter     <= 4'd0;
   end
   else
   begin
      if (aux_reset1 == 1'b0)
      begin
         aux_reset2  <= 1'b0;
      end
      if (clear == 1'b1)
      begin
         counter <=  4'd0;
      end		
      else
      begin
         counter <= counter + 1'd1;
      end    
   end
end

// bit detector logic sampling the 7,8 and 9 samples of the input
always @(posedge serial_br_trans_i)
begin
   if (aux_reset1 == 1'b1 || clear == 1'b1)
   begin
      aux1_bit_det       <= 1'b0;
      aux2_bit_det       <= 1'b0;
      aux3_bit_det       <= 1'b0;
      serial_shift_o     <= 1'b0;
   end
   else
   begin
      case (counter)
          4'd5: begin
                   serial_shift_o        <= 1'b0;
                   aux1_bit_det <= serial_rxd_data_i;
                end 
          4'd6: begin
                   serial_shift_o        <= 1'b0;
                   aux2_bit_det <= serial_rxd_data_i;
                 end 
          4'd7: begin
                   serial_shift_o        <= 1'b1;
                   aux3_bit_det <= serial_rxd_data_i;
                end
          4'd8: begin
                     serial_shift_o        <= 1'b0;
                     aux1_bit_det       <= 1'b0;
                     aux2_bit_det       <= 1'b0;
                     aux3_bit_det       <= 1'b0;
                 end 
                 
       default: begin
                   aux1_bit_det       <= 1'b0;
                   aux2_bit_det       <= 1'b0;
                   aux3_bit_det       <= 1'b0;
                   serial_shift_o     <= 1'b0;
                end
      endcase  
   end  
end

// assign to validate the bit
assign bit_det = ((aux1_bit_det && aux2_bit_det) || (aux1_bit_det && aux3_bit_det)
               || (aux2_bit_det && aux3_bit_det)); 

// set the bit detected in output
always @(posedge serial_br_trans_i)
begin
   if (aux_reset1 == 1'b1)
   begin
      serial_sample_detected_o <= 1'b0;
   end
   else
   begin
      serial_sample_detected_o <= bit_det;     
   end  
end

//always to the clear count detect 
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      clear <= 1'b0; 
   end 
   else
   begin
      if (serial_clear_count_i == 1'b1)
      begin
         clear <= 1'b1;    
      end
      else 
      begin
         if (clear_br == 1'b1) 
         begin
            clear <= 1'b0;
         end
	 else
	 begin
	    clear <=  clear; 
	 end   
      end
   end
end

always @(posedge serial_br_trans_i)
begin
   if (aux_reset1 == 1'b1)
   begin
      clear_br <= 1'b0;
   end
   else
   begin
      if (clear == 1'b1)
      begin
         clear_br <= 1'b1; 
      end
      else
      begin
         clear_br <= 1'b0;
      end
   end  
end


endmodule
