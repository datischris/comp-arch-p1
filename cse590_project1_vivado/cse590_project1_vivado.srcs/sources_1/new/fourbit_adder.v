`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 03:53:29 PM
// Design Name: 
// Module Name: fourbit_adder
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


module fourbit_adder(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] sum,
    output c_out
    );
    
    wire c1, c2, c3;
    
    full_adder f0(a[0], b[0], c_in, sum[0], c1);
    full_adder f1(a[1], b[1], c1, sum[1], c2);
    full_adder f2(a[2], b[2], c2, sum[2], c3);
    full_adder f3(a[3], b[3], c3, sum[3], c_out);
    
endmodule
