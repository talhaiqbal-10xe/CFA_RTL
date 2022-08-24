`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:15 07/27/2022
// Design Name:   mult13x8
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/multiplier13x8_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mult13x8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiplier13x8_tb;

	// Inputs
	reg [12:0] A;
	reg [7:0] B;

	// Outputs
	wire [20:0] out1;
	wire [20:0] out2;

	// Instantiate the Unit Under Test (UUT)
	mult13x8 uut ( 
		.out1(out1), 
		.out2(out2), 
		.A(A), 
		.B(B)
	);
   wire [20:0] out_verilog;
	assign out_verilog=out1+out2;
	reg [20:0] out_mat; 
	wire match;
	assign match= out_mat==out_verilog;
	integer outfile0,i;  
	initial begin
            
				i=0;
				#20
				outfile0=$fopen("mult13x8_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d \n",
				                   B,A,out_mat); //scan each line and get the value as a decimal.
             i=i+1;
				 #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
   
endmodule