// Atari 2600 system glue module
// Jamie Dickson, 2019

module system2600
(
	input clk,
	input rst,
	output [7:0] d_o,
	input [7:0] di,
	output [12:0] a,
	output r,
	input [7:0] pa,
	input [7:0] pb,
	input [7:0] paddle_0,
	input [7:0] paddle_1,
	input [7:0] paddle_2,
	input [7:0] paddle_3,
	input paddle_ena1,
	input paddle_ena2,
	input inpt4,
	input inpt5,
	output colu,
	output vsyn,
	output hsyn,
	output hblank,
	output vblank,
	output [23:0] rgbx2,
	output au0,
	output au1,
	output [3:0] av0,
	output [3:0] av1,
	output ph0_out,
	output ph2_out,
	input pal 
);

wire  [7:0] riot_do;
wire  [7:0] tia_do;

wire  [7:0] cpu_do;
wire [12:0] cpu_addr;
wire        cpu_RW_n;
wire  [7:0] cpu_di = tia_do & riot_do & di;
wire        cpu_rdy;

wire phi0, phi2; 

assign r = cpu_RW_n;
assign d_o = cpu_do;
assign a = cpu_addr;
assign ph0_out = phi0;
assign ph2_out = phi2;

// The CPU would normally generate Phi2, however T65 is not phase accurate so
// we have to do this ourselves.

T65 CPU
(
	.Mode   (00),
	.Res_n  (~rst),
	.Clk    (clk),       // System clock
	.Enable (phi0),      // Phi 0
	.A      (cpu_addr),
	.DI     (cpu_di),
	.DO     (cpu_do),
	.Rdy    (cpu_rdy),
	.IRQ_n  (1),
	.NMI_n  (1),
	.R_W_n  (cpu_RW_n)
);

// Atari 2600 port map
// PA: {Lpin4, Lpin3, Lpin2, Lpin1, Rpin4, Rpin3, Rpin2, Rpin1} - Controller ports (R, L, D, U is the pin order)
// PB7: Difficulty Right - 1 = A, 0 = B
// PB6: Difficulty Left  - 1 = A, 0 = B
// PB5: 1
// PB4: 1
// PB3: Color/BW         - 1 = Color, 0 = B&W
// PB2: 1
// PB1: Select           - 1 = Released, 0 = Pressed
// PB0: Start            - 1 = Released, 0 = Pressed

M6532 RIOT
(
	.clk    (clk),
	.ce     (phi2),
	.res_n  (~rst),
	.addr   (cpu_addr[6:0]),
	.RW_n   (cpu_RW_n),
	.d_out  (riot_do),
	.d_in   (cpu_do),
	.RS_n   (cpu_addr[9]),
	.CS1    (cpu_addr[7]),
	.CS2_n  (cpu_addr[12]),
	.PA_in  (pa),
	.PA_out (),
	.PB_in  (pb),
	.PB_out ()
);

// TIA does the original clock division and generates phi0
// It is not supposed to generate, but rather recieve phi2 from the 6507

TIA TIA
(
	.clk         (clk), // 3.579575 MHZ
	.cs          (~cpu_addr[12] & ~cpu_addr[7]),
	.r           (cpu_RW_n),
	.a           (cpu_addr[5:0]),
	.di          (cpu_do),
	.d_o         (tia_do),
	.colu        (colu),
	.vsyn        (vsyn),
	.hsyn        (hsyn),
	.ohblank     (hblank),
	.ovblank     (vblank),
	.rgbx2       (rgbx2),
	.rdy         (cpu_rdy),
	.ph0         (phi0),
	.ph2         (phi2),
	.au0         (au0),
	.au1         (au1),
	.av0         (av0),
	.av1         (av1),
	.paddle_0    (paddle_0),
	.paddle_1    (paddle_1),
	.paddle_2    (paddle_2),
	.paddle_3    (paddle_3),
	.paddle_ena1 (paddle_ena1),
	.paddle_ena2 (paddle_ena2),
	.inpt4       (inpt4),
	.inpt5       (inpt5),
	.pal         (pal)
);

endmodule