clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('w_intrp_s_f_tb.txt','w');
fmt = [repmat('%d ', 1, 5), '\n'];
for i=1:100


a = 0;
b =3100;
row=1;
column=1;
diff = floor((a + (b-a).*rand(row,column)));
blend_th0=100;
blend_th1=300;

denomenator=blend_th1-blend_th0;
numenator1=(blend_th1-diff)*255;
numenator2=(diff-blend_th0)*255;

quotient1=floor(numenator1/denomenator);
quotient2=floor(numenator2/denomenator);
if (diff < blend_th0)
    w_s=255;
    w_f=0;
else
    if (diff>blend_th1)
        w_s=0;
        w_f=255;
    else
        w_s = quotient1;
        w_f = quotient2;
    end
end





fprintf(fileID,fmt,diff,blend_th0,blend_th1,w_s,w_f);
end