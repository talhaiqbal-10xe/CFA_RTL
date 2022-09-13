`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:01 09/12/2022 
// Design Name: 
// Module Name:    DaddaMultiplier 
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
module DaddaMultiplierinput (
signed [12:0] a,
input [7:0] b,
output [20:0] out
);
wire [20:0] out1,out2;
mult13x8 m(out1,out2,a,b);
assign out = out1+out2;



endmodule
