`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:31 07/04/2022 
// Design Name: 
// Module Name:    abs 
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
module abs
#(parameter bitwidth=16)
(output  [bitwidth-1:0] out,
 input [bitwidth-1:0] inp);
 
 assign out = inp[bitwidth-1] ? ((~inp)+1'b1) : inp;
 
// wire [bitwidth-1:0] negative;
// twosComplement t(negative,inp);
// always @(*)
// begin
// if (inp[bitwidth-1]==1'b1)
//      out <= negative;
// else
//      out <= inp;
//end
endmodule
