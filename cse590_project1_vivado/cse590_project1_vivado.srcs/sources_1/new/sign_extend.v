`timescale 1ns / 1ps


module sign_extend(
    input [3:0] immediate,
    output reg [15:0] se_immediate
    );
    
    always @(*)
    begin
        se_immediate = {{12{immediate[3]}}, immediate};
    end
    
endmodule
