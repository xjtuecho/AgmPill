/**
 * clkout = clk/CNT_MAX
 * CNT_MAX is even number.
 * Author: Dong Xiao <echo.xjtu@gmail.com>
 */

`timescale 1 ns/ 1 ns

module clkdivider #( parameter CNT_MAX = 16'd2 )
(
	input clk,
	input nRST,
	output reg clkout
);
	reg [15:0] cnt;
	
	always @( posedge clk, negedge nRST ) begin
		if( !nRST ) begin
			cnt <= 16'd0;
			clkout <= 1'b0;
		end else begin
			if ( cnt < CNT_MAX/2-1 ) begin
				cnt <= cnt + 16'd1;
			end else begin
				cnt <= 16'd0;
				clkout <= ~clkout;
			end
		end
	end

endmodule