`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:17 07/19/2022 
// Design Name: 
// Module Name:    comparator_2 
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
module comparator_2
(
output [7:0] out,
input [7:0] a,blend_th0,blend_th1
    );
assign out = a < blend_th0 ? blend_th0: a> blend_th1 ? blend_th1 : a ;

endmodule
