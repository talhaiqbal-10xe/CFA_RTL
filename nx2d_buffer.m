clear all;
% Set the range 
filterBitWidth=5;
NoOfChannels=3;
filterSize=3;
buffer = zeros(filterSize,filterSize,NoOfChannels);
lineSelect=1;

fileID = fopen('nx2d_buffer_3D_tb.txt','w');
fmt = [repmat('%d ', 1, NoOfChannels), '%s','\n'];



%%
for i=1:100


a = 0;
b =2^filterBitWidth-1;
row=1;
column=NoOfChannels;
inp= (a + (b-a).*rand(row,column));
inp_floor= floor(inp);

% upding the buffer

for j=1:NoOfChannels
 if (lineSelect > filterSize)
     lineSelect = 1;
 end
 for k = 1:filterSize-1
     buffer(lineSelect,k,j)=buffer(lineSelect,k+1,j);
 end
    buffer(lineSelect,filterSize,j)=inp_floor(j);
 
end
lineSelect=lineSelect+1;
m=1;
bitStream=[];
for c=1:NoOfChannels
    for row=1:filterSize
        for col=1:filterSize
            vectoried_buffer(m)=buffer(row,col,c);
            b=fi(vectoried_buffer(m),0,4,0);
            bitStream=strcat(b.bin,bitStream);
            m=1+1;
        end
    end
end

    


fprintf(fileID,fmt,flip(inp_floor),bitStream);
 end
fclose(fileID);