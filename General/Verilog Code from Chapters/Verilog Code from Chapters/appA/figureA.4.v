module fulladd (Cin, x, y, s, Cout);
  input Cin, x, y;
  output s, Cout;
  wire z1, z2, z3, z4;

  and And1 (z1, x, y);
  and And2 (z2, x, Cin);
  and And3 (z3, y, Cin);
  or Or1 (Cout, z1, z2, z3);
  xor Xor1 (z4, x, y);
  xor Xor2 (s, z4, Cin);

endmodule
