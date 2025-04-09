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

    // required for pc
    reg  [15:0] pc_in;                
    wire [15:0] pc_out;
    
    // required for pc start + datapath signals
    reg clock, start;
    
    program_counter pc_inst(
         .pc_in(pc_in),
         .clock(clock),
         .start(start),
         .pc_out(pc_out)
    );
    
    // required for instruction memory
    wire [15:0] instruction;

    // instruction memory breakdown
    // [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] funct -> r-type
    // [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] immediate -> i-type
    // [15:12] opcode, [11:0] address -> j-type
    wire [3:0] opcode;
    wire [3:0] rt_rd;
    wire [3:0] rs;
    wire [3:0] funct;
    wire [11:0] address;
    
    instruction_mem im_inst(
         .pc_out(pc_out),
         .clock(clock),
         .instruction(instruction)
    );
    
    assign opcode    = instruction[15:12];
    assign rt_rd     = instruction[11:8];
    assign rs        = instruction[7:4];
    assign funct     = instruction[3:0];
    
    
    // required for control unit ALU and nearby logic
    wire write_enable, ALUSrc, read_mem, write_mem, mem_to_reg;
    wire [3:0]  ALUOp;
    wire [15:0] rd1, rd2, se_immediate, mux_rd1, mux_rd2, ALURes, wb_data;
    
    control_unit cu_inst(
         .opcode(opcode),
         .funct(funct),
         .write_enable(write_enable),
         .write_mem(write_mem),
         .read_mem(read_mem),
         .mem_to_reg(mem_to_reg),
         .ALUSrc(ALUSrc),
         .ALUOp(ALUOp)
    );
    

    register_file rf_inst(
         .rt_rd(rt_rd),
         .rs(rs),
         .write_reg(rt_rd),
         .clock(clock),
         .write_data(wb_data),
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
    
    mux_2_to_1_16bit mux_inst_2(
        .A(rd1),
        .B(rd2),
        .src(ALUSrc),
        .out(mux_rd1)
    );
    
    
    alu alu_inst(
         .A(mux_rd1),
         .B(mux_rd2),
         .ALUOp(ALUOp),
         .ALURes(ALURes)
    );
    
    wire [15:0] dm_data;
    
    data_memory dm_inst(
        .clock(clock),
        .write_data(rd1),
        .write_mem(write_mem),
        .read_mem(read_mem),
        .dm_address(ALURes),
        .dm_data(dm_data)
    );
    
    mux_2_to_1_16bit mux_inst_3(
        .A(ALURes),
        .B(dm_data),
        .src(mem_to_reg),
        .out(wb_data)
    );
    
    
    initial
    begin
          clock = 0;
          forever #5 clock = !clock;
    end
        
        
    initial
    begin
        start = 1; #10; start = 0; #5; pc_in = 16'd0;
        
        // cycle through first 7 instructions (4 r-type, 3 i-type)
        repeat (7) 
        begin
            #10; pc_in = pc_out;  // feed pc_out to the next pc_in
        end
        
        #10;$writememb("final_register_state.txt", rf_inst.RM);
        #10;$writememb("final_data_memory_state.txt", dm_inst.DM);
        
        $finish;
    end
endmodule
