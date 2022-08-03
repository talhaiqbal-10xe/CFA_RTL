`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:11 07/29/2022 
// Design Name: 
// Module Name:    buffer_2d_v3 
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
module buffer_2d_v3
#(parameter DataBitWidth=8,parameter FilterSize=3,parameter NoOfChannels=3,parameter FilterBitWidth=3,
  parameter rowSize=FilterSize*DataBitWidth,parameter channelSize = rowSize*FilterSize, // channel size = no of bits in a channel
  parameter filterRowSize= FilterSize*FilterBitWidth, parameter filterChannelSize=filterRowSize*FilterSize
  )
(
input clk,rst,en,
input signed [NoOfChannels*DataBitWidth -1:0] d_in,
output  [DataBitWidth*FilterSize*FilterSize*NoOfChannels -1:0] buffer_data, // output from all the buffers
output [DataBitWidth -1:0]RB_interpolation
    );
reg [FilterSize-1:0] state;	 
wire [DataBitWidth-1:0] data [0:NoOfChannels-1][0:FilterSize-1][0:FilterSize-1];

// reset and enable connections for 1D Buffers
wire rst_out;
assign rst_out = rst;
wire en_out;
assign en_out = en;

// Generating coefficients and data wires
genvar i,j,k,n;
//generate
//for (k=0; k<=NoOfChannels-1; k=k+1)
//begin
//	for ( i=0; i<=FilterSize-1; i=i+1)
//			begin
//			for ( j=0; j<= FilterSize-1; j=j+1)
//					begin
//					assign coeff[k][i][j] = f_coeff[k*channelSize+i*filterRowSize+j*FilterBitWidth+FilterBitWidth-1:
//														     k*channelSize+i*filterRowSize+j*FilterBitWidth];
//					assign data[k][i][j] =	buffer_data[k*channelSize+i*rowSize+(j+1)*DataBitWidth-1:
//																   k*channelSize+i*rowSize+j*DataBitWidth];									  
//	       end
//	  end
//end
//endgenerate


// Generating Buffers
generate
for (k=0;k<=NoOfChannels-1;k=k+1)
begin
for (j=0;j<=FilterSize-1;j=j+1)
     begin :buffer
	  buffer1d #(DataBitWidth,FilterSize) b(clk,rst_out,en_out,state[j],d_in[(k+1)*DataBitWidth-1:k*DataBitWidth],buffer_data[k*channelSize+(j+1)*rowSize-1:
	                                                                                                                        k*channelSize+j*rowSize]);
	  end
end
endgenerate



// shift logic
always @ (posedge clk)
if (rst) 
    begin
	 state <= 1;
	 end
else
    if (en)
	     begin
		  state<={state[FilterSize-2:0],state[FilterSize-1]};
		  end

endmodule
