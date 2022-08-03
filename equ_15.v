`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:46:10 07/20/2022 
// Design Name: 
// Module Name:    equ_15 
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
module equ_15

(
input clk,rst,
input [7:0] grad_f,blend_th0,blend_th1,
output [7:0] w_grad_f
    );

//------ Comparator------------------
wire [7:0] comparator_out;
comparator_2 c(comparator_out,grad_f,blend_th0,blend_th1);

//------ subtractor------------------
wire [7:0] divisor,temp_dividend;
wire [15:0] dividend;
n_bitSubtractor #(8) s1(divisor,blend_th1,blend_th0);
n_bitSubtractor #(8) s2(temp_dividend,comparator_out,blend_th0);
n_bitSubtractor #(16) subractor3(dividend,{8'b0000_0000,temp_dividend}<<8,{8'b0000_0000,temp_dividend});

//------ divider--------------------

wire [7:0] remainder;
divider #(16,8,8) divider_frequency(w_grad_f,remainder,dividend,divisor);



endmodule
