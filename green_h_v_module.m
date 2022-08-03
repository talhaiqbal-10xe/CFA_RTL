clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('green_h_v_tb.txt','w');
fmt = [repmat('%d ', 1, 6), '\n'];

%%
for i=1:10


a = 0;
b = 4095;
row=1;
column=5;
r = floor((a + (b-a).*rand(row,column)));

r_scaled(1)=-1*floor(r(1)/4);
r_scaled(2)=floor(r(2)/2);
r_scaled(3)=floor(r(3)/2);
r_scaled(4)=floor(r(4)/2);
r_scaled(5)=-1*floor(r(5)/4);

out=sum(r_scaled);
fprintf(fileID,fmt,r.',out);
end




