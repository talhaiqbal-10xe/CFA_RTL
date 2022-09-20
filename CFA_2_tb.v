`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:36:00 09/19/2022
// Design Name:   CFA_2
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL - Copy/CFA_2_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CFA_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define clockCycle 20
`define row 7
`define col 7



module CFA_2_tb
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
	wire rowUpdate;
	wire colUpdate;
	wire done;
	wire [16:0] readAddress;
	wire [16:0] writeAddress;
	wire [2:0] writeEnable;
	wire [11:0] greenWrite;
	wire [11:0] redWrite;
	wire [11:0] blueWrite;

	// Instantiate the Unit Under Test (UUT)
	CFA_2 uut (
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
		.rowUpdate(rowUpdate), 
		.colUpdate(colUpdate), 
		.done(done), 
		.readAddress(readAddress), 
		.writeAddress(writeAddress), 
		.writeEnable(writeEnable), 
		.greenWrite(greenWrite), 
		.redWrite(redWrite), 
		.blueWrite(blueWrite)
	);

		reg [11:0] buffer [0:4][0:4];
	reg [18:0] grad_hs_sum,grad_vs_sum;
	reg [15:0] grad_hs_abs,grad_vs_abs;
	reg [7:0] scaled_hs,scaled_vs,grad_hf,grad_vf,w_grad_hf,w_grad_vf;
	reg [13:0] green_h,green_v;
	reg [7:0] w_s,w_f;
	reg [12:0] green_s,green_f;
	reg [11:0] greenTemp,greenFinal;
	
	reg [11:0] mem [0:`row * `col -1];
	//reg [11:0] mem_ref_out [0:`row * `col -1];
   reg [11:0] mem_green [0: `row * `col -1];
	reg [11:0] mem_red [0: `row * `col -1];
	reg [11:0] mem_blue [0: `row * `col -1];
	
   
   integer outfile0,outfile1,i;
	initial 
	begin
		// Initialize Inputs
		outfile0=$fopen("7x7VerilogOutputsNS.txt","w");
		outfile1=$fopen("7x7InputsAndOutputs.txt","r");
		$readmemb("7x7_rawBinaryNS.txt", mem);
		$readmemb("7x7init_NS.txt", mem_green);
		$readmemb("7x7init_NS.txt", mem_red);
		$readmemb("7x7init_NS.txt", mem_blue);
		clk = 0;
		rst = 1;
		start =0;
		rowMax = `row;
		colMax = `col;
		grad_th0 = 0;
		grad_th1 = 128;
		intrp_th0 = 77;
		intrp_th1 = 179;
		blend_th0 = 100;
		blend_th1 = 300;
		patternSelect = 2'b00;
		#fullCycle
		rst =0;
		start =1;
		#fullCycle
		start = 0;
		#imageProcessTime
		for (i=0;i<=`row * `col-1;i=i+1)
		begin
		$fwrite(outfile0,"%b\n",mem_green[i]);
		#5;
		end
		#5;
		$fclose(outfile0);
      		

	   end
integer j,k;
initial 
begin
j=0;
k=0;
end

always @ (posedge clk)
if (colUpdate)
    begin
	 j=j+1;
    if (! $feof(outfile1))
	      begin
			k=k+1;
	      $fscanf(outfile1,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
			                 buffer[0][0],buffer[0][1],buffer[0][2],buffer[0][3],buffer[0][4],
								  buffer[1][0],buffer[1][1],buffer[1][2],buffer[1][3],buffer[1][4],
								  buffer[2][0],buffer[2][1],buffer[2][2],buffer[2][3],buffer[2][4],
								  buffer[3][0],buffer[3][1],buffer[3][2],buffer[3][3],buffer[3][4],
								  buffer[4][0],buffer[4][1],buffer[4][2],buffer[4][3],buffer[4][4],
		 						  grad_hs_sum,grad_vs_sum,
								  grad_hs_abs,grad_vs_abs,
								  scaled_hs,scaled_vs,grad_hf,grad_vf,w_grad_hf,w_grad_vf,
								  green_h,green_v,
								  w_s,w_f,
								  green_s,green_f,
								  greenTemp,greenFinal);
			end
		else
		    $fclose(outfile1);
		
	 end
								  
								  
always #halfCycle 
begin 
clk=~clk;
end    
 

always @(*)
begin 
raw = mem[readAddress[12:0]];
greenRead =  mem_green[readAddress[12:0]];
redRead = mem_red[readAddress[12:0]];
blueRead = mem_blue[readAddress[12:0]];
end

always @(posedge clk)
begin
if (writeEnable[0])
    mem_green[writeAddress]=greenWrite;
if (writeEnable[1])
    mem_red[writeAddress]=redWrite;
if (writeEnable[2])
    mem_blue[writeAddress]=blueWrite;
	 
	 
end
      
endmodule

