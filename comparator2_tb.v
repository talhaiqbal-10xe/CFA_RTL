`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:25:38 07/20/2022
// Design Name:   comparator_2
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/comparator2_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparator_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comparator2_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] blend_th0;
	reg [7:0] blend_th1;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	comparator_2 uut (
		.a(a), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		blend_th0 = 10;
		blend_th1 = 240;

		// Wait 100 ns for global reset to finish
		#100;
      a = 15;
		#100;
      a = 100;
		#100;
      a = 120;
		#100;
      a = 220;
		#100;
      a = 240;
		#100;
      a = 241;
		#100;
      a = 250;
		
		
		// Add stimulus here

	end
      
endmodule

