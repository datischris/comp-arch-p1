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
    output reg write_enable,
    output reg ALUSrc,
    output reg [3:0] ALUOp
    );
    
    always @(*)
    begin
        case(opcode)
              4'b0000: // r-type
                  begin 
                    write_enable = 1'b1;
                    ALUSrc = 1'b0;
                    ALUOp = funct; 
                    
                  end
              4'b0011: // addi
                   begin
                    write_enable = 1'b1;
                    ALUSrc = 1'b1;
                    ALUOp = 0000;
                   end
              
        endcase
    end
  
    
endmodule
