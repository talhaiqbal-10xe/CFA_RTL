clear all;
% Set the range 
fileID = fopen('equ_22_tb.txt','w');
fmt = [repmat('%d ', 1, 6), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

%% 
for i=1:100


a = 0;
b = 255;
row=1;
column=2;
r= (a + (b-a).*rand(row,column));
scaled_h= floor(r(1));
scaled_v= floor(r(2));

a = -4095;
b = 4095;
row=1;
column=2;
r= (a + (b-a).*rand(row,column));
g_h= floor(r(1));
g_v= floor(r(2));

f_th = 179;

if ( f_th * scaled_h > scaled_v*256)
    gf=g_v;
else
    if ( f_th * scaled_v > scaled_h*256)
        gf=g_h;
    else
        gf=(scaled_h*g_v + scaled_v*g_h)/(scaled_h+scaled_v);
        if (gf <0)
            gf=ceil(gf);
        else
            gf=floor(gf);
        end
        
    end
end
fprintf(fileID,fmt,scaled_h,scaled_v,g_h,g_v,f_th,gf);
 end
fclose(fileID);