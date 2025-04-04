`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 10:30:44 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    input [15:0] PC_address,
    output reg [15:0] instruction
    );
    
    reg [15:0] IM[0:127]; //addressing input address PC (0) to PC (254) as per 6.2.2 instruction document
    
    initial
    begin
      $readmemb("C:/Users/chris/cse590_project1_vivado/cse590_project1_vivado.srcs/sources_1/new/instruction_memory.txt", IM); // load file into IM array
    end
    
    always @(*) 
    begin
        instruction = IM[PC_address >> 1];
    end
    
endmodule
