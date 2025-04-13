`timescale 1ns / 1ps

module sim_datapath();

    // required for pc
    reg clock, start;
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
    wire zero_signal, beq, blt, branch_selection;
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
                         .read_mem(read_mem),.mem_to_reg(mem_to_reg),.beq(beq),.blt(blt),.jump(jump),
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
    
    branch_selector bs_inst(.beq(beq),.blt(blt),.zero_signal(zero_signal),.branch_selection(branch_selection));
    
    mux_2_to_1_16bit mux_inst_3(.A(pc_next),.B(branch_out),.src(branch_selection),.out(muxed_branch_out));
    
    mux_2_to_1_16bit mux_inst_4(.A(muxed_branch_out),.B(jump_out),.src(jump),.out(pc_in));
    
    data_memory dm_inst(.clock(clock),.write_data(rd1),.write_mem(write_mem),.read_mem(read_mem),
                        .dm_address(ALURes),.dm_data(dm_data));
    
    mux_2_to_1_16bit mux_inst_5(.A(ALURes),.B(dm_data),.src(mem_to_reg),.out(wb_data));
    
    reg start_reg = 1;
    reg has_started = 0;
    
    // INFINITE CLOCK: CYCLING POSEDGE -> NEGEDGE -> POSEDGE -> ...
    initial
    begin
          clock = 0;
          forever #5 clock = !clock;
    end
    
    // start pulse for one-time use
    always @(negedge clock) begin
        if (!has_started)
            start_reg <= 1;
        else
            start_reg <= 0;
        
        has_started <= 1; // latch after first clock edge
    end
    
    // USING START VALUE TO LOAD PC 0 AND WRITING MEM TO FILE TO VIEW AFTER 150ps COMPLETION
    initial
    begin
        start = 1;
        #10;
        start = 0;
        
        #150;
        
        $writememb("final_register_state.txt", rf_inst.RM);
        $writememb("final_data_memory_state.txt", dm_inst.DM);
        
        $finish;
    end
    
endmodule
