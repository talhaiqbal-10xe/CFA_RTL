clear all;
% Set the range 
fileID = fopen('equ_38_41_tb.txt','w');
fmt = [repmat('%d ', 1, 8), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

for i=1:100


a = -1*8191;
b = 8191;
row=1;
column=2;
g_hv = (a + (b-a).*rand(row,column));

g_hv(1)=floor(g_hv(1));
g_hv(2)=floor(g_hv(2));

a = 0;
b = 4095;
row=1;
column=1;
green = uint16(a + (b-a).*rand(row,column));


a = 0;
b = 255;
row=1;
column=1;
grad_h = (a + (b-a).*rand(row,column));

grad_v = 255-floor(grad_h);

r_dv=floor((grad_v/256)*(g_hv(1)));
r_dh=floor((floor(grad_h)/256)*(g_hv(2)));

R=green-(floor((r_dh+r_dv)/2));

if (R<0)
    R=0;
else
    if(R>4095)
        R=4095;
    end
end


fprintf(fileID,fmt,green,floor(grad_h),floor(grad_v),g_hv(1),g_hv(2),r_dh,r_dv,R);
 end
fclose(fileID);