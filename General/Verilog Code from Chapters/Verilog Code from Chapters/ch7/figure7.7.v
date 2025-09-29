module swap (Resetn, Clock, w, Data, Extern, RinExt1, RinExt2, RinExt3, BusWires, Done);
	parameter n = 8;
	input Resetn, Clock, w, Extern, RinExt1, RinExt2, RinExt3;
	input [n-1:0] Data;
	output tri [n-1:0] BusWires;
	output Done;
	wire [n-1:0] R1, R2, R3;
	wire R1in, R1out, R2in, R2out, R3in, R3out;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

	// Define the next state combinational circuit for FSM
	always @(w, y)
		case (y)
			A: if (w) Y = B;
				else Y = A;
			B: Y = C;
			C: Y = D;
			D: Y = A;
		endcase

	// Define the sequential block for FSM
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0)
			y <= A;
		else
			y <= Y;

	// Define outputs of FSM
	assign R2out = (y == B);
	assign R3in = (y == B);
	assign R1out = (y == C);
	assign R2in = (y == C);
	assign R3out = (y == D);
	assign R1in = (y == D);
	assign Done = (y == D);

	// Instantiate registers
	regn reg_1 (BusWires, RinExt1 | R1in, Clock, R1);
	regn reg_2 (BusWires, RinExt2 | R2in, Clock, R2);
	regn reg_3 (BusWires, RinExt3 | R3in, Clock, R3);

	// Instantiate tri-state drivers
	trin tri_ext (Data, Extern, BusWires);
	trin tri_1 (R1, R1out, BusWires);
	trin tri_2 (R2, R2out, BusWires);
	trin tri_3 (R3, R3out, BusWires);

endmodule

