`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:29:56 09/15/2022 
// Design Name: 
// Module Name:    CFA_2 
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

`define idle 3'b001
`define greenIntrp 3'b010
`define RBIntrp 3'b100

module CFA_2

#(// parameters related to addressing logic
  parameter addressBitWidth=17, parameter rowBitWidth=11,parameter colBitWidth=11, parameter filterSize =5,
  parameter dataBitWidth =12,
  // parameters related to buffer
  parameter NoOfChannels=4,parameter filterBitWidth=12,
  parameter filterRowSize= filterSize*filterBitWidth, parameter filterChannelSize=filterRowSize*filterSize
  )
(
input clk,rst,start,
input signed [rowBitWidth -1:0] rowMax,
input signed [colBitWidth -1:0] colMax,
input [dataBitWidth -1:0] raw,
input [dataBitWidth -1:0] greenRead,redRead,blueRead,
input [7:0] grad_th0,grad_th1,intrp_th0,intrp_th1,
input [8:0] blend_th0,blend_th1,
input [1:0] patternSelect,
output rowUpdate,colUpdate,
output reg done,
output  [addressBitWidth -1:0] readAddress,
output reg [addressBitWidth -1:0] writeAddress,
output  [2:0] writeEnable,
output reg [dataBitWidth -1:0] greenWrite,redWrite,blueWrite
);



wire addressValid,bufferReady,rowUpdateFlag,colUpdateFlag,frameDone,bufferEnable;
wire [1:0] bayerSymbol;
wire [rowBitWidth -1:0] row;
wire [colBitWidth -1:0] col;
wire addressEnable;
reg addressStart;
assign addressEnable = 1'b1; 
assign rowUpdate = rowUpdateFlag;
assign colUpdate = colUpdateFlag;

addressing_bayer addressingBayerModule (
		.clk(clk), 
		.rst(rst), 
		.start(addressStart), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.en(addressEnable), 
		.address(readAddress), 
		.patternSelect(patternSelect), 
		.addressValid(addressValid), 
		.ready(bufferReady),
      .done(frameDone),
      .bufferEnable(bufferEnable),		
		.rowUpdateFlag(rowUpdateFlag), 
		.colUpdateFlag(colUpdateFlag), 
		.row(row), 
		.col(col), 
		.bayerSymbol(bayerSymbol)
	);


wire [addressBitWidth -1:0] currentAddressWrite;
counter counterModule (
		.clk(clk), 
		.rst(rst || addressStart), 
		.en(colUpdateFlag), 
		.address(currentAddressWrite)
	);

wire [filterBitWidth -1:0] bufferInputGreen,bufferInputRed,bufferInputBlue,bufferInputRaw;
assign bufferInputGreen = addressValid ? greenRead : 12'd0;
assign bufferInputRed = addressValid ? redRead : 12'd0;
assign bufferInputBlue = addressValid ? blueRead : 12'd0;
assign bufferInputRaw = addressValid ? raw : 12'd0;
wire [NoOfChannels*filterBitWidth -1:0] d_in;
assign d_in = {bufferInputGreen,bufferInputRed,bufferInputBlue,bufferInputRaw};
wire [NoOfChannels*filterChannelSize -1:0] buffer_data; // output from all the buffers

buffer_nx2D Buffer_4D(
		.clk(clk),.rst(rst),.en(bufferEnable),.d_in(d_in),.buffer_data(buffer_data)	);
		
wire [filterBitWidth -1:0] array [0:NoOfChannels-1][0:filterSize-1][0:filterSize-1]; // channel wise data

genvar i,j,k;
generate  
for (i=0; i <= NoOfChannels-1; i=i+1)
     for (j=0; j <= filterSize-1; j=j+1)
	       for (k=0; k <= filterSize-1; k=k+1)
			      assign array[i][j][k]=buffer_data[i*(filterChannelSize)+j*(filterRowSize)+(k+1)*filterBitWidth -1:
														       i*(filterChannelSize)+j*(filterRowSize)+(k)*filterBitWidth];
endgenerate

// registers to save data
reg [filterBitWidth -1:0] regFile [0:NoOfChannels-1][0:filterSize-1][0:filterSize-1];
integer l,m,n;
always @(posedge clk)
if (rst)
    begin
	 for ( l =0 ; l<= NoOfChannels-1; l= l+1)
	      for (m=0; m <= filterSize-1; m=m+1)
			     for (n=0; n <= filterSize-1; n=n+1)
				        regFile [l][m][n] <= 12'd00;
	 end
else
    if (colUpdateFlag)
	     begin
		  for ( l =0 ; l<= NoOfChannels-1; l = l+1)
	          for ( m=0; m <= filterSize-1; m = m+1)
			         for (n=0; n <= filterSize-1; n = n+1)
				            regFile [l][m][n] <= array[l][m][n];
	     end
		  
wire [7:0] grad_hs_temp,grad_vs_temp,grad_hf_temp,grad_vf_temp,w_grad_hf_temp,w_grad_vf_temp;
gradients_3 gradients_module (
      .clk(clk), .rst(rst), .start(start),
		.p_m2_m2(regFile[0][0][0]), .p_m2_m1(regFile[0][0][1]), .p_m2_p0(regFile[0][0][2]), .p_m2_p1(regFile[0][0][3]), .p_m2_p2(regFile[0][0][4]), 
		.p_m1_m2(regFile[0][1][0]), .p_m1_m1(regFile[0][1][1]), .p_m1_p0(regFile[0][1][2]), .p_m1_p1(regFile[0][1][3]), .p_m1_p2(regFile[0][1][4]), 
		.p_p0_m2(regFile[0][2][0]), .p_p0_m1(regFile[0][2][1]), .p_p0_p0(regFile[0][2][2]), .p_p0_p1(regFile[0][2][3]), .p_p0_p2(regFile[0][2][4]), 
		.p_p1_m2(regFile[0][3][0]), .p_p1_m1(regFile[0][3][1]), .p_p1_p0(regFile[0][3][2]), .p_p1_p1(regFile[0][3][3]), .p_p1_p2(regFile[0][3][4]), 
		.p_p2_m2(regFile[0][4][0]), .p_p2_m1(regFile[0][4][1]), .p_p2_p0(regFile[0][4][2]), .p_p2_p1(regFile[0][4][3]), .p_p2_p2(regFile[0][4][4]), 
		.th0(grad_th0), .th1(grad_th1), 
		.grad_hs(grad_hs_temp), .grad_vs(grad_vs_temp), .grad_hf(grad_hf_temp), .grad_vf(grad_vf_temp), 
		.w_grad_hf(w_grad_hf_temp), .w_grad_vf(w_grad_vf_temp) );
		

wire [dataBitWidth -1:0] greenTemp,RonGTemp,BonGTemp,RBTemp;
green_interpolation greenInterpolationModule (
		.clk(clk), 
		.rst(rst), 
		.p_m2_p0(regFile[0][0][2]), 
		.p_m1_p0(regFile[0][1][2]), 
		.p_p0_m2(regFile[0][2][0]),
		.p_p0_m1(regFile[0][2][1]),
		.p_p0_p0(regFile[0][2][2]),
		.p_p0_p1(regFile[0][2][3]),
		.p_p0_p2(regFile[0][2][4]),
		.p_p1_p0(regFile[0][3][2]), 
		.p_p2_p0(regFile[0][4][2]), 
		.scaled_hs(grad_hs_temp), 
		.scaled_vs(grad_vs_temp), 
		.w_grad_hf(w_grad_hf_temp), 
		.w_grad_vf(w_grad_vf_temp), 
		.spatial_th(intrp_th0), 
		.freq_th(intrp_th1), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.green(greenTemp)
	);


RB_on_BR RBonBR_module (
		.clk(clk), 
		.rst(rst), 
		.G_m1_m1(regFile[1][1][1]), 
		.G_m1_p1(regFile[1][1][3]), 
		.G_p1_m1(regFile[1][3][1]), 
		.G_p1_p1(regFile[1][3][3]), 
		.RB_m1_m1(regFile[0][1][1]), 
		.RB_m1_p1(regFile[0][1][3]), 
		.RB_p1_m1(regFile[0][3][1]), 
		.RB_p1_p1(regFile[0][3][3]), 
		.RB(RBTemp)
	);
	

RB_on_G RB_on_G_Module (
		.clk(clk), 
		.rst(rst), 
		.green(regFile[1][2][2]), 
		.gv_m1(regFile[1][1][2]), 
		.gh_m1(regFile[1][2][1]), 
		.gh_p1(regFile[1][2][3]), 
		.gv_p1(regFile[1][3][2]), 
		.rv_m1(regFile[2][1][2]), 
		.rh_m1(regFile[2][2][1]), 
		.rh_p1(regFile[2][2][3]), 
		.rv_p1(regFile[2][3][2]), 
		.bv_m1(regFile[3][1][2]), 
		.bh_m1(regFile[3][2][1]), 
		.bh_p1(regFile[3][2][3]), 
		.bv_p1(regFile[3][3][2]),
		.scaled_hs(grad_hs_temp), 
		.scaled_vs(grad_vs_temp), 
		.red(RonGTemp), 
		.blue(BonGTemp)
	);

reg [2:0] state;
always @(posedge clk)
if (rst)
    begin
	 state <= `idle;
	 done <= 1'b0;
	 end
else
    case (state)
	 `idle : begin
	         if (start)
				    begin
					 state <= `greenIntrp;
					 addressStart<=1'b1;
					 end
	         
				
				end
	 `greenIntrp : begin
	               if (frameDone)
	                   begin
							 addressStart<=1'b1;
						    state<=`RBIntrp;
						    end
						else
						    begin
							 addressStart<=1'b0;
						    state<=`greenIntrp;
							 end
					   end
								  
	 `RBIntrp : begin
               if (frameDone)
	                begin
                      done <= 1'b1;						 
						    state<=`idle;
						 end
					else
						 begin
						 addressStart<=1'b0;
						 state<=`RBIntrp;
						 end           

               end
					 
	 default : state <= `idle;
	 endcase			


reg [1:0] currentBayer;
reg [dataBitWidth -1:0] rawReg;
reg [2:0] delayReg;
always @(posedge clk)
if (rst)
    begin
	 currentBayer <=0;
	 rawReg <= 0;
	 delayReg <= 0;
	 writeAddress <= 0;
	 end
else
    begin
	 if (colUpdateFlag)
	     begin
		  currentBayer <=bayerSymbol;
		  rawReg <= array[0][2][2];
		  writeAddress <= currentAddressWrite;
		  end
	 delayReg[0] <= colUpdateFlag;
	 delayReg[1] <= delayReg[0];
	 delayReg[2] <= delayReg[1];
	 end
assign writeEnable [0] = wrEnGreen && delayReg[2];
assign writeEnable [1] = wrEnRed && delayReg[2];
assign writeEnable [2] = wrEnBlue && delayReg[2];  




reg wrEnGreen,wrEnRed,wrEnBlue;
always @(*)
if (state == `greenIntrp)   // green interpolation is being performed
    begin
    if (currentBayer ==	`green) // the raw pixel is green during green interpplation
        begin
        greenWrite = regFile[0][2][2];
		  wrEnGreen = 1'b1;
		  wrEnRed = 1'b0;
		  wrEnBlue = 1'b0;
		  end 
	 else
	    if (currentBayer ==	`red) // the raw pixel is green during green interpplation
           begin
           greenWrite = greenTemp;
		     redWrite = regFile[0][2][2];
		     wrEnGreen = 1'b1;
		     wrEnRed = 1'b1;
		     wrEnBlue = 1'b0;
		     end
		 else
		     begin
           greenWrite = greenTemp;
		     blueWrite = regFile[0][2][2];
		     wrEnGreen = 1'b1;
		     wrEnRed = 1'b0;
		     wrEnBlue = 1'b1;
		     end
	 end
else
    if (state == `RBIntrp && currentBayer ==	`green )   // green interpolation is being performed
        
		  		begin
				redWrite = RonGTemp;
				blueWrite = BonGTemp;
				wrEnGreen = 1'b0;
				wrEnRed = 1'b1;
				wrEnBlue = 1'b1;
				end 
		  else
				if (state == `RBIntrp && currentBayer ==	`red) // the raw pixel is green during green interpplation
					 begin
					 blueWrite = RBTemp;
					 wrEnGreen = 1'b0;
					 wrEnRed = 1'b0;
					 wrEnBlue = 1'b1;
					 end
			   else
					 if (state == `RBIntrp && currentBayer ==	`blue) // the raw pixel is green during green interpplation
					 begin
					 redWrite = RBTemp;
					 wrEnGreen = 1'b0;
					 wrEnRed = 1'b1;
					 wrEnBlue = 1'b0;
					 end
	     
	 else
	     begin
		  wrEnGreen = 1'b0;
		  wrEnRed = 1'b0;
		  wrEnBlue = 1'b0;
		  end



//    if (state == `RBIntrp)   // green interpolation is being performed
//        
//		  if (currentBayer ==	`green) // the raw pixel is green during green interpplation
//				begin
//				redWrite = RonGTemp;
//				blueWrite = BonGTemp;
//				wrEnGreen = 1'b0;
//				wrEnRed = 1'b1;
//				wrEnBlue = 1'b1;
//				end 
//		  else
//				if (currentBayer ==	`red) // the raw pixel is green during green interpplation
//					 begin
//					 blueWrite = RBTemp;
//					 wrEnGreen = 1'b0;
//					 wrEnRed = 1'b0;
//					 wrEnBlue = 1'b1;
//					 end
//			   else
//					 begin
//					 redWrite = RBTemp;
//					 wrEnGreen = 1'b0;
//					 wrEnRed = 1'b1;
//					 wrEnBlue = 1'b0;
//					end
//	     
//	 else
//	     begin
//		  wrEnGreen = 1'b0;
//		  wrEnRed = 1'b0;
//		  wrEnBlue = 1'b0;
//		  end
		  
endmodule
