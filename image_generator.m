a = 0;
b = 255;
row=50;
column=50;
r = uint8(a + (b-a).*rand(row,column));
r_reshaped=reshape(transpose(r),[row*column,1]);
r_fp=fi(r_reshaped,1,12,0);
r_bin=r_fp.bin;
dlmwrite('input_image.mem',r_bin,'delimiter','');
fileID = fopen('input_image.txt','w');
fwrite(fileID,r_reshaped);
fclose(fileID);
coeff=[];

f= [1 0 0 0 2;
    0 1 2 1 0;
    0 0 0 0 0;
    0 -1 -2 -1 0;
    4 0 0 0 5;];
f_size=size(f)
for i=f_size(1):-1:1
    for j = f_size(2):-1:1
        temp=fi(f(i,j),1,8,0);
        coeff=strcat(coeff,temp.hex);
    end
end

c=filter2(f,r,'same')
c_reshaped=reshape(transpose(c),[row*column,1]);
c_fp=fi(c_reshaped,1,12+8,0);
c_bin=c_fp.bin;
dlmwrite('output_image_matlab.txt',c_bin,'delimiter','');



