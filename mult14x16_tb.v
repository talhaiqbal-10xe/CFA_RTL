`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:11:52 08/10/2022
// Design Name:   mult14x16
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/mult14x16_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mult14x16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mult14x16_tb;

	// Inputs
	reg [13:0] A;
	reg [15:0] B;

	// Outputs
	wire [29:0] out1;
	wire [29:0] out2;

	// Instantiate the Unit Under Test (UUT)
	mult14x16 uut (
		.out1(out1), 
		.out2(out2), 
		.A(A), 
		.B(B)
	);

	reg [29:0] out_mat;
	wire [29:0] out;
	assign out = out1+out2;
	
   wire match;
   assign match= out==out_mat;	
   
	integer outfile0;
	
	initial begin
            outfile0=$fopen("multiplier_test.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d \n",
				                   A,B,out_mat); //scan each line and get the value as a decimal.
             
				 #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end

 
endmodule 


