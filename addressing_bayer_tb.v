`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:54:47 09/04/2022
// Design Name:   addressing_bayer
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/addressing_bayer_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: addressing_bayer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module addressing_bayer_tb;

	// Inputs
	reg clk;
	reg rst;
	reg start; 
	reg [10:0] rowMax;
	reg [10:0] colMax;
	reg en;
	reg [1:0] patternSelect;

	// Outputs
	wire [21:0] address;
	wire addressValid;
	wire ready;
	wire done;
	wire bufferEnable;
	wire rowUpdateFlag;
	wire colUpdateFlag;
	wire [10:0] row;
	wire [10:0] col;
	wire [1:0] bayerSymbol;

	// Instantiate the Unit Under Test (UUT)
	addressing_bayer uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.en(en), 
		.address(address), 
		.patternSelect(patternSelect), 
		.addressValid(addressValid), 
		.ready(ready),
      .done(done),
      .bufferEnable(bufferEnable),		
		.rowUpdateFlag(rowUpdateFlag), 
		.colUpdateFlag(colUpdateFlag), 
		.row(row), 
		.col(col), 
		.bayerSymbol(bayerSymbol)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1; 
		start = 1;
		rowMax = 11'd7;
		colMax = 11'd7;
		patternSelect=2'b11;
		en = 1;

		// Wait 100 ns for global reset to finish
		#20;
		rst=0;
		#20
		start =0;
		
        
		// Add stimulus here

	end

always #10
begin
clk=~clk;
end

      
endmodule

