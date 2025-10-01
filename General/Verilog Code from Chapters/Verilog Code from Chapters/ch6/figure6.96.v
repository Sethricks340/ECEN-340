module seqmealy (Clock, Resetn, w, z); 
  input Clock, Resetn, w; 
  output reg z; 
  reg [2:1] y, Y; 
  parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b11; 

  // Define the next state and output combinational circuits 
  always @(w, y) 
    case (y) 
      A:  if (w) begin 
                         z = 0; Y = C; 
                      end 
           else     begin 
                         z = 0; Y = B; 
                     end 
      B:  if (w) begin 
                         z = 0; Y = C; 
                      end 
           else     begin 
                         z = 1; Y = B; 
                     end
      C:  if (w) begin 
                        z = 1; Y = C; 
                     end 
           else    begin 
                        z = 0; Y = B; 
                     end
       default: begin
                        z = 0; Y = 2'bxx;
                     end
    endcase 

  // Define the sequential block 
  always @(negedge Resetn, posedge Clock) 
    if (Resetn == 0) y <= A; 
    else y <= Y; 

endmodule

