`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 10:32:58 PM
// Design Name: 
// Module Name: program_count_adder
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


module program_count_adder(
    input [15:0] pc_out,
    output reg [15:0] pc_next
    );
    
    always @(*) 
    begin
        pc_next = pc_out + 2;
    end
    
   
endmodule
