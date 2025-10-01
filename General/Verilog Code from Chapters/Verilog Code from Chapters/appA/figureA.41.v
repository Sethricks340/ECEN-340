module mealy (Clock, w, Resetn, z);
  input Clock, w, Resetn ;
  output z ;
  reg z;
  reg y, Y;
  parameter A = 0, B = 1;

  always @(w or y)
    case (y)
      A:  if (w == 0)
        begin
          Y = A;
          z = 0;
        end
        else
        begin
          Y = B;
          z = 0;
        end
      B:  if (w == 0)
        begin
          Y = A;
          z = 0;
        end
        else
        begin
          Y = B;
          z = 1;
        end
    endcase

  always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
      y <= A;
    else
      y <= Y;

endmodule
