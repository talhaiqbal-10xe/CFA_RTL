`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:58 08/01/2022
// Design Name:   buffer_2d_v3
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/buffer_2d_v3_tb2.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer_2d_v3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buffer_2d_v3_tb2;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg [23:0] d_in;

	// Outputs
	wire [215:0] buffer_data;
	wire [7:0] RB_interpolation;

	// Instantiate the Unit Under Test (UUT)
	buffer_2d_v3 uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.d_in(d_in), 
		.buffer_data(buffer_data), 
		.RB_interpolation(RB_interpolation)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		en = 0;
		d_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

