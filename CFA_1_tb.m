clear all;
% Set the range 
fileID = fopen('equ_21_tb.txt','w');
fmt = [repmat('%d ', 1, 6), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%% random image
a = 0;
b = 4095;
row=50;
column=50;
channel =4;
r = (a + (b-a).*rand(channel,row,column));
r_floored = floor(r);

%% buffer initialization 
filterSize = 5;
buffer =zeros(channel,filterSize,filterSize);
offset = -1*floor(filterSize/2);

temp_row=offset;
temp_col=offset;

%% 