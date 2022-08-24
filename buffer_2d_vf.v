`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:55:32 08/22/2022 
// Design Name: 
// Module Name:    buffer_2d_vf 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module will be used in making n x row x column buffer 
//              Specifically, this module will implement row x column part of n x row x column
//              Here, row = column , indicated by FilterSize 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module buffer_2d_v4
#(parameter filterSize=3,parameter filterBitWidth=3,
  parameter filterRowSize= filterSize*filterBitWidth, parameter filterChannelSize=filterRowSize*filterSize
  )
(
input clk,rst,en,
input [filterSize -1:0] lineSelect,
input signed [filterBitWidth -1:0] d_in,
output  [filterBitWidth*filterSize*filterSize -1:0] buffer_data // output from all the buffers
);


genvar j;
generate
for (j=0;j<=filterSize-1;j=j+1)
     begin :buffer
	  buffer1d #(filterBitWidth,filterSize) b(clk,rst,en,lineSelect[j],d_in,buffer_data[(j+1)*(filterBitWidth*filterSize) -1:
	                                                                                               j*(filterBitWidth*filterSize)]);
	  end
	  
endgenerate

endmodule
