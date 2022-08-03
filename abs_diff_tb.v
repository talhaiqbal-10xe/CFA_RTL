`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:40 07/24/2022
// Design Name:   abs_diff
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/abs_diff_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: abs_diff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module abs_diff_tb;

	// Inputs
	reg [13:0] green_h;
	reg [13:0] green_v;

	// Outputs
	wire [12:0] absolute_diff;

	// Instantiate the Unit Under Test (UUT)
	abs_diff uut (
		.absolute_diff(absolute_diff), 
		.green_h(green_h), 
		.green_v(green_v)
	);

	reg [12:0] out_mat;
	wire match;
	assign match= out_mat==absolute_diff;
	integer outfile0,i;  
	initial begin
            
				i=0;
				#20
				outfile0=$fopen("diff_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d \n",
				                   green_h,green_v,out_mat); //scan each line and get the value as a decimal.
             i=i+1;
				 #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
   
endmodule

