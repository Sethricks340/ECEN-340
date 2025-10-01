module problem4_18 (W, En, y0, y1, y2, y3);
	input [1:0]W;
	input En;
	output reg y0, y1, y2, y3;

	always @(W, En)
	begin
		y0 = 0;
		y1 = 0;
		y2 = 0;
		y3 = 0;
		if (En)
			if (W == 0) y0 = 1;
			else if (W == 1) y1 = 1;
			else if (W == 2) y2 = 1;
			else y3 = 1;
	end

endmodule

