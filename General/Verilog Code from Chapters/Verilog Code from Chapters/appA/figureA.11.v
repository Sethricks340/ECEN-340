module fulladd (Cin, x, y, s, Cout);
  input Cin, x, y;
  output s, Cout;
  reg s, Cout;

  always @(Cin or x or y)
  begin
    case ( {Cin, x, y} )
      3'b000:  {Cout, s} = 'b00;
      3'b001:  {Cout, s} = 'b01;
      3'b010:  {Cout, s} = 'b01;
      3'b011:  {Cout, s} = 'b10;
      3'b100:  {Cout, s} = 'b01;
      3'b101:  {Cout, s} = 'b10;
      3'b110:  {Cout, s} = 'b11;
      3'b111:  {Cout, s} = 'b11;
    endcase
  end

endmodule
