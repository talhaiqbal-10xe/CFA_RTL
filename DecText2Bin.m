clear all;
% this file is used for the testbench: green_h_v_tb
%%
fileID = fopen('3_70InputsAndOutputs.txt','r');
fmt = [repmat('%d ', 1, 1), '\n'];
A = fscanf( fileID , fmt ) ;
fclose(fileID);
%%
fileID = fopen('3_raw70x70binaryInputsNS.txt','w');
fmt = '%s\n';
for i=1:length(A);
    b=fi(A(i),0,12,0);
    b_bin=b.bin;
    fprintf(fileID,fmt,b_bin);
end
fclose(fileID);
    