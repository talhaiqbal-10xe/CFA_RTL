clear all;
% this file is used for the testbench: gradients_tb2_2,gradients_2_tb_0719
fileID = fopen('pre_equ_24_27_tb.txt','w');
fmt = [repmat('%d ', 1, 8+1), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%%
 for i=1:10


a = 0;
b = 4095;
row=1;
column=8;
r = int16(a + (b-a).*rand(row,column));

delta(1)=r(1)-r(5);
delta(2)=r(2)-r(6);
delta(3)=r(3)-r(7);
delta(4)=r(4)-r(8);

delat_sum=sum(delta);

out=floor(delat_sum/4);

fprintf(fileID,fmt,r,out);
 end
fclose(fileID);