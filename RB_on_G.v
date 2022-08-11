`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:31 08/10/2022 
// Design Name: 
// Module Name:    RB_on_G 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RB_on_G
#(parameter pixelBitWidth=12,parameter gradBitWidth=8)
(
input clk,rst,  // g = green, r = red and b = blue , h=horizontal, v= vertical , m= minus, p=plus
input [pixelBitWidth -1:0] green,
input [pixelBitWidth -1:0] gv_m1,gh_m1,gh_p1,gv_p1,
input [pixelBitWidth -1:0] rv_m1,rh_m1,rh_p1,rv_p1,
input [pixelBitWidth -1:0] bv_m1,bh_m1,bh_p1,bv_p1,
input [gradBitWidth -1:0] scaled_hs,scaled_vs,
output  [pixelBitWidth-1 :0] red,blue
    );
wire [pixelBitWidth+2 -1:0] gr_h,gr_v,gb_h,gb_v;

RB_on_G_sums sums_module (
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
	
equ_38_41 red_calc (
		.clk(clk), 
		.rst(rst), 
		.green(green), 
		.scaled_h(scaled_hs), 
		.scaled_v(scaled_vs), 
		.green_h(gr_h), 
		.green_v(gr_v), 
		.RB(red)
	);
	equ_38_41 blue_calc (
		.clk(clk), 
		.rst(rst), 
		.green(green), 
		.scaled_h(scaled_hs), 
		.scaled_v(scaled_vs), 
		.green_h(gb_h), 
		.green_v(gb_v), 
		.RB(blue)
	);


endmodule
