clear all;
% Set the range 
fileID = fopen('multiplier_test.txt','w');
fmt = [repmat('%d ', 1, 3), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%%
 for i=1:100


a = -8192;
b = 8191;
row=1;
column=1;
q = int32(a + (b-a).*rand(row,column));


a = 0;
b = 65535;
row=1;
column=1;
p = int32(a + (b-a).*rand(row,column));
fprintf(fileID,fmt,q,p,p*q);
 end
fclose(fileID);