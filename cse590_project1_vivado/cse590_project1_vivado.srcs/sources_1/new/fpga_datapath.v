`timescale 1ns / 1ps

module fpga_datapath(
    input clock,
    output [15:0] leds
);

    reg start_reg = 1;
    reg has_started = 0;
    wire [15:0] rd_before_write;
    wire [15:0] rd_after_write;
    
//    reg clock;
//    initial
//    begin
//          clock = 0;
//          forever #5 clock = !clock;
//    end
    
    // start pulse for one-time use
    always @(negedge clock) begin
        if (!has_started)
            start_reg <= 1;
        else
            start_reg <= 0;
        
        has_started <= 1; // latch after first clock edge
    end
    
    complete_datapath datapath_inst (
        .clock(clock),
        .start(start_reg),
        .rd1_led(rd_before_write),
        .wb_led(rd_after_write)
    );
    
    assign leds = clock ? rd_before_write : rd_after_write;
    
//    initial
//    begin
//        #150;
//        $finish;
//    end
    
endmodule
