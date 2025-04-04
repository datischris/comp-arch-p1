`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 01:25:55 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input [3:0] rs,
    input [3:0] rt_rd,
    input [3:0] write_reg,
//       input clockrise,
    input [15:0] write_data,
    input ctrl_sig,
    
    output reg [15:0] reg1,
    output reg [15:0] reg2
    );
    
    reg [15:0] RM[0:15]; //addressing $s1 (line 1 -> 0th index) to $s15 (line 16 -> 15th index) in register array as per 5.3 instruction document
    
    initial
    begin
      $readmemb("C:/Users/chris/cse590_project1_vivado/cse590_project1_vivado.srcs/sources_1/new/register_memory.txt", RM); // load file into RM array
    end
    
    always @(*) 
    begin
        reg1 = RM[rs];
        reg2 = RM[rt_rd];
    end
    
    
    
    // TODO: include ctrl_sig for reg WB and adjust for clock rising edge!!
    
    
    
endmodule
