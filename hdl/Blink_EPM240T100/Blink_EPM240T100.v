module Blink_EPM240T100 (
	input CLK,

	input  RXD,
	output TXD,
	
	input NCS,
	input SCK,
	input SI,
	output SO,
	
	input [2:1] KEY,
	
	output [2:0] CLKO,
	output [4:1] LED
);

	wire nRst;
	PowerOnReset por0(.iCLK(CLK), .oRESET(nRst));
	
	wire CLK_UFM, CLK_1M, CLK_1K, CLK_1Hz;
	clkdivider #(.CNT_MAX(16'd24))   c0 (.clk(CLK),    .nRST(nRst), .clkout(CLK_1M));
	clkdivider #(.CNT_MAX(16'd1000)) c1 (.clk(CLK_1M), .nRST(nRst), .clkout(CLK_1K));
	clkdivider #(.CNT_MAX(16'd1000)) c2 (.clk(CLK_1K), .nRST(nRst), .clkout(CLK_1Hz));

	// two key
	wire [2:1] key_o;
	debouncer d1(.clk(CLK), .rst_n(nRst), .key_i(KEY[1]), .key_o(key_o[1]));
	debouncer d2(.clk(CLK), .rst_n(nRst), .key_i(KEY[2]), .key_o(key_o[2]));

	reg  [7:0] ctrl, TX_Byte;
	reg  TX_DV;
	wire [7:0] RX_Byte;
	wire RX_DV, TX_Active;

	// 24e6/208 = 115384.6
	UART_RX #(.CLKS_PER_BIT(208)) r0(
		.i_Rst_L(nRst),
		.i_Clock(CLK),
		.i_RX_Serial(RXD),
		.o_RX_DV(RX_DV),
		.o_RX_Byte(RX_Byte)
	);
	UART_TX #(.CLKS_PER_BIT(208)) t0(
		.i_Rst_L(nRst),
		.i_Clock(CLK),
		.i_TX_DV(TX_DV),
		.i_TX_Byte(TX_Byte),
		.o_TX_Active(TX_Active),
		.o_TX_Serial(TXD),
		.o_TX_Done(TX_Done)
	);

	always @(posedge CLK, negedge nRst) begin
		if(~nRst) begin
			ctrl <= 8'h00;
			TX_Byte <= 8'h00;
			TX_DV <= 1'b0;
		end
		else begin
			if (RX_DV) begin
				ctrl <= RX_Byte;
				TX_Byte <= {2'b00, key_o[2:1], RX_Byte[3:0]};
				TX_DV <= 1'b1;
			end
			else if(TX_Done) begin
				TX_DV <= 1'b0;
			end
		end
	end

	assign CLKO[2] = TX_Active;
	assign CLKO[1] = ctrl[5];
	assign CLKO[0] = ctrl[4];
	
	assign LED[4]  = CLK_1Hz;
	assign LED[3]  = ~CLK_1Hz;
	assign LED[2]  = ctrl[1];
	assign LED[1]  = ctrl[0];

endmodule
