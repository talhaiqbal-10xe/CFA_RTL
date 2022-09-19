clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('7x7_rawNS.txt','r');
fmt = [repmat('%d ', 1, 1), '\n'];
A = fscanf( fileID , fmt ) ;
fclose(fileID);
%%
fileID = fopen('7x7_rawBinaryNS.txt','w');
fmt = '%s\n';
for i=1:length(A);
    b=fi(A(i),0,12,0);
    b_bin=b.bin;
    fprintf(fileID,fmt,b_bin);
end
fclose(fileID);
    