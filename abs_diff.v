`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:00 07/24/2022 
// Design Name: 
// Module Name:    abs_diff 
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
module abs_diff
#(parameter pixelBitWidth=14) // absoluteBitWidth = bit width of the absolute module. 
(
output reg [pixelBitWidth-2:0] absolute_diff, // 13 bits
input  [pixelBitWidth-1:0] green_h,green_v

    );
wire [pixelBitWidth -1:0] diff;
n_bitSubtractor #(pixelBitWidth) sub1(diff,green_h,green_v);

wire [pixelBitWidth-1:0] abs_out;
absolute_value #(pixelBitWidth) abs_module(abs_out,diff);

always @(*)
begin
absolute_diff=abs_out[pixelBitWidth-2:0];
end

endmodule
