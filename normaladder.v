`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:46:02 09/12/2022 
// Design Name: 
// Module Name:    normaladder 
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
module normaladder
#(parameter bitwidth =12)
(
input signed [bitwidth -1:0] a,b,c,d,e,
output [bitwidth+3 -1:0] out
    );
assign out = a+b+c-d-e;

endmodule
