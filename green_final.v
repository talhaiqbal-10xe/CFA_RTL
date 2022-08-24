`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:35 07/29/2022 
// Design Name: 
// Module Name:    green_final 
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
`define pBits 12
module green_final
#(parameter pixelBitWidth=12,parameter weightBitWidth =8)
(
input clk,rst,
input [weightBitWidth -1:0] w_s,w_f,
input [pixelBitWidth+1 -1:0] green_s,green_f,
output reg [pixelBitWidth -1:0] green 
    );
wire [weightBitWidth+pixelBitWidth+1 -1:0] Gs_x_ws,Gs_x_ws_out1,Gs_x_ws_out2;
wire [weightBitWidth+pixelBitWidth+1 -1:0] Gf_x_wf,Gf_x_wf_out1,Gf_x_wf_out2;
mult13x8 Gs_x_ws_module(Gs_x_ws_out1,Gs_x_ws_out2,green_s,w_s);
mult13x8 Gf_x_wf_module(Gf_x_wf_out1,Gf_x_wf_out2,green_f,w_f);
adder #(weightBitWidth+pixelBitWidth+1) add_Gs_x_ws(Gs_x_ws,Gs_x_ws_out1,Gs_x_ws_out2);
adder #(weightBitWidth+pixelBitWidth+1) add_Gf_x_wf(Gf_x_wf,Gf_x_wf_out1,Gf_x_wf_out2);

wire signed [weightBitWidth+pixelBitWidth+1+1 -1:0] final_add_temp,final_add;
adder #(weightBitWidth+pixelBitWidth+1+1) add_final(final_add_temp,{Gs_x_ws[weightBitWidth+pixelBitWidth+1 -1],Gs_x_ws},{Gf_x_wf[weightBitWidth+pixelBitWidth+1 -1],Gf_x_wf});
assign final_add = final_add_temp>>>8;

wire min_limit,max_limit;
assign min_limit = final_add [weightBitWidth+pixelBitWidth+1+1 -1] == 1'b1;
assign max_limit = final_add >`pBits'd2**pixelBitWidth-1;

always @ (*)
begin
if (min_limit)
    begin
	 green = `pBits'd0;
	 end
else
    if (max_limit)
	     begin
		  green = `pBits'hffff;
		  end
	 else
	     begin
		  green = final_add[pixelBitWidth -1:0];
		  end
end



endmodule
