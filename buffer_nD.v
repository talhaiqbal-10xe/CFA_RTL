`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:31 08/19/2022 
// Design Name: 
// Module Name:    buffer_nD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module generates NoOfChannels x filterSize x filterSize buffer 
//              which work as line buffers 
//              when enable is asserted, it starts updating N buffers line by line
//              N Data samples comes simulataneously from the memory 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module buffer_nx2D
#(parameter filterSize=5,parameter NoOfChannels=4,parameter filterBitWidth=12,
  parameter filterRowSize= filterSize*filterBitWidth, parameter filterChannelSize=filterRowSize*filterSize
  )
(
input clk,rst,en,
input signed [NoOfChannels*filterBitWidth -1:0] d_in,
output  [NoOfChannels*filterChannelSize -1:0] buffer_data // output from all the buffers
);

reg [filterSize-1:0] lineSelect;
always @ (posedge clk)
if (rst) 
    begin
	 lineSelect <= 1;
	 end
else
    if (en)
	     begin
		  lineSelect<={lineSelect[filterSize-2:0],lineSelect[filterSize-1]};
		  end



genvar j;
generate
for (j=0;j<=NoOfChannels-1;j=j+1)
     begin :buffer
	  buffer_2d_v4 #(filterSize,filterBitWidth) b2D(clk,rst,en,lineSelect,d_in[(j+1)*filterBitWidth-1: j*filterBitWidth],
	                                                                        buffer_data[(j+1)*(filterChannelSize) -1:
	                                                                                        j*filterChannelSize]);
	  end
	  
endgenerate



endmodule
