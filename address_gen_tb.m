clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('address_gen_tb.txt','w');
fmt = [repmat('%d ', 1, 4), '\n'];

%%
for i=1:100


a =1 ;
b = 1080;
row=1;
column=1;
r = floor((a + (b-a).*rand(row,column)));

a =1 ;
b = 1920;
row=1;
column=1;
c = floor((a + (b-a).*rand(row,column)));

col_max=1920;

addr= r*col_max+c;


fprintf(fileID,fmt,r,c,col_max,addr);
end
fclose(fileID);
