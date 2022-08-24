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
#(parameter DataBitWidth=12)
(
input clk,rst,
input [DataBitWidth -1:0] G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,
input [DataBitWidth -1:0] RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1,
output reg [DataBitWidth+3 -1:0] out
    );



wire [DataBitWidth+2 -1:0] out1_G,out2_G,out_G_comp;
adder4x12 adder4x12_green(out1_G,out2_G,G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1);
adder #(DataBitWidth+2) adder_green(out_G_comp,out1_G,out2_G);

wire [DataBitWidth+2 -1:0] out1_RB,out2_RB,out_RB_comp;
adder4x12 adder4x12_RB(out1_RB,out2_RB,RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1);
adder #(DataBitWidth+2) adder_RB(out_RB_comp,out1_RB,out2_RB);

wire signed [DataBitWidth+3 -1:0] sub_out;
n_bitSubtractor #(DataBitWidth+3) G_minus_RB(sub_out,{1'b0,out_G_comp},{1'b0,out_RB_comp});

wire signed [DataBitWidth+3 -1:0] sub_out_div_by_4;
assign sub_out_div_by_4 = {{sub_out[DataBitWidth+3 -1],sub_out[DataBitWidth+3 -1]},sub_out[DataBitWidth+3 -1:2]};
 
always @(*)
begin
out=sub_out_div_by_4;
//if (sub_out_div_by_4[DataBitWidth+3 -1])
//    out = 0;
//else
//    if(sub_out_div_by_4>15'h0fff)
//       out = 12'hfff;
//    else
//       out=sub_out_div_by_4;

end



endmodule
