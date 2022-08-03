`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:29 07/28/2022 
// Design Name: 
// Module Name:    mult5x3 
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
module mult5x3(
output [7:0] out1,out2,
input [4:0] A,
input [2:0] B );


wire [7:0] CV;
 assign CV=8'b10010000;
integer i;
 reg[4:0] PP[ 0:2];
always@*
begin
   for ( i=0 ; i<3; i = i+1 )
   begin
      PP[i]= A & {5{B[i]}};
   end
end



///////////// Iteration Number =1///////////////////





wire Hi1L2_inp1, Hi1L2_inp2;
assign Hi1L2_inp1 = PP[0][2];
assign Hi1L2_inp2 = PP[1][1];
wire sHi1L2, cHi1L2;
HA Hi1L2 ( sHi1L2,cHi1L2,Hi1L2_inp1,Hi1L2_inp2 );

wire F1i1L3_inp1, F1i1L3_inp2, F1i1L3_inp3;
assign F1i1L3_inp1 = PP[0][3];
assign F1i1L3_inp2 = PP[1][2];
assign F1i1L3_inp3 = PP[2][1];
wire sF1i1L3, cF1i1L3;
FA F1i1L3( sF1i1L3,cF1i1L3,F1i1L3_inp1,F1i1L3_inp2,F1i1L3_inp3 );

wire F1i1L4_inp1, F1i1L4_inp2, F1i1L4_inp3;
assign F1i1L4_inp1 = ~PP[0][4];
assign F1i1L4_inp2 = PP[1][3];
assign F1i1L4_inp3 = PP[2][2];
wire sF1i1L4, cF1i1L4;
FA F1i1L4( sF1i1L4,cF1i1L4,F1i1L4_inp1,F1i1L4_inp2,F1i1L4_inp3 );

wire Hi1L4_inp1, Hi1L4_inp2;
assign Hi1L4_inp1 = CV[4];
assign Hi1L4_inp2 = cF1i1L3;
wire sHi1L4, cHi1L4;
HA Hi1L4 ( sHi1L4,cHi1L4,Hi1L4_inp1,Hi1L4_inp2 );

wire F1i1L5_inp1, F1i1L5_inp2, F1i1L5_inp3;
assign F1i1L5_inp1 = ~PP[1][4];
assign F1i1L5_inp2 = PP[2][3];
assign F1i1L5_inp3 = cF1i1L4;
wire sF1i1L5, cF1i1L5;
FA F1i1L5( sF1i1L5,cF1i1L5,F1i1L5_inp1,F1i1L5_inp2,F1i1L5_inp3 );


assign out1 ={{CV[7]},{~PP[2][4]},{cHi1L4},{sF1i1L4},{cHi1L2},{PP[2][0]},{PP[0][1]},{PP[0][0]}};
assign out2 ={{1'b0},{cF1i1L5},{sF1i1L5},{sHi1L4},{sF1i1L3},{sHi1L2},{PP[1][0]},{1'b0}} ;
endmodule 