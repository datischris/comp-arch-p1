`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 01:56:25 PM
// Design Name: 
// Module Name: test_register_file
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


module test_register_file();
  // Inputs
  reg [3:0] rs;
  reg [3:0] rt_rd;
  
  
  // Outputs
  wire [15:0] reg1;
  wire [15:0] reg2;
  
  register_file uut (
    .rs(rs),
    .rt_rd(rt_rd),
    .write_reg(),
    .write_data(),
    .ctrl_sig(),
    .reg1(reg1),
    .reg2(reg2)
  );
  
  initial begin
    $monitor($time,,"rs=%d, rt=%d, reg1=%d, reg2=%d", rs, rt_rd, reg1, reg2);
    $display($time,,"rs=%d, rt=%d, reg1=%d, reg2=%d", rs, rt_rd, reg1, reg2);
    
    rs = 4'b0001; rt_rd = 4'b0010; #10;
    rs = 4'b0011; rt_rd = 4'b0100; #10;
    rs = 4'b0000; rt_rd = 4'b1111; #10;

    #10

    $finish;
  end
endmodule
