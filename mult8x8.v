`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:02 07/28/2022 
// Design Name: 
// Module Name:    mult8x8 
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
module mult8x8(
output [15:0] out1,out2,
input [7:0] A,
input [7:0] B );


integer i;
 reg[7:0] PP[ 0:7];
always@*
begin
   for ( i=0 ; i<8; i = i+1 )
   begin
      PP[i]= A & {8{B[i]}};
   end
end



///////////// Iteration Number =1///////////////////





wire Hi1L6_inp1, Hi1L6_inp2;
assign Hi1L6_inp1 = PP[0][6];
assign Hi1L6_inp2 = PP[1][5];
wire sHi1L6, cHi1L6;
HA Hi1L6 ( sHi1L6,cHi1L6,Hi1L6_inp1,Hi1L6_inp2 );

wire F1i1L7_inp1, F1i1L7_inp2, F1i1L7_inp3;
assign F1i1L7_inp1 = PP[0][7];
assign F1i1L7_inp2 = PP[1][6];
assign F1i1L7_inp3 = PP[2][5];
wire sF1i1L7, cF1i1L7;
FA F1i1L7( sF1i1L7,cF1i1L7,F1i1L7_inp1,F1i1L7_inp2,F1i1L7_inp3 );

wire Hi1L7_inp1, Hi1L7_inp2;
assign Hi1L7_inp1 = PP[3][4];
assign Hi1L7_inp2 = PP[4][3];
wire sHi1L7, cHi1L7;
HA Hi1L7 ( sHi1L7,cHi1L7,Hi1L7_inp1,Hi1L7_inp2 );

wire F1i1L8_inp1, F1i1L8_inp2, F1i1L8_inp3;
assign F1i1L8_inp1 = PP[1][7];
assign F1i1L8_inp2 = PP[2][6];
assign F1i1L8_inp3 = PP[3][5];
wire sF1i1L8, cF1i1L8;
FA F1i1L8( sF1i1L8,cF1i1L8,F1i1L8_inp1,F1i1L8_inp2,F1i1L8_inp3 );

wire Hi1L8_inp1, Hi1L8_inp2;
assign Hi1L8_inp1 = PP[4][4];
assign Hi1L8_inp2 = PP[5][3];
wire sHi1L8, cHi1L8;
HA Hi1L8 ( sHi1L8,cHi1L8,Hi1L8_inp1,Hi1L8_inp2 );

wire F1i1L9_inp1, F1i1L9_inp2, F1i1L9_inp3;
assign F1i1L9_inp1 = PP[2][7];
assign F1i1L9_inp2 = PP[3][6];
assign F1i1L9_inp3 = PP[4][5];
wire sF1i1L9, cF1i1L9;
FA F1i1L9( sF1i1L9,cF1i1L9,F1i1L9_inp1,F1i1L9_inp2,F1i1L9_inp3 );



///////////// Iteration Number =2///////////////////





wire Hi2L4_inp1, Hi2L4_inp2;
assign Hi2L4_inp1 = PP[0][4];
assign Hi2L4_inp2 = PP[1][3];
wire sHi2L4, cHi2L4;
HA Hi2L4 ( sHi2L4,cHi2L4,Hi2L4_inp1,Hi2L4_inp2 );

wire F1i2L5_inp1, F1i2L5_inp2, F1i2L5_inp3;
assign F1i2L5_inp1 = PP[0][5];
assign F1i2L5_inp2 = PP[1][4];
assign F1i2L5_inp3 = PP[2][3];
wire sF1i2L5, cF1i2L5;
FA F1i2L5( sF1i2L5,cF1i2L5,F1i2L5_inp1,F1i2L5_inp2,F1i2L5_inp3 );

wire Hi2L5_inp1, Hi2L5_inp2;
assign Hi2L5_inp1 = PP[3][2];
assign Hi2L5_inp2 = PP[4][1];
wire sHi2L5, cHi2L5;
HA Hi2L5 ( sHi2L5,cHi2L5,Hi2L5_inp1,Hi2L5_inp2 );

wire F1i2L6_inp1, F1i2L6_inp2, F1i2L6_inp3;
assign F1i2L6_inp1 = PP[2][4];
assign F1i2L6_inp2 = PP[3][3];
assign F1i2L6_inp3 = PP[4][2];
wire sF1i2L6, cF1i2L6;
FA F1i2L6( sF1i2L6,cF1i2L6,F1i2L6_inp1,F1i2L6_inp2,F1i2L6_inp3 );

wire F2i2L6_inp1, F2i2L6_inp2, F2i2L6_inp3;
assign F2i2L6_inp1 = PP[5][1];
assign F2i2L6_inp2 = PP[6][0];
assign F2i2L6_inp3 = sHi1L6;
wire sF2i2L6, cF2i2L6;
FA F2i2L6( sF2i2L6,cF2i2L6,F2i2L6_inp1,F2i2L6_inp2,F2i2L6_inp3 );

wire F1i2L7_inp1, F1i2L7_inp2, F1i2L7_inp3;
assign F1i2L7_inp1 = PP[5][2];
assign F1i2L7_inp2 = PP[6][1];
assign F1i2L7_inp3 = PP[7][0];
wire sF1i2L7, cF1i2L7;
FA F1i2L7( sF1i2L7,cF1i2L7,F1i2L7_inp1,F1i2L7_inp2,F1i2L7_inp3 );

wire F2i2L7_inp1, F2i2L7_inp2, F2i2L7_inp3;
assign F2i2L7_inp1 = cHi1L6;
assign F2i2L7_inp2 = sF1i1L7;
assign F2i2L7_inp3 = sHi1L7;
wire sF2i2L7, cF2i2L7;
FA F2i2L7( sF2i2L7,cF2i2L7,F2i2L7_inp1,F2i2L7_inp2,F2i2L7_inp3 );

wire F1i2L8_inp1, F1i2L8_inp2, F1i2L8_inp3;
assign F1i2L8_inp1 = PP[6][2];
assign F1i2L8_inp2 = PP[7][1];
assign F1i2L8_inp3 = cF1i1L7;
wire sF1i2L8, cF1i2L8;
FA F1i2L8( sF1i2L8,cF1i2L8,F1i2L8_inp1,F1i2L8_inp2,F1i2L8_inp3 );

wire F2i2L8_inp1, F2i2L8_inp2, F2i2L8_inp3;
assign F2i2L8_inp1 = cHi1L7;
assign F2i2L8_inp2 = sF1i1L8;
assign F2i2L8_inp3 = sHi1L8;
wire sF2i2L8, cF2i2L8;
FA F2i2L8( sF2i2L8,cF2i2L8,F2i2L8_inp1,F2i2L8_inp2,F2i2L8_inp3 );

wire F1i2L9_inp1, F1i2L9_inp2, F1i2L9_inp3;
assign F1i2L9_inp1 = PP[5][4];
assign F1i2L9_inp2 = PP[6][3];
assign F1i2L9_inp3 = PP[7][2];
wire sF1i2L9, cF1i2L9;
FA F1i2L9( sF1i2L9,cF1i2L9,F1i2L9_inp1,F1i2L9_inp2,F1i2L9_inp3 );

wire F2i2L9_inp1, F2i2L9_inp2, F2i2L9_inp3;
assign F2i2L9_inp1 = cF1i1L8;
assign F2i2L9_inp2 = cHi1L8;
assign F2i2L9_inp3 = sF1i1L9;
wire sF2i2L9, cF2i2L9;
FA F2i2L9( sF2i2L9,cF2i2L9,F2i2L9_inp1,F2i2L9_inp2,F2i2L9_inp3 );

wire F1i2L10_inp1, F1i2L10_inp2, F1i2L10_inp3;
assign F1i2L10_inp1 = PP[3][7];
assign F1i2L10_inp2 = PP[4][6];
assign F1i2L10_inp3 = PP[5][5];
wire sF1i2L10, cF1i2L10;
FA F1i2L10( sF1i2L10,cF1i2L10,F1i2L10_inp1,F1i2L10_inp2,F1i2L10_inp3 );

wire F2i2L10_inp1, F2i2L10_inp2, F2i2L10_inp3;
assign F2i2L10_inp1 = PP[6][4];
assign F2i2L10_inp2 = PP[7][3];
assign F2i2L10_inp3 = cF1i1L9;
wire sF2i2L10, cF2i2L10;
FA F2i2L10( sF2i2L10,cF2i2L10,F2i2L10_inp1,F2i2L10_inp2,F2i2L10_inp3 );

wire F1i2L11_inp1, F1i2L11_inp2, F1i2L11_inp3;
assign F1i2L11_inp1 = PP[4][7];
assign F1i2L11_inp2 = PP[5][6];
assign F1i2L11_inp3 = PP[6][5];
wire sF1i2L11, cF1i2L11;
FA F1i2L11( sF1i2L11,cF1i2L11,F1i2L11_inp1,F1i2L11_inp2,F1i2L11_inp3 );



///////////// Iteration Number =3///////////////////





wire Hi3L3_inp1, Hi3L3_inp2;
assign Hi3L3_inp1 = PP[0][3];
assign Hi3L3_inp2 = PP[1][2];
wire sHi3L3, cHi3L3;
HA Hi3L3 ( sHi3L3,cHi3L3,Hi3L3_inp1,Hi3L3_inp2 );

wire F1i3L4_inp1, F1i3L4_inp2, F1i3L4_inp3;
assign F1i3L4_inp1 = PP[2][2];
assign F1i3L4_inp2 = PP[3][1];
assign F1i3L4_inp3 = PP[4][0];
wire sF1i3L4, cF1i3L4;
FA F1i3L4( sF1i3L4,cF1i3L4,F1i3L4_inp1,F1i3L4_inp2,F1i3L4_inp3 );

wire F1i3L5_inp1, F1i3L5_inp2, F1i3L5_inp3;
assign F1i3L5_inp1 = PP[5][0];
assign F1i3L5_inp2 = cHi2L4;
assign F1i3L5_inp3 = sF1i2L5;
wire sF1i3L5, cF1i3L5;
FA F1i3L5( sF1i3L5,cF1i3L5,F1i3L5_inp1,F1i3L5_inp2,F1i3L5_inp3 );

wire F1i3L6_inp1, F1i3L6_inp2, F1i3L6_inp3;
assign F1i3L6_inp1 = cF1i2L5;
assign F1i3L6_inp2 = cHi2L5;
assign F1i3L6_inp3 = sF1i2L6;
wire sF1i3L6, cF1i3L6;
FA F1i3L6( sF1i3L6,cF1i3L6,F1i3L6_inp1,F1i3L6_inp2,F1i3L6_inp3 );

wire F1i3L7_inp1, F1i3L7_inp2, F1i3L7_inp3;
assign F1i3L7_inp1 = cF1i2L6;
assign F1i3L7_inp2 = cF2i2L6;
assign F1i3L7_inp3 = sF1i2L7;
wire sF1i3L7, cF1i3L7;
FA F1i3L7( sF1i3L7,cF1i3L7,F1i3L7_inp1,F1i3L7_inp2,F1i3L7_inp3 );

wire F1i3L8_inp1, F1i3L8_inp2, F1i3L8_inp3;
assign F1i3L8_inp1 = cF1i2L7;
assign F1i3L8_inp2 = cF2i2L7;
assign F1i3L8_inp3 = sF1i2L8;
wire sF1i3L8, cF1i3L8;
FA F1i3L8( sF1i3L8,cF1i3L8,F1i3L8_inp1,F1i3L8_inp2,F1i3L8_inp3 );

wire F1i3L9_inp1, F1i3L9_inp2, F1i3L9_inp3;
assign F1i3L9_inp1 = cF1i2L8;
assign F1i3L9_inp2 = cF2i2L8;
assign F1i3L9_inp3 = sF1i2L9;
wire sF1i3L9, cF1i3L9;
FA F1i3L9( sF1i3L9,cF1i3L9,F1i3L9_inp1,F1i3L9_inp2,F1i3L9_inp3 );

wire F1i3L10_inp1, F1i3L10_inp2, F1i3L10_inp3;
assign F1i3L10_inp1 = cF1i2L9;
assign F1i3L10_inp2 = cF2i2L9;
assign F1i3L10_inp3 = sF1i2L10;
wire sF1i3L10, cF1i3L10;
FA F1i3L10( sF1i3L10,cF1i3L10,F1i3L10_inp1,F1i3L10_inp2,F1i3L10_inp3 );

wire F1i3L11_inp1, F1i3L11_inp2, F1i3L11_inp3;
assign F1i3L11_inp1 = PP[7][4];
assign F1i3L11_inp2 = cF1i2L10;
assign F1i3L11_inp3 = cF2i2L10;
wire sF1i3L11, cF1i3L11;
FA F1i3L11( sF1i3L11,cF1i3L11,F1i3L11_inp1,F1i3L11_inp2,F1i3L11_inp3 );

wire F1i3L12_inp1, F1i3L12_inp2, F1i3L12_inp3;
assign F1i3L12_inp1 = PP[5][7];
assign F1i3L12_inp2 = PP[6][6];
assign F1i3L12_inp3 = PP[7][5];
wire sF1i3L12, cF1i3L12;
FA F1i3L12( sF1i3L12,cF1i3L12,F1i3L12_inp1,F1i3L12_inp2,F1i3L12_inp3 );



///////////// Iteration Number =4///////////////////





wire Hi4L2_inp1, Hi4L2_inp2;
assign Hi4L2_inp1 = PP[0][2];
assign Hi4L2_inp2 = PP[1][1];
wire sHi4L2, cHi4L2;
HA Hi4L2 ( sHi4L2,cHi4L2,Hi4L2_inp1,Hi4L2_inp2 );

wire F1i4L3_inp1, F1i4L3_inp2, F1i4L3_inp3;
assign F1i4L3_inp1 = PP[2][1];
assign F1i4L3_inp2 = PP[3][0];
assign F1i4L3_inp3 = sHi3L3;
wire sF1i4L3, cF1i4L3;
FA F1i4L3( sF1i4L3,cF1i4L3,F1i4L3_inp1,F1i4L3_inp2,F1i4L3_inp3 );

wire F1i4L4_inp1, F1i4L4_inp2, F1i4L4_inp3;
assign F1i4L4_inp1 = sHi2L4;
assign F1i4L4_inp2 = cHi3L3;
assign F1i4L4_inp3 = sF1i3L4;
wire sF1i4L4, cF1i4L4;
FA F1i4L4( sF1i4L4,cF1i4L4,F1i4L4_inp1,F1i4L4_inp2,F1i4L4_inp3 );

wire F1i4L5_inp1, F1i4L5_inp2, F1i4L5_inp3;
assign F1i4L5_inp1 = sHi2L5;
assign F1i4L5_inp2 = cF1i3L4;
assign F1i4L5_inp3 = sF1i3L5;
wire sF1i4L5, cF1i4L5;
FA F1i4L5( sF1i4L5,cF1i4L5,F1i4L5_inp1,F1i4L5_inp2,F1i4L5_inp3 );

wire F1i4L6_inp1, F1i4L6_inp2, F1i4L6_inp3;
assign F1i4L6_inp1 = sF2i2L6;
assign F1i4L6_inp2 = cF1i3L5;
assign F1i4L6_inp3 = sF1i3L6;
wire sF1i4L6, cF1i4L6;
FA F1i4L6( sF1i4L6,cF1i4L6,F1i4L6_inp1,F1i4L6_inp2,F1i4L6_inp3 );

wire F1i4L7_inp1, F1i4L7_inp2, F1i4L7_inp3;
assign F1i4L7_inp1 = sF2i2L7;
assign F1i4L7_inp2 = cF1i3L6;
assign F1i4L7_inp3 = sF1i3L7;
wire sF1i4L7, cF1i4L7;
FA F1i4L7( sF1i4L7,cF1i4L7,F1i4L7_inp1,F1i4L7_inp2,F1i4L7_inp3 );

wire F1i4L8_inp1, F1i4L8_inp2, F1i4L8_inp3;
assign F1i4L8_inp1 = sF2i2L8;
assign F1i4L8_inp2 = cF1i3L7;
assign F1i4L8_inp3 = sF1i3L8;
wire sF1i4L8, cF1i4L8;
FA F1i4L8( sF1i4L8,cF1i4L8,F1i4L8_inp1,F1i4L8_inp2,F1i4L8_inp3 );

wire F1i4L9_inp1, F1i4L9_inp2, F1i4L9_inp3;
assign F1i4L9_inp1 = sF2i2L9;
assign F1i4L9_inp2 = cF1i3L8;
assign F1i4L9_inp3 = sF1i3L9;
wire sF1i4L9, cF1i4L9;
FA F1i4L9( sF1i4L9,cF1i4L9,F1i4L9_inp1,F1i4L9_inp2,F1i4L9_inp3 );

wire F1i4L10_inp1, F1i4L10_inp2, F1i4L10_inp3;
assign F1i4L10_inp1 = sF2i2L10;
assign F1i4L10_inp2 = cF1i3L9;
assign F1i4L10_inp3 = sF1i3L10;
wire sF1i4L10, cF1i4L10;
FA F1i4L10( sF1i4L10,cF1i4L10,F1i4L10_inp1,F1i4L10_inp2,F1i4L10_inp3 );

wire F1i4L11_inp1, F1i4L11_inp2, F1i4L11_inp3;
assign F1i4L11_inp1 = sF1i2L11;
assign F1i4L11_inp2 = cF1i3L10;
assign F1i4L11_inp3 = sF1i3L11;
wire sF1i4L11, cF1i4L11;
FA F1i4L11( sF1i4L11,cF1i4L11,F1i4L11_inp1,F1i4L11_inp2,F1i4L11_inp3 );

wire F1i4L12_inp1, F1i4L12_inp2, F1i4L12_inp3;
assign F1i4L12_inp1 = cF1i2L11;
assign F1i4L12_inp2 = cF1i3L11;
assign F1i4L12_inp3 = sF1i3L12;
wire sF1i4L12, cF1i4L12;
FA F1i4L12( sF1i4L12,cF1i4L12,F1i4L12_inp1,F1i4L12_inp2,F1i4L12_inp3 );

wire F1i4L13_inp1, F1i4L13_inp2, F1i4L13_inp3;
assign F1i4L13_inp1 = PP[6][7];
assign F1i4L13_inp2 = PP[7][6];
assign F1i4L13_inp3 = cF1i3L12;
wire sF1i4L13, cF1i4L13;
FA F1i4L13( sF1i4L13,cF1i4L13,F1i4L13_inp1,F1i4L13_inp2,F1i4L13_inp3 );


assign out1 ={{1'b0},{PP[7][7]},{cF1i4L12},{cF1i4L11},{cF1i4L10},{cF1i4L9},{cF1i4L8},{cF1i4L7},{cF1i4L6},{cF1i4L5},{cF1i4L4},{cF1i4L3},{cHi4L2},{PP[2][0]},{PP[0][1]},{PP[0][0]}};
assign out2 ={{1'b0},{cF1i4L13},{sF1i4L13},{sF1i4L12},{sF1i4L11},{sF1i4L10},{sF1i4L9},{sF1i4L8},{sF1i4L7},{sF1i4L6},{sF1i4L5},{sF1i4L4},{sF1i4L3},{sHi4L2},{PP[1][0]},{1'b0}} ;
endmodule 