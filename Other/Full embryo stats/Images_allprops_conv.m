% Test window-based feature extraction
% Play around with different overlap and window sizes
% Plot MCC number, average minimum distance, and uniformity
% Parameters to test: i)window-size ii) window-overlap

%% Window based feature extraction

function [Number,All_Props] = Images_allprops_conv(Master_Images_Col,pf)
%canvass = xExpandMatrix(canvas, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
for loop=1:length(Master_Images_Col)
    Img2 = Master_Images_Col{loop,1};
    blobMeasurements = regionprops(Img2,'Centroid');
    allBlobCentroids = [blobMeasurements.Centroid];
    centroidsX = allBlobCentroids(1:2:end-1);
    centroidsY = allBlobCentroids(2:2:end);
    if(~isempty(centroidsX))
        %Get the MCC cell properties.......................................................
        AA = regionprops(Img2,'Area');
        Area = [AA.Area].';
        OO = regionprops(Img2,'orientation');
        Oreo = [OO.Orientation].';
        CC = regionprops(Img2,'Circularity');
        Circ = [CC.Circularity].';
        Length = regionprops(Img2,'MajorAxisLength');
        L = [Length.MajorAxisLength].';
        Width =  regionprops(Img2,'MinorAxisLength');
        W = [Width.MinorAxisLength].';
        Aspect = L./W;
        All_Props.Area{loop,1} = [Area].*pf^2;
        All_Props.Orient{loop,1} = [Oreo];
        All_Props.Circularity{loop,1} = [Circ];
        All_Props.Aspect{loop,1} = [Aspect];
        All_Props.centx{loop,1} = centroidsX;
        All_Props.centy{loop,1} = centroidsY;
        Number(loop,1) = length(centroidsX);
    else
        All_Props.Area{loop,1} = NaN;
        All_Props.Orient{loop,1} = NaN;
        All_Props.Circularity{loop,1} = NaN;
        All_Props.Aspect{loop,1} = NaN;
        All_Props.centx{loop,1} = NaN;
        All_Props.centy{loop,1} = NaN;
        Number(loop,1) = NaN;
    end
end
end
%% Only comments
% inc=8; sizes=size(CF.MU);blocksize = 448; kj =1:inc:sizes(2)-blocksize;
% inc=2.3; sizes=size(VI.MU);blocksize = 136; kjj =1:inc:sizes(2)-blocksize;