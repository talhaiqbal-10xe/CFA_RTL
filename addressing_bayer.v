`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:08 09/04/2022 
// Design Name: 
// Module Name:    addressing_bayer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: this module is the combination of addressing_logic and  
//              bayer_color 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module addressing_bayer
#(parameter addressBitWidth=17, parameter rowBitWidth=11,parameter colBitWidth=11, parameter filterSize =5)
(
input clk,rst,start,
input signed [rowBitWidth -1:0] rowMax,
input signed [colBitWidth -1:0] colMax,
input en,
output [addressBitWidth -1:0] address,
input [1:0] patternSelect,
output  addressValid,
output  ready,done,bufferEnable,
output  rowUpdateFlag,
output  colUpdateFlag,
output  [rowBitWidth -1:0] row,
output  [colBitWidth -1:0] col,
output  [1:0] bayerSymbol
);

// Instantiate the Unit Under Test (UUT)
	addressing_logic conv2dAddressingLogic (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.en(en), 
		.address(address), 
		.addressValid(addressValid), 
		.ready(ready),
      .done(done),
      .bufferEnable(bufferEnable),		
		.rowUpdateFlag(rowUpdateFlag), 
		.colUpdateFlag(colUpdateFlag), 
		.row(row), 
		.col(col)
	);

bayer_color BayerColorModule (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.patternSelect(patternSelect), 
		.rowUpdate(rowUpdateFlag), 
		.colUpdate(colUpdateFlag), 
		.bayerSymbol(bayerSymbol)
	);

endmodule
