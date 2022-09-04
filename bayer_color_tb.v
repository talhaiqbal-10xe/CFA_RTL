`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:42 09/02/2022
// Design Name:   bayer_color
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/bayer_color_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bayer_color
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bayer_color_tb;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [1:0] patternSelect;
	reg rowUpdate;
	reg colUpdate;

	// Outputs
	wire [1:0] bayerSymbol;

	// Instantiate the Unit Under Test (UUT)
	bayer_color uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.patternSelect(patternSelect), 
		.rowUpdate(rowUpdate), 
		.colUpdate(colUpdate), 
		.bayerSymbol(bayerSymbol)
	);
integer i,j;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1; 
		start = 1;
		patternSelect = 0;
		rowUpdate = 0;
		colUpdate = 0;
		#20;
		rst=0;
		#20
		start =0;
		#10
		i=0;
		j=0;
		while(i<=7)
		      begin
				while(j<=7)
				      begin
						colUpdate = ~colUpdate;
						if (j==7)
						    rowUpdate = 1'b1;
						j=j+1;
						#20;
						end
				rowUpdate = 1'b0;
				i=i+1;
				j=0;
				#20;
				end
				
				
				

	   end

always #10
begin
clk=~clk;
end
      
endmodule

