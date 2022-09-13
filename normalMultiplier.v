`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:25 09/12/2022 
// Design Name: 
// Module Name:    normalMultiplier 
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
module normalMultiplier(
input signed [12:0] a,
input [7:0] b,
output [20:0] out
    );
assign out = a*b;

endmodule
