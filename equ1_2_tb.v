`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:01:45 07/15/2022
// Design Name:   equ1_2
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/equ1_2_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ1_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ1_2_tb;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [11:0] e1t1;
	reg [11:0] e1t2;
	reg [11:0] e1t3;
	reg [11:0] e1t4;
	reg [11:0] e1t5;
	reg [11:0] e2t1;
	reg [11:0] e2t2;
	reg [11:0] e2t3;
	reg [11:0] e2t4;
	reg [11:0] e2t5;
	reg [11:0] e3t1;
	reg [11:0] e3t2;
	reg [11:0] e3t3;
	reg [11:0] e3t4;
	reg [11:0] e3t5;
	reg [11:0] e4t1;
	reg [11:0] e4t2;
	reg [11:0] e4t3;
	reg [11:0] e4t4;
	reg [11:0] e4t5;
	reg [11:0] e5t1;
	reg [11:0] e5t2;
	reg [11:0] e5t3;
	reg [11:0] e5t4;
	reg [11:0] e5t5;

	// Outputs
	wire [14:0] e1;
	wire [14:0] e2;
	wire [14:0] e3;
	wire [14:0] e4;
	wire [14:0] e5;
	wire [16:0] grad_out;

	// Instantiate the Unit Under Test (UUT)
	equ1_2 uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.e1t1(e1t1), 
		.e1t2(e1t2), 
		.e1t3(e1t3), 
		.e1t4(e1t4), 
		.e1t5(e1t5), 
		.e2t1(e2t1), 
		.e2t2(e2t2), 
		.e2t3(e2t3), 
		.e2t4(e2t4), 
		.e2t5(e2t5), 
		.e3t1(e3t1), 
		.e3t2(e3t2), 
		.e3t3(e3t3), 
		.e3t4(e3t4), 
		.e3t5(e3t5), 
		.e4t1(e4t1), 
		.e4t2(e4t2), 
		.e4t3(e4t3), 
		.e4t4(e4t4), 
		.e4t5(e4t5), 
		.e5t1(e5t1), 
		.e5t2(e5t2), 
		.e5t3(e5t3), 
		.e5t4(e5t4), 
		.e5t5(e5t5), 
		.e1(e1), 
		.e2(e2), 
		.e3(e3), 
		.e4(e4), 
		.e5(e5), 
		.grad_out(grad_out)
	);

	reg [16:0] absolute_output,absolute_output2;  
integer outfile0;

	initial begin
          clk=0;
          rst=1;
			 #20
			 rst=0;
	       outfile0=$fopen("equ1.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n",
				                   e1t1,e1t2,e1t3,e1t4,e1t5,e2t1,e2t2,e2t3,e2t4,e2t5,e3t1,e3t2,e3t3,e3t4,e3t5,e4t1,
										 e4t2,e4t3,e4t4,e4t5,e5t1,e5t2,e5t3,e5t4,e5t5,absolute_output,absolute_output2); //scan each line and get the value as a decimal.
             #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end
always #10 
begin 
clk=~clk;
end     
 
endmodule

