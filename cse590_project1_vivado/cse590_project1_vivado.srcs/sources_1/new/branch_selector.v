`timescale 1ns / 1ps

module branch_selector(
    input beq,
    input bne,
    input zero_signal,
    output reg branch_selection
    );
    
    always @(*)
    begin
        branch_selection = (beq && zero_signal) || (bne && ~zero_signal);
    end
    
endmodule
