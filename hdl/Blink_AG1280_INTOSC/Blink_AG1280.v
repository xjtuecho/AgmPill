module Blink_AG1280(
	input CLK, 
	input CLK1,
	
	input  [2:1] KEY,
	output [2:1] LED,
	
	// Test Output
	output [2:0] CLKO,
	output BENCH_OUT
	);

	wire locked;
	wire nRst = KEY[2];
	wire CLK_24M, CLK_50M;
	PLL p0(
		.clkin(CLK1),
		.clkfb(CLK_24M),
		.pllen(1'b1),
		.resetn(1'b1),
		.clkout0en(1'b1),
		.clkout1en(1'b1),
		.clkout2en(1'b0),
		.clkout3en(1'b0),
		.clkout0(CLK_24M),
		.clkout1(CLK_50M),
		.clkout2(),
		.clkout3(),
		.lock(locked));

	wire CLK_1M, CLK_1k, CLK_1Hz;
	clkdivider #(.CNT_MAX(16'd50))    c0 (.clk(CLK_50M), .nRST(nRst), .clkout(CLK_1M));
	clkdivider #(.CNT_MAX(16'd1000))  c1 (.clk(CLK_1M),  .nRST(nRst), .clkout(CLK_1k));
	clkdivider #(.CNT_MAX(16'd1000))  c2 (.clk(CLK_1k),  .nRST(nRst), .clkout(CLK_1Hz));

	assign CLKO[0] = CLK_1M;
	assign CLKO[1] = CLK_1k;
	assign CLKO[2] = CLK_1Hz;
	assign BENCH_OUT = CLK_1M;
	
	assign LED[1] = CLK_1Hz;
	assign LED[2] = ~KEY[1];

endmodule
