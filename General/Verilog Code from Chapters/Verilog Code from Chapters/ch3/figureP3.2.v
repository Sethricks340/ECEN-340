module problem3_17 (IN, OUT);
	input [3:0] IN;
	output reg [3:0] OUT;

	always @(IN)
		if (IN == 4'b0101)  OUT = 4'b0001;
		else if (IN == 4'b0110)  OUT = 4'b0010;
		else if (IN == 4'b0111)  OUT = 4'b0011;
		else if (IN == 4'b1001)  OUT = 4'b0010;
		else if (IN == 4'b1010)  OUT = 4'b0100;
		else if (IN == 4'b1011)  OUT = 4'b0110;
		else if (IN == 4'b1101)  OUT = 4'b0011;
		else if (IN == 4'b1110)  OUT = 4'b0110;
		else if (IN == 4'b1111)  OUT = 4'b1001;
		else  OUT = 4'b0000;
		
endmodule
