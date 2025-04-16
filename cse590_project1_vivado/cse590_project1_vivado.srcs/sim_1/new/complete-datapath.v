`timescale 1ns / 1ps

module complete_datapath(
    input clock,
    input start,
    output [15:0] rd1_led,
    output [15:0] wb_led
);

    // required for pc
//    reg clock, start;
    wire  [15:0] pc_in;                
    wire  [15:0] pc_out;
    wire  [15:0] pc_next;
    
    // required for instruction memory
    wire [15:0] instruction;

    // instruction memory breakdown
    // r-type: [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] funct
    // i-type: [15:12] opcode, [11:8] rt_rd, [7:4] rs, [3:0] immediate
    // j-type: [15:12] opcode, [11:0] address
    wire [3:0] opcode;
    wire [3:0] rt_rd;
    wire [3:0] rs;
    wire [3:0] funct;
    wire [11:0] address;
    
    // required for control unit ALU and nearby logic
    wire write_enable, ALUSrc;
    wire read_mem, write_mem, mem_to_reg;
    wire zero_signal, beq, bne, branch_selection;
    wire jump;
    wire [3:0]  ALUOp;
    wire [15:0] rd1, rd2, se_immediate, mux_rd1, mux_rd2, ALURes, wb_data, dm_data;
    wire [15:0] branch_out, muxed_branch_out, jump_out;
    
    program_counter pc_inst(.pc_in(pc_in),.clock(clock),.start(start),.pc_out(pc_out));
    
    program_count_adder pc_adder_inst(.pc_out(pc_out),.pc_next(pc_next));
    
    instruction_mem im_inst(.pc_in(pc_out),.clock(clock),.instruction(instruction));
    
    assign opcode   = instruction[15:12];
    assign rt_rd    = instruction[11:8];
    assign rs       = instruction[7:4];
    assign funct    = instruction[3:0];
    assign address  = instruction[11:0];
    
    control_unit cu_inst(.opcode(opcode),.funct(funct),.write_enable(write_enable),.write_mem(write_mem),
                         .read_mem(read_mem),.mem_to_reg(mem_to_reg),.beq(beq),.bne(bne),.jump(jump),
                         .ALUSrc(ALUSrc),.ALUOp(ALUOp));

    register_file rf_inst(.rt_rd(rt_rd),.rs(rs),.write_reg(rt_rd),.clock(clock),.write_data(wb_data),
                          .write_enable(write_enable),.rd1(rd1),.rd2(rd2));
        
    sign_extend se_inst(.immediate(funct),.se_immediate(se_immediate));
    
    // selecting rd1 and rd2 (in case for addi)
    mux_2_to_1_16bit mux_inst_1(.A(rd2),.B(se_immediate),.src(ALUSrc),.out(mux_rd2));
    mux_2_to_1_16bit mux_inst_2(.A(rd1),.B(rd2),.src(ALUSrc),.out(mux_rd1)); 
    
    alu alu_inst(.A(mux_rd1),.B(mux_rd2),.ALUOp(ALUOp),.ALURes(ALURes),.zero_signal(zero_signal));

    jump_adder j_add_inst(.address(address),.pc_out(pc_next),.jump_out(jump_out));
    
    pc_adder pc_add_inst(.se_immediate(se_immediate),.pc_out(pc_next),.branch_out(branch_out));
    
    branch_selector bs_inst(.beq(beq),.bne(bne),.zero_signal(zero_signal),.branch_selection(branch_selection));
    
    mux_2_to_1_16bit mux_inst_3(.A(pc_next),.B(branch_out),.src(branch_selection),.out(muxed_branch_out));
    
    mux_2_to_1_16bit mux_inst_4(.A(muxed_branch_out),.B(jump_out),.src(jump),.out(pc_in));
    
    data_memory dm_inst(.clock(clock),.write_data(rd1),.write_mem(write_mem),.read_mem(read_mem),
                        .dm_address(ALURes),.dm_data(dm_data));
    
    mux_2_to_1_16bit mux_inst_5(.A(ALURes),.B(dm_data),.src(mem_to_reg),.out(wb_data));
    
    // FOR FPGA BOARD
    assign rd1_led = rd1;
    assign wb_led  = wb_data;
    
endmodule