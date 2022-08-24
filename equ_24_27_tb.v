`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:42:34 08/09/2022
// Design Name:   equ_24_27
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_24_27_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_24_27
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_24_27_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] G_m1_m1;
	reg [11:0] G_m1_p1;
	reg [11:0] G_p1_m1;
	reg [11:0] G_p1_p1;
	reg [11:0] RB_m1_m1;
	reg [11:0] RB_m1_p1;
	reg [11:0] RB_p1_m1;
	reg [11:0] RB_p1_p1;

	// Outputs
	wire [14:0] out;

	// Instantiate the Unit Under Test (UUT)
	equ_24_27 uut (
		.clk(clk), 
		.rst(rst), 
		.G_m1_m1(G_m1_m1), 
		.G_m1_p1(G_m1_p1), 
		.G_p1_m1(G_p1_m1), 
		.G_p1_p1(G_p1_p1), 
		.RB_m1_m1(RB_m1_m1), 
		.RB_m1_p1(RB_m1_p1), 
		.RB_p1_m1(RB_p1_m1), 
		.RB_p1_p1(RB_p1_p1), 
		.out(out)
	);

	reg [14:0] out_mat;
   wire match;
   assign match= out==out_mat;	
   integer outfile0,green_sum,rb_sum,green_minus_rb,g_minus_rb_by_4;
	
	initial begin
          clk=0;
          rst=1;
			 #20
			 rst=0;
	       outfile0=$fopen("equ_24_27_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d \n",
				                   G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,
										 RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1,
										 out_mat); //scan each line and get the value as a decimal.
             green_sum=G_m1_m1+G_m1_p1+G_p1_m1+G_p1_p1;
				 rb_sum=RB_m1_m1+RB_m1_p1+RB_p1_m1+RB_p1_p1;
				 green_minus_rb=green_sum-rb_sum;
				 g_minus_rb_by_4=green_minus_rb/4;
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
