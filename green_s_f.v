`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:48:27 07/27/2022 
// Design Name: 
// Module Name:    green_s_f 
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
module green_s_f
#(parameter pixelBitWidth=12,parameter weightBitWidth=8,parameter divider=0)
(
input clk,rst,
input [weightBitWidth -1:0] h,v,threshold,
input [pixelBitWidth+1 -1:0] Gh,Gv,
output reg [pixelBitWidth+1 -1:0] green,
output ready
    );

wire [2*weightBitWidth-1:0] th_x_h,th_x_h_out1,th_x_h_out2;
wire [2*weightBitWidth-1:0] th_x_v,th_x_v_out1,th_x_v_out2;
mult8x8 mult_h_module(th_x_h_out1,th_x_h_out2,threshold,h);
mult8x8 mult_v_module(th_x_v_out1,th_x_v_out2,threshold,v);
adder #(2*weightBitWidth) add_h(th_x_h,th_x_h_out1,th_x_h_out2);
adder #(2*weightBitWidth) add_v(th_x_v,th_x_v_out1,th_x_v_out2);

wire condition_h,condition_v;
assign condition_h= th_x_h > {v,8'h00};
assign condition_v= th_x_v > {h,8'h00};


wire [weightBitWidth+pixelBitWidth+1 -1:0] Gv_x_h,Gv_x_h_out1,Gv_x_h_out2;
wire [weightBitWidth+pixelBitWidth+1 -1:0] Gh_x_v,Gh_x_v_out1,Gh_x_v_out2;
mult13x8 term1(Gv_x_h_out1,Gv_x_h_out2,Gv,h);
mult13x8 term2(Gh_x_v_out1,Gh_x_v_out2,Gh,v);
adder #(weightBitWidth+pixelBitWidth+1) add_term1(Gv_x_h,Gv_x_h_out1,Gv_x_h_out2);
adder #(weightBitWidth+pixelBitWidth+1) add_term2(Gh_x_v,Gh_x_v_out1,Gh_x_v_out2);

wire [weightBitWidth+pixelBitWidth+1+1 -1:0] numenator;
adder #(weightBitWidth+pixelBitWidth+1+1) adder_term3(numenator,{Gv_x_h[weightBitWidth+pixelBitWidth+1 -1],Gv_x_h},{Gh_x_v[weightBitWidth+pixelBitWidth+1 -1],Gh_x_v});

wire [pixelBitWidth+1 -1:0]green_third;

generate 
if (divider==1)
    begin
	 // getting dividend ready
	 wire [weightBitWidth+pixelBitWidth+1+1 -1:0] temp1,dividend;
	 absolute_value #(weightBitWidth+pixelBitWidth+1+1) abs_numenator(dividend,numenator);
	 
	 // getting the divider ready
	 wire [weightBitWidth+1 -1:0] divisor;
	 adder #(weightBitWidth+1) adder_divisor_gen(divisor,{1'b0,h},{1'b0,v});
	 
	 // divider 
	 wire [pixelBitWidth+1 -1:0] quotient,quotient_complement;
    wire [weightBitWidth+1 -1:0] remainder;
	 divider #(weightBitWidth+pixelBitWidth+1+1, weightBitWidth+1) divider_green(quotient,remainder,dividend,divisor);
	 
	 // complement to check if the number was originally negative
	 twosComplement #(pixelBitWidth+1) t_c(quotient_complement,quotient);
	 assign green_third = numenator[weightBitWidth+pixelBitWidth+1+1-1] ? quotient_complement : quotient;
	 
	 
	 end
else
    begin
	 wire [weightBitWidth+pixelBitWidth+1+1 -1:0] green_scaled;
	 assign green_scaled = numenator>>8;
	 assign green_third=green_scaled[pixelBitWidth+1 -1:0];
	 end
endgenerate 

always @(*)
case({condition_h,condition_v})
2'b00: green =  green_third;
2'b01: green =  Gh; // MSB extension
2'b10: green =  Gv; // MSB extension
2'b11: green =  green_third;
endcase






endmodule
