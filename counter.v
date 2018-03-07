//
//  counter.v
//  Counter Module
//
//  Created  by Juan Diego Ocampo on 03/05/2018.
//  Copyright © 2018 Juan Diego Ocampo. All rights reserved.
//

module counter(clk,period,duty,state,en); // Period nad DutyCycle are given in ms.
// Inputs and Outputs
	input clk;
	input en;
	input [31:0] period;
	input [31:0] duty;
	output reg state;
// Registers
reg [5:0] contusec = 0;
reg [14:0] contmsec = 0;
reg [4:0] periodf = 0;
reg [4:0] dutyf = 0;

	always @(posedge clk) begin
		if(en == 1)begin
			if(contusec == 50) begin // Counter registers 50 CLK Cycles, which equals to 1us (for a 50 MHz CLK).
				contusec = 0;
				if(contmsec >= period-1) begin // Period is registered in ms.
					contmsec = 0;
				end else begin
					contmsec = contmsec + 1;
				end
			end else begin
				contusec = contusec + 1;
			end
		end
	end

	always @(posedge clk) begin
		if(en == 1)begin
			if(contmsec <= duty-1)begin
				state = 1;
			end else begin
				state = 0;
			end
		end
	end

/*
	always @(posedge clk) begin

		if(en == 1)begin
			dutyf = duty;
			periodf = period;
		end
	end
*/

endmodule