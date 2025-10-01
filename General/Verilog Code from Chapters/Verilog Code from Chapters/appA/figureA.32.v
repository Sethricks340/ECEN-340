module shift3 (w, Clock, Q);
  input w, Clock;
  output [1:3] Q;
  reg [1:3] Q;

  always @(posedge Clock)
  begin
    Q[3] <= w;
    Q[2] <= Q[3];
    Q[1] <= Q[2];
  end

endmodule
