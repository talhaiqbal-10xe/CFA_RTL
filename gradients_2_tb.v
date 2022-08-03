`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:39 07/15/2022
// Design Name:   gradients_2
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/gradients_2_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gradients_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gradients_2_tb;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [11:0] p_m2_m2;
	reg [11:0] p_m2_m1;
	reg [11:0] p_m2_p0;
	reg [11:0] p_m2_p1;
	reg [11:0] p_m2_p2;
	reg [11:0] p_m1_m2;
	reg [11:0] p_m1_m1;
	reg [11:0] p_m1_p0;
	reg [11:0] p_m1_p1;
	reg [11:0] p_m1_p2;
	reg [11:0] p_p0_m2;
	reg [11:0] p_p0_m1;
	reg [11:0] p_p0_p0;
	reg [11:0] p_p0_p1;
	reg [11:0] p_p0_p2;
	reg [11:0] p_p1_m2;
	reg [11:0] p_p1_m1;
	reg [11:0] p_p1_p0;
	reg [11:0] p_p1_p1;
	reg [11:0] p_p1_p2;
	reg [11:0] p_p2_m2;
	reg [11:0] p_p2_m1;
	reg [11:0] p_p2_p0;
	reg [11:0] p_p2_p1;
	reg [11:0] p_p2_p2;

	// Outputs
	wire [7:0] grad_hs;
	wire [7:0] grad_vs;
	wire [7:0] grad_hf;
	wire [7:0] grad_vf;
	wire [7:0] w_grad_hf;
	wire [7:0] w_grad_vf;

	// Instantiate the Unit Under Test (UUT)
	gradients_2 uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.p_m2_m2(p_m2_m2), 
		.p_m2_m1(p_m2_m1), 
		.p_m2_p0(p_m2_p0), 
		.p_m2_p1(p_m2_p1), 
		.p_m2_p2(p_m2_p2), 
		.p_m1_m2(p_m1_m2), 
		.p_m1_m1(p_m1_m1), 
		.p_m1_p0(p_m1_p0), 
		.p_m1_p1(p_m1_p1), 
		.p_m1_p2(p_m1_p2), 
		.p_p0_m2(p_p0_m2), 
		.p_p0_m1(p_p0_m1), 
		.p_p0_p0(p_p0_p0), 
		.p_p0_p1(p_p0_p1), 
		.p_p0_p2(p_p0_p2), 
		.p_p1_m2(p_p1_m2), 
		.p_p1_m1(p_p1_m1), 
		.p_p1_p0(p_p1_p0), 
		.p_p1_p1(p_p1_p1), 
		.p_p1_p2(p_p1_p2), 
		.p_p2_m2(p_p2_m2), 
		.p_p2_m1(p_p2_m1), 
		.p_p2_p0(p_p2_p0), 
		.p_p2_p1(p_p2_p1), 
		.p_p2_p2(p_p2_p2), 
		.grad_hs(grad_hs), 
		.grad_vs(grad_vs), 
		.grad_hf(grad_hf), 
		.grad_vf(grad_vf), 
		.w_grad_hf(w_grad_hf), 
		.w_grad_vf(w_grad_vf)
	);

	reg [7:0] grad_hs_matlab,grad_vs_matlab;  
   integer outfile0;

	initial begin
            clk=0;
				rst=1;
				#20
				rst=0;	
	         outfile0=$fopen("equ_4_5.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
										 p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
										 p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
										 p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
										 p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,
										 grad_hs_matlab,grad_vs_matlab); //scan each line and get the value as a decimal.
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

