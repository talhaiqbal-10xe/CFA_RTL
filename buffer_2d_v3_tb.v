`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:47 08/01/2022
// Design Name:   buffer_2d_v3
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/buffer_2d_v3_tb.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer_2d_v3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buffer_2d_v3_tb;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg [23:0] d_in;

	// Outputs
	wire [215:0] buffer_data;
	wire [0:0] RB_interpolation;

	// Instantiate the Unit Under Test (UUT)
	buffer_2d_v3 uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.d_in(d_in), 
		.buffer_data(buffer_data), 
		.RB_interpolation(RB_interpolation)
	);

	reg [7:0] out_mat [0:2][0:2][0:2];
	reg [7:0] data_in_mat0,data_in_mat1,data_in_mat2;
	integer outfile0,i; 
	initial begin
            clk=0;
				rst=1;
				en=0;
				i=0;
				#20
				en=1;
				rst=0;	
	         outfile0=$fopen("buffer_2d_v3_tb.txt","r");
		      while (! $feof(outfile0)) begin //read until an "end of file" is reached.
            $fscanf(outfile0,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
				                   data_in_mat0,data_in_mat1,data_in_mat2,//scan each line and get the value as a decimal.
										 out_mat[0][0][0],out_mat[0][1][0],out_mat[0][2][0],out_mat[0][0][1],out_mat[0][1][1],out_mat[0][2][1],out_mat[0][0][2],out_mat[0][1][2],out_mat[0][2][2],
										 out_mat[1][0][0],out_mat[1][1][0],out_mat[1][2][0],out_mat[1][0][1],out_mat[1][1][1],out_mat[1][2][1],out_mat[1][0][2],out_mat[1][1][2],out_mat[1][2][2],
										 out_mat[2][0][0],out_mat[2][1][0],out_mat[2][2][0],out_mat[2][0][1],out_mat[2][1][1],out_mat[2][2][1],out_mat[2][0][2],out_mat[2][1][2],out_mat[2][2][2]
										 ); 
             i=i+1;
				 d_in[7:0]=data_in_mat0;
				 d_in[15:8]=data_in_mat1;
				 d_in[23:16]=data_in_mat2;
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
