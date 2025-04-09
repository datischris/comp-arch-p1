`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 11:54:21 PM
// Design Name: 
// Module Name: i_type_instruction_datapath
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


module i_type_instruction_datapath();

    // required for pc
    reg  [15:0] pc_in;                
    wire [15:0] pc_out;
    
    // required for instruction memory
    wire [15:0] instruction;

    // required for instruction memory breakdown
    // [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] funct -> r-type
    // [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] immediate -> i-type
    // [15:12] opcode, [11:0] address -> j-type
    wire [3:0] opcode;
    wire [3:0] rt_rd;
    wire [3:0] rs;
    wire [3:0] funct;
    wire [11:0] address;

    // required for control unit and ALU
    wire write_enable, ALUSrc;
    wire [3:0]  ALUOp;
    wire [15:0] rd1, rd2, se_immediate, mux_rd2, ALURes;
    
    // required for pc start + datapath signals
    reg clock, start;

    program_counter pc_inst(
         .pc_in(pc_in),
         .clock(clock),
         .start(start),
         .pc_out(pc_out)
    );
    
    instruction_mem im_inst(
         .pc_out(pc_out),
         .clock(clock),
         .instruction(instruction)
    );
    
    assign opcode    = instruction[15:12];
    assign rt_rd     = instruction[11:8];
    assign rs        = instruction[7:4];
    assign funct     = instruction[3:0];
    
    
    control_unit cu_inst(
         .opcode(opcode),
         .funct(funct),
         .write_enable(write_enable),
         .ALUSrc(ALUSrc),
         .ALUOp(ALUOp)
    );
    

    register_file rf_inst(
         .rs(rs),
         .rt_rd(rt_rd),
         .write_reg(rt_rd),
         .clock(clock),
         .write_data(ALURes),
         .write_enable(write_enable),
         .rd1(rd1),
         .rd2(rd2) 
    );
    
    
    sign_extend se_inst(
         .immediate(funct),
         .se_immediate(se_immediate)
    );
    
    
    mux_2_to_1_16bit mux_inst_1(
        .A(rd2),
        .B(se_immediate),
        .src(ALUSrc),
        .out(mux_rd2)
    );
    
    
    alu alu_inst(
         .A(rd1),
         .B(mux_rd2),
         .ALUOp(ALUOp),
         .ALURes(ALURes)
    );
    

    initial
    begin
          clock = 0;
          forever #5 clock = !clock;
    end
        
        
    initial
    begin
        start = 1; #10; start = 0; #5; pc_in = 16'd0;
        
        // cycle through first 4 instructions (r-type)
        repeat (5) 
        begin
            #10; pc_in = pc_out;  // feed pc_out to the next pc_in
        end
        
        $writememb("final_register_state.txt", rf_inst.RM);
        
        $finish;
        
        
    end
endmodule
