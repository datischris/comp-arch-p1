`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 01:42:06 AM
// Design Name: 
// Module Name: mux_2_to_1
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


module mux_2_to_1_16bit (
    input [15:0] A,
    input [15:0] B,
    input src,
    output reg [15:0] out
    );
    
    always@(*)
    begin
        case(src)
            1'b0: begin out = A; end
            1'b1: begin out = B; end
        endcase
    end
    
endmodule
