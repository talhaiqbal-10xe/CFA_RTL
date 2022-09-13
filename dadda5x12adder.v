`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:52:07 09/12/2022 
// Design Name: 
// Module Name:    dadda5x12adder 
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
module dadda5x12adder(
input [11:0] a,b,c,d,e,
output [14:0] out
    );
wire [14:0] out1,out2;
adder5x12 adderDadda(out1,out2,a,b,c,d,e);
adder adderFinal( out,out1,out2);

endmodule
