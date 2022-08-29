`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:40 07/24/2022 
// Design Name: 
// Module Name:    w_intrp_s_f 
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
module w_intrp_s_f
#(parameter pixelBitWidth=12,thresholdBitWidth=9)
(
input clk,rst,
input [pixelBitWidth+1 -1:0] diff,
input [thresholdBitWidth-1:0] blend_th0,blend_th1,
output reg [7:0] w_s,w_f
    );

//comparator
wire diff_lt_th0,diff_gt_th1; //diff_greater_lesser_than_threshold_0_1
assign diff_lt_th0=diff<blend_th0;
assign diff_gt_th1=diff>=blend_th1;

// subtacting thresholds
wire [thresholdBitWidth-1:0] subtractor_out;
n_bitSubtractor #(thresholdBitWidth) subtract1_th1_th0(subtractor_out,blend_th1,blend_th0);

// threshold and absolute difference subtraction
wire [pixelBitWidth-1+1:0] diff_minus_th0,th1_minus_diff;
n_bitSubtractor #(pixelBitWidth+1) subtract2_d_th0(diff_minus_th0,diff,{(pixelBitWidth+1-thresholdBitWidth)*{1'b0},blend_th0});
n_bitSubtractor #(pixelBitWidth+1) subtract3_th1_diff(th1_minus_diff,{(pixelBitWidth+1-thresholdBitWidth)*{1'b0},blend_th1},diff);

// dividers
wire [7:0] w_intrp_s,w_intrp_f;
wire [thresholdBitWidth+8-1:0] temp1,temp2,dividend1,dividend2;
wire [thresholdBitWidth-1:0] divisor;
wire [7:0] quotient1,quotient2;
wire [thresholdBitWidth-1:0] remainder1,remainder2;
assign temp1 = {diff_minus_th0[thresholdBitWidth-1:0],8'h00}; // multiply by 256
assign temp2 = {th1_minus_diff[thresholdBitWidth-1:0],8'h00}; // multiply by 256
assign divisor = subtractor_out;
n_bitSubtractor #(thresholdBitWidth+8) subtract5_255(dividend1,temp1,{(thresholdBitWidth+8-1)*{1'b0},1'b1}); // multiply by 255
n_bitSubtractor #(thresholdBitWidth+8) subtract6_255(dividend2,temp2,{(thresholdBitWidth+8-1)*{1'b0},1'b1}); // multiply by 255
divider #(thresholdBitWidth+8,thresholdBitWidth) divider_w_s(quotient1,remainder1,dividend1,divisor);
divider #(thresholdBitWidth+8,thresholdBitWidth) divider_w_f(quotient2,remainder2,dividend2,divisor);

always @(*)
case ({diff_gt_th1,diff_lt_th0})
2'b00: begin w_s = quotient2;w_f=quotient1; end
2'b01: begin w_s = 8'hff;w_f = 8'h00; end
2'b10: begin w_s = 8'h00;w_f = 8'hff; end
2'b11: begin w_s = 8'h00;w_f = 8'h00; end
endcase 













endmodule
