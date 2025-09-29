module fulladd (Cin, x, y, s, Cout);
  input Cin, x, y;
  output s, Cout;

  and (z1, x, y);
  and (z2, x, Cin);
  and (z3, y, Cin);
  or (Cout, z1, z2, z3);
  xor (z4, x, y);
  xor (s, z4, Cin);

endmodule
