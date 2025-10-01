module arbiter (r, Resetn, Clock, g);
	input [1:3] r;
	input Resetn, Clock;
	output wire [1:3] g;
	reg [2:1] y, Y;
	parameter Idle = 2'b00, gnt1 = 2'b01, gnt2 = 2'b10, gnt3 = 2'b11;
	
	// Next state combinational circuit
	always @(r, y)
		case (y)
			Idle: casex (r)
					3'b000: Y = Idle;
					3'b1xx: Y = gnt1;
					3'b01x: Y = gnt2;
					3'b001: Y = gnt3;
					default: Y = Idle;
				endcase
			gnt1: if (r[1])  Y = gnt1;
				else  Y = Idle;
			gnt2: if (r[2])  Y = gnt2;
				else  Y = Idle;
			gnt3: if (r[3])  Y = gnt3;
				else  Y = Idle;
 			default: Y = Idle;
  		endcase
		
	// Sequential block
	always @(posedge Clock)
		if (Resetn == 0)	    y <= Idle;
		else     y <= Y;
 
	//  Define output
	assign g[1] = (y == gnt1);
	assign g[2] = (y == gnt2);
	assign g[3] = (y == gnt3);
 
endmodule

