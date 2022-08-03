`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:26 07/13/2022 
// Design Name: 
// Module Name:    PE 
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
module PE
#(parameter pixelBitWidth=12)
(
input clk,rst,start,    // p=pixel_ row coordinate m=minus p=plus , column coordinate m=minus p=plus  
input [pixelBitWidth-1:0] p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2,
input [pixelBitWidth-1:0] p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2,
input [pixelBitWidth-1:0] p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2,
input [pixelBitWidth-1:0] p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2,
input [pixelBitWidth-1:0] p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2,

output reg [7:0] grad_hs,grad_vs,grad_hf,grad_vf,w_grad_hf,w_grad_vf
);

// ---------------- Row adders----------------------------------------------
wire [14:0] out1_row1,out2_row1,out_comp_row1;
adder5x12 row_1(out1_row1,out2_row1,p_m2_m2,p_m2_m1,p_m2_p0,p_m2_p1,p_m2_p2);
adder row_1_adder(out_comp_row1,out1_row1,out2_row1);

wire [14:0] out1_row2,out2_row2,out_comp_row2;
adder5x12 row_2(out1_row2,out2_row2,p_m1_m2,p_m1_m1,p_m1_p0,p_m1_p1,p_m1_p2);
adder row_2_adder(out_comp_row2,out1_row2,out2_row2);

wire [14:0] out1_row3,out2_row3,out_comp_row3;
adder5x12 row_3(out1_row3,out2_row3,p_p0_m2,p_p0_m1,p_p0_p0,p_p0_p1,p_p0_p2);
adder row_3_adder(out_comp_row3,out1_row3,out2_row3);

wire [14:0] out1_row4,out2_row4,out_comp_row4;
adder5x12 row_4(out1_row4,out2_row4,p_p1_m2,p_p1_m1,p_p1_p0,p_p1_p1,p_p1_p2);
adder row_4_adder(out_comp_row3,out1_row3,out2_row3);


wire [14:0] out1_row5,out2_row5,out_comp_row5;
adder5x12 row_5(out1_row5,out2_row5,p_p2_m2,p_p2_m1,p_p2_p0,p_p2_p1,p_p2_p2);
adder row_5_adder(out_comp_row5,out1_row5,out2_row5);


// ---------------- Column adders-------------------------------------------

wire [14:0] out1_col1,out2_col1,out_comp_col1;
adder5x12 col_1(out1_col1,out2_col1,p_m2_m2,p_m1_m2,p_p0_m2,p_p1_m2,p_p2_m2);
adder col_1_adder(out_comp_col1,out1_col1,out2_col1);

wire [14:0] out1_col2,out2_col2,out_comp_col2;
adder5x12 col_2(out1_col1,out2_col1,p_m2_m1,p_m1_m1,p_p0_m1,p_p1_m1,p_p2_m1);
adder col_2_adder(out_comp_col2,out1_col2,out2_col2);

wire [14:0] out1_col3,out2_col3,out_comp_col3;
adder5x12 col_3(out1_col3,out2_col3,p_m2_p0,p_m1_p0,p_p0_p0,p_p1_p0,p_p2_p0);
adder col_3_adder(out_comp_col3,out1_col3,out2_col3);

wire [14:0] out1_col4,out2_col4,out_comp_col4;
adder5x12 col_4(out1_col4,out2_col4,p_m2_p1,p_m1_p1,p_p0_p1,p_p1_p1,p_p2_p1);
adder col_4_adder(out_comp_col4,out1_col4,out2_col4);

												
wire [14:0] out1_col5,out2_col5,out_comp_col5;
adder5x12 col_5(out1_col1,out2_col1,p_m2_p2,p_m1_p2,p_p0_p2,p_p1_p2,p_p2_p2);
adder col_5_adder(out_comp_col5,out1_col5,out2_col5);

//--------- columns and rows scaled for spatial gradients-------------------
wire signed [16:0] row2_scaled;
assign row2_scaled = out_comp_row2<<1; 

wire signed [16:0] row4_scaled;
assign row4_scaled = out_comp_row4<<1;

wire signed [16:0] col2_scaled;
assign col2_scaled = out_comp_col2<<1;

wire signed [16:0] col4_scaled;
assign col4_scaled = out_comp_col4<<1;

//-------- 2's complemented numbers------------------------------------------
wire signed [16:0] row2_complement;
twosComplement #(17) row2_comp(row2_complement,row2_scaled);

wire signed [16:0] row5_complement;
twosComplement #(17) row5_comp(row5_complement,{{2'b00},out_comp_row5});

wire signed [16:0] col2_complement;
twosComplement #(17) col2_comp(col2_complement,col2_scaled);

wire signed [16:0] col5_complement;
twosComplement #(17) col5_comp(col5_complement,{{2'b00},out_comp_col5});

//------ grad_hs and grad_vs sum ---------------------------------------------
wire [16:0] grad_hs_sum_out1,grad_hs_sum_out2,grad_hs_sum_comp;
adder4x17 grad_hs_sum(grad_hs_sum_out1,grad_hs_sum_out2,{{2'b00},out_comp_col1},col2_complement,col4_scaled,{{2'b00},out_comp_col5});
adder #(17)  grad_hs_adder(grad_hs_sum_comp,grad_hs_sum_out1,grad_hs_sum_out2);
 
wire [16:0] grad_vs_sum_out1,grad_vs_sum_out2,grad_vs_sum_comp;
adder4x17 grad_vs_sum(grad_vs_sum_out1,grad_vs_sum_out2,{{2'b00},out_comp_row1},row2_complement,row4_scaled,{{2'b00},out_comp_row5});
adder #(17)  grad_hs_adder(grad_vs_sum_comp,grad_vs_sum_out1,grad_vs_sum_out2);

// ------ grad_hs and grad_vs absolute values --------------------------------
wire [16:0] grad_hs_abs_out,grad_vs_abs_out;
abs #(17) grad_hs_abs(grad_hs_abs_out,grad_hs_sum_comp);
abs #(17) grad_vs_abs(grad_vs_abs_out,grad_vs_sum_comp);

//------  zero detect --------------------------------------------------------
wire [16:0] grad_hs_zd_out,grad_vs_zd_out;
zero_detect zd(grad_hs_zd_out,grad_vs_zd_out,grad_hs_abs_out,grad_vs_abs_out);  

//------ grad_hs and grad_vs sum for the divider------------------------------
wire [15:0] grad_hs_vs_sum_out;
adder #(16) grad_hs_vs_sum(grad_hs_vs_sum_out,grad_hs_zd_out[15:0],grad_vs_zd_out[15:0]);

//------ division------------------------------------------------------------
wire [23:0] temp,dividend;
wire [15:0] divisor;
wire [7:0] quotient,scaled_hs,scaled_vs;
wire [15:0] remainder;
assign divisor = grad_hs_vs_sum_out;
assign temp = rad_hs_zd_out<<8; // multiplied by 256
n_bitSubtractor # (24) s1(dividend,temp,24'd1);
divider divider_spatial(quotient,remainder,dividend,divisor);
assign scaled_hs=quotient;
n_bitSubtractor # (24) s2(scaled_vs,8'd255,scaled_hs);









always @ (posedge clk)
if (rst)
begin
grad_hs<=8'b0;
grad_vs<=8'b0;
grad_hf<=8'b0;
grad_vf<=8'b0;
w_grad_hf<=8'b0;
w_grad_vf<=8'b0;
end
else
begin
end

endmodule
