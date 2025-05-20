function Img1 = filter_edge_decision(Img,tol,siz)

Centroids = regionprops(Img,'Centroid');
allBlobCentroids = [Centroids.Centroid];
centroidsX = allBlobCentroids(1:2:end-1);
centroidsY = allBlobCentroids(2:2:end);
xfil_l = tol; xfil_r = siz-tol;
yfil_u = tol; yfil_d = siz-tol;

filt_bound_x = find(centroidsX<xfil_l | centroidsX>xfil_r);
filt_bound_y = find(centroidsY<yfil_u | centroidsY>yfil_d);
all_bound_filt = unique([filt_bound_x ,filt_bound_y]);
all_filt = all_bound_filt.';

Pixeldst = regionprops(Img,'PixelIdxList');
Pixeldst2 ={Pixeldst.PixelIdxList}.';
Pixeldst2(all_filt)= [];

Img1 = zeros(size(Img));

for kk= 1 : length(Pixeldst2)
    Img1(Pixeldst2{kk,1}) = 1;
end

end