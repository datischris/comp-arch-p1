`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 08:26:45 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input [15:0] pc_in,
    input clock,
    input start,    
    output reg [15:0] pc_out
    );
    
    always @(posedge clock)
    begin
        if (start) 
            begin 
                pc_out <= 16'd0; 
            end
        else 
            begin 
                pc_out <= pc_in + 2; 
            end
    end
    
endmodule