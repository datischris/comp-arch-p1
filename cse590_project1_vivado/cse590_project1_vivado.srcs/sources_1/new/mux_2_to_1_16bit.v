`timescale 1ns / 1ps


module mux_2_to_1_16bit (
    input [15:0] A,
    input [15:0] B,
    input src,
    output reg [15:0] out
    );
    
    always@(*)
    begin
        case(src)
            1'b0: begin out = A; end
            1'b1: begin out = B; end
        endcase
    end
    
endmodule
