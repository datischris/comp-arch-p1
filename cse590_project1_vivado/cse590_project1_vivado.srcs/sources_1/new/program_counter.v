`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 08:26:45 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input [15:0] in_address,
//    input clockrise,    
    output reg [15:0] out_address,
    output reg [15:0] next_address
    );
    
//    wire [15:0] out_plus_2;
    
//    sixteenbit_adder s0(.a(in_address), .b(2), .sum(out_plus_2), .c_out());

    always @(*) 
    begin
        assign next_address = in_address + 2;
        assign out_address = in_address;
    end
    
endmodule
