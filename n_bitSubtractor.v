`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:10 07/14/2022 
// Design Name: 
// Module Name:    n_bitSubtractor 
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
module n_bitSubtractor
#(parameter bitwidth=15)
(
output [bitwidth-1:0] out,
input [bitwidth-1:0] inp1,inp2
);

assign out=inp1-inp2;
endmodule  