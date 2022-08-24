`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:15:32 08/22/2022
// Design Name:   green_h_v
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_16_17_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: green_h_v
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_16_17_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] m2;
	reg [11:0] m1;
	reg [11:0] c;
	reg [11:0] p1;
	reg [11:0] p2;

	// Outputs
	wire [13:0] out;

	// Instantiate the Unit Under Test (UUT)
	green_h_v uut (
		.clk(clk), 
		.rst(rst), 
		.m2(m2), 
		.m1(m1), 
		.c(c), 
		.p1(p1), 
		.p2(p2), 
		.out(out)
	);
   wire match;
	assign match = out == out_mat;
	reg [13:0] out_mat;  
integer outfile0;

	initial begin 
	       outfile0=$fopen("equ_16_17_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d \n",
				                   m2,m1,c,p1,p2,out_mat); //scan each line and get the value as a decimal.
             #50; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
	
      
endmodule


