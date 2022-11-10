/**
 * Author: Dong Xiao <echo.xjtu@gmail.com> 2012.04.21
 */

module debouncer #( parameter SAMPLE = 8'd30 )
(
	input clk,
	input rst_n,
	input key_i,
	output reg key_o
);
	parameter IDLE = 3'b001;
	parameter JUGH = 3'b010;
	parameter JUGL = 3'b100;
	reg  key;
	reg [7:0] cnt;
	reg [2:0] state;

	always @ ( posedge clk, negedge rst_n ) begin
		if(!rst_n) begin
			key <= 1'b0;
		end
		else begin
			key <= key_i;
		end
	end

	always @ ( posedge clk, negedge rst_n ) begin
		if(!rst_n) begin
			state <= IDLE;
			key_o <= 1'b0;
		end
		else begin
			case (state)
			IDLE: begin
				cnt <= 8'd0;
				if(key == 1'b0 && key_i == 1'b1) begin
					state <= JUGH;
				end
				else if(key == 1'b1 && key_i == 1'b0) begin
					state <= JUGL;
				end
				else begin
					state <= IDLE;
				end
			end
			JUGH: begin
				if(key_i == 1'b1) begin
					cnt <= cnt + 1'b1;
					if(cnt < SAMPLE) begin
						state <= JUGH;
					end
					else begin
						state <= IDLE;
						key_o <= key;
					end
				end
				else begin
					cnt <= 8'd0;
					state <= IDLE;
				end
			end
			JUGL: begin
				if(key_i == 1'b0) begin
					cnt <= cnt + 1'b1;
					if(cnt < SAMPLE) begin
						state <= JUGL;
					end
					else begin
						state <= IDLE;
						key_o <= key;
					end
				end
				else begin
					cnt <= 8'd0;
					state <= IDLE;
				end
			end
			default:;
			endcase
		end
	end

endmodule