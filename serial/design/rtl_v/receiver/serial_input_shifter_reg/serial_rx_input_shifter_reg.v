// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_input_shifter_reg.v
// Module Name: serial
// Author: Harney Abrahim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 23/08/2010 Initial version
// 2.0 08/09/2010 Bugs to generate the rigth output fixed
// 2.1 10/09/2010 Standard signals names
// 2.2 06/12/2010 Logic added to invert the bits received to be the same transmitted
// -------------------------------------------------------------------
// Description
// Implements the RX serial input shifter register that shift the re-
// ceived data and according to the baud rate shift it and store in a 
// internal register, and after writes it in the SBUF register.
// -------------------------------------------------------------------


module serial_rx_input_shifter_reg (
                                    serial_clock_i,
                                    serial_reset_i_b,
                                    serial_load_sbuf_i,
				    serial_data_i,
				    serial_scon7_sm0_i,
                                    serial_start_input_shift_reg_i,
                                    serial_shift_input_shift_reg_i,
                                    serial_receive_i,
                                    
                                    serial_sbuf_rx_o,
                                    serial_end_bit_o,
                                    serial_scon2_rb8_o
                                    ); 

////////////////////// Inputs and Outputs /////////////////////////////////////
input serial_clock_i;	              // main serial_clock_i
input serial_reset_i_b;                  // main serial_reset_i_b
input serial_load_sbuf_i;              // rx_control avisa q dado pode ser escrito no sbuf
input serial_start_input_shift_reg_i;  // sinal que starta o shifter register com 1FF or 1FE 
input serial_shift_input_shift_reg_i;  // shift para controlar o input shifter register
input serial_data_i;       		      // serial_data_i from mode0 or mode2 
input serial_receive_i;
input serial_scon7_sm0_i;


output[7:0] serial_sbuf_rx_o;               // dado a ser escrito no sbuf
output serial_end_bit_o;               // ultimo bit do registro para controle da fsm
output serial_scon2_rb8_o;			  // write the serial_receive_id TB8 in mode 2

//////////////////////// Inputs and Outputs serial_data_i types ////////////////////////
wire       serial_clock_i;
wire       serial_reset_i_b;
wire       serial_load_sbuf_i;
wire       serial_start_input_shift_reg_i;
wire       serial_shift_input_shift_reg_i;
wire       serial_scon7_sm0_i;
wire       serial_data_i;
wire       serial_receive_i;

reg[7:0]   serial_sbuf_rx_o;
reg        serial_end_bit_o;
reg        serial_scon2_rb8_o;

//////////////////////// Internal Variables ///////////////////////////////////
reg [9:0] data_received; // reg para cotrolar a chegada dos dados

//////////////////////// Code Begins  /////////////////////////////////////////

// logica para receber os dados e shiftar
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      data_received <= 10'd0;
   end
   else
   begin
      if (serial_start_input_shift_reg_i == 1'b1)
      begin
         if (serial_scon7_sm0_i == 1'b0) // modo0, entao escreve 1FE
         begin
            data_received <= 10'b1111111101; // 1FE after the first shift 
         end
         else //entao he mode 2 ,escreve 1FF
         begin
            data_received <= 10'b1111111101; 
         end 
      end
      else
      begin
         if (serial_receive_i == 1'b1 ) // se recepcao ativa
         begin
            if (serial_shift_input_shift_reg_i == 1'b1) // se ocorreu um shift entao shifta 
            begin
               data_received <= data_received << 1'b1; 
            end
            else // entaquanto nao ocorre o shift
            begin
               data_received[0] <= serial_data_i;    
            end 
         end    
         else
         begin
            //data_received <= 9'd0;
            data_received <= data_received;
         end //else serial_shift_input_shift_reg_i  
      end
   end //else serial_reset_i_b 
end //always

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
         if (data_received[8] == 1'b0)
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
         if (data_received[9] == 1'b0)
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


// logica para write_sbuf
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      serial_sbuf_rx_o   <= 8'd0;
      serial_scon2_rb8_o <= 1'b0;  //TODO: verificar como vai ficar isso com o core 
   end
   else
   begin
      if (serial_load_sbuf_i == 1'b1) // entao ja pode escrever no sbuf
      begin
         if (serial_scon7_sm0_i == 1'b0)
         begin
            //serial_sbuf_rx_o <= data_received[8:1];
            //invert the bits
            serial_sbuf_rx_o[0]     <= data_received[8];
            serial_sbuf_rx_o[1]     <= data_received[7];
            serial_sbuf_rx_o[2]     <= data_received[6];
            serial_sbuf_rx_o[3]     <= data_received[5];
            serial_sbuf_rx_o[4]     <= data_received[4];
            serial_sbuf_rx_o[5]     <= data_received[3];
            serial_sbuf_rx_o[6]     <= data_received[2];
            serial_sbuf_rx_o[7]     <= data_received[1];
             
         end
         else
         begin //mode 2
            //serial_sbuf_rx_o     <= data_received[9:2];
            //invert the bits
            serial_sbuf_rx_o[0]     <= data_received[9];
            serial_sbuf_rx_o[1]     <= data_received[8];
            serial_sbuf_rx_o[2]     <= data_received[7];
            serial_sbuf_rx_o[3]     <= data_received[6];
            serial_sbuf_rx_o[4]     <= data_received[5];
            serial_sbuf_rx_o[5]     <= data_received[4];
            serial_sbuf_rx_o[6]     <= data_received[3];
            serial_sbuf_rx_o[7]     <= data_received[2];
            
            
            
            serial_scon2_rb8_o   <= data_received[1];
         end
      end
      else
      begin
         serial_sbuf_rx_o     <= 8'd0;
         serial_scon2_rb8_o   <= 1'b0; 
      end
   end     
    
end

endmodule
