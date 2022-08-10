`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:58 08/09/2022 
// Design Name: 
// Module Name:    RB_on_G_sums 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: RB on G takes the i nputs of R, G and B and then spits out sums 
//              needed for the computations of equations 36,37,38 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RB_on_G_sums
#(parameter pixelBitWidth=12)
(
input clk,rst,  // g = green, r = red and b = blue , h=horizontal, v= vertical , m= minus, p=plus
input [pixelBitWidth -1:0] gv_m1,gh_m1,gh_p1,gv_p1,
input [pixelBitWidth -1:0] rv_m1,rh_m1,rh_p1,rv_p1,
input [pixelBitWidth -1:0] bv_m1,bh_m1,bh_p1,bv_p1,
output reg [pixelBitWidth+2 -1:0] gr_h,gr_v,gb_h,gb_v  
    );

wire [pixelBitWidth+1 -1:0] gh_temp,gv_temp,rh_temp,rv_temp,bh_temp,bv_temp;
adder #(pixelBitWidth+1) adder_gh(gh_temp,{1'b0,gh_m1},{1'b0,gh_p1});
adder #(pixelBitWidth+1) adder_gv(gv_temp,{1'b0,gv_m1},{1'b0,gv_p1});
adder #(pixelBitWidth+1) adder_rh(rh_temp,{1'b0,rh_m1},{1'b0,rh_p1});
adder #(pixelBitWidth+1) adder_rv(rv_temp,{1'b0,rv_m1},{1'b0,rv_p1});
adder #(pixelBitWidth+1) adder_bh(bh_temp,{1'b0,bh_m1},{1'b0,bh_p1});
adder #(pixelBitWidth+1) adder_bv(bv_temp,{1'b0,bv_m1},{1'b0,bv_p1});

wire [pixelBitWidth+2 -1:0] gv_m_rv,gh_m_rh,gv_m_bv,gh_m_bh;

n_bitSubtractor #(pixelBitWidth+2) sub_equ36(gv_m_rv,{1'b0,gv_temp},{1'b0,rv_temp});
n_bitSubtractor #(pixelBitWidth+2) sub_equ37(gh_m_rh,{1'b0,gh_temp},{1'b0,rh_temp});

n_bitSubtractor #(pixelBitWidth+2) sub_equ39(gv_m_bv,{1'b0,gv_temp},{1'b0,bv_temp});
n_bitSubtractor #(pixelBitWidth+2) sub_equ40(gh_m_bh,{1'b0,gh_temp},{1'b0,bh_temp});


always @(*)
begin
gr_v = gv_m_rv;
gr_h = gh_m_rh;
gb_v = gv_m_bv;
gb_h = gh_m_bh;

end


endmodule
