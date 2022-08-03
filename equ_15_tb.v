`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:33 07/20/2022
// Design Name:   equ_15
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/equ_15_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_15
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_15_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] blend_th0;
	reg [7:0] blend_th1;
	reg [7:0] grad_f;

	// Outputs
	wire [7:0] w_grad_f;

	// Instantiate the Unit Under Test (UUT)
	equ_15 uut (
		.clk(clk), 
		.rst(rst), 
		.grad_f(grad_f),
      .blend_th0(blend_th0),
      .blend_th1(blend_th1),		
		.w_grad_f(w_grad_f)
	);
   integer i;
	wire test;
	wire [9:0] true_value;
	assign true_value = (((grad_f >blend_th1 ? blend_th1:grad_f)*255)/blend_th1);
	assign test = (((grad_f >blend_th1 ? blend_th1:grad_f)*255)/blend_th1)==w_grad_f;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		blend_th0=8'b0000_0000;
		blend_th1=8'b1000_0000;
		grad_f = 0;

		// Wait 100 ns for global reset to finish
		#100;
      for (i=0;i<=256;i=i+1)
      begin
		grad_f = i;
      #50;
      end		
		// Add stimulus here

	end
      
endmodule

