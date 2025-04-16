`timescale 1ns / 1ps


module register_file(
    input [3:0] rt_rd,
    input [3:0] rs,
    input [3:0] write_reg,
    input clock,
    input [15:0] write_data,
    input write_enable,
    
    output reg [15:0] rd1, // rt_rd location
    output reg [15:0] rd2  // rs location
    );
    
    //addressing $s1 (line 1 -> 0th index) to $s15 (line 16 -> 15th index) in register array as per 5.3 instruction document
    reg [15:0] RM[0:15]; 
    
    initial
    begin
      $readmemb("register_memory.txt", RM); // load file into RM array
    end
    
    always @(*) 
    begin
      rd1 = RM[rt_rd];
      rd2 = RM[rs];
    end
    
    // clock rise + write_enable signal for reg WB
    always @(posedge clock) 
    begin 
        if (write_enable) 
        begin
            RM[write_reg] <= write_data;
        end
    end
    
endmodule
