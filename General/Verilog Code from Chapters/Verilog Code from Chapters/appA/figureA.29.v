module flipflop_sr (D, Clock, Resetn, Q);
  input D, Clock, Resetn;
  output Q;
  reg  Q;

  always @(posedge Clock)
    if (Resetn == 0)
      Q <= 0;
    else
      Q <= D;

endmodule
