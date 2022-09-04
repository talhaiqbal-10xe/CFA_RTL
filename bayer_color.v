`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:40 09/02/2022 
// Design Name: 
// Module Name:    bayer_color 
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
`define green 2'b01
`define red 2'b10
`define blue 2'b11


module bayer_color(
input clk,rst,start,
input [1:0] patternSelect,
input rowUpdate,colUpdate,
output reg [1:0] bayerSymbol
    );

// Bayer Symbol
// 01 for green
// 02 for red
// 03 for blue

// Pattern Select
// 00 RGGB
// 01 GRBG
// 02 GBRG
// 03 BGGR

reg [1:0] line0 [0:1];
reg [1:0] line1 [0:1];

reg lineSelect;

always @(posedge clk)
if(rst)
begin
lineSelect <= 1'b0;
line0[0] <= `red;
line0[1] <= `green;
line1[0] <= `green;
line1[1] <= `blue;
end
else
begin
if (start)
    begin
	 case (patternSelect)
		2'b00 : begin
      line0[0] <= `red;
		line0[1] <= `green;
		line1[0] <= `green;
		line1[1] <= `blue;
		end
		2'b01 : begin
      line0[0] <= `green;
		line0[1] <= `red;
		line1[0] <= `blue;
		line1[1] <= `green;
		end
		2'b10 : begin
      line0[0] <= `green;
		line0[1] <= `blue;
		line1[0] <= `red;
		line1[1] <= `green;
		end
		2'b11 : begin
      line0[0] <= `blue;
		line0[1] <= `green;
		line1[0] <= `green;
		line1[1] <= `red;
		end
	 endcase
	 end
else
    begin
    if(rowUpdate)
      begin
		 lineSelect <= ~lineSelect;
		 case (patternSelect)
			 2'b00 : begin
						line0[0] <= `red;
						line0[1] <= `green;
						line1[0] <= `green;
						line1[1] <= `blue;
						end
			 2'b01 : begin
						line0[0] <= `green;
						line0[1] <= `red;
						line1[0] <= `blue;
						line1[1] <= `green;
						end
			 2'b10 : begin
						line0[0] <= `green;
						line0[1] <= `blue;
						line1[0] <= `red;
						line1[1] <= `green;
						end
			 2'b11 : begin
						line0[0] <= `blue;
						line0[1] <= `green;
						line1[0] <= `green;
						line1[1] <= `red;
						end
		 endcase
		 end
		
	 if(colUpdate & ~rowUpdate)
	   begin		  
		line0[0]<=line0[1];
      line0[1]<=line0[0];
		line1[0]<=line1[1];
      line1[1]<=line1[0];
      end
	    
	 end
end

always @(*)
case (lineSelect)
1'b0:	bayerSymbol = line0[0];
1'b1: bayerSymbol = line1[0];
endcase
	
        



endmodule
