module priority (W, Y, f);
  input [3:0] W;
  output [1:0] Y;
  output f;
  reg [1:0] Y;

  assign f = (W == 0);
  always @(W)
  begin
    casex (W)
      'b1xxx:   Y = 3;
      'b01xx:   Y = 2;
      'b001x:   Y = 1;
      default: Y = 0;
    endcase
  end

endmodule
