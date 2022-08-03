clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('diff_tb.txt','w');
fmt = [repmat('%d ', 1, 3), '\n'];

%%
for i=1:100


a = -2047;
b = 2047*3;
row=1;
column=2;
r = floor((a + (b-a).*rand(row,column)));


out=abs(r(1)-r(2));
fprintf(fileID,fmt,r.',out);
end