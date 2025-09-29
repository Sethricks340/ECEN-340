module addern (X, Y, S, S2s);
  parameter n = 4;
  input [n-1:0] X, Y;
  output [2*n-1:0] S, S2s;	
	
  assign  S = X + Y,
          S2s = {{n{X[n-1]}}, X} + {{n{Y[n-1]}}, Y};

endmodule
