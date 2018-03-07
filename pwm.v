// HOLA MUNDO
//  pwm.v
//  Top level Verilog code for PWM Generator
// Hi
//  Created  by Juan Diego Ocampo on 03/05/2018.
//  Copyright © 2018 Juan Diego Ocampo. All rights reserved.
//

`timescale 1ms / 1ns

module pwm(clk,rst,rd,wr,din,adrs,dout,pwmo);
// Inputs and Outputs
	input clk;
	input rst;
	input rd;
	input wr;
	input [31:00] din;
	input [6:0] adrs;
	output reg [31:00] dout;
	output [7:0] pwmo;
// Registers
reg [31:00] dinf;
reg [31:00] period0;
reg [31:00] period1;
reg [31:00] period2;
reg [31:00] period3;
reg [31:00] period4;
reg [31:00] period5;
reg [31:00] period6;
reg [31:00] period7;
reg [31:00] duty0;
reg [31:00] duty1;
reg [31:00] duty2;
reg [31:00] duty3;
reg [31:00] duty4;
reg [31:00] duty5;
reg [31:00] duty6;
reg [31:00] duty7;
reg en0;
reg en1;
reg en2;
reg en3;
reg en4;
reg en5;
reg en6;
reg en7;

/* Counter */

counter pwm0(.clk(clk), .period(period0), .duty(duty0), .state(pwmo[0]), .en(en0));
counter pwm1(.clk(clk), .period(period1), .duty(duty1), .state(pwmo[1]), .en(en1));
counter pwm2(.clk(clk), .period(period2), .duty(duty2), .state(pwmo[2]), .en(en2));
counter pwm3(.clk(clk), .period(period3), .duty(duty3), .state(pwmo[3]), .en(en3));
counter pwm4(.clk(clk), .period(period4), .duty(duty4), .state(pwmo[4]), .en(en4));
counter pwm5(.clk(clk), .period(period5), .duty(duty5), .state(pwmo[5]), .en(en5));
counter pwm6(.clk(clk), .period(period6), .duty(duty6), .state(pwmo[6]), .en(en6));
counter pwm7(.clk(clk), .period(period7), .duty(duty7), .state(pwmo[7]), .en(en7));

	always @(posedge clk) begin
		if(wr == 1) begin
			dinf = din;
			case(adrs)
				7'h00: en0 = dinf;
				7'h04: period0 = dinf;
				7'h08: duty0 = dinf;

				7'h0c: en1 = dinf;
				7'h10: period1 = dinf;
				7'h14: duty1 = dinf;
				
				7'h18: en2 = dinf;
				7'h1c: period2 = dinf;
				7'h20: duty2 = dinf;
				
				7'h24: en3 = dinf;
				7'h28: period3 = dinf;
				7'h2c: duty3 = dinf;
				
				7'h30: en4 = dinf;
				7'h34: period4 = dinf;
				7'h38: duty4 = dinf;
				
				7'h3c: en5 = dinf;
				7'h40: period5 = dinf;
				7'h44: duty5 = dinf;
				
				7'h48: en6 = dinf;
				7'h4c: period6 = dinf;
				7'h50: duty6 = dinf;
				
				7'h54: en7 = dinf;
				7'h58: period7 = dinf;
				7'h5c: duty7 = dinf;			
			default
				dinf = din;	
			endcase
		end
		
		if(rd == 1) begin
			case(adrs)
				6'h00: dout = en0;
				6'h04: dout = period0;
				6'h08: dout = duty0;
				
				6'h0c: dout = en1;
				6'h10: dout = period1;
				6'h14: dout = duty1;
				
				6'h18: dout = en2;
				6'h1c: dout = period2;
				6'h20: dout = duty2;
				
				6'h24: dout = en3;
				6'h28: dout = period3;
				6'h2c: dout = duty3;
				
				6'h30: dout = en4;
				6'h34: dout = period4;
				6'h38: dout = duty4;
				
				6'h3c: dout = en5;
				6'h40: dout = period5;
				6'h44: dout = duty5;
				
				6'h48: dout = en6;
				6'h4c: dout = period6;
				6'h50: dout = duty6;
				
				6'h54: dout = en7;
				6'h58: dout = period7;
				6'h5c: dout = duty7;
			default
				dinf = din;	
			endcase
		end
	end

endmodule