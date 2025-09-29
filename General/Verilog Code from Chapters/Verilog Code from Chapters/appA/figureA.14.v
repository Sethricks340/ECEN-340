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
