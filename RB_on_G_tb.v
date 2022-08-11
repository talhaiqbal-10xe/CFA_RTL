`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:14:38 08/11/2022
// Design Name:   RB_on_G
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/RB_on_G_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RB_on_G
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RB_on_G_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] green;
	reg [11:0] gv_m1;
	reg [11:0] gh_m1;
	reg [11:0] gh_p1;
	reg [11:0] gv_p1;
	reg [11:0] rv_m1;
	reg [11:0] rh_m1;
	reg [11:0] rh_p1;
	reg [11:0] rv_p1;
	reg [11:0] bv_m1;
	reg [11:0] bh_m1;
	reg [11:0] bh_p1;
	reg [11:0] bv_p1;
	reg [7:0] scaled_hs;
	reg [7:0] scaled_vs;

	// Outputs
	wire [11:0] red;
	wire [11:0] blue;

	// Instantiate the Unit Under Test (UUT)
	RB_on_G uut (
		.clk(clk), 
		.rst(rst), 
		.green(green), 
		.gv_m1(gv_m1), 
		.gh_m1(gh_m1), 
		.gh_p1(gh_p1), 
		.gv_p1(gv_p1), 
		.rv_m1(rv_m1), 
		.rh_m1(rh_m1), 
		.rh_p1(rh_p1), 
		.rv_p1(rv_p1), 
		.bv_m1(bv_m1), 
		.bh_m1(bh_m1), 
		.bh_p1(bh_p1), 
		.bv_p1(bv_p1), 
		.scaled_hs(scaled_hs), 
		.scaled_vs(scaled_vs), 
		.red(red), 
		.blue(blue)
	);

	integer outfile0;
	reg [11:0] R_mat,B_mat; 
	reg [13:0] gr_h,gr_v,gb_h,gb_v;
	reg [21:0] r_dv,r_dh,b_dv,b_dh;
	wire match;
	assign match = R_mat==red & B_mat==blue; 
	initial begin
	         clk=0;
            rst=1;
			   #20
			   rst=0;
	         outfile0=$fopen("RB_on_G_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   gv_m1,gh_m1,gh_p1,gv_p1, rv_m1,rh_m1,rh_p1,rv_p1, bv_m1,bh_m1,bh_p1,bv_p1,green,
										 scaled_hs,scaled_vs,
										 gr_h,gr_v,gb_h,gb_v,
										 r_dv,r_dh,b_dv,b_dh,
										 R_mat,B_mat); //scan each line and get the value as a decimal.
             
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