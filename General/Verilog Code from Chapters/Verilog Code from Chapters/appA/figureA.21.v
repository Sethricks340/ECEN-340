module common (X, Y, C);
  input [7:0] X, Y;
  output [3:0] C;	
  wire [7:0] T;

  // Make T[i] = 1 if X[i] == Y[i]
  assign T = X ~^ Y;

  bit_count cbits (T, C);
    defparam cbits.n = 8, cbits.logn = 3;

endmodule

module bit_count (X, Count); 
  parameter n = 4; 
  parameter logn = 2; 
  input [n-1:0] X; 
  output [logn:0] Count; 
  reg [logn:0] Count; 
  integer k; 

  always @(X) 
  begin 
    Count = 0; 
    for (k = 0; k < n; k = k+1) 
      Count = Count + X[k]; 
  end 

endmodule
