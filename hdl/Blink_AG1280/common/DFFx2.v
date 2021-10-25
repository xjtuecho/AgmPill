/**
 * Author: Dong Xiao <echo.xjtu@gmail.com> 2012.10.30
 */

module DFFx2
(
	input clk,
	input nRst,
	input D,
	output Q
);
	reg D1, D2;
	assign Q = D2;

	always @ ( posedge clk, negedge nRst ) begin
		if(!nRst) begin
			D1 <= 1'b0;
			D2 <= 1'b0;
		end
		else begin
			D1 <= D;
			D2 <= D1;
		end
	end

endmodule