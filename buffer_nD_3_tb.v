`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:03:57 08/22/2022
// Design Name:   buffer_nx2D
// Module Name:   C:/Users/user3/Downloads/Documents/CFA_RTL/buffer_nD_3_tb.v
// Project Name:  CFA_RTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer_nx2D
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buffer_nD_3_tb;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg [11:0] d_in;

	// Outputs
	wire [107:0] buffer_data;

	// Instantiate the Unit Under Test (UUT)
	buffer_nx2D uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.d_in(d_in), 
		.buffer_data(buffer_data)
	);

	reg [107:0] out_mat;
	integer outfile0;
	wire match;
	assign match = out_mat == buffer_data;

	initial begin
            clk=0;
				rst=1;
				en=1;
				#20
				rst=0;
            #10				
	         outfile0=$fopen("nx2d_buffer_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %b \n",d_in,out_mat); //scan each line and get the value as a decimal.
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

