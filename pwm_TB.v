//
//  pwm_TB.v
//  TestBench File for PWM Generator
//
//  Created  by Juan Diego Ocampo on 03/05/2018.
//  Copyright © 2018 Juan Diego Ocampo. All rights reserved.
//

`timescale 1ns / 1ns

module pwm_TB;
// Registers and Wires
	reg clk;
	reg rst;
	reg rd;
	reg wr;
	reg [31:0] din;
	reg [6:0] adrs;
	wire [31:0] dout;
	wire [7:0] pwmo;
	
	pwm uut( .clk(clk), .rst(rst), .rd(rd), .wr(wr), .din(din), .adrs(adrs), .dout(dout), .pwmo(pwmo));
	
// CLK Generator Module

	initial   clk <= 1;
	always #1 clk <= ~clk;

	initial begin
		
		wr = 1;
		din = 2;
		adrs = 7'h08;
		#2;
		din = 20;
		adrs = 7'h04;
		#2;
		din = 1;
		adrs = 7'h00;
		#2;
		
		din = 4;
		adrs = 7'h14;
		#2;
		din = 20;
		adrs = 7'h10;
		#2;
		din = 1;
		adrs = 7'h0c;
		#2;
		
		din = 2;
		adrs = 7'h20;
		#2;
		din = 20;
		adrs = 7'h1c;
		#2;
		din = 1;
		adrs = 7'h18;
		#2;
		
		din = 2;
		adrs = 7'h44;
		#2;
		din = 20;
		adrs = 7'h40;
		#2;
		din = 1;
		adrs = 7'h3c;
		#2;
		
		din = 2;
		adrs = 7'h5c;
		#2;
		din = 20;
		adrs = 7'h58;
		#2;
		din = 1;
		adrs = 7'h54;
		#2;
		
		wr = 0;
		rd = 1;
		adrs = 7'h04;
		#2;
		adrs = 7'h18;
		#2;
		adrs = 7'h5c;
		#2;
		adrs = 7'h00;
		#2;
		adrs = 7'h0;
	end

	initial begin: TEST_CASE
		$dumpfile("pwm_TB.vcd");
		$dumpvars(-1,uut);
		#(100000) $finish;
	end

endmodule