`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:45 07/05/2022 
// Design Name: 
// Module Name:    divide_by_5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: The module will generate the strings by itself, however, appropriate adder
//               is to inserted manually.
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module divide_by_5
#(parameter bitwidth = 16)
(
output [32:0] out1,out2,
input [bitwidth-1:0] inp
    );

wire [bitwidth+14-1:0] temp,a1,b2,c3,d4,e5,f6,g7;

assign temp = {inp,14'b0};
assign a1=temp>>3;
assign b2=temp>>4;
assign c3=temp>>7;
assign d4=temp>>8;
assign e5=temp>>11;
assign f6=temp>>12;
assign g7=temp>>14;
adder7x30 adder(out1,out2,a1,b2,c3,d4,e5,f6,g7);
                          



endmodule
