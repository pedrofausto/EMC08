// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_tx_input_serial_shift_ier_reg.v
// Module Name: serial
// Author: Harney Abrahim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 27/08/2010 Initial version
// 2.0 08/09/2010 Some sync bugs were fixed
// 2.1 09/09/2010 Lec warnig fixed in serial_data_sbuf_i
// 2.2 10/09/2010 Standard signals names 
// 2.3 04/10/2010 Bug with start bit in mode 2 fixed
// -------------------------------------------------------------------
// Description
// Implements the TX serial output serial_shift_ier register that serial_shift_i the transmit
// data according to the baud rate serial_shift_i it and send to the port according
// to the mode
// -------------------------------------------------------------------



module serial_tx_output_shifter_reg (
                                    serial_clock_i,
                                    serial_reset_i_b,
                                    serial_data_sbuf_i,
                                    serial_start_shifter_reg_i,
                                    serial_shift_i,
                                    serial_stop_bit_gen_i,
                                    serial_scon3_tb8_i,
                                    serial_scon7_sm0_i,
                                    serial_start_idle_i,
                                    
                                    serial_data_tx_o,
                                    serial_end_bit_o
                                    ); 

////////////////////// Inputs and Outputs /////////////////////////////////////
input serial_clock_i;	              // main serial_clock_i
input serial_reset_i_b;                  // main serial_reset_i_b
input [7:0]serial_data_sbuf_i;              // data from sbuf in SFR
input serial_start_shifter_reg_i;      // WR_SBUF signal start from core fsm 
input serial_shift_i;                  // serial_shift_i from core to control the transmitter
input serial_stop_bit_gen_i;           // from core to generate the stop bit gen
input serial_scon3_tb8_i;			  // 9th bit to be tranmitted
input serial_scon7_sm0_i;             // Serial mode
input serial_start_idle_i;

output serial_data_tx_o;               // data to be send
output serial_end_bit_o;               // flag to advise core about last data to be send

//////////////////////// Inputs and Outputs data types ////////////////////////
wire       serial_clock_i;
wire       serial_reset_i_b;
wire [7:0] serial_data_sbuf_i;
wire       serial_shifter_reg_i;
wire       serial_shift_i;
wire       serial_stop_bit_gen_i;
wire       serial_scon3_tb8_i;
wire       serial_scon7_sm0_i;
wire       serial_start_idle_i;

reg        serial_data_tx_o;
reg        serial_end_bit_o;

//////////////////////// Internal Variables ///////////////////////////////////
reg [9:0] data_to_transmit;  // internal reg to serial_shift_i and control the send data
reg flag_end_bit;
//////////////////////// Code Begins  /////////////////////////////////////////

// always to control the serial_shift_ier register and send the data
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      data_to_transmit <= 9'd0;
      flag_end_bit     <= 1'b0;
   end
   else
   begin
      if (serial_start_shifter_reg_i == 1'b1) //start the transmitter
      begin
         if (serial_scon7_sm0_i == 1'b0) //if mode 0 load 1 in the 9th bit
         begin
            data_to_transmit[7:0] <= serial_data_sbuf_i; //coming from SBUF
            data_to_transmit[8]   <= 1'b1; //coming from SBUF 
            data_to_transmit[9]   <= 1'b0; //nothing 
         end
         else // mode 2
         begin
            data_to_transmit[0] <= 1'b0; //start bit
            data_to_transmit[8:1] <= serial_data_sbuf_i; //coming from SBUF
            data_to_transmit[9]   <= serial_scon3_tb8_i; //coming from SBUF
         end
      end
      else
      begin
         if (serial_shift_i == 1'b1)
         begin
            data_to_transmit <= data_to_transmit >> 1'b1; // serial_shift_i one bit
         end
         else
         begin
            //////// serial_stop_bit_gen_i_ logic ////////
            if (serial_stop_bit_gen_i == 1'b1)
            begin
               data_to_transmit[9] <= 1'b1;
               data_to_transmit[8:0] <= data_to_transmit[8:0];
               flag_end_bit          <= 1'b1; //flag to control end bit logic   
            end
            else
            begin
               data_to_transmit <= data_to_transmit;
               //// logic to control the end bit
               if (data_to_transmit == 9'b000000000) //stop bit
               begin
                  flag_end_bit          <= 1'b0; // to clear the flag
               end
               else    
               begin
                  flag_end_bit          <= flag_end_bit; 
               end
            end
         end    
      end // else start
   end // else serial_reset_i_b
end // begin always

// end bit logic
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      serial_end_bit_o <= 1'b0; 
   end
   else
   begin
      if (serial_scon7_sm0_i == 1'b0)
      begin
         if (data_to_transmit == 10'b0000000010 || data_to_transmit == 10'b0000000011)
         begin
            serial_end_bit_o <= 1'b1;    
         end
         else
         begin
            serial_end_bit_o <= 1'b0; 
         end    
      end
      else
      begin
         if (data_to_transmit == 10'b0000000001)
         begin
            serial_end_bit_o <= 1'b1;    
         end
         else
         begin
            serial_end_bit_o <= 1'b0; 
         end 
      end
   end 
end   
   
// serial_data_tx_o logic
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      serial_data_tx_o <= 1'd0; 
   end
   else
   begin
      if (serial_start_idle_i == 1'b1)
      begin
         serial_data_tx_o <= 1'b1; //transmitting 1 (idle mode) for one baud rate
      end
      else
      begin
         if (serial_start_shifter_reg_i == 1'b1) // entao ja pode escrever no sbuf
         begin
            serial_data_tx_o <= data_to_transmit[0];
         end
         else
         begin
            if (serial_scon7_sm0_i == 1'b0)
            begin
               if (data_to_transmit == 9'b000000001)
               begin
                  serial_data_tx_o <= 1'd0; // BUG FOUND NEED TO FIX
               end
               else
               begin
                  serial_data_tx_o <= data_to_transmit[0]; 
               end 
            end
            else
            begin
               if (data_to_transmit == 9'b000000000) //stop bit
               begin
                  if (flag_end_bit == 1'b1)
                  begin
                     serial_data_tx_o <= 1'd1; //generate end_bit
                  end
                  else
                  begin
                     serial_data_tx_o <= serial_data_tx_o; 
                  end
               end
               else    
               begin
                  serial_data_tx_o <= data_to_transmit[0]; 
               end
            end
         end // else start
      end //end serial_start_idle
   end  //else serial_reset_i_b   
end //begin always
      

endmodule


 