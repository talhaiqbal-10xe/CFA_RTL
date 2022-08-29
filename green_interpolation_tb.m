clear all;
% Set the range 
fileID = fopen('green_interpolation_tb.txt','w');
fmt = [repmat('%d ', 1, 9+2+1+2+4+4+2+1), '\n'];

%% 

for i=1:1000
%% calculation of Gh and Gv
a = 0;
b = 1023;
row=1;
column=9;
r= (a + (b-a).*rand(row,column));
r_inp = floor(r);
inps = r_inp;

m2_v=floor(r_inp(1)/4);
m1_v=floor(r_inp(2)/2);
c0_v=floor(r_inp(5)/2);
p1_v=floor(r_inp(8)/2);
p2_v=floor(r_inp(9)/4);
g_h=-1*m2_v+m1_v+c0_v+p1_v-1*p2_v;

m2_h=floor(r_inp(3)/4);
m1_h=floor(r_inp(4)/2);
c0_h=floor(r_inp(5)/2);
p1_h=floor(r_inp(6)/2);
p2_h=floor(r_inp(7)/4);
g_v=-1*m2_h+m1_h+c0_h+p1_h-1*p2_h;

%% absoulte difference
diff = abs(g_h - g_v);


%% w_intrp_s and w_intrp_f calculation

blend_th1=100;
blend_th2=300;

r_inp=diff;
if (r_inp < blend_th1)
    w_intrp_s = 255;
    w_intrp_f =0;
else
    if (r_inp >= blend_th2)
        w_intrp_s = 0;
        w_intrp_f =255;
    else
        w_intrp_s = floor( ((blend_th2-r_inp)*255)/(blend_th2-blend_th1) );
        w_intrp_f = floor( ((r_inp-blend_th1)*255)/(blend_th2-blend_th1) );
        
    end
end

%% green_s and green_v calculation

a = 0;
b = 255;
row=1;
column=1;
s= (a + (b-a).*rand(row,column));
scaled_h= floor(s);
scaled_v=255-scaled_h;

a = 0;
b = 255;
row=1;
column=2;
w= (a + (b-a).*rand(row,column));
w_grad_hf= floor(w(1));
w_grad_vf= floor(w(2));

s_th = 77;
if ( s_th * scaled_h > scaled_v*256)
    gs=g_v;
else
    if ( s_th * scaled_v > scaled_h*256)
        gs=g_h;
    else
        gs=floor((scaled_h*g_v + scaled_v*g_h)/256);
        
    end
end

f_th = 179;
if ( f_th * w_grad_hf > w_grad_vf*256)
    gf=g_v;
else
    if ( f_th * w_grad_vf > w_grad_hf*256)
        gf=g_h;
    else
        gf=floor((w_grad_hf*g_v + w_grad_vf*g_h)/(w_grad_hf+w_grad_vf));
        if (gf <0)
            gf=ceil(gf);
        else
            gf=floor(gf);
        end
        
    end
end

%% final calculation of g
g=floor((gs*w_intrp_s+gf*w_intrp_f)/256);

if (g<0)
    g=0;
else
    if (g>4095)
        g=4095;
    else
        g=g;
    end
end


fprintf(fileID,fmt,inps, g_h,g_v, diff, w_intrp_s,w_intrp_f, scaled_h,...
    scaled_v,w_grad_hf,w_grad_vf, blend_th1,blend_th2,s_th,f_th, gs,gf,g);
 end
fclose(fileID);