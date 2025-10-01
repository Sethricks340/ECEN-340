//This file cannot be compiled with MAX+plusII, because it uses the unsupported
// #(parameter) feature
module common (X, Y, C);
  input [7:0] X, Y;
  output [3:0] C;	
  wire [7:0] T;

  // Make T[i] = 1 if X[i] == Y[i]
  assign T = X ~^ Y;

  bit_count #(8,3) cbits (T, C);

endmodule
