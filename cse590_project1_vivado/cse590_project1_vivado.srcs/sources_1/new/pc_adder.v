`timescale 1ns / 1ps


module pc_adder(
    input [15:0] se_immediate,
    input [15:0] pc_out,
    output reg [15:0] branch_out
    );
    
    always @(*) 
    begin
        branch_out = pc_out + (se_immediate << 1);
    end
    
endmodule
