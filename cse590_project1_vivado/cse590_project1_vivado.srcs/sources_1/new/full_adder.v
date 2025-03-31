`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 07:26:46 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    
    wire a1, a2, a3;
  
    xor u1(a1,A,B);   //a1 = A xor B
    xor u2(S,a1,Cin); // S = a1 xor Cin
      
    and u3(a2,A,B);    // a2 = A and B
    and u4(a3,a1,Cin); // a3 = a1 and Cin
    or u5(Cout,a2,a3); //Cout = a2 or a3
    
endmodule
