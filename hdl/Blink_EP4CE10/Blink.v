// MegaPill
module Blink (
	input CLK,				// 24M Input CLK

	input  [2:1] KEY,		// Active Low
	output [2:1] LED,		// Active Low

	// SPI FLASH
	output M25_CLK,
	output M25_NCS,
	output M25_DO,
	input  M25_DI,

	// UART Port
	input  UART_RTS,
	input  UART_RX,
	output UART_TX,

	// Test Output
	output [2:0] CLKO
);
	wire inclk = CLK;
	reg [5:0] reset_init = 6'b0 /* synthesis syn_preserve = 1*/;
	wire init = reset_init[5];
	always @ (posedge inclk) begin
		if (!init) begin
			reset_init <= reset_init + 1'b1;
		end
	end

	wire PLL_Locked;
	wire nRst = PLL_Locked;
	wire CLK_40M, CLK_1M, CLK_1k, CLK_1Hz;
	wire [2:1] KEYF;
	PLL p0(
		.areset(!init),
		.inclk0(CLK),
		.c0(CLK_40M),
		.c1(),
		.locked(PLL_Locked));

	clkdivider #(.CNT_MAX(16'd40))    c0 (.clk(CLK_40M), .nRST(nRst), .clkout(CLK_1M));
	clkdivider #(.CNT_MAX(16'd1000))  c1 (.clk(CLK_1M),  .nRST(nRst), .clkout(CLK_1k));
	clkdivider #(.CNT_MAX(16'd1000))  c2 (.clk(CLK_1k),  .nRST(nRst), .clkout(CLK_1Hz));
	
	assign CLKO[0] = CLK_1M;
	assign CLKO[1] = CLK_1k;
	assign CLKO[2] = CLK_1Hz;

	assign LED[1]  =  CLK_1Hz & KEYF[1];
	assign LED[2]  = ~CLK_1Hz & KEYF[2];
	
	// ECHO UART data
	assign UART_TX = UART_RX;
	
	DFFx2 d1(.clk(CLK_40M), .nRst(nRst), .D(KEY[1]), .Q(KEYF[1]));
	DFFx2 d2(.clk(CLK_40M), .nRst(nRst), .D(KEY[2]), .Q(KEYF[2]));

endmodule
