`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:08 09/05/2022 
// Design Name: 
// Module Name:    counter 
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
module counter
#(parameter addressBitWidth=17)
(input clk,rst,en,
output reg [addressBitWidth -1:0] address
);
always @(posedge clk)
if (rst)
    begin
	 address <= 17'd0;
	 end
else
    begin
    if (en)
	     address <= address +1'b1;
	 end


endmodule
