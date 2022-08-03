`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:31 07/18/2022 
// Design Name: 
// Module Name:    equ_7 
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
module equ_7
#(parameter pixelBitWidth=12)
(
input clk,rst,
input [pixelBitWidth-1:0] e1,e2,e3,e4,e5,mean_1,
output reg [pixelBitWidth-1+3+2:0] grad_abs
    );
	 
// Subtraction
wire [pixelBitWidth-1:0] s1,s2,s3,s4,s5;
n_bitSubtractor #(12) sub_1(s1,mean_1,e1);
n_bitSubtractor #(12) sub_2(s2,mean_1,e2);
n_bitSubtractor #(12) sub_3(s3,mean_1,e3);
n_bitSubtractor #(12) sub_4(s4,mean_1,e4);
n_bitSubtractor #(12) sub_5(s5,mean_1,e5);

// absolute
wire [pixelBitWidth-1:0] a1,a2,a3,a4,a5;
abs #(12) grad_abs1(a1,s1);
abs #(12) grad_abs2(a2,s2);
abs #(12) grad_abs3(a3,s3);
abs #(12) grad_abs4(a4,s4);
abs #(12) grad_abs5(a5,s5);


// bit width extension and shifts
wire [pixelBitWidth-1+2:0] t1,t2,t3,t4,t5;
assign t1={2'b00,a1};
assign t2={2'b00,a2};
assign t3={2'b00,a3};
assign t4={2'b00,a4};
assign t5={2'b00,a5};
wire [pixelBitWidth-1+2:0] u2,u3,u4; // corresponding to terms which are to be shifted
assign u2=t2<<1;
assign u3=t3<<2;
assign u4=t4<<1;

// adder compression
wire [pixelBitWidth-1+3+2:0] out1,out2,out_comp;
adder5x14 adder_tree(out1,out2,t1,u2,u3,u4,t5);
adder #(17) a_comp(out_comp,out1,out2);

// results output
always @(*)
begin
grad_abs = out_comp;
end



endmodule
