`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 03:39:06 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUOp,
    output reg [15:0] ALURes
    );
    
    always @(*) 
    begin
        case(ALUOp)
            4'b0000: ALURes = $signed(A) + $signed(B);
            4'b0001: ALURes = $signed(A) - $signed(B);
            4'b0010: ALURes = B << A[3:0];
            4'b0011: ALURes = A && B;
        endcase
    end
    
    
endmodule
