`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:37:18 09/13/2022
// Design Name:   CFA_1
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL - Copy/CFA_1_tb2.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CFA_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define clockCycle 20
`define row 70
`define col 70

module CFA_1_tb2
#(parameter halfCycle = `clockCycle/2,parameter imageProcessTime = `row * `col *6,
  parameter fullCycle = `clockCycle)
;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [10:0] rowMax;
	reg [10:0] colMax;
	reg [11:0] raw;
	reg [11:0] greenRead;
	reg [11:0] redRead;
	reg [11:0] blueRead;
	reg [7:0] grad_th0;
	reg [7:0] grad_th1;
	reg [7:0] intrp_th0;
	reg [7:0] intrp_th1;
	reg [8:0] blend_th0;
	reg [8:0] blend_th1;
	reg [1:0] patternSelect;

	// Outputs
	wire rowUpdate;
	wire colUpdate;
	wire [16:0] readAddress;
	wire [16:0] writeAddress;
	wire [2:0] writeEnable;
	wire [11:0] greenWrite;
	wire [11:0] redWrite;
	wire [11:0] blueWrite;

	// Instantiate the Unit Under Test (UUT)
	CFA_1 uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.raw(raw), 
		.greenRead(greenRead), 
		.redRead(redRead), 
		.blueRead(blueRead), 
		.grad_th0(grad_th0), 
		.grad_th1(grad_th1), 
		.intrp_th0(intrp_th0), 
		.intrp_th1(intrp_th1), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.patternSelect(patternSelect), 
		.rowUpdate(rowUpdate), 
		.colUpdate(colUpdate), 
		.readAddress(readAddress), 
		.writeAddress(writeAddress), 
		.writeEnable(writeEnable), 
		.greenWrite(greenWrite), 
		.redWrite(redWrite), 
		.blueWrite(blueWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		start = 0;
		rowMax = 69;
		colMax = 69;
		raw = 0;
		greenRead = 0;
		redRead = 0;
		blueRead = 0;
		grad_th0 = 0;
		grad_th1 = 0;
		intrp_th0 = 0;
		intrp_th1 = 0;
		blend_th0 = 0;
		blend_th1 = 0;
		patternSelect = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

