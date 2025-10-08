`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 09:51:57 AM
// Design Name: 
// Module Name: decoder_7seg_tb
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

// Test bench for 7 segment decoder
module decoder_7seg_tb(
    );
    
    reg [3:0] sw; // input switches
    wire [6:0] sseg; // output segment displays
    
    seven_seg U1 (.seg(sseg), .sw(sw)); // using seven segment source module
    
    integer k=0;
    initial
    begin
        for (k=0;k<10;k=k+1)
            #10 sw = k; // Looping through k possiblilies, 0-9 in this case
    $finish;
    end
endmodule
    
    
    
   