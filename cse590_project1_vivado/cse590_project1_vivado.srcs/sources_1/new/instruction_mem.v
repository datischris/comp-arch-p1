`timescale 1ns / 1ps

module instruction_mem(
    input [15:0] pc_in,
    input clock,
    output reg [15:0] instruction
    );
    
    //addressing input address PC (0) to PC (254) as per 6.2.2 instruction document
    reg [15:0] IM[0:127];
    
    initial
    begin
      $readmemb("instruction_memory.txt", IM); // load file into IM array
    end
    
    always @(*) 
    begin
        instruction = IM[pc_in >> 1];
    end
    
endmodule
