`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:08 08/24/2022
// Design Name:   green_final
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_23_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: green_final
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_23_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] w_s;
	reg [7:0] w_f;
	reg [12:0] green_s;
	reg [12:0] green_f;

	// Outputs
	wire [11:0] green;

	// Instantiate the Unit Under Test (UUT)
	green_final uut (
		.clk(clk), 
		.rst(rst), 
		.w_s(w_s), 
		.w_f(w_f), 
		.green_s(green_s), 
		.green_f(green_f), 
		.green(green)
	);

	wire match;
	reg [11:0] out_mat; 
	assign match = out_mat == green;
	 
   integer outfile0;

	initial begin 
	       outfile0=$fopen("equ_23_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d \n",
				                   w_s,w_f,green_s,green_f,out_mat); //scan each line and get the value as a decimal.
             #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
	
      
endmodule  
