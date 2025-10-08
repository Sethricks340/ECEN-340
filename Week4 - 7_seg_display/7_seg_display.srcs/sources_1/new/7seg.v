`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:20:48 AM
// Design Name: 
// Module Name: 7seg
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

// seven segment display on FPGA board
module seven_seg(output reg [6:0] seg, input [3:0] sw);
    
    // sensitivity list includes everything
    always@(*)
    begin 
        // For each switch combination, possibilities from 0-9
        // seg is the output segments on the 7 digit display
        if (sw == 4'b0000) seg = 7'b1000000;
        else if (sw == 4'b0001) seg = 7'b1111001;
        else if (sw == 4'b0010) seg = 7'b0100100;
        else if (sw == 4'b0011) seg = 7'b0110000;
        else if (sw == 4'b0100) seg = 7'b0011001;
        else if (sw == 4'b0101) seg = 7'b0010010;
        else if (sw == 4'b0110) seg = 7'b0000011;
        else if (sw == 4'b0111) seg = 7'b1111000;
        else if (sw == 4'b1000) seg = 7'b0000000;
        else if (sw == 4'b1001) seg = 7'b0011000;
    end    
endmodule
