`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:29 08/30/2022 
// Design Name: 
// Module Name:    address_gen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Delay using "row * col_max + col" is 3.383 ns USING DSP48E1 slice 171 LUTs
//              The use of compression tree (mult11x11MAC) resulted in a much longer routing delay of 5.11 ns
//              The combined delay was 6.7 ns
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module address_gen
#(parameter rowBitWidth = 11, parameter colBitWidth = 11, parameter DSP =0)
(

input [colBitWidth -1:0] col_max,
input [rowBitWidth -1:0] row,
input [colBitWidth -1:0] col,
output [colBitWidth+rowBitWidth -1:0] address
 
    );

generate 
if(DSP == 1)
   begin 
   assign address = row * col_max + col;
   end
else
    begin
	 wire [colBitWidth+rowBitWidth -1:0] adder_out1,adder_out2;
    mult11x11MAC m(adder_out1,adder_out2,row,col_max,col);
    adder #(colBitWidth+rowBitWidth) RCA(address,adder_out1,adder_out2);
	 end
endgenerate 	 

endmodule
