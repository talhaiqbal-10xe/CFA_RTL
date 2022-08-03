clear all;
% this file is used for the testbench: gradients_tb2_2,gradients_2_tb_0719
fileID = fopen('equ_10_11.txt','w');
fmt = [repmat('%d ', 1, 25+4), '\n'];
%fmt = [repmat('%d ', 1, 7), '\n'];
for i=1:10


a = 0;
b = 4095;
row=5;
column=5;
r = uint16(a + (b-a).*rand(row,column));

r1=sum(r(1,:));
r2=sum(r(2,:));
r3=sum(r(3,:));
r4=sum(r(4,:));
r5=sum(r(5,:));

r2_scaled=r2*2;
r4_scaled=r4*2;

r2_complemented=r2_scaled*-1;
r5_complemented=r5*-1;

r_sum=r1+r2_complemented+r4_scaled+r5_complemented;

r_abs=abs(r_sum);

c1=sum(r(:,1));
c2=sum(r(:,2));
c3=sum(r(:,3));
c4=sum(r(:,4));
c5=sum(r(:,5));

c2_scaled=c2*2;
c4_scaled=c4*2;

c2_complemented=c2_scaled*-1;
c5_complemented=c5*-1;

c_sum=c1+c2_complemented+c4_scaled+c5_complemented;

c_abs=abs(c_sum);

scaled_hs = floor((c_abs*255)/(c_abs+r_abs));
scaled_vs= 255-scaled_hs;

% fprintf(fileID,fmt,r.',scaled_hs,scaled_vs);

r1_mean=(floor(r1/5));
r2_mean=(floor(r2/5));
r3_mean=(floor(r3/5));
r4_mean=(floor(r4/5));
r5_mean=(floor(r5/5));

patch_mean=(floor((r1_mean+r2_mean+r3_mean+r4_mean+r5_mean)/5));

c1_mean=(floor(c1/5));
c2_mean=(floor(c2/5));
c3_mean=(floor(c3/5));
c4_mean=(floor(c4/5));
c5_mean=(floor(c5/5));

%fprintf(fileID,fmt,r.',scaled_hs,scaled_vs,r1_mean,r2_mean,r3_mean,r4_mean,r5_mean,c1_mean,c2_mean,c3_mean,c4_mean,c5_mean,patch_mean);
grad_vf = abs((patch_mean-r1_mean))+2*abs((patch_mean-r2_mean))+4*abs((patch_mean-r3_mean))+2*abs((patch_mean-r4_mean))+abs((patch_mean-r5_mean));
grad_hf = abs((patch_mean-c1_mean))+2*abs((patch_mean-c2_mean))+4*abs((patch_mean-c3_mean))+2*abs((patch_mean-c4_mean))+abs((patch_mean-c5_mean));

scaled_hf = floor((grad_hf*255)/(grad_hf+grad_vf));
scaled_vf= 255-scaled_hf;

%fprintf(fileID,fmt,r1_mean,r2_mean,r3_mean,r4_mean,r5_mean,patch_mean,grad_vf);

fprintf(fileID,fmt,r.',scaled_hs,scaled_vs,scaled_hf,scaled_vf);
end
fclose(fileID);