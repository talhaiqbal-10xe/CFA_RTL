clear all;
% this file is used for the testbench: gradients_tb2_2,gradients_2_tb_0719
fileID = fopen('equ_24_27_tb.txt','w');
fmt = [repmat('%d ', 1, 8+1), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%%
 for i=1:100


a = 0;
b = 4095;
row=1;
column=8;
r = int16(a + (b-a).*rand(row,column));
%r1=floor(r/4);

G=r(1)+r(2)+r(3)+r(4);
RB=r(5)+r(6)+r(7)+r(8);

delta_sum=G-RB;

if(delta_sum<0)
out=ceil(delta_sum/4);
else
out=floor(delta_sum/4);
end


fprintf(fileID,fmt,r,out);
 end
fclose(fileID);