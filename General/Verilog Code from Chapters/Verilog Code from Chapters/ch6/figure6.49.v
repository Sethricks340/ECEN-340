module serial_adder (A, B, Reset, Clock, Sum);
	input [7:0] A, B;
	input Reset, Clock;
	output wire [7:0] Sum;
	reg [3:0] Count;
	reg s, y, Y;
	wire [7:0] QA, QB;
	wire Run;
	parameter G = 1'b0, H = 1'b1;

	shiftrne shift_A (A, Reset, 1'b1, 1'b0, Clock, QA);
	shiftrne shift_B  (B, Reset, 1'b1, 1'b0, Clock, QB);
	shiftrne shift_Sum  (8'b0, Reset, Run, s, Clock, Sum);

	// Adder FSM
	// Output and next state combinational circuit
	always @(QA, QB, y)
		case (y)
			G: begin
				s = QA[0] ^ QB[0];
				if (QA[0] & QB[0])   Y = H;
			      else	Y = G;
		        	      end
			H: begin
				s = QA[0] ~^ QB[0];
				if (~QA[0] & ~QB[0])	Y = G;
				else    Y = H;
			      end
			default: Y = G;
		 endcase

	// Sequential block
	always @(posedge Clock)
		if (Reset)	y <= G;
		else		y <= Y;

	// Control the shifting process
	always @(posedge Clock)
		if (Reset)			Count = 8;
		else if (Run)	Count = Count - 1;
	assign Run = |Count;

endmodule

