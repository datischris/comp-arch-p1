`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 02:29:18 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [3:0] opcode,
    input [3:0] funct,
    output reg ctrl_sig,
    output reg [3:0] ALUOp
    );
    
    always @(*) 
    begin
        case(opcode)
              4'b0000: begin ctrl_sig = 1'b1; ALUOp = funct; end
        endcase
    end
  
    
endmodule
