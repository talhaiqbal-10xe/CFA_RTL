`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:37 09/01/2022 
// Design Name: 
// Module Name:    addressing_logic 
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
`define idle     5'b00001
`define left     5'b00010
`define middle   5'b00100
`define waiting  5'b01000
`define complete 5'b10000
`define Offset 12'b1111_1111_1110


module addressing_logic
#(parameter addressBitWidth=17, parameter rowBitWidth=11,parameter colBitWidth=11, parameter filterSize =5)
(
input clk,rst,start,
input signed [rowBitWidth -1:0] rowMax,
input signed [colBitWidth -1:0] colMax,
input en,
output [rowBitWidth+colBitWidth -1:0] address,
output addressValid,
output reg ready,
output reg rowUpdateFlag,
output reg colUpdateFlag,
output reg [rowBitWidth -1:0] row,
output reg [colBitWidth -1:0] col
);

reg [4:0] state,nextState;
reg [filterSize-1:0] rowReg,colReg;
reg signed [rowBitWidth :0] tempRow;
reg signed [colBitWidth :0] tempCol;

wire [rowBitWidth -1:0] rowInp;
wire [colBitWidth -1:0] colInp;
assign rowInp = tempRow[rowBitWidth -1:0];
assign colInp = tempCol[colBitWidth -1:0];

wire signed [rowBitWidth :0] offset;
assign offset = `Offset;

// Finding valid Addr
assign addressValid = (tempRow>=0 && tempRow <=rowMax-1) && (tempCol >=0 && tempCol <=colMax-1);

// address generation Block
address_gen address_module(colMax,rowInp,colInp,address);

reg rowComplete,frameComplete;
always @(*)
begin
rowComplete =tempCol == colMax-offset-1 && rowReg[filterSize-1]==1;
frameComplete =tempRow == rowMax-offset-1'b1 && tempCol == colMax-offset-1'b1 && rowReg[filterSize-1]==1;
ready =rowReg[filterSize-1];
end

always @(posedge clk)
if (rst)
    begin
	 state<=`idle;
	 rowReg <=1;
	 colReg <=1; 
	 row<=0;
	 col<=0;
	 tempRow<=12'd0;
	 tempCol<=12'd0;
	 ready<=0;
	 nextState<=`idle;
	 rowUpdateFlag <=1'b0;
	 colUpdateFlag <=1'b0;
	 end
else
    case (state)
	 `idle: begin
	       if(start)
			    begin
				 state<=`left;
				 tempRow<=offset;
				 tempCol<=offset;
				 end				 
			 end

        
	  
	 `left: begin
	        if ( rowReg[filterSize-1]==1'b1) 
			      begin
				   rowReg<={rowReg[filterSize-2:0],rowReg[filterSize-1]};
				   colReg<={colReg[filterSize-2:0],colReg[filterSize-1]};
				   tempCol<=tempCol+1'b1;
				   tempRow<=row+offset;
				   if (colReg[filterSize-1]==1)
				       begin
						 colUpdateFlag <= 1'b1;
						 col<=col+1'b1;
						 if (en)
						     begin
							  state<=`middle;
						     end
						 else
						     begin
							  nextState <= `middle;
							  state <= `waiting;
							  end				  
						     
						 end
				   end
			  else
			      begin
					colUpdateFlag <= 1'b0;
					rowUpdateFlag <= 1'b0;
				   rowReg<={rowReg[filterSize-2:0],rowReg[filterSize-1]};
				   tempRow<=tempRow+1'b1;
				   end
			  end
	
	 `middle:begin // as offset is a negative number so it is being subtracted in the following line for addition,-1 due to 0 as starting index
           if (frameComplete)
			      begin
					colUpdateFlag <= 1'b1;
					state<=`complete;
				   end
			  else
			      if (rowComplete)
				       begin
						 colUpdateFlag <= 1'b1;
						 rowUpdateFlag <= 1'b1;
						 col<=1'b0;
						 tempCol<=offset;
						 row<=row+1'b1;
						 tempRow<=row+offset+1'b1;
					    rowReg<={rowReg[filterSize-2:0],rowReg[filterSize-1]};
						 if (en)
						     begin
							  state<=`left;
						     end
						 else
						     begin
							  nextState <= `left;
							  state <= `waiting;
							  end		
						 end
			      else
				       if (rowReg[filterSize-1]==1'b1)
						     begin
							  colUpdateFlag <= 1'b1;
							  col<=col+1'b1;
							  tempCol<=tempCol+1'b1;
							  tempRow<=row+offset;
							  rowReg<={rowReg[filterSize-2:0],rowReg[filterSize-1]};
							  if (en)
						         begin
							      state<=`middle;
									end
						     else
									begin
									nextState <= `middle;
									state <= `waiting;
									end		
							  end
						 else
						     begin
							  colUpdateFlag <= 1'b0;
							  tempRow<=tempRow+1'b1;
							  rowReg<={rowReg[filterSize-2:0],rowReg[filterSize-1]};
							  end
				  end				  
	 
	 `waiting:begin
	          colUpdateFlag <= 1'b0;
				 rowUpdateFlag <= 1'b0;
	          if (en)
				     begin
					  state <=nextState;
					  end
				 else
				     begin
					  state <=`waiting;
					  end
				 end
				  
				  
    `complete: begin
	           colUpdateFlag <= 1'b0;
	           
				  row<=0;
				  col<=0;
				  tempRow<=0;
				  tempCol<=0;
              if (start)
                 state<=`idle;
				  end
             		 
			 
	 default: state<=`idle;
	 
	 endcase



endmodule
