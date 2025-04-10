`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 02:22:27 AM
// Design Name: 
// Module Name: jump_adder
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


module jump_adder(
    input [11:0] address,
    input [15:0] pc_out,
    output reg [15:0] jump_out
    );
    
    always @(*) 
    begin
        jump_out = pc_out + (address << 1);
    end
    
endmodule
