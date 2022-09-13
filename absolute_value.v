`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:02:27 09/12/2022 
// Design Name: 
// Module Name:    absolute_value 
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:31 07/04/2022 
// Design Name: 
// Module Name:    abs 
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
module absolute_value
#(parameter bitwidth=16)
(output  [bitwidth-1:0] out,
 input [bitwidth-1:0] inp);
 
 assign out = inp[bitwidth-1] ? ((~inp)+1'b1) : inp;
 
// wire [bitwidth-1:0] negative;
// twosComplement t(negative,inp);
// always @(*)
// begin
// if (inp[bitwidth-1]==1'b1)
//      out <= negative;
// else
//      out <= inp;
//end
endmodule 