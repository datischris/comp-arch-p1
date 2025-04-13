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
    
    reg [7:0] DM[0:255];
    
    initial
    begin
        DM[0]  = 8'd0;      // using this for sw example
        DM[1]  = 8'd0;      // using this for sw example
        DM[2]  = 8'd0;
        DM[3]  = 8'd0;
        DM[4]  = 8'd0;
        DM[5]  = 8'd0;
        DM[6]  = 8'd0;
        DM[7]  = 8'd0;
        DM[8]  = 8'd0;
        DM[9]  = 8'd0;
        DM[10] = 8'd0;      // using this for lw example
        DM[11] = 8'd255;    // using this for lw example
        DM[12] = 8'd0;
        DM[13] = 8'd0;
        DM[14] = 8'd0;
        DM[15] = 8'd0;
        DM[16] = 8'd0;      
        DM[17] = 8'd0;
        DM[18] = 8'd0;
        DM[19] = 8'd0;
        DM[20] = 8'd0;
        DM[21] = 8'd0;
        DM[22] = 8'd0;
        DM[23] = 8'd0;
        DM[24] = 8'd0;
        DM[25] = 8'd0;
        DM[26] = 8'd0;
        DM[27] = 8'd0;
        DM[28] = 8'd0;
        DM[29] = 8'd0;
        DM[30] = 8'd0;
        DM[31] = 8'd0;
    end
    
    always @(*)
    begin
        // setting so we dont carry over old signals
        dm_data = 16'd0;
        
        if (read_mem)
        begin
            dm_data <= {DM[dm_address], DM[dm_address + 1]}; // {MSB, LSB}
        end
    end
    
    always @(posedge clock)
    begin
        if (write_mem)
        begin
            DM[dm_address] <= write_data[15:8];     // MSB
            DM[dm_address + 1] <= write_data[7:0];  // LSB
        end
    end
    
endmodule
