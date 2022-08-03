`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:19:18 07/18/2022
// Design Name:   mean_calc
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/mean_calc_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mean_calc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mean_calc_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] r1;
	reg [15:0] r2;
	reg [15:0] r3;
	reg [15:0] r4;
	reg [15:0] r5;
	reg [15:0] c1;
	reg [15:0] c2;
	reg [15:0] c3;
	reg [15:0] c4;
	reg [15:0] c5;

	// Outputs
	wire [11:0] r1_mean;
	wire [11:0] r2_mean;
	wire [11:0] r3_mean;
	wire [11:0] r4_mean;
	wire [11:0] r5_mean;
	wire [11:0] c1_mean;
	wire [11:0] c2_mean;
	wire [11:0] c3_mean;
	wire [11:0] c4_mean;
	wire [11:0] c5_mean;
	wire [11:0] patch_mean;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	mean_calc uut (
		.clk(clk), 
		.rst(rst), 
		.r1(r1), 
		.r2(r2), 
		.r3(r3), 
		.r4(r4), 
		.r5(r5), 
		.c1(c1), 
		.c2(c2), 
		.c3(c3), 
		.c4(c4), 
		.c5(c5), 
		.r1_mean(r1_mean), 
		.r2_mean(r2_mean), 
		.r3_mean(r3_mean), 
		.r4_mean(r4_mean), 
		.r5_mean(r5_mean), 
		.c1_mean(c1_mean), 
		.c2_mean(c2_mean), 
		.c3_mean(c3_mean), 
		.c4_mean(c4_mean), 
		.c5_mean(c5_mean), 
		.patch_mean(patch_mean), 
		.ready(ready)
	);
wire patch_match,row_mean,column_mean;
assign patch_match = (r1_mean+r2_mean+r3_mean+r4_mean+r5_mean)/5 == patch_mean;
assign row_mean = r1/5 == r1_mean  & r2/5 == r2_mean & r3/5 == r3_mean & r4/5 == r4_mean & r5/5 == r5_mean;
assign column_mean = c1/5 == c1_mean  & c2/5 == c2_mean & c3/5 == c3_mean & c4/5 == c4_mean & c5/5 == c5_mean;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		r1 = 4095*5;
		r2 = 4095*5;
		r3 = 4095*5;
		r4 = 4095*5;
		r5 = 4095*5;
		c1 = 4095*5;
		c2 = 4095*5;
		c3 = 4095*5;
		c4 = 4095*5;
		c5 = 4095*5;

		// Wait 100 ns for global reset to finish
		#100;
		r1 = 4095*1;
		r2 = 4095*2;
		r3 = 4095*3;
		r4 = 4095*4;
		r5 = 4095*5;
		#100;
		r1 = 1234;
		r2 = 5678;
		r3 = 9101;
		r4 = 11213;
		r5 = 14151;
		#100;
		c1 = 6171;
		c2 = 8192;
		c3 = 02122;
		c4 = 2324;
		c5 = 6272;
		#100;
		c1 = 8293;
		c2 = 03132;
		c3 = 3334;
		c4 = 3536;
		c5 = 3738;
        
		// Add stimulus here

	end
      
endmodule

