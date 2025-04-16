`timescale 1ns / 1ps

module program_count_adder(
    input [15:0] pc_out,
    output reg [15:0] pc_next
    );
    
    always @(*) 
    begin
        pc_next = pc_out + 2;
    end
    
   
endmodule
