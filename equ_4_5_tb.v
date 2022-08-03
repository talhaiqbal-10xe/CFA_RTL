`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:59:31 07/14/2022
// Design Name:   equ_4_5
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/equ_4_5_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_4_5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_4_5_tb;

	// Inputs
	reg clk;
	reg rst;
	reg strat;
	reg [15:0] grad_hs;
	reg [15:0] grad_vs;

	// Outputs
	wire [7:0] scaled_hs;
	wire [7:0] scaled_vs;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	equ_4_5 uut (
		.clk(clk), 
		.rst(rst), 
		.strat(strat), 
		.grad_hs(grad_hs), 
		.grad_vs(grad_vs), 
		.scaled_hs(scaled_hs), 
		.scaled_vs(scaled_vs), 
		.ready(ready)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		strat = 0;
		grad_hs = 0;
		grad_vs = 0;

		// Wait 100 ns for global reset to finish
		#100;
		grad_hs = 1;
		grad_vs = 0;
		
		#100;
		grad_hs = 150;
		grad_vs = 150;
		
		#100;
		grad_hs = 3000;
		grad_vs = 4500;
		
		
        
		// Add stimulus here

	end
      
endmodule

