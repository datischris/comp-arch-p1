`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 04:54:56 PM
// Design Name: 
// Module Name: test_alu
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


module test_alu();
    // Inputs
    reg [15:0] A;
    reg [15:0] B;
    reg [3:0] ALUOp;
    
    // Outputs
    wire [15:0] ALURes;
    
    alu uut (
        .A(A),
        .B(B),
        .ALUOp(ALUOp),
        .ALURes(ALURes)
    );
    
    initial begin
        $monitor($time,,"A=%d, B=%d, ALUOp=%d, ALUResult=%d", A, B, ALUOp, ALURes);
        $display($time,,"A=%d, B=%d, ALUOp=%d, ALUResult=%d", A, B, ALUOp, ALURes);
    
    A = 16'b0001; B = 16'b0001; ALUOp = 4'b0000; #10;   // add 
    A = 16'b0001; B = 16'b0001; ALUOp = 4'b0001; #10;   // sub
    A = 16'b0001; B = 16'b0001; ALUOp = 4'b0010; #10;   // slt
    A = 16'b0001; B = 16'b0001; ALUOp = 4'b0011; #10;   // and
    
    #10

    $finish;
    end

endmodule
