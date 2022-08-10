`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:09:00 08/10/2022
// Design Name:   RB_on_G_sums
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/RB_on_G_sums_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RB_on_G_sums
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RB_on_G_sums_tb;

	// Inputs
	reg clk;
	reg rst;
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

	// Outputs
	wire [13:0] gr_h;
	wire [13:0] gr_v;
	wire [13:0] gb_h;
	wire [13:0] gb_v;

	// Instantiate the Unit Under Test (UUT)
	RB_on_G_sums uut (
		.clk(clk), 
		.rst(rst), 
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
		.gr_h(gr_h), 
		.gr_v(gr_v), 
		.gb_h(gb_h), 
		.gb_v(gb_v)
	); 

	integer outfile0;
	reg [13:0] equ_36,equ_37,equ_39,equ_40;
	wire match;
	assign match = equ_36==gr_v & equ_37==gr_h & equ_39==gb_v & equ_40==gb_h; 
	initial begin
	         clk=0;
            rst=1;
			   #20
			   rst=0;
	         outfile0=$fopen("RB_on_G_sums_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   gv_m1,gh_m1,gh_p1,gv_p1, rv_m1,rh_m1,rh_p1,rv_p1, bv_m1,bh_m1,bh_p1,bv_p1,
										 equ_36,equ_37,equ_39,equ_40); //scan each line and get the value as a decimal.
             
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
