`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 04:00:00 PM
// Design Name: 
// Module Name: test
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


module test_adder();

  // Inputs
  reg [15:0] a;
  reg [15:0] b;
  
  // Outputs
  wire [15:0] sum;
  wire c_out;

  sixteenbit_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .c_out(c_out)
  );

  initial begin
    $monitor($time,,"a=%d, b=%d, sum=%d, c_out=%b", a, b, sum, c_out);
    $display($time,,"a=%d, b=%d, sum=%d, c_out=%b", a, b, sum, c_out);
    
    a = 2; b = 3; #10;
    a = 1; b = 9; #10;
    a = 0; b = 4; #10;
    a = 4; b = 8; #10;
    
    #10

    $finish;
  end

endmodule
