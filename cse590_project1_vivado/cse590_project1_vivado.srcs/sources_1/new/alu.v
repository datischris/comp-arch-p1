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
    input [15:0] A, // rt_rd or rs(i-type)
    input [15:0] B, // rs or immediate(i-type)
    input [3:0] ALUOp,
    output reg [15:0] ALURes,
    output reg zero_signal
    );
    
    always @(*) 
    begin
    
    // setting default values so we dont carry over old signals
    ALURes = 16'd0; 
    zero_signal = 1'b0;
    
        case(ALUOp)
            // standard ALUOp controls
            4'b0000: ALURes = $signed(B) + $signed(A);
            4'b0001: ALURes = $signed(B) - $signed(A);
            4'b0010: ALURes = A << B;
            4'b0011: ALURes = A & B;
            
            // custom ALUOp controls for beq and bne
            4'b1001: zero_signal = ($signed(B) == $signed(A));
        endcase

    end
    
    
endmodule
