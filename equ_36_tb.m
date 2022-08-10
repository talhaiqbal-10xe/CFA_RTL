clear all;
% Set the range 
fileID = fopen('equ_36_tb.txt','w');
fmt = [repmat('%d ', 1, 3), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%%
 for i=1:100


a = -1*8191;
b = 8191;
row=1;
column=1;
r = (a + (b-a).*rand(row,column));



a = 0;
b = 255;
row=1;
column=1;
grad = (a + (b-a).*rand(row,column));

grad1 = floor(grad)/256;

fprintf(fileID,fmt,floor(r),floor(grad),floor(r*grad1));
 end
fclose(fileID);