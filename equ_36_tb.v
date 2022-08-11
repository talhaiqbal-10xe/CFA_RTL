`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:03 08/10/2022
// Design Name:   equ_36
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_36_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_36
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_36_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] grad;
	reg [13:0] G_m_RB;

	// Outputs
	wire [21:0] RB_deriv;

	// Instantiate the Unit Under Test (UUT)
	equ_36 uut (
		.clk(clk), 
		.rst(rst), 
		.grad(grad), 
		.G_m_RB(G_m_RB),  
		.RB_deriv(RB_deriv)
	);

	reg [21:0] out_mat;
	//wire [21:0] out_shifted;
	//assign out_shifted={RB_deriv[21],RB_deriv[21:1]};
	
	
   wire match;
   assign match= RB_deriv==out_mat;	
   
	integer outfile0;
	
	initial begin
	         clk=0;
            rst=1;
			   #20
			   rst=0;
	         outfile0=$fopen("equ_36_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d \n",
				                   G_m_RB,grad,out_mat); //scan each line and get the value as a decimal.
             
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
