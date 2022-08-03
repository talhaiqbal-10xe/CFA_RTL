`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:27 07/21/2022 
// Design Name: 
// Module Name:    green_interpolation 
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
module green_interpolation
#(parameter pixelBitWidth=12)
(
input clk,rst,
input [pixelBitWidth-1:0] p_m2_p0,
input [pixelBitWidth-1:0] p_m1_p0,
input [pixelBitWidth-1:0] p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
input [pixelBitWidth-1:0] p_p1_p0,
input [pixelBitWidth-1:0] p_p2_p0,
input [7:0] scaled_hs,scaled_vs,w_grad_hf,w_grad_vf,spatial_th,freq_th,
output reg [pixelBitWidth-1:0] green

    );
wire [pixelBitWidth-1+3:0] green_h,green_v,absolute_diff;
green_h_v green_h_module(clk,rst,p_p0_m2,p_p0_m1,p_p0_p1,p_p0_p2,green_h);
green_h_v green_v_module(clk,rst,p_m2_p0,p_m1_p0,p_p1_p0,p_p2_p0,green_v);

abs_diff abs_diff_module(absolute_diff,green_h,green_v);

wire [7:0] W_s,W_f;
w_intrp_s_f W_s_f_module(clk,rst,absolute_diff,9'b100,9'd300,W_s,W_f);

wire ready_Gs,ready_Gf;
wire [pixelBitWidth+1 -1:0] Gs,Gf;
green_s_f #(12,8,0) green_s_module(clk,rst,scaled_hs,scaled_vs,spatial_th,green_h,green_v,Gs,ready_Gs);
green_s_f #(12,8,1) green_f_module(clk,rst,w_grad_hf,w_grad_vf,freq_th,green_h,green_v,Gf,ready_Gf);

wire [pixelBitWidth-1:0] green_temp;
green_final #(12,8) final_out_module(clk,rst,W_s,W_f,Gs,Gf);


endmodule
