`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:12:41 07/18/2022 
// Design Name: 
// Module Name:    entry_wise_mean 
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
module entry_wise_mean(
input clk, rst, 
input [15:0] e1,e2,e3,e4,e5,
output reg [15:0] mean_e1,mean_e2,mean_e3,mean_e4,mean_e5,
output reg ready
    );
	 
wire [32:0] m1_out1,m1_out2,m2_out1,m2_out2,m3_out1,m3_out2,m4_out1,m4_out2,m5_out1,m5_out2;
wire [32:0] m1,m2,m3,m4,m5;

divide_by_5 d1(m1_out1,m1_out2,e1);
divide_by_5 d2(m2_out1,m2_out2,e2);
divide_by_5 d3(m3_out1,m3_out2,e3);
divide_by_5 d4(m4_out1,m4_out2,e4);
divide_by_5 d5(m5_out1,m5_out2,e5);

adder #(33) a1(m1,m1_out1,m1_out2);
adder #(33) a2(m2,m2_out1,m2_out2);
adder #(33) a3(m3,m3_out1,m3_out2);
adder #(33) a4(m4,m4_out1,m4_out2);
adder #(33) a5(m5,m5_out1,m5_out2);


always @(*)
begin
mean_e1 = m1[14+16-1:14];
mean_e2 = m2[14+16-1:14];
mean_e3 = m3[14+16-1:14];
mean_e4 = m4[14+16-1:14];
mean_e5 = m5[14+16-1:14];
end
endmodule
