`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 10:45:17 PM
// Design Name: 
// Module Name: one-instruction-datapath
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


module one_instruction_datapath();

    // Declare simulation variables
    reg  [15:0] PC;                  // Program counter input
    wire [15:0] instruction;         // Instruction fetched from memory
    wire [15:0] out_address, next_address; // PC outputs

    // [15:12] opcode, [11:8] rs, [7:4] rt, [3:0] funct
    wire [3:0] opcode;
    wire [3:0] rs;
    wire [3:0] rt;
    wire [3:0] funct;

    // Wires for connecting the register file, control unit and ALU
    wire        ctrl_sig;
    wire [3:0]  ALUOp;
    wire [15:0] reg1, reg2;
    wire [15:0] ALURes;
    
    // Instantiate the program counter module
    program_counter pc_inst(
         .in_address(PC),
         .out_address(out_address),
         .next_address(next_address)
    );
    
    // Instantiate the instruction memory module
    instruction_mem im_inst(
         .PC_address(out_address),
         .instruction(instruction)
    );
    
    // Decode the instruction fields from the fetched instruction
    assign opcode = instruction[15:12];
    assign rs     = instruction[11:8];
    assign rt     = instruction[7:4];
    assign funct  = instruction[3:0];
    

    register_file rf_inst(
         .rs(rs),
         .rt_rd(rt),
         .write_reg(4'b0000),
         .write_data(16'b0),
         .ctrl_sig(ctrl_sig),
         .reg1(reg1),
         .reg2(reg2)
    );
    
    // Instantiate the control unit module.
    // For opcode 0000, the CU enables the ALU operation using the function field.
    control_unit cu_inst(
         .opcode(opcode),
         .funct(funct),
         .ctrl_sig(ctrl_sig),
         .ALUOp(ALUOp)
    );
    
    // Instantiate the ALU module.
    // When ALUOp = 4'b0000 (from add instruction), the ALU performs A + B.
    alu alu_inst(
         .A(reg1),
         .B(reg2),
         .ALUOp(ALUOp),
         .ALURes(ALURes)
    );
    
    initial begin
         // Initialize the Program Counter to 0 to fetch the first instruction.
         PC = 16'b0;
         
         // Wait a short delay for all modules to update.
         #10;
         
         // Display the simulation data
         $display("Time = %0t ns", $time);
         $display("Fetched Instruction = %h", instruction);
         $display("Decoded fields: opcode = %b, rs = %b, rt = %b, funct = %b", opcode, rs, rt, funct);
         $display("Register values: reg1 = %d, reg2 = %d", reg1, reg2);
         $display("Control Unit: ALUOp = %b", ALUOp);
         $display("ALU Result (Final Output) = %d", ALURes);
         
         $finish;
    end
endmodule
