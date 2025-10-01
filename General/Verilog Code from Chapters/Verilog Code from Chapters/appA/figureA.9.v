module mux (w0, w1, s, f);
  input w0, w1, s;
  output f;
  reg f;

  always @(w0 or w1 or s)
  begin
    f = w0;
    if (s == 1) 
      f = w1;
  end

endmodule
