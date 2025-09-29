module adder_sign (X, Y, S, S2s);
  input [3:0] X, Y;
  output [7:0] S, S2s;	
	
  assign  S = X + Y,
          S2s = {{4{X[3]}}, X} + {{4{Y[3]}}, Y};

endmodule
