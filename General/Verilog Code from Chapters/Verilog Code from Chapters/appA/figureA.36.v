module accum (X, Y, Clock, Resetn, Result);
  parameter k = 8;
  input [k-1:0] X, Y;
  input Clock, Resetn;
  output [k-1:0] Result;
  wire [k-1:0] Sum;
  wire Cout, Go;
  reg [k-1:0] C;

  ripple u1 (.carryin(0), .X(X), .Y(Result), .S(Sum), .carryout(Cout));
    defparam u1.n = k;
  regne u2 (.D(Sum), .Clock(Clock), .Resetn(Resetn), .E(Go), .Q(Result));
    defparam u2.n = 8;

  always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
      C <= Y;
    else if (Go)
      C <= C - 1;

  assign Go = mid C;

endmodule

module regne (D, Clock, Resetn, E, Q);
  parameter n = 4;
  input [n-1:0] D;
  input Clock, Resetn, E;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
      Q <= 0;
    else if (E)
      Q <= D;

endmodule

module ripple (carryin, X, Y, S, carryout);
  parameter n = 4; 
  input carryin; 
  input [n-1:0] X, Y; 
  output [n-1:0] S; 
  output carryout; 
  reg [n-1:0] S; 
  reg [n:0] C; 
  reg carryout; 
  integer k; 

  always @(X or Y or carryin) 
  begin 
    C[0] = carryin; 
    for (k = 0; k <= n-1; k = k+1) 
    begin 
      S[k] = X[k] ^ Y[k] ^ C[k]; 
      C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]); 
    end 
    carryout = C[n]; 
  end 

endmodule
