`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:52 07/14/2022 
// Design Name: 
// Module Name:    equ_4_5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: module definition includes the signals which may be needed for the  
//              pipelined version of the module 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module equ_4_5(
input clk,rst,strat,
input [15:0] grad_hs,grad_vs,
output [7:0] scaled_hs,scaled_vs, 
output ready
    );

//------  zero detect --------------------------------------------------------
wire [15:0] grad_hs_zd_out,grad_vs_zd_out;
zero_detect zd(grad_hs_zd_out,grad_vs_zd_out,grad_hs,grad_vs);  

//------ grad_hs and grad_vs sum for the divider------------------------------
wire [15:0] grad_hs_vs_sum_out;
adder #(16) grad_hs_vs_sum(grad_hs_vs_sum_out,grad_hs_zd_out[15:0],grad_vs_zd_out[15:0]);

//------ division------------------------------------------------------------
wire [23:0] temp,dividend;
wire [15:0] divisor;
wire [7:0] quotient;
wire [15:0] remainder;
assign divisor = grad_hs_vs_sum_out;
assign temp = grad_hs_zd_out<<8; // multiplied by 256

n_bitSubtractor #(24) s1(dividend,temp,{8*{1'b0},grad_hs_zd_out});
divider divider_spatial(quotient,remainder,dividend,divisor);

assign scaled_hs=quotient;
n_bitSubtractor #(8) s2(scaled_vs,8'b11111111,quotient);


endmodule
