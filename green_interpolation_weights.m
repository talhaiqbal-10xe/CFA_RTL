fid = fopen('interpolation_weights.txt');
fmt = [repmat('%d ', 1, 6), '\n'];

w_s_max=256;
w_f_max=256;
w_intrp_s_max=0;
w_intrp_f_max=0;
green_max=0;
d_max=0;
count_s=0;
count_f=0;

while ~feof(fid)
       tline = fgetl(fid);
       index=find(tline==' ');
       x(1)=str2num(tline(1:index(1)-1));
       if(x(1)>d_max)
           d_max=x(1);
       end
       x(2)=str2num(tline(index(1)+1:index(2)-1));
        if(x(2)>w_s_max)
           count_s=count_s+1;
        end
       x(3)=str2num(tline(index(2)+1:index(3)-1));
        if(x(3)>w_f_max)
           count_f=count_f+1;
        end
       x(4)=str2num(tline(index(3)+1:index(4)-1));
        if(x(4)>w_intrp_s_max)
           w_intrp_s_max=x(4);
        end
       x(5)=str2num(tline(index(4)+1:index(5)-1));
        if(x(5)>w_intrp_f_max)
           w_intrp_f_max=x(5);
        end
       x(6)=str2num(tline(index(5)+1:index(6)-1));
        if(x(6)>green_max)
           green_max=x(6);
        end
                
end
fclose(fid);