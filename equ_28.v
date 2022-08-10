`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:23:14 08/03/2022 
// Design Name: 
// Module Name:    equ_28 
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
module equ_28
#(parameter PixelBitWidth=12)
(
input clk,rst,
input [PixelBitWidth -1:0] g,
input [PixelBitWidth-2 -1:0] g_m_rb, // G minus RB
output reg [PixelBitWidth -1:0] RB
    );
wire [PixelBitWidth-2 -1:0] tc_g_m_rb; // 2's complement 
twosComplement (tc_g_m_rb,g_m_rb);

wire [PixelBitWidth+1 -1:0] temp;
adder #(PixelBitWidth+1) (temp,{1'b0,g},{3*{tc_g_m_rb[PixelBitWidth-2 -1]},tc_g_m_rb[PixelBitWidth-2 -1:0]});
 
always @(*)
begin
RB = temp[PixelBitWidth+1 -1]==0? 0: temp>12'hfff ?12'hfff:temp; 
end


endmodule
