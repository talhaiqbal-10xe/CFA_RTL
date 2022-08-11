%% Initial
clear all;
% this file is used for the testbench: gradients_tb2_2,gradients_2_tb_0719
fileID = fopen('RB_on_G_tb.txt','w');
fmt = [repmat('%d ', 1, 1+12+4+4+2+2), '\n'];
%% Loop 
for i=1:100


a = 0;
b = 4095;
row=1;
column=13;
r = (a + (b-a).*rand(row,column));
for j=1:column
    r(j)=floor(r(j));
end

a = 0;
b = 255;
row=1;
column=1;
grad_hs = (a + (b-a).*rand(row,column));
grad_hs=floor(grad_hs);
grad_vs=255-grad_hs;


green=r(13);

gv=r(1)+r(4);
gh=r(2)+r(3);
rv=r(5)+r(8);
rh=r(6)+r(7);
bv=r(9)+r(12);
bh=r(10)+r(11);

gr_h=gh-rh;
gr_v=gv-rv;
gb_h=gh-bh;
gb_v=gv-bv;



r_dv=floor((grad_vs/256)*(gr_v));
r_dh=floor((grad_hs/256)*(gr_h));

b_dv=floor((grad_vs/256)*(gb_v));
b_dh=floor((grad_hs/256)*(gb_h));

R=green-(floor((r_dh+r_dv)/2));

if (R<0)
    R=0;
else
    if(R>4095)
        R=4095;
    end
end

B=green-(floor((b_dh+b_dv)/2));

if (B<0)
    B=0;
else
    if(B>4095)
        B=4095;
    end
end


fprintf(fileID,fmt,r,grad_hs,grad_vs,gr_h,gr_v,gb_h,gb_v,r_dv,r_dh,b_dv,b_dh,R,B);
 end
fclose(fileID);