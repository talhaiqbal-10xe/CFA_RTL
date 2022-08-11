`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:49:49 08/10/2022 
// Design Name: 
// Module Name:    equ_36 
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
module equ_36
#(parameter dataBitWidth = 14,parameter gradBitWidth=8)
(
input clk,rst,
input [gradBitWidth -1:0] grad, 
input [dataBitWidth -1:0] G_m_RB, // green minus RB
output reg [dataBitWidth+gradBitWidth -1:0] RB_deriv
    );
wire [2*gradBitWidth -1:0] p;
assign p={8'h00,grad}; 

wire [dataBitWidth+2*gradBitWidth -1:0] mult_out1,mult_out2,mult_out_comp;
mult14x16 mult_module(mult_out1,mult_out2,G_m_RB,p);
adder #(dataBitWidth+2*gradBitWidth) mult_adder(mult_out_comp,mult_out1,mult_out2);

always @(*)
begin
//RB_deriv = mult_out_comp[dataBitWidth+2*gradBitWidth -1: gradBitWidth -1];
// had to shift output by 1 bit to get the answer matching with that of matlab. 
// couldn't figure out the reason yet
RB_deriv = {mult_out_comp[dataBitWidth+2*gradBitWidth -1],mult_out_comp[dataBitWidth+2*gradBitWidth -1: gradBitWidth ]};
end


endmodule
