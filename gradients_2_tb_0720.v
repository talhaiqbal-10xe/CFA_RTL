`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:47 07/20/2022
// Design Name:   gradients_2
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/gradients_2_tb_0720.v
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

module gradients_2_tb_0720;

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

	reg [7:0] grad_hs_mat,grad_vs_mat,grad_hf_mat,grad_vf_mat,w_grad_hf_mat,w_grad_vf_mat; 
   
	wire hs_match,vs_match,hf_match,vf_match,w_hf_match,w_vf_match;
   
	assign hs_match = grad_hs_mat == grad_hs;
	assign vs_match = grad_vs_mat == grad_vs;
	assign hf_match = grad_hf_mat == grad_hf;
  	assign vf_match = grad_vf_mat == grad_vf;
	assign w_hf_match=w_grad_hf_mat == w_grad_hf;
	assign w_vf_match=w_grad_vf_mat == w_grad_vf;
	
	reg [11:0] r1_mat;
	reg [11:0] r2_mat;
	reg [11:0] r3_mat;
	reg [11:0] r4_mat;
	reg [11:0] r5_mat;
	reg [11:0] c1_mat;
	reg [11:0] c2_mat;
	reg [11:0] c3_mat;
	reg [11:0] c4_mat;
	reg [11:0] c5_mat;
	reg [11:0] patch_mat;
	
   integer outfile0,i; 
	initial begin
            clk=0;
				rst=1;
				i=0;
				#20
				rst=0;	
	         outfile0=$fopen("patchesAndOutputs2.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
		 								 p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
										 p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
										 p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
										 p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,
										 grad_hs_mat,grad_vs_mat,
										 patch_mat,
										 r1_mat,c1_mat,r2_mat,c2_mat,r3_mat,c3_mat,r4_mat,c4_mat,r5_mat,c5_mat,
										 grad_hf_mat,grad_vf_mat,w_grad_hf_mat,w_grad_vf_mat); //scan each line and get the value as a decimal.
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


// inputs and gradients

//integer outfile0,i; 
//	initial begin
//            clk=0;
//				rst=1;
//				i=0;
//				#20
//				rst=0;	
//	         outfile0=$fopen("patchesAndOutputs.txt","r");
//		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
//            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n",
//				                   p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
//		 								 p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
//										 p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
//										 p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
//										 p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,
//										 grad_hs_matlab,grad_vs_matlab,grad_hf_matlab,grad_vf_matlab,w_grad_hf_matlab,w_grad_vf_matlab); //scan each line and get the value as a decimal.
//             i=i+1;
//				 #20; //wait some time as needed.
//             end 
//          //once reading and writing is finished, close the file.
//          $fclose(outfile0);
//           end