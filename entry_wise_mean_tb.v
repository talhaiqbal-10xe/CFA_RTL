`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:31:29 07/18/2022
// Design Name:   entry_wise_mean
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/entry_wise_mean_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: entry_wise_mean
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module entry_wise_mean_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] e1;
	reg [15:0] e2;
	reg [15:0] e3;
	reg [15:0] e4;
	reg [15:0] e5;

	// Outputs
	wire [11:0] mean_e1;
	wire [11:0] mean_e2;
	wire [11:0] mean_e3;
	wire [11:0] mean_e4;
	wire [11:0] mean_e5;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	entry_wise_mean uut (
		.clk(clk), 
		.rst(rst), 
		.e1(e1), 
		.e2(e2), 
		.e3(e3), 
		.e4(e4), 
		.e5(e5), 
		.mean_e1(mean_e1), 
		.mean_e2(mean_e2), 
		.mean_e3(mean_e3), 
		.mean_e4(mean_e4), 
		.mean_e5(mean_e5), 
		.ready(ready)
	);
wire t1,t2,t3,t4,t5;
assign t1 = e1/5==mean_e1;
assign t2 = e2/5==mean_e2;
assign t3 = e3/5==mean_e3;
assign t4 = e4/5==mean_e4;
assign t5 = e5/5==mean_e5;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		e1 = 4095;
		e2 = 4095*5;
		e3 = 4520;
		e4 = 7568;
		e5 = 4832;

		// Wait 100 ns for global reset to finish
		#100;
		e1 = 9685;
		e2 = 75142;
		e3 = 15986;
		e4 = 0;
		e5 = 2345;
        
		// Add stimulus here

	end
      
endmodule

