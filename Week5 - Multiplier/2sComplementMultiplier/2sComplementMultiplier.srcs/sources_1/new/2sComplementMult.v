`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 09:55:06 AM
// Design Name: 
// Module Name: 2sComplementMult
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


module twosComplementMult(input [15:0] sw,output reg [15:0] led);
    // Inputs are 2 8-bit numbers. Switches 0 to 7, and 8 to 15
    // Outputs are 16 LEDs, representing a 16-bit number
    wire signed [7:0] A;                                // Input 1
    wire signed [7:0] B;                                // Input 2
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
        
        PP0 = {1'b1, ~PP0[7], PP0[6], PP0[5], PP0[4], PP0[3], PP0[2], PP0[1], PP0[0]};
        PP1 = {~PP1[7], PP1[6], PP1[5], PP1[4], PP1[3], PP1[2], PP1[1], PP1[0], 1'b0};
        PP2 = {~PP2[7],PP2[6],PP2[5],PP2[4],PP2[3],PP2[2],PP2[1],PP2[0], 1'b0, 1'b0};
        PP3 = {~PP3[7],PP3[6],PP3[5],PP3[4],PP3[3],PP3[2],PP3[1],PP3[0], 1'b0, 1'b0, 1'b0};
        PP4 = {~PP4[7],PP4[6],PP4[5],PP4[4],PP4[3],PP4[2],PP4[1],PP4[0], 1'b0, 1'b0, 1'b0, 1'b0};
        PP5 = {~PP5[7],PP5[6],PP5[5],PP5[4],PP5[3],PP5[2],PP5[1],PP5[0], 1'b0, 1'b0, 1'b0, 1'b0,1'b0};
        PP6 = {~PP6[7],PP6[6],PP6[5],PP6[4],PP6[3],PP6[2],PP6[1],PP6[0], 1'b0, 1'b0, 1'b0, 1'b0,1'b0, 1'b0};
        PP7 = {1'b1,PP7[7],~PP7[6],~PP7[5],~PP7[4],~PP7[3],~PP7[2],~PP7[1],~PP7[0], 1'b0, 1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0};
        
        // Add all the partial products together
        P = PP0 + PP1 + PP2 + PP3 + PP4 + PP5 + PP6 + PP7;
        
        // assign the final product to the LEDs
        led = P;       
        
        end 
endmodule
    


