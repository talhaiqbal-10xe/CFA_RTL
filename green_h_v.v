`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:13 07/23/2022 
// Design Name: 
// Module Name:    green_h_v 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: this module implements equ 16 and 17 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module green_h_v
#(parameter pixelBitWidth=12)
(
input clk,rst,
input  [pixelBitWidth-1:0] m2,m1,c,p1,p2, // -2,-1,center,+1,+2
output reg [pixelBitWidth+2 -1:0] out
    );
wire [pixelBitWidth+2 -1:0] adder_inp_m2,adder_inp_m1,adder_inp_c,adder_inp_p1,adder_inp_p2;
wire [pixelBitWidth+2 -1:0] shifted_m2,shifted_m1,shifted_c,shifted_p1,shifted_p2;

assign shifted_m2=m2>>2;
assign shifted_m1=m1>>1;
assign shifted_c=c>>1;
assign shifted_p1=p1>>1;
assign shifted_p2=p2>>2;


//twosComplement #(12) t_c_m2(adder_inp_m2,shifted_m2);
//twosComplement #(12) t_c_p2(adder_inp_p2,shifted_p2);

// the tree lines are same as the middle three lines in the above assing statements
assign adder_inp_m2 =~{2'b00,shifted_m2};
assign adder_inp_m1 = {2'b00,shifted_m1};
assign adder_inp_c  = {2'b00,shifted_c};
assign adder_inp_p1 = {2'b00,shifted_p1};
assign adder_inp_p2 =~{2'b00,shifted_p2};

wire [pixelBitWidth+2+3 -1:0] adder_out1,adder_out2,adder_complete;
adder5x14_cv adder5x14_cv_module(adder_out1,adder_out2,adder_inp_m2,adder_inp_m1,adder_inp_c,adder_inp_p1,adder_inp_p2);
adder #(pixelBitWidth+2+3) adder_comp(adder_complete,adder_out1,adder_out2);

always @(*)
begin
out = adder_complete[pixelBitWidth+1 -1:0];
end


endmodule
