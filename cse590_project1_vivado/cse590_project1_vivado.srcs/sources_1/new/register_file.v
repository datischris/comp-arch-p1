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
    input clock,
    input [15:0] write_data,
    input write_enable,
    
    output reg [15:0] rd1,
    output reg [15:0] rd2
    );
    
    reg [15:0] RM[0:15]; //addressing $s1 (line 1 -> 0th index) to $s15 (line 16 -> 15th index) in register array as per 5.3 instruction document
    
    initial
    begin
      $readmemb("register_memory.txt", RM); // load file into RM array
    end
    
    always @(*) 
    begin
      rd1 = RM[rs];
      rd2 = RM[rt_rd];
    end
    
    
    // clock rise && write_enable signal for reg WB
    always @(posedge clock) 
    begin 
        if (write_enable) 
        begin
            RM[write_reg] <= write_data;
        end
    end
    
endmodule
