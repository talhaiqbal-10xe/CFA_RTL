`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:24 07/14/2022 
// Design Name: 
// Module Name:    gradients 
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
module gradients
#(parameter pixelBitWidth=12)
(
input clk,rst,start,    // p=pixel_ row coordinate m=minus p=plus , column coordinate m=minus p=plus  
input [pixelBitWidth-1:0] p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
input [pixelBitWidth-1:0] p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
input [pixelBitWidth-1:0] p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
input [pixelBitWidth-1:0] p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
input [pixelBitWidth-1:0] p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,

output  [7:0] grad_hs,grad_vs,grad_hf,grad_vf,w_grad_hf,w_grad_vf
);

wire [16:0] grad_hs_1,grad_vs_1;
equ1 inst1(1'b0,1'b0,1'b0,p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
								  p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
                          p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
                          p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
                          p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,grad_vs_1);


equ1 inst2(1'b0,1'b0,1'b0,p_m2_m2,p_m1_m2,p_p0_m2,p_p1_m2,p_p2_m2,
								  p_m2_m1,p_m1_m1,p_p0_m1,p_p1_m1,p_p2_m1,
                          p_m2_p0,p_m1_p0,p_p0_p0,p_p1_p0,p_p2_p0,
                          p_m2_p1,p_m1_p1,p_p0_p1,p_p1_p1,p_p2_p1,
                          p_m2_p2,p_m1_p2,p_p0_p2,p_p1_p2,p_p2_p2,grad_hs_1);

wire ready1;
equ_4_5 inst3(1'b0,1'b0,1'b0,grad_hs_1,grad_vs_1,grad_hs,grad_vs,ready1);


								  
endmodule

								  
								  
								  