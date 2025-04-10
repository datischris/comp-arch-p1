`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 11:08:52 PM
// Design Name: 
// Module Name: branch_selector
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


module branch_selector(
    input beq,
    input bne,
    input zero_signal,
    output reg branch_selection
    );
    
    always @(*)
    begin
        branch_selection = (beq && zero_signal) || (bne && ~zero_signal);
    end
    
endmodule
