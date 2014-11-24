

//---------------------------- TASK PARA TESTAR A VALIDACAO -------------------------------------------

task test_samples ;
   begin
      if ( tb_serial_final.serial_top_tb.serial_rx_block.serial_rx_detector.counter == 4'd8 )
      begin
         if ( tb_serial_final.serial_top_tb.serial_rx_block.serial_rx_detector.serial_sample_detected_o !=
              p3_0_i )
/*            begin
               $display("amostra ok.");
            end
         else*/
         begin
            $display($time, ,"TEST FAILED EXPECTED IS %d BUT OUTPUT WAS %d", p3_0_i,
            tb_serial_final.serial_top_tb.serial_rx_block.serial_rx_detector.serial_sample_detected_o);
         end
      end
   end
endtask

//-----------------------------------------------------------------------------------------------------

