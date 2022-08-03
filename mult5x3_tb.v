`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:12 07/28/2022
// Design Name:   mult5x3
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/mult5x3_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mult5x3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mult5x3_tb;

	// Inputs
	reg [4:0] A;
	reg [2:0] B;

	// Outputs
	wire [7:0] out1;
	wire [7:0] out2;

	// Instantiate the Unit Under Test (UUT)
	mult5x3 uut (
		.out1(out1), 
		.out2(out2), 
		.A(A), 
		.B(B)
	);
   wire [7:0] out;
	assign out = out1+out2;
	initial begin
		// Initialize Inputs
		A = 17;
		B = 3;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

