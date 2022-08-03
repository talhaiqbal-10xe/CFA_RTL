`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:03:49 07/18/2022 
// Design Name: 
// Module Name:    mean_calc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: this module calculates means with the help of rows/5
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mean_calc
#(parameter pixelBitWidth=12)
(
input clk,rst,
input [15:0] r1,r2,r3,r4,r5,c1,c2,c3,c4,c5,
output reg[pixelBitWidth-1:0] r1_mean,r2_mean,r3_mean,r4_mean,r5_mean,
output reg [pixelBitWidth-1:0] c1_mean,c2_mean,c3_mean,c4_mean,c5_mean,patch_mean,
output reg ready
    );

wire [15:0] r1_m,r2_m,r3_m,r4_m,r5_m;
wire [15:0] c1_m,c2_m,c3_m,c4_m,c5_m;

wire ready1,ready2,ready3;
entry_wise_mean row_means(clk,rst,r1,r2,r3,r4,r5,r1_m,r2_m,r3_m,r4_m,r5_m,ready1);
entry_wise_mean col_means(clk,rst,c1,c2,c3,c4,c5,c1_m,c2_m,c3_m,c4_m,c5_m,ready2);

wire [14:0] adder_out1,adder_out2,adder_out_comp;

adder5x12 p(adder_out1,adder_out2,r1_m[11:0],r2_m[11:0],r3_m[11:0],r4_m[11:0],r5_m[11:0]);
adder #(15) p_add(adder_out_comp,adder_out1,adder_out2);

wire [32:0] div_out1,div_out2,div_out_comp;

divide_by_5 d(div_out1,div_out2,{1'b0,adder_out_comp});
adder #(33) div_adder(div_out_comp,div_out1,div_out2);

always @(*)
begin
patch_mean = div_out_comp[14+12:14];
r1_mean=r1_m[11:0];
r2_mean=r2_m[11:0];
r3_mean=r3_m[11:0];
r4_mean=r4_m[11:0]; 
r5_mean=r5_m[11:0];
c1_mean=c1_m[11:0];
c2_mean=c2_m[11:0];
c3_mean=c3_m[11:0];
c4_mean=c4_m[11:0];
c5_mean=c5_m[11:0];

end


endmodule
