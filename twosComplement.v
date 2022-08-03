`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:27 07/04/2022 
// Design Name: 
// Module Name:    twosComplement 
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
module twosComplement
 #(parameter bitwidth=16)
(
output [bitwidth-1:0] out,
input [bitwidth-1:0] inp1
);
assign out =((~inp1)+1'b1);
endmodule
