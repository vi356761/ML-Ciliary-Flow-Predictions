function [Inew,I_sinusoid] = applysinetransform(Imem2,thr,amp,Bound_img2)
I=Imem2;
nrows = size(I,1);
ncols = size(I,2);
fill = 0;

a = ncols/thr; %S1 Try varying the amplitude of the sin
%ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*-pi*xy(:,1)/nrows)];  %Laevis S9 Flippy = 'YES'
ifcn = @(xy) [xy(:,1), xy(:,2) + a*sin(amp*pi*xy(:,1)/nrows)];
tform = geometricTransform2d(ifcn);
I_sinusoid = imwarp(I,tform,FillValues=fill);

ydif = size(I_sinusoid,1)- size(I,1);
xdif = size(I_sinusoid,2)- size(I,2);

Inew = I_sinusoid(1:end-ydif,1:end-xdif);
%figure;imshowpair(Bound_img2,I)
figure;imshowpair(Bound_img2,Inew)
end