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
// --- module for an 8-bit adder, in structural style verilog. --- // 
module adder8(input [15:0] sw, output [8:0] led);
    wire [6:0] w;
    // Declare each fulladd module separtely, and pass carrout outputs into the carrin inputs
    // This resembles a ripple carry-in adder
    fulladd FA0 (.Carryin(1'b0), .x(sw[0]), .y(sw[8]),  .Sum(led[0]), .Carryout(w[0]));
    fulladd FA1 (.Carryin(w[0]), .x(sw[1]), .y(sw[9]), .Sum(led[1]), .Carryout(w[1]));
    fulladd FA2 (.Carryin(w[1]), .x(sw[2]), .y(sw[10]), .Sum(led[2]), .Carryout(w[2]));
    fulladd FA3 (.Carryin(w[2]), .x(sw[3]), .y(sw[11]), .Sum(led[3]), .Carryout(w[3]));
    fulladd FA4 (.Carryin(w[3]), .x(sw[4]), .y(sw[12]), .Sum(led[4]), .Carryout(w[4]));
    fulladd FA5 (.Carryin(w[4]), .x(sw[5]), .y(sw[13]), .Sum(led[5]), .Carryout(w[5]));
    fulladd FA6 (.Carryin(w[5]), .x(sw[6]), .y(sw[14]), .Sum(led[6]), .Carryout(w[6]));
    fulladd FA7 (.Carryin(w[6]), .x(sw[7]), .y(sw[15]), .Sum(led[7]), .Carryout(led[8]));
endmodule

// --- Adder using structural verilog. --- //
// Inputs: Carrin, x (bit one), and y (bit two)
// Outputs: Sum and Carryout
module fulladd(Carryin, x, y, Sum, Carryout);
    input Carryin, x, y;
    output Sum, Carryout;
    wire w1, w2, w3;
    xor (w1, x, y);
    xor (Sum, w1, Carryin);
    and (w2, x, y);
    and (w3, w1, Carryin);
    or  (Carryout, w2, w3);   
endmodule