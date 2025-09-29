module flipflop_ar (D, Clock, Resetn, Q);
  input D, Clock, Resetn;
  output Q;
  reg Q;

  always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
      Q <= 0;
    else
      Q <= D;

endmodule
