clear all;
% Set the range 
fileID = fopen('equ_23_tb.txt','w');
fmt = [repmat('%d ', 1, 5), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%% 
for i=1:100


a = 0;
b = 255;
row=1;
column=2;
r= (a + (b-a).*rand(row,column));
ws= floor(r(1));
wf= 255-ws;

a = -4096;
b = 4095;
row=1;
column=2;
r= (a + (b-a).*rand(row,column));
gs= floor(r(1));
gf= floor(r(2));

g=floor((gs*ws+gf*wf)/256);

if (g<0)
    g=0;
else
    if (g>4095)
        g=4095;
    else
        g=g;
    end
end

fprintf(fileID,fmt,ws,wf,gs,gf,g);
 end
fclose(fileID);