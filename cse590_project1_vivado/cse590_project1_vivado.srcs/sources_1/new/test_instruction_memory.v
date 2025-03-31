`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 11:43:49 AM
// Design Name: 
// Module Name: test_instruction_memory
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


module test_instruction_memory();
  // Inputs
  reg [15:0] PC_address;
  
  // Outputs
  wire [15:0] instruction;
  
  instruction_mem uut (
    .PC_address(PC_address),
    .instruction(instruction)
    );
  
  initial begin
    $monitor($time,,"in_address=%d, out_address=%d", PC_address, instruction);
    $display($time,,"in_address=%d, out_address=%d", PC_address, instruction);
    
    PC_address = 0; #10;
    PC_address = 2; #10;
    PC_address = 4; #10;
    PC_address = 6; #10;
    
    #10

    $finish;
  end
  
endmodule
