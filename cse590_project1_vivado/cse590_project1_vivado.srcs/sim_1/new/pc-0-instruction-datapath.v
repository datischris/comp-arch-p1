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


module r_type_instruction_datapath();

    reg  [15:0] PC;           
    wire [15:0] instruction;         
    wire [15:0] out_address, next_address;

    // [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] funct
    wire [3:0] opcode;
    wire [3:0] rs;
    wire [3:0] rt_rd;
    wire [3:0] funct;

    wire        ctrl_sig;
    wire [3:0]  ALUOp;
    wire [15:0] reg1, reg2;
    wire [15:0] ALURes;
    

    program_counter pc_inst(
         .in_address(PC),
         .out_address(out_address),
         .next_address(next_address)
    );
    

    instruction_mem im_inst(
         .PC_address(out_address),
         .instruction(instruction)
    );
    
    
    assign opcode = instruction[15:12];
    assign rt_rd     = instruction[11:8];
    assign rs     = instruction[7:4];
    assign funct  = instruction[3:0];


    register_file rf_inst(
         .rs(rs),
         .rt_rd(rt_rd),
         .write_reg(4'b0000),
         .write_data(16'b0),
         .ctrl_sig(ctrl_sig),
         .reg1(reg1),
         .reg2(reg2)
    );
    

    control_unit cu_inst(
         .opcode(opcode),
         .funct(funct),
         .ctrl_sig(ctrl_sig),
         .ALUOp(ALUOp)
    );
    

    alu alu_inst(
         .A(reg1),
         .B(reg2),
         .ALUOp(ALUOp),
         .ALURes(ALURes)
    );
    
    initial begin
         // Initialize the Program Counter to 0 to fetch the first instruction.
         PC = 16'b0000000000000000;#10; // add instruction
         PC = 16'b0000000000000010;#10; // sub instruction
         PC = 16'b0000000000000100;#10; // sll instruction
//         PC = 16'b0000000000000110;#10; // and instruction
//         PC = 16'b0000000000001000;#10; // lw instruction
         
         
         
         // Display the simulation data
         $display("Time = %0t ns", $time);
         $display("Fetched Instruction = %h", instruction);
         $display("Decoded fields: opcode = %b, rt_rd = %b, rs = %b, funct = %b", opcode, rt_rd, rs, funct);
         $display("Register values: reg1 = %d, reg2 = %d", reg1, reg2);
         $display("Control Unit: ALUOp = %b", ALUOp);
         $display("ALU Result (Final Output) = %d", ALURes);
         
         $finish;
    end
endmodule
