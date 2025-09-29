`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 11:12:45 AM
// Design Name: 
// Module Name: decoder_new
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

module decoder(
    input [2:0] sw,
    output [7:0] led
);

and(led[0], ~sw[2], ~sw[1], ~sw[0]);  // 000
and(led[1], ~sw[2], ~sw[1],  sw[0]);  // 001
and(led[2], ~sw[2],  sw[1], ~sw[0]);  // 010
and(led[3], ~sw[2],  sw[1],  sw[0]);  // 011
and(led[4],  sw[2], ~sw[1], ~sw[0]);  // 100
and(led[5],  sw[2], ~sw[1],  sw[0]);  // 101
and(led[6],  sw[2],  sw[1], ~sw[0]);  // 110
and(led[7],  sw[2],  sw[1],  sw[0]);  // 111

endmodule

