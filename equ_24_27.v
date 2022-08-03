`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:01:35 08/03/2022 
// Design Name: 
// Module Name:    equ_24_27 
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
module equ_24_27
#(parameter DataBitWidth=10)
(
input clk,rst,
input [DataBitWidth -1:0] G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,
input [DataBitWidth -1:0] RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1,
output reg [DataBitWidth+3 -1:0] out
    );

wire [DataBitWidth+3 -1:0] out1,out2,out_comp;
adder8x10 adder8x10_module(out1,out2,G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1);
adder #(DataBitWidth+3) adder_module(out_comp,out1,out2);

always @(*)
begin
out = out_comp;
end


endmodule
