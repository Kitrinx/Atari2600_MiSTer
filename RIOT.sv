

module RIOT 
(
	input clk,
	input ce,
	input reset_n,
	input RW_n,
	input IRQ_n,
	input [6:0] addr,
	input [7:0] d_in,
	output [7:0] d_out,
	input ram_sel_n,
	input CS1,
	input CS2_n,
	input PA_in,
	output PA_out,
	input PB_in,
	output PB_out
);


// Borrowed from stella
wire [7:0] init_ram[128] = '{
	8'hA9, 8'h00, 8'hAA, 8'h85, 8'h01, 8'h95, 8'h03, 8'hE8, 8'hE0, 8'h2A, 8'hD0, 8'hF9, 8'h85, 8'h02, 8'hA9, 8'h04,
	8'hEA, 8'h30, 8'h23, 8'hA2, 8'h04, 8'hCA, 8'h10, 8'hFD, 8'h9A, 8'h8D, 8'h10, 8'h01, 8'h20, 8'hCB, 8'h04, 8'h20,
	8'hCB, 8'h04, 8'h85, 8'h11, 8'h85, 8'h1B, 8'h85, 8'h1C, 8'h85, 8'h0F, 8'hEA, 8'h85, 8'h02, 8'hA9, 8'h00, 8'hEA,
	8'h30, 8'h04, 8'h24, 8'h03, 8'h30, 8'h09, 8'hA9, 8'h02, 8'h85, 8'h09, 8'h8D, 8'h12, 8'hF1, 8'hD0, 8'h1E, 8'h24,
	8'h02, 8'h30, 8'h0C, 8'hA9, 8'h02, 8'h85, 8'h06, 8'h8D, 8'h18, 8'hF1, 8'h8D, 8'h60, 8'hF4, 8'hD0, 8'h0E, 8'h85,
	8'h2C, 8'hA9, 8'h08, 8'h85, 8'h1B, 8'h20, 8'hCB, 8'h04, 8'hEA, 8'h24, 8'h02, 8'h30, 8'hD9, 8'hA9, 8'hFD, 8'h85,
	8'h08, 8'h6C, 8'hFC, 8'hFF, 8'hEA, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF,
	8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF, 8'hFF
};

endmodule
