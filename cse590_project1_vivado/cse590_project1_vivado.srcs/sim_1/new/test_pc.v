`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 09:47:51 PM
// Design Name: 
// Module Name: test_pc
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


module test_pc();
  // Inputs
  reg [15:0] in_address;
  
  // Outputs
  wire [15:0] out_address;
  wire [15:0] next_address;
  
  program_counter uut (
    .in_address(in_address),
    .out_address(out_address),
    .next_address(next_address)
  );
  
  initial begin
    $monitor($time,,"in_address=%d, out_address=%d, next_address=%d", in_address, out_address, next_address);
    $display($time,,"in_address=%d, out_address=%d, next_address=%d", in_address, out_address, next_address);
    
    in_address = 0; #10;
    in_address = 2; #10;
    in_address = 4; #10;
    in_address = 6; #10;
    
    #10

    $finish;
  end
  
endmodule
