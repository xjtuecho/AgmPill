/**
 * power on reset
 * Author: Dong Xiao <echo.xjtu@gmail.com>
 */

module PowerOnReset (input iCLK, output reg oRESET);

	reg [19:0] cnt;

	initial begin
		cnt <= 20'h00000;
	end

	always @(posedge iCLK) begin
		if(cnt != 20'hFFFFF) begin
			cnt    <= cnt + 20'd1;
			oRESET <= 1'b0;
		end
		else
			oRESET <= 1'b1;
	end

endmodule