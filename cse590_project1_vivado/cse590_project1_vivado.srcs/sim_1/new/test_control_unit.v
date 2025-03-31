`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 03:08:14 PM
// Design Name: 
// Module Name: test_control_unit
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


module test_control_unit();
    // Inputs
    reg [3:0] opcode;
    reg [3:0] funct;
    
    // Outputs
    wire ctrl_sig;
    wire [3:0] ALUOp;
    
    control_unit uut (
        .opcode(opcode),
        .funct(funct),
        .ctrl_sig(ctrl_sig),
        .ALUOp(ALUOp)
    );
    
    initial begin
        $monitor($time,,"opcode=%d, funct=%d, ctrl_sig=%d, ALUOP=%d", opcode, funct, ctrl_sig, ALUOp);
        $display($time,,"opcode=%d, funct=%d, ctrl_sig=%d, ALUOP=%d", opcode, funct, ctrl_sig, ALUOp);
    
    opcode= 4'b0000; funct=4'b0000; #10; // add 
    opcode= 4'b0000; funct=4'b0001; #10; // sub
    opcode= 4'b0000; funct=4'b0010; #10; // sll
    opcode= 4'b0000; funct=4'b0011; #10; // and
    
    #10

    $finish;
    end

endmodule
