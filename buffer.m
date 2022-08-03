function [out] = buffer (new_inp,buffer_array,row_select)
[rows columns channels] = size(buffer_array);
assert (length(new_inp)== rows)
for i=1:columns-1
    buffer_array(row_select,i,:)=buffer_array(row_select,i+1,:);
end
buffer_array(row_select,columns,:)=new_inp;
out=buffer_array;

    
