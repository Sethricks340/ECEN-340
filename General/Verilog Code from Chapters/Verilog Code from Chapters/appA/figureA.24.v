//This file cannot be compiled with MAX+plusII, because of a bug in the
//software
module group_f (Digits, Lights);
  input [11:0] Digits;
  output [1:21] Lights;
  reg [1:21] Lights;
	
  function [1:7] leds;
    input [3:0] bcd;
    begin
      case (bcd)     //  a  b  c  d  e  f  g
        0: leds = 7'b1111110;
        1: leds = 7'b0110000;
        2: leds = 7'b1101101;
        3: leds = 7'b1111001;
        4: leds = 7'b0110011;
        5: leds = 7'b1011011;
        6: leds = 7'b1011111;
        7: leds = 7'b1110000;
        8: leds = 7'b1111111;
        9: leds = 7'b1111011;
        default: leds = 7'bx;
      endcase
    end
  endfunction
		
  always @(Digits)
  begin
    Lights[1:7] = leds(Digits[3:0]);
    Lights[8:14] = leds(Digits[7:4]);
    Lights[15:21] = leds(Digits[11:8]);
  end

endmodule
