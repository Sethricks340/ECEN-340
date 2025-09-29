module sort (Clock, Resetn, s, WrInit, Rd, DataIn, RAdd, DataOut, Done);
	parameter n = 4;
	input Clock, Resetn, s, WrInit, Rd;
	input [n-1:0] DataIn;
	input [1:0] RAdd;
	output [n-1:0] DataOut;
	output reg Done;
	wire [1:0] Ci, Cj, CMux, IMux;
	wire [n-1:0] R0, R1, R2, R3, A, B, RData, ABMux;
	wire BltA, zi, zj;
	reg Int, Csel, Wr, Ain, Bin, Bout;
	reg LI, LJ, EI, EJ, Rin0, Rin1, Rin2, Rin3;
	reg [3:0] y, Y;
	reg [n-1:0] ABData;

// control circuit
	parameter S1 = 4'b0000, S2 = 4'b0001, S3 = 4'b0010, S4 = 4'b0011;
	parameter S5 = 4'b0100, S6 = 4'b0101, S7 = 4'b0110, S8 = 4'b0111, S9 = 4'b1000;

	always @(s, BltA, zj, zi, y)
	begin: State_table
		case (y)
			S1:	if (s == 0) Y = S1;
				else Y = S2;
			S2: 	Y = S3;
			S3: 	Y = S4;
			S4: 	Y = S5;
			S5:	if (BltA) Y = S6;
				else Y = S8;
			S6: 	Y = S7;
			S7: 	Y = S8;
			S8:	if (!zj) Y = S4;
				else if (!zi) Y = S2;
				else Y = S9;
			S9:	if (s) Y = S9;
				else Y = S1;
			default: Y = 4'bx;
		endcase
	end

	always @(posedge Clock, negedge Resetn)
	begin: State_flipflops
		if (Resetn == 0)
			y <= S1;
		else
			y <= Y;
	end

	always @(y, zj, zi)
	begin: FSM_outputs
		// defaults
		Int = 1; Done = 0; LI = 0; LJ = 0; EI = 0; EJ = 0; Csel = 0;
		Wr = 0; Ain = 0; Bin = 0; Bout = 0;
		case (y)
			S1:	begin  LI = 1; Int = 0;  end
			S2: 	begin  Ain = 1; LJ = 1;  end
			S3:	EJ = 1;
			S4:	begin  Bin = 1; Csel = 1;  end
			S5:	; // no outputs asserted in this state
			S6:	begin  Csel = 1; Wr = 1; end
			S7:	begin  Wr = 1; Bout = 1;  end
			S8:	begin
					Ain = 1;
					if (!zj) EJ = 1;
					else
					begin
						EJ = 0;
						if (!zi) EI = 1;
						else EI = 0;
					end
				end
			S9:	Done = 1;
		endcase
	end

//datapath circuit

	regne Reg0 (RData, Clock, Resetn, Rin0, R0);
		defparam Reg0.n = n;
	regne Reg1 (RData, Clock, Resetn, Rin1, R1);
		defparam Reg1.n = n;
	regne Reg2 (RData, Clock, Resetn, Rin2, R2);
		defparam Reg2.n = n;
	regne Reg3 (RData, Clock, Resetn, Rin3, R3);
		defparam Reg3.n = n;

	regne RegA (ABData, Clock, Resetn, Ain, A);
		defparam RegA.n = n;
	regne RegB (ABData, Clock, Resetn, Bin, B);
		defparam RegB.n = n;

	assign BltA = (B < A) ? 1 : 0;
	assign ABMux = (Bout == 0) ? A : B;
	assign RData = (WrInit == 0) ? ABMux : DataIn;

	upcount OuterLoop (2'b00, Resetn, Clock, EI, LI, Ci);
	upcount InnerLoop (Ci, Resetn, Clock, EJ, LJ, Cj);

	assign CMux = (Csel == 0) ? Ci : Cj;
	assign IMux = (Int == 1) ? CMux : RAdd;

	always @(WrInit, Wr, IMux, R0, R1, R2, R3)
	begin
		case (IMux)
			0: ABData = R0;
			1: ABData = R1;
			2: ABData = R2;
			3: ABData = R3;
		endcase

		if (WrInit || Wr)
			case (IMux)
				0: {Rin3, Rin2, Rin1, Rin0} = 4'b0001;
				1: {Rin3, Rin2, Rin1, Rin0} = 4'b0010;
				2: {Rin3, Rin2, Rin1, Rin0} = 4'b0100;
				3: {Rin3, Rin2, Rin1, Rin0} = 4'b1000;
			endcase
		else {Rin3, Rin2, Rin1, Rin0} = 4'b0000;
	end

	assign zi = (Ci == 2);
	assign zj = (Cj == 3);
	assign DataOut = (Rd == 0) ? 'bz : ABData;

endmodule

