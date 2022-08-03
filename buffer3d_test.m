clear all;
% this file is used for the testbench: green_h_v_tb
%%
row=3;
column=3;
channel=3;
fileID = fopen('buffer_2d_v3_tb.txt','w');
fmt = [repmat('%d ', 1, channel+row*column*channel), '\n'];
buffer_array=zeros(row,column,channel);
%%
k=1;
for i=1:15


a = 0;
b = 255;
r=1;
c=3;
raw = floor((a + (b-a).*rand(r,c)));
if (k>3)
    k=1;
end
buffer_array = buffer (raw,buffer_array,k);
k=k+1;
fprintf(fileID,fmt,raw.',reshape(buffer_array,[1,row*column*channel]));
end