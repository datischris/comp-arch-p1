`timescale 1ns / 1ps


module jump_adder(
    input [11:0] address,
    input [15:0] pc_out,
    output reg [15:0] jump_out
    );
    
    always @(*) 
    begin
        jump_out = pc_out + ({{4{address[11]}}, address} << 1);
    end
    
endmodule
