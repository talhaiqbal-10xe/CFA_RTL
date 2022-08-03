module adder4x17(
output [18:0] out1,out2,
input [16:0]A,B,C,D );






///////////// Iteration Number =1///////////////////





wire Hi1L0_inp1, Hi1L0_inp2;
assign Hi1L0_inp1 = A[0];
assign Hi1L0_inp2 = B[0];
wire sHi1L0, cHi1L0;
HA Hi1L0 ( sHi1L0,cHi1L0,Hi1L0_inp1,Hi1L0_inp2 );

wire F1i1L1_inp1, F1i1L1_inp2, F1i1L1_inp3;
assign F1i1L1_inp1 = A[1];
assign F1i1L1_inp2 = B[1];
assign F1i1L1_inp3 = C[1];
wire sF1i1L1, cF1i1L1;
FA F1i1L1( sF1i1L1,cF1i1L1,F1i1L1_inp1,F1i1L1_inp2,F1i1L1_inp3 );

wire F1i1L2_inp1, F1i1L2_inp2, F1i1L2_inp3;
assign F1i1L2_inp1 = A[2];
assign F1i1L2_inp2 = B[2];
assign F1i1L2_inp3 = C[2];
wire sF1i1L2, cF1i1L2;
FA F1i1L2( sF1i1L2,cF1i1L2,F1i1L2_inp1,F1i1L2_inp2,F1i1L2_inp3 );

wire F1i1L3_inp1, F1i1L3_inp2, F1i1L3_inp3;
assign F1i1L3_inp1 = A[3];
assign F1i1L3_inp2 = B[3];
assign F1i1L3_inp3 = C[3];
wire sF1i1L3, cF1i1L3;
FA F1i1L3( sF1i1L3,cF1i1L3,F1i1L3_inp1,F1i1L3_inp2,F1i1L3_inp3 );

wire F1i1L4_inp1, F1i1L4_inp2, F1i1L4_inp3;
assign F1i1L4_inp1 = A[4];
assign F1i1L4_inp2 = B[4];
assign F1i1L4_inp3 = C[4];
wire sF1i1L4, cF1i1L4;
FA F1i1L4( sF1i1L4,cF1i1L4,F1i1L4_inp1,F1i1L4_inp2,F1i1L4_inp3 );

wire F1i1L5_inp1, F1i1L5_inp2, F1i1L5_inp3;
assign F1i1L5_inp1 = A[5];
assign F1i1L5_inp2 = B[5];
assign F1i1L5_inp3 = C[5];
wire sF1i1L5, cF1i1L5;
FA F1i1L5( sF1i1L5,cF1i1L5,F1i1L5_inp1,F1i1L5_inp2,F1i1L5_inp3 );

wire F1i1L6_inp1, F1i1L6_inp2, F1i1L6_inp3;
assign F1i1L6_inp1 = A[6];
assign F1i1L6_inp2 = B[6];
assign F1i1L6_inp3 = C[6];
wire sF1i1L6, cF1i1L6;
FA F1i1L6( sF1i1L6,cF1i1L6,F1i1L6_inp1,F1i1L6_inp2,F1i1L6_inp3 );

wire F1i1L7_inp1, F1i1L7_inp2, F1i1L7_inp3;
assign F1i1L7_inp1 = A[7];
assign F1i1L7_inp2 = B[7];
assign F1i1L7_inp3 = C[7];
wire sF1i1L7, cF1i1L7;
FA F1i1L7( sF1i1L7,cF1i1L7,F1i1L7_inp1,F1i1L7_inp2,F1i1L7_inp3 );

wire F1i1L8_inp1, F1i1L8_inp2, F1i1L8_inp3;
assign F1i1L8_inp1 = A[8];
assign F1i1L8_inp2 = B[8];
assign F1i1L8_inp3 = C[8];
wire sF1i1L8, cF1i1L8;
FA F1i1L8( sF1i1L8,cF1i1L8,F1i1L8_inp1,F1i1L8_inp2,F1i1L8_inp3 );

wire F1i1L9_inp1, F1i1L9_inp2, F1i1L9_inp3;
assign F1i1L9_inp1 = A[9];
assign F1i1L9_inp2 = B[9];
assign F1i1L9_inp3 = C[9];
wire sF1i1L9, cF1i1L9;
FA F1i1L9( sF1i1L9,cF1i1L9,F1i1L9_inp1,F1i1L9_inp2,F1i1L9_inp3 );

wire F1i1L10_inp1, F1i1L10_inp2, F1i1L10_inp3;
assign F1i1L10_inp1 = A[10];
assign F1i1L10_inp2 = B[10];
assign F1i1L10_inp3 = C[10];
wire sF1i1L10, cF1i1L10;
FA F1i1L10( sF1i1L10,cF1i1L10,F1i1L10_inp1,F1i1L10_inp2,F1i1L10_inp3 );

wire F1i1L11_inp1, F1i1L11_inp2, F1i1L11_inp3;
assign F1i1L11_inp1 = A[11];
assign F1i1L11_inp2 = B[11];
assign F1i1L11_inp3 = C[11];
wire sF1i1L11, cF1i1L11;
FA F1i1L11( sF1i1L11,cF1i1L11,F1i1L11_inp1,F1i1L11_inp2,F1i1L11_inp3 );

wire F1i1L12_inp1, F1i1L12_inp2, F1i1L12_inp3;
assign F1i1L12_inp1 = A[12];
assign F1i1L12_inp2 = B[12];
assign F1i1L12_inp3 = C[12];
wire sF1i1L12, cF1i1L12;
FA F1i1L12( sF1i1L12,cF1i1L12,F1i1L12_inp1,F1i1L12_inp2,F1i1L12_inp3 );

wire F1i1L13_inp1, F1i1L13_inp2, F1i1L13_inp3;
assign F1i1L13_inp1 = A[13];
assign F1i1L13_inp2 = B[13];
assign F1i1L13_inp3 = C[13];
wire sF1i1L13, cF1i1L13;
FA F1i1L13( sF1i1L13,cF1i1L13,F1i1L13_inp1,F1i1L13_inp2,F1i1L13_inp3 );

wire F1i1L14_inp1, F1i1L14_inp2, F1i1L14_inp3;
assign F1i1L14_inp1 = A[14];
assign F1i1L14_inp2 = B[14];
assign F1i1L14_inp3 = C[14];
wire sF1i1L14, cF1i1L14;
FA F1i1L14( sF1i1L14,cF1i1L14,F1i1L14_inp1,F1i1L14_inp2,F1i1L14_inp3 );

wire F1i1L15_inp1, F1i1L15_inp2, F1i1L15_inp3;
assign F1i1L15_inp1 = A[15];
assign F1i1L15_inp2 = B[15];
assign F1i1L15_inp3 = C[15];
wire sF1i1L15, cF1i1L15;
FA F1i1L15( sF1i1L15,cF1i1L15,F1i1L15_inp1,F1i1L15_inp2,F1i1L15_inp3 );

wire F1i1L16_inp1, F1i1L16_inp2, F1i1L16_inp3;
assign F1i1L16_inp1 = A[16];
assign F1i1L16_inp2 = B[16];
assign F1i1L16_inp3 = C[16];
wire sF1i1L16, cF1i1L16;
FA F1i1L16( sF1i1L16,cF1i1L16,F1i1L16_inp1,F1i1L16_inp2,F1i1L16_inp3 );



///////////// Iteration Number =2///////////////////





wire Hi2L0_inp1, Hi2L0_inp2;
assign Hi2L0_inp1 = C[0];
assign Hi2L0_inp2 = D[0];
wire sHi2L0, cHi2L0;
HA Hi2L0 ( sHi2L0,cHi2L0,Hi2L0_inp1,Hi2L0_inp2 );

wire F1i2L1_inp1, F1i2L1_inp2, F1i2L1_inp3;
assign F1i2L1_inp1 = D[1];
assign F1i2L1_inp2 = cHi1L0;
assign F1i2L1_inp3 = sF1i1L1;
wire sF1i2L1, cF1i2L1;
FA F1i2L1( sF1i2L1,cF1i2L1,F1i2L1_inp1,F1i2L1_inp2,F1i2L1_inp3 );

wire F1i2L2_inp1, F1i2L2_inp2, F1i2L2_inp3;
assign F1i2L2_inp1 = D[2];
assign F1i2L2_inp2 = cF1i1L1;
assign F1i2L2_inp3 = sF1i1L2;
wire sF1i2L2, cF1i2L2;
FA F1i2L2( sF1i2L2,cF1i2L2,F1i2L2_inp1,F1i2L2_inp2,F1i2L2_inp3 );

wire F1i2L3_inp1, F1i2L3_inp2, F1i2L3_inp3;
assign F1i2L3_inp1 = D[3];
assign F1i2L3_inp2 = cF1i1L2;
assign F1i2L3_inp3 = sF1i1L3;
wire sF1i2L3, cF1i2L3;
FA F1i2L3( sF1i2L3,cF1i2L3,F1i2L3_inp1,F1i2L3_inp2,F1i2L3_inp3 );

wire F1i2L4_inp1, F1i2L4_inp2, F1i2L4_inp3;
assign F1i2L4_inp1 = D[4];
assign F1i2L4_inp2 = cF1i1L3;
assign F1i2L4_inp3 = sF1i1L4;
wire sF1i2L4, cF1i2L4;
FA F1i2L4( sF1i2L4,cF1i2L4,F1i2L4_inp1,F1i2L4_inp2,F1i2L4_inp3 );

wire F1i2L5_inp1, F1i2L5_inp2, F1i2L5_inp3;
assign F1i2L5_inp1 = D[5];
assign F1i2L5_inp2 = cF1i1L4;
assign F1i2L5_inp3 = sF1i1L5;
wire sF1i2L5, cF1i2L5;
FA F1i2L5( sF1i2L5,cF1i2L5,F1i2L5_inp1,F1i2L5_inp2,F1i2L5_inp3 );

wire F1i2L6_inp1, F1i2L6_inp2, F1i2L6_inp3;
assign F1i2L6_inp1 = D[6];
assign F1i2L6_inp2 = cF1i1L5;
assign F1i2L6_inp3 = sF1i1L6;
wire sF1i2L6, cF1i2L6;
FA F1i2L6( sF1i2L6,cF1i2L6,F1i2L6_inp1,F1i2L6_inp2,F1i2L6_inp3 );

wire F1i2L7_inp1, F1i2L7_inp2, F1i2L7_inp3;
assign F1i2L7_inp1 = D[7];
assign F1i2L7_inp2 = cF1i1L6;
assign F1i2L7_inp3 = sF1i1L7;
wire sF1i2L7, cF1i2L7;
FA F1i2L7( sF1i2L7,cF1i2L7,F1i2L7_inp1,F1i2L7_inp2,F1i2L7_inp3 );

wire F1i2L8_inp1, F1i2L8_inp2, F1i2L8_inp3;
assign F1i2L8_inp1 = D[8];
assign F1i2L8_inp2 = cF1i1L7;
assign F1i2L8_inp3 = sF1i1L8;
wire sF1i2L8, cF1i2L8;
FA F1i2L8( sF1i2L8,cF1i2L8,F1i2L8_inp1,F1i2L8_inp2,F1i2L8_inp3 );

wire F1i2L9_inp1, F1i2L9_inp2, F1i2L9_inp3;
assign F1i2L9_inp1 = D[9];
assign F1i2L9_inp2 = cF1i1L8;
assign F1i2L9_inp3 = sF1i1L9;
wire sF1i2L9, cF1i2L9;
FA F1i2L9( sF1i2L9,cF1i2L9,F1i2L9_inp1,F1i2L9_inp2,F1i2L9_inp3 );

wire F1i2L10_inp1, F1i2L10_inp2, F1i2L10_inp3;
assign F1i2L10_inp1 = D[10];
assign F1i2L10_inp2 = cF1i1L9;
assign F1i2L10_inp3 = sF1i1L10;
wire sF1i2L10, cF1i2L10;
FA F1i2L10( sF1i2L10,cF1i2L10,F1i2L10_inp1,F1i2L10_inp2,F1i2L10_inp3 );

wire F1i2L11_inp1, F1i2L11_inp2, F1i2L11_inp3;
assign F1i2L11_inp1 = D[11];
assign F1i2L11_inp2 = cF1i1L10;
assign F1i2L11_inp3 = sF1i1L11;
wire sF1i2L11, cF1i2L11;
FA F1i2L11( sF1i2L11,cF1i2L11,F1i2L11_inp1,F1i2L11_inp2,F1i2L11_inp3 );

wire F1i2L12_inp1, F1i2L12_inp2, F1i2L12_inp3;
assign F1i2L12_inp1 = D[12];
assign F1i2L12_inp2 = cF1i1L11;
assign F1i2L12_inp3 = sF1i1L12;
wire sF1i2L12, cF1i2L12;
FA F1i2L12( sF1i2L12,cF1i2L12,F1i2L12_inp1,F1i2L12_inp2,F1i2L12_inp3 );

wire F1i2L13_inp1, F1i2L13_inp2, F1i2L13_inp3;
assign F1i2L13_inp1 = D[13];
assign F1i2L13_inp2 = cF1i1L12;
assign F1i2L13_inp3 = sF1i1L13;
wire sF1i2L13, cF1i2L13;
FA F1i2L13( sF1i2L13,cF1i2L13,F1i2L13_inp1,F1i2L13_inp2,F1i2L13_inp3 );

wire F1i2L14_inp1, F1i2L14_inp2, F1i2L14_inp3;
assign F1i2L14_inp1 = D[14];
assign F1i2L14_inp2 = cF1i1L13;
assign F1i2L14_inp3 = sF1i1L14;
wire sF1i2L14, cF1i2L14;
FA F1i2L14( sF1i2L14,cF1i2L14,F1i2L14_inp1,F1i2L14_inp2,F1i2L14_inp3 );

wire F1i2L15_inp1, F1i2L15_inp2, F1i2L15_inp3;
assign F1i2L15_inp1 = D[15];
assign F1i2L15_inp2 = cF1i1L14;
assign F1i2L15_inp3 = sF1i1L15;
wire sF1i2L15, cF1i2L15;
FA F1i2L15( sF1i2L15,cF1i2L15,F1i2L15_inp1,F1i2L15_inp2,F1i2L15_inp3 );

wire F1i2L16_inp1, F1i2L16_inp2, F1i2L16_inp3;
assign F1i2L16_inp1 = D[16];
assign F1i2L16_inp2 = cF1i1L15;
assign F1i2L16_inp3 = sF1i1L16;
wire sF1i2L16, cF1i2L16;
FA F1i2L16( sF1i2L16,cF1i2L16,F1i2L16_inp1,F1i2L16_inp2,F1i2L16_inp3 );


assign out1 ={{1'b0},{cF1i1L16},{cF1i2L15},{cF1i2L14},{cF1i2L13},{cF1i2L12},{cF1i2L11},{cF1i2L10},{cF1i2L9},{cF1i2L8},{cF1i2L7},{cF1i2L6},{cF1i2L5},{cF1i2L4},{cF1i2L3},{cF1i2L2},{cF1i2L1},{cHi2L0},{sHi1L0}};
assign out2 ={{1'b0},{cF1i2L16},{sF1i2L16},{sF1i2L15},{sF1i2L14},{sF1i2L13},{sF1i2L12},{sF1i2L11},{sF1i2L10},{sF1i2L9},{sF1i2L8},{sF1i2L7},{sF1i2L6},{sF1i2L5},{sF1i2L4},{sF1i2L3},{sF1i2L2},{sF1i2L1},{sHi2L0}} ;
endmodule