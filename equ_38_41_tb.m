clear all;
% Set the range 
fileID = fopen('equ_38_41_tb.txt','w');
fmt = [repmat('%d ', 1, 8), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];

for i=1:100


a = -1*8191;
b = 8191;
row=1;
column=1;
green_h= (a + (b-a).*rand(row,column));
green_h= floor(green_h);

a = -1*8191;
b = 8191;
row=1;
column=1;
green_v= (a + (b-a).*rand(row,column));
green_v= floor(green_v);



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
grad_h=floor(grad_h);

grad_v = 255-floor(grad_h);

r_dv=floor((grad_v/256)*(green_v));
r_dh=floor((grad_h/256)*(green_h));

R=green-(floor((r_dh+r_dv)/2));

if (R<0)
    R=0;
else
    if(R>4095)
        R=4095;
    end
end


fprintf(fileID,fmt,green,grad_h,grad_v,green_h,green_v,r_dh,r_dv,R);
 end
fclose(fileID);