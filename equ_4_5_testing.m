clear all;
% this file is used for the testbench: gradients_tb2_2,gradients_2_tb
fileID = fopen('equ_4_5.txt','w');
fmt = [repmat('%d ', 1, 27), '\n'];
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

fprintf(fileID,fmt,r.',scaled_hs,scaled_vs);
end
fclose(fileID);