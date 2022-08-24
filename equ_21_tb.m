clear all;
% Set the range 
fileID = fopen('equ_21_tb.txt','w');
fmt = [repmat('%d ', 1, 6), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%% 
for i=1:100


a = 0;
b = 255;
row=1;
column=1;
r= (a + (b-a).*rand(row,column));
scaled_h= floor(r);
scaled_v=255-scaled_h;

a = -4095;
b = 4095;
row=1;
column=2;
r= (a + (b-a).*rand(row,column));
g_h= floor(r(1));
g_v= floor(r(2));

s_th = 77;

if ( s_th * scaled_h > scaled_v*256)
    gs=g_v;
else
    if ( s_th * scaled_v > scaled_h*256)
        gs=g_h;
    else
        gs=floor((scaled_h*g_v + scaled_v*g_h)/256);
        
    end
end
fprintf(fileID,fmt,scaled_h,scaled_v,g_h,g_v,s_th,gs);
 end
fclose(fileID);
    