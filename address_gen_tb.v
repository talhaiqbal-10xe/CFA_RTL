`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:54 08/30/2022
// Design Name:   address_gen
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/address_gen_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: address_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module address_gen_tb;

	// Inputs
	reg [10:0] col_max;
	reg [10:0] row;
	reg [10:0] col;

	// Outputs
	wire [21:0] address;

	// Instantiate the Unit Under Test (UUT)
	address_gen uut (
		.col_max(col_max), 
		.row(row), 
		.col(col), 
		.address(address) 
	);
      reg [21:0] out_mat;
		wire match;
		assign match = address == out_mat;
		integer outfile0,LHS;
	
	   initial begin
            outfile0=$fopen("address_gen_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            LHS=$fscanf(outfile0,"%d %d %d %d\n",
				                   row,col,col_max,out_mat); //scan each line and get the value as a decimal.
             
				 #20; //wait some time as needed.
             end 
          //once reading and writing is finished, close the file.
          $fclose(outfile0);
           end


endmodule

