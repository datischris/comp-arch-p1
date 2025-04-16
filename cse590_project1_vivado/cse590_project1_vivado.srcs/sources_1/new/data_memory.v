`timescale 1ns / 1ps

module data_memory(
    input clock,
    input write_mem,
    input read_mem,
    input [15:0] write_data,
    input [15:0] dm_address,
    output reg [15:0] dm_data
    );
    
    reg [7:0] DM[0:255];
    integer i;

    
    initial
    begin
		for (i = 0; i < 256; i = i + 1) begin
			DM[i] = 8'd0; 
		end
		// for sample instruction simulation
//		 DM[11] = 8'd255; 
    end
    
    always @(*)
    begin
        // setting so we dont carry over old signals
        dm_data = 16'd0;
        
        if (read_mem)
        begin
            dm_data <= {DM[dm_address], DM[dm_address + 1]}; // {MSB, LSB}
        end
    end
    
    always @(posedge clock)
    begin
        if (write_mem)
        begin
            DM[dm_address] <= write_data[15:8];     // MSB
            DM[dm_address + 1] <= write_data[7:0];  // LSB
        end
    end
    
endmodule
