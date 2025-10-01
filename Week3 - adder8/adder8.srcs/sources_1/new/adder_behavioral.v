`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 10:23:37 AM
// Design Name: 
// Module Name: adder_behavioral
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Input 9 switches
// Output 9 LEDs
// --- module for an 8-bit adder, in behavioral style verilog. --- // 
module addern(input [15:0] sw, output [8:0] led);
    // Changeable parameter set at 8
    parameter n = 8;
    wire [n:0] C;
    
    genvar i;
    // The first carryin will be a zero, since it is the first addition
    assign C[0] = 1'b0; 

    // generate statement needed when instantiating modules
    // loops through n number of fulladd stages
    generate 
        for(i=0;i<=n-1;i=i+1)
           begin:adderbit
           fulladd stage(.Carryin(C[i]), .x(sw[i]), .y(sw[i+8]), .Sum(led[i]), .Carrout(C[i+1]));
           end
    endgenerate

endmodule

// --- Adder using behavioral verilog. --- //
// Inputs: Carrin, x (bit one), and y (bit two)
// Outputs: Sum and Carryout
module fulladd(Carryin, x, y, Sum, Carryout);
    input Carryin, x, y;
    output Sum, Carryout;
    assign Sum = x ^ y ^ Carryin;
    assign Carryout = (x&y)|(x&Carryin)|(y&Carryin);
endmodule