`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:15 08/03/2022 
// Design Name: 
// Module Name:    pre_equ_24_27 
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
module pre_equ_24_27
#(parameter DataBitWidth=12)
(
input clk,rst,
input [DataBitWidth -1:0] G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,
input [DataBitWidth -1:0] RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1,
output  reg [DataBitWidth+1 -1:0] RB
);

wire [DataBitWidth -1:0] a1,b1,c1,d1,e1,f1,g1,h1;
assign a1=G_m1_m1>>2;
assign b1=G_m1_p1>>2;
assign c1=G_p1_m1>>2;
assign d1=G_p1_p1>>2;
assign e1=RB_m1_m1>>2;
assign f1=RB_m1_p1>>2;
assign g1=RB_p1_m1>>2;
assign h1=RB_p1_p1>>2;

wire [DataBitWidth-2 -1:0] a,b,c,d,e,f,g,h;
assign a=a1[DataBitWidth-2 -1:0];
assign b=b1[DataBitWidth-2 -1:0];
assign c=c1[DataBitWidth-2 -1:0];
assign d=d1[DataBitWidth-2 -1:0];

assign e={e1[DataBitWidth-2 -1],~{e1[DataBitWidth-2 -2:0]}};
assign f={f1[DataBitWidth-2 -1],~{f1[DataBitWidth-2 -2:0]}};
assign g={g1[DataBitWidth-2 -1],~{g1[DataBitWidth-2 -2:0]}};
assign h={h1[DataBitWidth-2 -1],~{h1[DataBitWidth-2 -2:0]}};

wire [DataBitWidth+1 -1:0] RB_temp;
equ_24_27 equ_24_27_module(clk,rst,a,b,c,d,e,f,g,h,RB_temp);

always @(*)
begin
RB=RB_temp;
end


endmodule
