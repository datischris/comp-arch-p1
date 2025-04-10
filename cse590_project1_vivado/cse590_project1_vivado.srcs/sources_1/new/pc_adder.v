`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 11:46:37 PM
// Design Name: 
// Module Name: pc_adder
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


module pc_adder(
    input [15:0] se_immediate,
    input [15:0] pc_out,
    output reg [15:0] branch_out
    );
    
    always @(*) 
    begin
        branch_out = pc_out + (se_immediate << 1);
    end
    
endmodule
