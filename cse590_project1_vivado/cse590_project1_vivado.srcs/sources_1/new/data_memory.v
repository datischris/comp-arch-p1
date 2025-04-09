`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 03:08:11 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clock,
    input write_mem,
    input read_mem,
    input [15:0] write_data,
    input [15:0] dm_address,
    output reg [15:0] dm_data
    );
    
    reg [7:0] byte_address;
    reg [7:0] DM[0:255];
    
    initial
    begin
        DM[0]  = 8'd0;
        DM[1]  = 8'd1;
        DM[2]  = 8'd2;
        DM[3]  = 8'd3;
        DM[4]  = 8'd4;
        DM[5]  = 8'd5;
        DM[6]  = 8'd6;
        DM[7]  = 8'd7;
        DM[8]  = 8'd8;
        DM[9]  = 8'd9;
        DM[10] = 8'd0;
        DM[11] = 8'd10;
        DM[12] = 8'd12;
        DM[13] = 8'd13;
        DM[14] = 8'd14;
        DM[15] = 8'd15;
        DM[16] = 8'd16;
        DM[17] = 8'd17;
        DM[18] = 8'd18;
        DM[19] = 8'd19;
        DM[20] = 8'd20;
        DM[21] = 8'd21;
        DM[22] = 8'd22;
        DM[23] = 8'd23;
        DM[24] = 8'd24;
        DM[25] = 8'd25;
        DM[26] = 8'd26;
        DM[27] = 8'd27;
        DM[28] = 8'd28;
        DM[29] = 8'd29;
        DM[30] = 8'd30;
        DM[31] = 8'd31;
    end
    
    always @(posedge clock)
    begin
        byte_address = dm_address[7:0] << 1;
    
        if (write_mem)
            begin
                DM[byte_address] <= write_data[15:8]; // MSB
                DM[byte_address + 1] <= write_data[7:0]; //LSB
            end
        else
            begin
                dm_data <= {DM[byte_address], DM[byte_address + 1]};
            end
    end
    
endmodule
