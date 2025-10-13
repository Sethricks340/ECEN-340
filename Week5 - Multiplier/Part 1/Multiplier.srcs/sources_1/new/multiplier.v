`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 10:16:08 AM
// Design Name: 
// Module Name: multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier(input [15:0] sw, output reg [15:0] led);

    // Inputs are 2 8-bit numbers. Switches 0 to 7, and 8 to 15
    // Outputs are 16 LEDs, representing a 16-bit number
    wire [7:0] A;                                       // Input 1
    wire [7:0] B;                                       // Input 1
    reg [15:0] PP0, PP1, PP2, PP3, PP4, PP5, PP6, PP7;  // Partial Products
    reg [15:0] P;                                       // Final Product 
    
    assign A = sw[15:8];
    assign B = sw[7:0];
    
    always @(*) 
        begin
      
        PP0 = {8{B[0]}}  & A;       // Multiply the first bit of B with each bit of A
        PP1 = ({8{B[1]}} & A) << 1; // Multiply the second bit of B with each bit of A, then shift one bit to the left
        PP2 = ({8{B[2]}} & A) << 2;
        PP3 = ({8{B[3]}} & A) << 3;
        PP4 = ({8{B[4]}} & A) << 4;
        PP5 = ({8{B[5]}} & A) << 5;
        PP6 = ({8{B[6]}} & A) << 6;
        PP7 = ({8{B[7]}} & A) << 7;
        
        // Add all the partial products together
        P = PP0 + PP1 + PP2 + PP3 + PP4 + PP5 + PP6 + PP7;
        
        // assign the final product to the LEDs
        led = P; 
  
        end

endmodule
