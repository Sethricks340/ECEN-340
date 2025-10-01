module count4 (Clock, Resetn, E, Q);
  input Clock, Resetn, E;
  output [3:0] Q;
  reg [3:0] Q;

  always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
      Q <= 0;
    else if (E)
      Q <= Q + 1;

endmodule
