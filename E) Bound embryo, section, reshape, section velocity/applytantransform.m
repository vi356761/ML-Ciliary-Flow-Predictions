function [Inew,I_sinusoid] = applytantransform(flippy,Imem2,thr,amp,dir,Bound_img2)

if (strcmpi(flippy,'YES')==1)
    I=flip(Imem2,2);
else
    I=Imem2;
end
nrows = size(I,1);
ncols = size(I,2);
fill = 0;

a = ncols/thr; %S1 Try varying the amplitude of the sin
if (strcmpi(dir,'down')==1)
    ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(amp*-pi*xy(:,1)/nrows)];
else
    ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(amp*pi*xy(:,1)/nrows)];
end
tform = geometricTransform2d(ifcn);
I_sinusoid = imwarp(I,tform,FillValues=fill);

ydif = size(I_sinusoid,1)- size(I,1);
xdif = size(I_sinusoid,2)- size(I,2);

if (strcmpi(flippy,'YES')==1)
    Inew = flip(I_sinusoid(1:end-ydif,1:end-xdif),2);
    %figure;imshowpair(Bound_img2,flip(I,2))
    figure;imshowpair(Bound_img2,Inew)
else
    Inew = I_sinusoid(1:end-ydif,1:end-xdif);
    %figure;imshowpair(Bound_img2,I)
    figure;imshowpair(Bound_img2,Inew)
end
end