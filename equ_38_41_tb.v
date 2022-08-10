`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:00 08/10/2022
// Design Name:   equ_38_41
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/equ_38_41_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equ_38_41
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equ_38_41_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [11:0] green;
	reg [7:0] scaled_h;
	reg [7:0] scaled_v;
	reg [13:0] green_h;
	reg [13:0] green_v;

	// Outputs
	wire [11:0] RB;

	// Instantiate the Unit Under Test (UUT)
	equ_38_41 uut (
		.clk(clk), 
		.rst(rst), 
		.green(green), 
		.scaled_h(scaled_h), 
		.scaled_v(scaled_v), 
		.green_h(green_h), 
		.green_v(green_v), 
		.RB(RB)
	);

   reg [21:0] RB_dv,RB_dh;
	reg [11:0] RB_mat;
	wire match;
	assign match = RB_mat == RB;
	integer outfile0;
	
	initial begin
	         clk=0;
            rst=1;
			   #20
			   rst=0;
	         outfile0=$fopen("equ_38_41_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d \n",
				                   green,scaled_h,scaled_v,green_h,green_v,RB_dv,RB_dh,RB_mat); //scan each line and get the value as a decimal.
             
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


