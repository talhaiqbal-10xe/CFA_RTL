`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:23:23 06/29/2022
// Design Name:   buffer
// Module Name:   C:/Users/user3/Downloads/Documents/convolution_2/comparator.v
// Project Name:  convolution_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comparator;

	// Inputs
	
	// Outputs
	//reg [11:0] mem_matlab;
	reg [12+8-1:0] mem_verilog,mem_matlab;
	wire t;
   assign t=mem_verilog==mem_matlab;
	// Instantiate the Unit Under Test (UUT)
	integer outfile0,outfile1,i;

	initial 
	         begin 
	         outfile0=$fopen("out_image_verilog.txt","r");
				outfile1=$fopen("output_image_matlab.txt","r");
				i=0;
				
		      while (! $feof(outfile0))//read until an "end of file" is reached. 
						begin 
						$fscanf(outfile0,"%b\n",mem_verilog); //scan each line and get the value as a decimal.
						$fscanf(outfile1,"%b\n",mem_matlab);
						#50; //wait some time as needed.
						i=i+1;
						end 
				//once reading and writing is finished, close the file.
				$fclose(outfile0);
				$fclose(outfile1);
				end 

	initial begin
		// Initialize Inputs
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

