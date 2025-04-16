`timescale 1ns / 1ps

module control_unit(
    input [3:0] opcode,
    input [3:0] funct,
    output reg write_enable,
    output reg write_mem,
    output reg read_mem,
    output reg mem_to_reg,
    output reg beq,
    output reg bne,
    output reg jump,
    output reg ALUSrc,
    output reg [3:0] ALUOp
    );
    
    always @(*)
    begin
    
        // setting default values so we dont carry over old signals
        write_enable = 1'b0;
        write_mem    = 1'b0;
        read_mem     = 1'b0;
        mem_to_reg   = 1'b0;
        beq          = 1'b0;
        bne          = 1'b0;
        jump         = 1'b0;
        ALUSrc       = 1'b0;
        ALUOp        = 4'b0000;
        
        case(opcode)
              
              4'b0000: // r-type
                  begin 
                    write_enable = 1'b1;
                    ALUOp = funct;
                  end
              
              4'b0011: // addi
                   begin
                    write_enable = 1'b1;
                    ALUSrc = 1'b1;
                   end
              
              4'b0001: // lw
                   begin
                    write_enable = 1'b1;
                    read_mem = 1'b1;
                    mem_to_reg = 1'b1;
                    ALUSrc = 1'b1;
                   end
              
              4'b0010: // sw
                   begin
                    write_mem = 1'b1;
                    ALUSrc = 1'b1;
                   end
              
              4'b0100: // beq --> using custom ALUOp for zero signal
                   begin
                    beq = 1'b1;
                    ALUOp = 4'b1001;
                   end
               
               4'b0101: // bne --> using custom ALUOp for zero signal
                   begin
                    bne = 1'b1;
                    ALUOp = 4'b1001;
                   end
               
               4'b0110: // jmp
                   begin
                    jump = 1'b1;
                   end                                 
        endcase
    end
  
    
endmodule
