module sequence (Clock, Resetn, w, z); 
  input Clock, Resetn, w; 
  output z; 
  reg [3:1] y, Y; 
  parameter [3:1] A = 3'b000, B = 3'b001, C = 3'b010, 
	            D = 3'b011, E = 3'b100; 

  // Define the next state combinational circuit 
  always @(w, y) 
    case (y) 
      A:  if (w)    Y = D; 
           else        Y = B; 
      B:  if (w)     Y = D; 
           else        Y = C; 
      C:  if (w)     Y = D; 
           else        Y = C;
      D:  if (w)     Y = E; 
           else         Y = B; 
      E:  if (w)      Y = E; 
           else         Y = B;  
      default:        Y = 3'bxxx; 
    endcase 

  // Define the sequential block 
  always @(negedge Resetn, posedge Clock) 
    if (Resetn == 0) y <= A; 
    else y <= Y; 
  // Define output 
  assign z = (y == C) | (y == E); 
endmodule

