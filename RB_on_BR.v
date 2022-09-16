`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:19 08/11/2022 
// Design Name: 
// Module Name:    RB_on_BR 
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
module RB_on_BR
#(parameter DataBitWidth=12)
(
input clk,rst,
input [DataBitWidth -1:0] G_m1_m1,G_m1_p1,G_p1_m1,G_p1_p1,
input [DataBitWidth -1:0] RB_m1_m1,RB_m1_p1,RB_p1_m1,RB_p1_p1,
output  reg [DataBitWidth+1+1 -1:0] RB
);

wire [DataBitWidth+1 -1:0] a1,b1,c1,d1,e1,f1,g1,h1;
assign a1={1'b0,G_m1_m1};
assign b1={1'b0,G_m1_p1};
assign c1={1'b0,G_p1_m1};
assign d1={1'b0,G_p1_p1};
assign e1={1'b0,RB_m1_m1};
assign f1={1'b0,RB_m1_p1};
assign g1={1'b0,RB_p1_m1};
assign h1={1'b0,RB_p1_p1};

wire [DataBitWidth+1 -1:0] a,b,c,d,e,f,g,h;
assign a=a1[DataBitWidth+1 -1:0];
assign b=b1[DataBitWidth+1 -1:0];
assign c=c1[DataBitWidth+1 -1:0];
assign d=d1[DataBitWidth+1 -1:0];

assign e={e1[DataBitWidth+1 -1],~{e1[DataBitWidth+1 -2:0]}};
assign f={f1[DataBitWidth+1 -1],~{f1[DataBitWidth+1 -2:0]}};
assign g={g1[DataBitWidth+1 -1],~{g1[DataBitWidth+1 -2:0]}};
assign h={h1[DataBitWidth+1 -1],~{h1[DataBitWidth+1 -2:0]}};

wire [DataBitWidth+1+3 -1:0] RB_temp;
equ_24_27 equ_24_27_module(clk,rst,a,b,c,d,e,f,g,h,RB_temp);

always @(*)
begin
RB=RB_temp[DataBitWidth+1 -1:2]; 
end


endmodule
