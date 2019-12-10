// Princess TIAbeanie
// Jamie Dickson, 2019
// Based on Stella Programmer's Guide and TIA schematics, and verified with Stella Emulator

// Enum ripped strait from Stella. Thanks man.
enum bit [5:0] {
	VSYNC   = 6'h00,  // Write: vertical sync set-clear (D1)
	VBLANK  = 6'h01,  // Write: vertical blank set-clear (D7-6,D1)
	WSYNC   = 6'h02,  // Write: wait for leading edge of hrz. blank (strobe)
	RSYNC   = 6'h03,  // Write: reset hrz. sync counter (strobe)
	NUSIZ0  = 6'h04,  // Write: number-size player-missle 0 (D5-0)
	NUSIZ1  = 6'h05,  // Write: number-size player-missle 1 (D5-0)
	COLUP0  = 6'h06,  // Write: color-lum player 0 (D7-1)
	COLUP1  = 6'h07,  // Write: color-lum player 1 (D7-1)
	COLUPF  = 6'h08,  // Write: color-lum playfield (D7-1)
	COLUBK  = 6'h09,  // Write: color-lum background (D7-1)
	CTRLPF  = 6'h0a,  // Write: cntrl playfield ballsize & coll. (D5-4,D2-0)
	REFP0   = 6'h0b,  // Write: reflect player 0 (D3)
	REFP1   = 6'h0c,  // Write: reflect player 1 (D3)
	PF0     = 6'h0d,  // Write: playfield register byte 0 (D7-4)
	PF1     = 6'h0e,  // Write: playfield register byte 1 (D7-0)
	PF2     = 6'h0f,  // Write: playfield register byte 2 (D7-0)
	RESP0   = 6'h10,  // Write: reset player 0 (strobe)
	RESP1   = 6'h11,  // Write: reset player 1 (strobe)
	RESM0   = 6'h12,  // Write: reset missle 0 (strobe)
	RESM1   = 6'h13,  // Write: reset missle 1 (strobe)
	RESBL   = 6'h14,  // Write: reset ball (strobe)
	AUDC0   = 6'h15,  // Write: audio control 0 (D3-0)
	AUDC1   = 6'h16,  // Write: audio control 1 (D4-0)
	AUDF0   = 6'h17,  // Write: audio frequency 0 (D4-0)
	AUDF1   = 6'h18,  // Write: audio frequency 1 (D3-0)
	AUDV0   = 6'h19,  // Write: audio volume 0 (D3-0)
	AUDV1   = 6'h1a,  // Write: audio volume 1 (D3-0)
	GRP0    = 6'h1b,  // Write: graphics player 0 (D7-0)
	GRP1    = 6'h1c,  // Write: graphics player 1 (D7-0)
	ENAM0   = 6'h1d,  // Write: graphics (enable) missle 0 (D1)
	ENAM1   = 6'h1e,  // Write: graphics (enable) missle 1 (D1)
	ENABL   = 6'h1f,  // Write: graphics (enable) ball (D1)
	HMP0    = 6'h20,  // Write: horizontal motion player 0 (D7-4)
	HMP1    = 6'h21,  // Write: horizontal motion player 1 (D7-4)
	HMM0    = 6'h22,  // Write: horizontal motion missle 0 (D7-4)
	HMM1    = 6'h23,  // Write: horizontal motion missle 1 (D7-4)
	HMBL    = 6'h24,  // Write: horizontal motion ball (D7-4)
	VDELP0  = 6'h25,  // Write: vertical delay player 0 (D0)
	VDELP1  = 6'h26,  // Write: vertical delay player 1 (D0)
	VDELBL  = 6'h27,  // Write: vertical delay ball (D0)
	RESMP0  = 6'h28,  // Write: reset missle 0 to player 0 (D1)
	RESMP1  = 6'h29,  // Write: reset missle 1 to player 1 (D1)
	HMOVE   = 6'h2a,  // Write: apply horizontal motion (strobe)
	HMCLR   = 6'h2b,  // Write: clear horizontal motion registers (strobe)
	CXCLR   = 6'h2c,  // Write: clear collision latches (strobe)

	CXM0P   = 6'h00,  // Read collision: D7=(M0,P1); D6=(M0,P0)
	CXM1P   = 6'h01,  // Read collision: D7=(M1,P0); D6=(M1,P1)
	CXP0FB  = 6'h02,  // Read collision: D7=(P0,PF); D6=(P0,BL)
	CXP1FB  = 6'h03,  // Read collision: D7=(P1,PF); D6=(P1,BL)
	CXM0FB  = 6'h04,  // Read collision: D7=(M0,PF); D6=(M0,BL)
	CXM1FB  = 6'h05,  // Read collision: D7=(M1,PF); D6=(M1,BL)
	CXBLPF  = 6'h06,  // Read collision: D7=(BL,PF); D6=(unused)
	CXPPMM  = 6'h07,  // Read collision: D7=(P0,P1); D6=(M0,M1)
	INPT0   = 6'h08,  // Read pot port: D7
	INPT1   = 6'h09,  // Read pot port: D7
	INPT2   = 6'h0a,  // Read pot port: D7
	INPT3   = 6'h0b,  // Read pot port: D7
	INPT4   = 6'h0c,  // Read P1 joystick trigger: D7
	INPT5   = 6'h0d   // Read P2 joystick trigger: D7
};

/////////////////////////////////////////////////////////////////////////////////////////

module playfield
(

);


endmodule

/////////////////////////////////////////////////////////////////////////////////////////

module collision
(

);

endmodule

/////////////////////////////////////////////////////////////////////////////////////////

module player
(

);

endmodule

/////////////////////////////////////////////////////////////////////////////////////////
module audio
(
	input clk,
	input ce,
	input aud0,
	input aud1,
	input [3:0] volume,
	input [4:0] freq,
	input [3:0] audc,
	output [3:0] audio
);

reg [4:0] freq_div;
reg [3:0] pulse_sr; // Pulse generator
reg [4:0] noise_sr; // Noise generator
reg noise;

reg noise_en;
reg noise_hold		

wire pulse_en;

assign audio = pulse_sr[0] ? volume : 4'h0;

always_comb begin
	case (audc[3:2])
		0: pulse_en = ((pulse_sr[1] ? 1 : 0) ^ pulse_sr[0]) && (pulse_sr != 4'h0A) && |audc[1:0];
		1: pulse_en = ~pulse_sr[3];
		2: pulse_en = ~noise_sr[0];
		3: pulse_en = ~(pulse_sr[1] || |(pulse_sr[3:1]);
	endcase
end

always_ff @(posedge clk) begin
	if (reset) begin
		freq_div <= 0;
	end else if (aud0 | aud1) begin
		freq_div <= freq_div + 1'd1;
		audio_clk <= 0;
		if (freq_div >= freq) begin
			freq_div <= 0;
			audio_clk <= 1;
		end
	end

	// The audio ctrl register controls various dividers for the
	// noise generator.
	if (aud0 & audio_clk) begin
		case (audc[1:0])
			0: pulse_hold <= 0;
			1: pulse_hold <= 0;
			2: pulse_hold <= (noise_sr[4:1] != 4'b0010);
			3: pulse_hold <= ~noise_sr[0];
		endcase
		if (~|audc[1:0])
			noise_en <= ~|audc ? (pulse_cnt[0] ^ noise_cnt[0]) ||
				~(|noise_cnt) | (pulse_cnt != 4'b1010)) || ~|audc[3:2];
		else
			noise_en <= ((noise_sr[3] ? 1 : 0) ^ noise_sr[0] || ~|noise_sr);
	end

	if (aud1 & audio_clk) begin
		noise_sr <= {noise_en, noise_sr[4:1]};
		if (~pulse_hold)
			pulse_sr <= {pulse_en, pulse_sr[3:1]};
	end
end

endmodule

/////////////////////////////////////////////////////////////////////////////////////////
module video_gen
(
	input clk,
	input ce,
	output [7:0] column;
	output vsync,
	output hsync,
	output vblank,
	output reg hblank,
	output reg aud0, // Audio clocks need to be high twice per line
	output reg aud1
);


localparam hsync_start = 186;  // sync and burst 16 counts
localparam hsync_end = hsync_start + 16;
localparam hblank_start = 160; // Blank 68 counts

reg [7:0] h_count;// H count of 228

assign column = h_count;

always_ff @(posedge clk) if (reset) begin
	h_count <= 0; // Do we want this?
end else if (ce) begin
	h_count <= h_count + 1'd1;
	if (h_count >= 227)
		h_count <= 0;
	// According to stella, the magic numbers for audio clocks are 81 and 149
	aud0 <= (h_count == 80);
	aud1 <= (h_count == 148);
	hblank <= (h_count >= hblank_start);
	hsync <= (h_count >= hsync_start && h_count < hsync_end);
end

endmodule;

/////////////////////////////////////////////////////////////////////////////////////////
module clockgen
(
	input clk,
	input ce,
	input phi2,
	output reg phi0,
	output reg phi2_gen,
	output phase
);

// Generation of Phi0. One phi0 clock is 3x hardware clocks, but we will allow for CE so we can use a single PLL.
// In this implementation, our 6507 does not generate phi2, so we will add here as an extra port which can
// be fed immediately back into the chip to satisfy the phi2 signal.
always_ff @(posedge clk) begin : phi0_gen
	reg [1:0] phi_div;
	phi0 <= 0;
	phi2_gen <= 0;
	if (reset) begin
		phi_div <= 0;
	end else if (ce) begin
		phi_div <= phi_div + 1'd1;
		if (phi_div >= 2) begin
			phi_div <= 0;
			phi0 <= 1;
		end
		if (phi_div >= 1)
			phi2_gen <= 1;
	end
end

// Make sure we have our phases right
reg phase_latch;
always_ff @(posedge clk) if (phi0)
	phase_latch <= 0;
else if (phi2)
	phase_latch <= 1;

assign phase = ~phi0 & (phi2 | phase_latch);

endmodule

/////////////////////////////////////////////////////////////////////////////////////////
module priority_encoder
(
	input clk,
	input ce,
	input p0,
	input m0,
	input p1,
	input m1,
	input pf,
	input bl,
	input cntd, // 0 = left half, 1 = right half
	input pfp,
	input score,
	output [3:0] col_select // {bk, pf, p1, p0}
);

// Normal priority:
// 0: P0, M0
// 1: P1, M1
// 2: PF, BL
// 3: BK

// PFP:
// 0: PF, BL
// 1: P0, M0
// 2: P1, M1
// 3: BK

// When a one is written into the score control bit, the playfield is forced
// to take the color-lum of player 0 in the left half of the screen and player 
// 1 in the right half of the screen.

always_comb begin
	casex ({pfp, (pf | bl), (p1 | m1), (p0 | m0)})
		4'bX_001: select = 4'b0001;
		4'bX_010: select = 4'b0010;
		4'bX_011: select = 4'b0001;
		4'bX_100: select = 4'b0100;
		4'b0_101: select = 4'b0001;
		4'b0_110: select = 4'b0010;
		4'b0_111: select = 4'b0001;
		4'b1_101: select = score ? (cntd ? 4'b0010 : 4'b0001) : 4'b0100;
		4'b1_110: select = score ? (cntd ? 4'b0010 : 4'b0001) : 4'b0100;
		4'b1_111: select = score ? (cntd ? 4'b0010 : 4'b0001) : 4'b0100;
		default: select = 4'b1000;
	endcase
end

endmodule

/////////////////////////////////////////////////////////////////////////////////////////
module TIA
(
	// Original Pins
	input        clk,
	output       phi0,
	input        phi2,
	input        RW_n,
	output       rdy,
	input  [5:0] addr,
	input  [7:0] d_in,
	output [7:0] d_out,
	input  [7:0] i0,     // On real hardware, these would be ADC pins
	input  [7:0] i1,
	input  [7:0] i2,
	input  [7:0] i3,
	input        i4,
	input        i5,
	output [3:0] col,
	output [2:0] lum,
	output       BLK_n,
	output       sync,
	input        cs0_n,
	input        cs2,

	// Abstractions
	input        rst,
	input        ce,     // Clock enable for CLK generation only
	input        video_ce,
	output       vblank,
	output       hblank,
	output       vsync,
	output       hsync,
	output       phi2_gen
);

reg [7:0] wreg[64]; // Write registers. Only 44 are used.
reg [7:0] rreg[16]; // Read registers.
reg rdy_latch; // buffer for the rdy signal
reg [14:0] collision;

wire [7:0] read_val;
wire cs = ~cs0_n & cs2; // Chip Select (cs1 and 3 were NC)
wire phase; // 0 = phi0, 1 = phi2
wire wsync,rsync,resp0,resp1,resm0,resm1,resbl,hmove,hmclr,cxclr; // Strobe register signals
wire [3:0] color_select;
wire p0, p1, m0, m1, bl, pf; // Current object active flags
wire aclk0, aclk1;
wire [7:0] column;

assign d_out = phase ? read_val : 8'hFF;
assign rdy = ~(wsync & rdy_latch);
assign BLK_n ~(hblank | vblank);

clockgen clockgen
(
	.clk      (clk),
	.ce       (ce),
	.phi2     (phi2),
	.phi0     (phi0),
	.phi2_gen (phi2_gen),
	.phase    (phase)
);

video_gen h_gen
(
	.clk    (clk),
	.ce     (phi0),
	.column (column),
	.vsync  (vsync),
	.hsync  (hsync),
	.vblank (vblank),
	.hblank (hblank),
	.aud0   (aclk0),
	.aud1   (aclk1),
);

//player0
//player1
//missile0
//missile1
//ball

playfield playfield
(
	.clk(clk),
	.ce(phi0),
	.column (column),
	.playfield({wreg[PF2], wreg[PF1], wreg[PF0][7:4]}),
	.pf(pf)
);

priority_encoder priority
(
	.p0     (p0),
	.m0     (m0),
	.p1     (p1),
	.m1     (m1),
	.pf     (pf),
	.cntd   (column > 80),
	.pfp    (wreg[CTRLPF][2]),
	.score  (wreg[CTRLPF][1]),
	.select (color_select)
);

audio audio0
(
	.clk    (clk),
	.aud0   (aclk0),
	.aud1   (aclk1),
	.volume (wreg[AUDV0]),
	.freq   (wreg[AUDF0]),
	.audc   (wreg[AUDC0]),
	.audio  (aud0)
);

audio audio1
(
	.clk    (clk),
	.aud0   (aclk0),
	.aud1   (aclk1),
	.volume (wreg[AUDV1]),
	.freq   (wreg[AUDF1]),
	.audc   (wreg[AUDC1]),
	.audio  (aud1)
);

// Select the correct output register
always_comb begin
	if (hblank | vblank)
		{col, lum} = 7'd0; // My own innovation for modern displays, not part of the chip
	else begin
		case (color_select)
			4'b0001: {col, lum} = wreg[COLUP0][7:1];
			4'b0010: {col, lum} = wreg[COLUP1][7:1];
			4'b0100: {col, lum} = wreg[COLUPF][7:1];
			4'b1000: {col, lum} = wreg[COLUBK][7:1];
			default: {col, lum} = 7'd0;
		endcase
	end
end

// Chip reads and writes
// Register writes happen when Phi2 falls, or in our context, when Phi0 rises.
// Register reads happen when Phi2 is high. This is relevant in particular to RIOT which is clocked on Phi2.

always_comb begin
	if (cs & RW_n)
		read_val = rreg[addr[3:0]]; // reads only use the lower 4 bits of addr
	else
		read_val = 8'hFF;
end

always @(posedge clk) if (reset) begin
	wreg <= '{64{8'h00}};
end else if (phi0 & cs & ~RW_n) begin
	wreg[addr] <= d_in;
end

// "Strobe" registers have an immediate effect
always_comb begin
	{wsync,rsync,resp0,resp1,resm0,resm1,resbl,hmove,hmclr,cxclr} = '0;
	case(addr)
		WSYNC: wsync = 1;
		RSYNC: rsync = 1;
		RESP0: resp0 = 1;
		RESP1: resp1 = 1;
		RESM0: resm0 = 1;
		RESM1: resm1 = 1;
		RESBL: resbl = 1;
		HMOVE: hmove = 1;
		HMCLR: hmclr = 1;
		CXCLR: cxclr = 1;
	endcase
end

// WSYNC register controls the RDY signal to the CPU. It is cleared at the start of hblank.
always_ff @(posedge clk) begin
	reg old_hblank;
	old_hblank <= hblank;
	if (~old_hblank & hblank)
		rdy_latch <= 0;
end

// Calculate the collisions
always_ff @(posedge clk) if (phi0) begin
	wram[CXPM0P][7:6] <= {(m0 & p1), (m0 & m0)};
	wram[CXPM1P][7:6] <= {(m1 & p0), (m1 & p1)};
	wram[CXP0FB][7:6] <= {(p0 & pf), (p0 & bl)};
	wram[CXP1FB][7:6] <= {(p1 & pf), (p1 & bl)};
	wram[CXM0FB][7:6] <= {(m0 & pf), (m0 & bl)};
	wram[CXM1FB][7:6] <= {(m1 & pf), (m1 & bl)};
	wram[CXBLPF][7:6] <= {(bl & pf), 1'b0};
	wram[CXPPMM][7:6] <= {(p0 & p1), (m0 & m1)};
end

endmodule

