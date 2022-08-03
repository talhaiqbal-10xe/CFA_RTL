`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:25 07/05/2022 
// Design Name: 
// Module Name:    zero_detect 
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
module zero_detect
#(parameter bitwidth=16)
(
output reg [bitwidth-1:0] grad_h_out,grad_v_out,
input [bitwidth-1:0] grad_h,grad_v

    );
always @(*)
begin
if (grad_h == 0 & grad_v ==0)
    begin
	 grad_h_out = 1;
	 grad_v_out = 1;
	 end
else
    begin
	 grad_h_out = grad_h;
	 grad_v_out = grad_v;
	 end
end

	 

endmodule
