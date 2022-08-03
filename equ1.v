`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:03 07/14/2022 
// Design Name: 
// Module Name:    equ1 
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
module equ1
#(parameter pixelBitWidth=12)
(
input clk,rst,start,    // p=pixel_ row coordinate m=minus p=plus , column coordinate m=minus p=plus  
input [pixelBitWidth-1:0] e1t1,e1t2,e1t3,e1t4,e1t5,
input [pixelBitWidth-1:0] e2t1,e2t2,e2t3,e2t4,e2t5,
input [pixelBitWidth-1:0] e3t1,e3t2,e3t3,e3t4,e3t5,
input [pixelBitWidth-1:0] e4t1,e4t2,e4t3,e4t4,e4t5,
input [pixelBitWidth-1:0] e5t1,e5t2,e5t3,e5t4,e5t5,
output [pixelBitWidth+3+2-1:0] grad_abs_out
);

// adding 

wire [14:0] out1_e1,out2_e1,out_comp_e1;
wire [14:0] out1_e2,out2_e2,out_comp_e2;
wire [14:0] out1_e3,out2_e3,out_comp_e3;
wire [14:0] out1_e4,out2_e4,out_comp_e4;
wire [14:0] out1_e5,out2_e5,out_comp_e5;

adder5x12 entry1(out1_e1,out2_e1,e1t1,e1t2,e1t3,e1t4,e1t5);
adder5x12 entry2(out1_e2,out2_e2,e2t1,e2t2,e2t3,e2t4,e2t5);
adder5x12 entry3(out1_e3,out2_e3,e3t1,e3t2,e3t3,e3t4,e3t5);
adder5x12 entry4(out1_e4,out2_e4,e4t1,e4t2,e4t3,e4t4,e4t5);
adder5x12 entry5(out1_e5,out2_e5,e5t1,e5t2,e5t3,e5t4,e5t5);

adder e1_adder(out_comp_e1,out1_e1,out2_e1);
adder e2_adder(out_comp_e2,out1_e2,out2_e2);
adder e3_adder(out_comp_e3,out1_e3,out2_e3);
adder e4_adder(out_comp_e4,out1_e4,out2_e4);
adder e5_adder(out_comp_e5,out1_e5,out2_e5);

// scaling second and forth

wire signed [16:0] e2_scaled;
assign e2_scaled = out_comp_e2<<1; 

wire signed [16:0] e4_scaled;
assign e4_scaled = out_comp_e4<<1;

// 2's complement of 2nd and fifth
wire signed [16:0] e2_complement;
twosComplement #(17) e2_comp(e2_complement,e2_scaled);

wire signed [16:0] e5_complement;
twosComplement #(17) e5_comp(e5_complement,{{2'b00},out_comp_e5});

// adding all the terms
wire [16:0] grad_sum_out1,grad_sum_out2,grad_sum_comp;
adder4x17 grad_sum(grad_sum_out1,grad_sum_out2,{{2'b00},out_comp_e1},e2_complement,e4_scaled,e5_complement);
adder #(17)  grad_adder(grad_sum_comp,grad_sum_out1,grad_sum_out2);


// taking absolute
//wire [16:0] grad_abs_out;
abs #(17) grad_hs_abs(grad_abs_out,grad_sum_comp);

 
endmodule




