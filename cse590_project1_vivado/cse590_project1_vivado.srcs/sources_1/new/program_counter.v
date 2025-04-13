`timescale 1ns / 1ps

module program_counter(
    input [15:0] pc_in,
    input clock,
    input start,    
    output reg [15:0] pc_out
    );
    
    initial 
    begin
         pc_out = 16'd0;
    end
    
    always @(posedge clock)
    begin
        if (start)
            begin 
                pc_out <= 16'd0; 
            end
        else 
            begin 
                pc_out <= pc_in; 
            end
    end
    
endmodule