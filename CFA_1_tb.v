`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:08:10 09/08/2022
// Design Name:   CFA_1
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/CFA_1_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CFA_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define clockCycle 20
`define row 70
`define col 70



module CFA_1_tb
#(parameter halfCycle = `clockCycle/2,parameter imageProcessTime = `row * `col *6,
  parameter fullCycle = `clockCycle)
;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [10:0] rowMax;
	reg [10:0] colMax;
	reg [11:0] raw;
	reg [11:0] greenRead;
	reg [11:0] redRead;
	reg [11:0] blueRead;
	reg [7:0] grad_th0;
	reg [7:0] grad_th1;
	reg [7:0] intrp_th0;
	reg [7:0] intrp_th1;
	reg [8:0] blend_th0;
	reg [8:0] blend_th1;
	reg [1:0] patternSelect;

	// Outputs
	wire [16:0] readAddress; 
	wire [16:0] writeAddress;
	wire [2:0] writeEnable;
	wire [11:0] greenWrite;
	wire [11:0] redWrite;
	wire [11:0] blueWrite;

	// Instantiate the Unit Under Test (UUT)
	CFA_1 uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.rowMax(rowMax), 
		.colMax(colMax), 
		.raw(raw), 
		.greenRead(greenRead), 
		.redRead(redRead), 
		.blueRead(blueRead), 
		.grad_th0(grad_th0), 
		.grad_th1(grad_th1), 
		.intrp_th0(intrp_th0), 
		.intrp_th1(intrp_th1), 
		.blend_th0(blend_th0), 
		.blend_th1(blend_th1), 
		.patternSelect(patternSelect), 
		.readAddress(readAddress), 
		.writeAddress(writeAddress), 
		.writeEnable(writeEnable), 
		.greenWrite(greenWrite), 
		.redWrite(redWrite), 
		.blueWrite(blueWrite)
	);
   
	reg [11:0] mem [0:`row * `col -1];
   reg [11:0] mem_out [0: `row * `col -1];
	
   
   integer outfile0,i;
	initial 
	begin
		// Initialize Inputs
		outfile0=$fopen("4_70rowsRawOutputs.txt","w");
		$readmemb("3_70rowsRawOutputs.txt", mem);
		clk = 0;
		rst = 1;
		start =0 ;
		rowMax = 70;
		colMax = 70;
		greenRead = 0;
		redRead = 0;
		blueRead = 0;
		grad_th0 = 0;
		grad_th1 = 128;
		intrp_th0 = 77;
		intrp_th1 = 179;
		blend_th0 = 100;
		blend_th1 = 300;
		patternSelect = 2'b11;
		
		#fullCycle
		rst =0;
		start =1;
		#fullCycle
		start = 0;
		#imageProcessTime
		for (i=0;i<=`row * `col-1;i=i+1)
		begin
		$fwrite(outfile0,"%b\n",mem_out[i]);
		#5;
		end
		#5;
		$fclose(outfile0);	

	   end
always #halfCycle 
begin 
clk=~clk;
end    

always @(*) 
raw = mem[readAddress[12:0]];

always @(posedge clk)
begin
if (writeEnable[2])
    mem_out[writeAddress]=greenWrite;
end
      
endmodule

