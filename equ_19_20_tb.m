clear all;
% Set the range 
fileID = fopen('equ_19_20_tb.txt','w');
fmt = [repmat('%d ', 1, 5), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];
blend_th1 = 100;
blend_th2 = 300;

%% 
for i=1:100


a = 0;
b = 400;
row=1;
column=1;
r= (a + (b-a).*rand(row,column));
r_inp= floor(r);

if (r_inp < blend_th1)
    w_intrp_s = 255;
    w_intrp_f =0;
else
    if (r_inp > blend_th2)
        w_intrp_s = 0;
        w_intrp_f =255;
    else
        w_intrp_s = round(((blend_th2-r_inp)*255)/(blend_th2-blend_th1));
        w_intrp_f = round(((r_inp-blend_th1)*255)/(blend_th2-blend_th1));
        
    end
end
fprintf(fileID,fmt,r_inp,blend_th1,blend_th2,w_intrp_s,w_intrp_f);
 end
fclose(fileID);

    

