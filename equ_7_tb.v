`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:37:30 07/18/2022
// Design Name:   equ_7
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/equ_7_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_7_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] e1;
	reg [11:0] e2;
	reg [11:0] e3;
	reg [11:0] e4;
	reg [11:0] e5;
	reg [11:0] mean_1;

	// Outputs
	wire [16:0] grad_abs;

	// Instantiate the Unit Under Test (UUT)
	equ_7 uut (
		.clk(clk), 
		.rst(rst), 
		.e1(e1), 
		.e2(e2), 
		.e3(e3), 
		.e4(e4), 
		.e5(e5), 
		.mean_1(mean_1), 
		.grad_abs(grad_abs)
	);

	integer outfile0;
   reg [16:0] grad_mat; 
	initial begin
            clk=0;
				rst=1;
				#20
				rst=0;	
	         outfile0=$fopen("equ_6.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d \n",e1,e2,e3,e4,e5,mean_1,grad_mat); //scan each line and get the value as a decimal.
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
      


