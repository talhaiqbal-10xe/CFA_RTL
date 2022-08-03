`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:48 07/23/2022
// Design Name:   green_h_v
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/green_h_v_tb.v
// Project Name:  convolution_2
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

module green_h_v_tb;

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
   
	reg [13:0] out_mat;
	wire match;
	assign match= out_mat==out;
	integer outfile0,i; 
	initial begin
            clk=0;
				rst=1;
				i=0;
				#20
				rst=0;	
	         outfile0=$fopen("green_h_v_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d \n",
				                   m2,m1,c,p1,p2,out_mat); //scan each line and get the value as a decimal.
             i=i+1;
				 #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
always #10 
begin 
clk=~clk;
end        
endmodule


