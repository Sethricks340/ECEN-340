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

// Creating Module
// Input 9 switches
// Output 9 LEDs
module addern(input [15:0] sw, output [8:0] led);
    parameter n = 8;
    wire [n:0] C;
    
    genvar i;
    assign C[0] = 1'b0; 

    generate 
        for(i=0;i<=n-1;i=i+1)
           begin:whatever
           fulladd stage(.Carryin(C[i]), .x(sw[i]), .y(sw[i+8]), .Sum(led[i]), .Carrout(C[i+1]));
           end
    endgenerate

endmodule

module fulladd(Carryin, x, y, Sum, Carryout);
    input Carryin, x, y;
    output Sum, Carryout;
    assign Sum = x ^ y ^ Carryin;
    assign Carryout = (x&y)|(x&Carryin)|(y&Carryin);
endmodule