`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 09:19:24 PM
// Design Name: 
// Module Name: sixteenbit_adder
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


module sixteenbit_adder(
    input [15:0] a,
    input [15:0] b,
    output [15:0] sum,
    output c_out
    );
    
    wire c1, c2, c3;
    
    fourbit_adder f0(a[3:0], b[3:0], 1'b0, sum[3:0], c1);
    fourbit_adder f1(a[7:4], b[7:4], c1, sum[7:4], c2);
    fourbit_adder f2(a[11:8], b[11:8], c2, sum[11:8], c3);
    fourbit_adder f3(a[15:12], b[15:12], c3, sum[15:12], c_out);
    
endmodule
