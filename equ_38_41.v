`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:31 08/10/2022 
// Design Name: 
// Module Name:    equ_38_41 
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
module equ_38_41
#(parameter gradBitWidth=8, parameter pixelBitWidth=12)
(
input clk,rst,
input [pixelBitWidth -1:0] green,
input [gradBitWidth -1:0] scaled_h,scaled_v,
input [pixelBitWidth+2 -1:0] green_h,green_v, // green_h minus RB_h,green_v minus RB_v 
output reg [pixelBitWidth -1:0] RB
    );

wire [pixelBitWidth+2+gradBitWidth -1:0] RB_vertical,RB_horizontal,RB_temp,RB_temp_mean,RB_m_G;	 
equ_36 vertical_module(clk,rst,scaled_v,green_v,RB_vertical);
equ_36 horizontal_module(clk,rst,scaled_h,green_h,RB_horizontal);

adder #(pixelBitWidth+2+gradBitWidth) adder_module(RB_temp,RB_vertical,RB_horizontal);

assign RB_temp_mean = {RB_temp[pixelBitWidth+2+gradBitWidth -1],RB_temp[pixelBitWidth+2+gradBitWidth -1:1]};

n_bitSubtractor #(pixelBitWidth+2+gradBitWidth) sub_equ38(RB_m_G,{10'h000,green},RB_temp_mean);
 
always @(*)
begin
if (RB_m_G[pixelBitWidth+2+gradBitWidth-1] ==1'b1)
    RB=12'd0;
else
    if (RB_m_G>{10'h000,12'hfff})
	 RB=12'hfff;
else
    RB=RB_m_G[pixelBitWidth -1:0];
end


endmodule
