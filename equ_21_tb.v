`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:01 08/22/2022
// Design Name:   green_s_f
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_21_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: green_s_f
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_21_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] h;
	reg [7:0] v;
	reg [7:0] threshold;
	reg [12:0] Gh;
	reg [12:0] Gv;

	// Outputs
	wire [12:0] green;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	green_s_f #(12,8,0) uut  (
		.clk(clk), 
		.rst(rst), 
		.h(h), 
		.v(v), 
		.threshold(threshold), 
		.Gh(Gh), 
		.Gv(Gv), 
		.green(green), 
		.ready(ready)
	);

	wire match;
	reg [12:0] out_mat; 
	assign match = out_mat == green;
	 
   integer outfile0;

	initial begin 
	       outfile0=$fopen("equ_21_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d \n",
				                   h,v,Gh,Gv,threshold,out_mat); //scan each line and get the value as a decimal.
             #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
	
      
endmodule 