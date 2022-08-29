`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:43:25 08/24/2022
// Design Name:   green_interpolation
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/green_interpolation_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: green_interpolation
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module green_interpolation_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] p_m2_p0;
	reg [11:0] p_m1_p0;
	reg [11:0] p_p0_m2;
	reg [11:0] p_p0_m1;
	reg [11:0] p_p0_p0;
	reg [11:0] p_p0_p1;
	reg [11:0] p_p0_p2;
	reg [11:0] p_p1_p0;
	reg [11:0] p_p2_p0;
	reg [7:0] scaled_hs;
	reg [7:0] scaled_vs;
	reg [7:0] w_grad_hf;
	reg [7:0] w_grad_vf;
	reg [7:0] spatial_th;
	reg [7:0] freq_th;
	reg [8:0] blend_th0;
	reg [8:0] blend_th1;

	// Outputs
	wire [11:0] green;

	// Instantiate the Unit Under Test (UUT)
	green_interpolation uut (
		.clk(clk), 
		.rst(rst), 
		.p_m2_p0(p_m2_p0), 
		.p_m1_p0(p_m1_p0), 
		.p_p0_m2(p_p0_m2), 
		.p_p0_m1(p_p0_m1), 
		.p_p0_p0(p_p0_p0), 
		.p_p0_p1(p_p0_p1), 
		.p_p0_p2(p_p0_p2), 
		.p_p1_p0(p_p1_p0), 
		.p_p2_p0(p_p2_p0), 
		.scaled_hs(scaled_hs), 
		.scaled_vs(scaled_vs), 
		.w_grad_hf(w_grad_hf), 
		.w_grad_vf(w_grad_vf), 
		.spatial_th(spatial_th), 
		.freq_th(freq_th), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.green(green)
	);

	wire match;
	reg [13:0] Gh_mat,Gv_mat;
	reg [12:0] diff_mat,gs_mat,gf_mat;
	reg [7:0] w_intp_s_mat,w_intp_f_mat; 
	reg [12:0] out_mat; 
	assign match = out_mat == green;
	 
   integer outfile0;

	initial begin 
	       outfile0=$fopen("green_interpolation_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   p_m2_p0,p_m1_p0,p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,p_p1_p0,p_p2_p0,
										 Gh_mat,Gv_mat, diff_mat, w_intp_s_mat,w_intp_f_mat,
										 scaled_hs,scaled_vs,w_grad_hf,w_grad_vf,blend_th0,blend_th1,spatial_th,freq_th,
										 gs_mat,gf_mat,out_mat); //scan each line and get the value as a decimal.
             #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
	
      
endmodule
