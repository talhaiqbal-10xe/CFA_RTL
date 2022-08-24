clear all;
% Set the range 
fileID = fopen('equ_16_17_tb.txt','w');
fmt = [repmat('%d ', 1, 6), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%% loop
for i=1:100


a = 0;
b = 4095;
row=1;
column=5;
r= (a + (b-a).*rand(row,column));
r_inp= floor(r);

m2=floor(r_inp(1)/4);
m1=floor(r_inp(2)/2);
c0=floor(r_inp(3)/2);
p1=floor(r_inp(4)/2);
p2=floor(r_inp(5)/4);

g_h_v=-1*m2+m1+c0+p1-1*p2;

fprintf(fileID,fmt,r_inp,g_h_v);
 end
fclose(fileID);


