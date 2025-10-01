module mux_f (W, S16, f);
  input [0:15] W;
  input [3:0] S16;
  output f;
  reg f;
  reg [0:3] M;

  function mux4to1;
    input [0:3] W;
    input [1:0] S;

    if (S == 0) mux4to1 = W[0];
    else if (S == 1) mux4to1 = W[1];
    else if (S == 2) mux4to1 = W[2];
    else if (S == 3) mux4to1 = W[3];
  endfunction

  always @(W or S16)
  begin
    M[0] = mux4to1(W[0:3], S16[1:0]);
    M[1] = mux4to1(W[4:7], S16[1:0]);
    M[2] = mux4to1(W[8:11], S16[1:0]);
    M[3] = mux4to1(W[12:15], S16[1:0]);
    f = mux4to1(M[0:3], S16[3:2]);
  end 

endmodule
