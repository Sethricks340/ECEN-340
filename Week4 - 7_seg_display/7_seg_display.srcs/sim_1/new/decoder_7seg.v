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


module decoder_7seg_tb(
    );
    
    reg [3:0] sw;
    wire [3:0] sseg_col;
    wire [15:0] led;
    wire [7:0] sseg;
    
    seven_seg U1 (sw, sseg_col, led, sseg);
    
    initial
    begin
        sw = 4'b000;
        #1000 $finish;
    end
endmodule
    
    
    
    
    
    
endmodule
