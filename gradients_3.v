`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:39 09/05/2022 
// Design Name: 
// Module Name:    gradients_3 
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
module gradients_3
#(parameter pixelBitWidth=12)
(
input clk,rst,start,    // p=pixel_ row coordinate m=minus p=plus , column coordinate m=minus p=plus  
input [pixelBitWidth-1:0] p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
input [pixelBitWidth-1:0] p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
input [pixelBitWidth-1:0] p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
input [pixelBitWidth-1:0] p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
input [pixelBitWidth-1:0] p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,
input [7:0] th0,th1,
output reg  [7:0] grad_hs,grad_vs,grad_hf,grad_vf,w_grad_hf,w_grad_vf
);

wire [16:0] grad_hs_1,grad_vs_1;
wire [14:0] r1_sum,r2_sum,r3_sum,r4_sum,r5_sum,c1_sum,c2_sum,c3_sum,c4_sum,c5_sum;
equ1_2 grad_vs_module(clk,rst,1'b0,
                          p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
								  p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
                          p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
                          p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
                          p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,
								  r1_sum,r2_sum,r3_sum,r4_sum,r5_sum,grad_vs_1);


equ1_2 grad_hs_module(clk,rst,1'b0,
                          p_m2_m2,p_m1_m2,p_p0_m2,p_p1_m2,p_p2_m2,
								  p_m2_m1,p_m1_m1,p_p0_m1,p_p1_m1,p_p2_m1,
                          p_m2_p0,p_m1_p0,p_p0_p0,p_p1_p0,p_p2_p0,
                          p_m2_p1,p_m1_p1,p_p0_p1,p_p1_p1,p_p2_p1,
                          p_m2_p2,p_m1_p2,p_p0_p2,p_p1_p2,p_p2_p2,
								  c1_sum,c2_sum,c3_sum,c4_sum,c5_sum,grad_hs_1);

wire ready1;
wire [7:0] grad_hs_temp,grad_vs_temp;
equ_4_5 scaled_hs_vs_module(clk,rst,1'b0,grad_hs_1,grad_vs_1,grad_hs_temp,grad_vs_temp,ready1);

wire [pixelBitWidth-1:0] r1_mean,r2_mean,r3_mean,r4_mean,r5_mean;
wire [pixelBitWidth-1:0] c1_mean,c2_mean,c3_mean,c4_mean,c5_mean,patch_mean;


wire ready_mean;
mean_calc means_module(clk,rst,{1'b0,r1_sum},{1'b0,r2_sum},{1'b0,r3_sum},{1'b0,r4_sum},{1'b0,r5_sum},{1'b0,c1_sum},{1'b0,c2_sum},{1'b0,c3_sum},{1'b0,c4_sum},{1'b0,c5_sum},
                        r1_mean,r2_mean,r3_mean,r4_mean,r5_mean,
								c1_mean,c2_mean,c3_mean,c4_mean,c5_mean,
								patch_mean,ready_mean);

wire [16:0] grad_hf_1,grad_vf_1;
equ_7 grad_hf_module(clk,rst,c1_mean,c2_mean,c3_mean,c4_mean,c5_mean,patch_mean,grad_hf_1);
equ_7 grad_vf_module(clk,rst,r1_mean,r2_mean,r3_mean,r4_mean,r5_mean,patch_mean,grad_vf_1);

wire ready2;
wire [7:0] grad_hf_temp,grad_vf_temp;
equ_4_5 scaled_hf_vf_module(clk,rst,1'b0,grad_hf_1[15:0],grad_vf_1[15:0],grad_hf_temp,grad_vf_temp,ready2);

wire [7:0] w_grad_hf_temp,w_grad_vf_temp;
equ_15 w_grad_hf_module(clk,rst,grad_hf_temp,th0,th1,w_grad_hf_temp);
equ_15 w_grad_vf_module(clk,rst,grad_vf_temp,th0,th1,w_grad_vf_temp);

always @(posedge clk)
if (rst)
    begin
	 grad_hs <= 8'h00;
	 grad_vs <= 8'h00;
	 grad_hf <= 8'h00;
	 grad_vf <= 8'h00;
	 w_grad_hf <= 8'h00;
	 w_grad_vf <= 8'h00;
	 end
else
    begin
	 grad_hs <= grad_hs_temp;
	 grad_vs <= grad_vs_temp;
	 grad_hf <= grad_hf_temp;
	 grad_vf <= grad_vf_temp;
	 w_grad_hf <= w_grad_hf_temp;
	 w_grad_vf <= w_grad_vf_temp;
	 end
    
								  
endmodule
