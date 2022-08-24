`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:45:14 08/22/2022
// Design Name:   w_intrp_s_f
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_19_20_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: w_intrp_s_f
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_19_20_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [12:0] diff;
	reg [8:0] blend_th0;
	reg [8:0] blend_th1;

	// Outputs
	wire [7:0] w_s;
	wire [7:0] w_f;

	// Instantiate the Unit Under Test (UUT)
	w_intrp_s_f uut (
		.clk(clk), 
		.rst(rst), 
		.diff(diff), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.w_s(w_s), 
		.w_f(w_f)
	);

      
		
	wire match;
	reg [7:0] w_s_mat,w_f_mat; 
	assign match = w_s_mat == w_s && w_f_mat == w_f ;
	 
   integer outfile0;

	initial begin 
	       outfile0=$fopen("equ_19_20_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d \n",
				                   diff,blend_th0,blend_th1,w_s_mat,w_f_mat); //scan each line and get the value as a decimal.
             #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
	
      
endmodule
