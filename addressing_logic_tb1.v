`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:39:18 09/01/2022
// Design Name:   addressing_logic
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/addressing_logic_tb1.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: addressing_logic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module addressing_logic_tb1;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [10:0] rowMax;
	reg [10:0] colMax;
	reg en;

	// Outputs
	wire [21:0] address;
	wire addressValid;
	wire ready;
	wire rowUpdateFlag;
	wire colUpdateFlag;
	wire [10:0] row;
	wire [10:0] col;

	// Instantiate the Unit Under Test (UUT)
	addressing_logic uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.en(en), 
		.address(address), 
		.addressValid(addressValid), 
		.ready(ready), 
		.rowUpdateFlag(rowUpdateFlag), 
		.colUpdateFlag(colUpdateFlag), 
		.row(row), 
		.col(col)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1; 
		start = 1;
		rowMax = 11'd7;
		colMax = 11'd7;
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

