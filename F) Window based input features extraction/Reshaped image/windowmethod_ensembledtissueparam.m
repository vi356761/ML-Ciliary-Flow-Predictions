% Test window-based feature extraction
% Play around with different overlap and window sizes
% Plot MCC number, average minimum distance, and uniformity
% Parameters to test: i)window-size ii) window-overlap

%% Window based feature extraction

function [centx, centy, All_Props, n, ro, re, stdro, uniformity, minima, lamda, gamma] = windowmethod_ensembledtissueparam(Master_Images_Col,thresh)
%canvass = xExpandMatrix(canvas, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
 for loop=1:length(Master_Images_Col)
    Img2 = Master_Images_Col{loop,1};
    blobMeasurements = regionprops(Img2,'Centroid');
    allBlobCentroids = [blobMeasurements.Centroid];
    centroidsX = allBlobCentroids(1:2:end-1);
    centroidsY = allBlobCentroids(2:2:end);
%Get the Cell Properties MCC number and average minimum distance
    dist = {};
    if(length(centroidsX)>2)
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
        All_Props.Area{loop,1} = [Area];
        All_Props.Orient{loop,1} = [Oreo];
        All_Props.Circularity{loop,1} = [Circ];
        All_Props.Aspect{loop,1} = [Aspect];
%Get the tissue properties.......................................................
% Number of MCCs, average minimum distance, standard deviation
        n(loop,1)=length(centroidsX);
        centx{loop,1} = centroidsX;
        centy{loop,1} = centroidsY;
        for mm = 1:length(centroidsX)
            x = centroidsX(1,mm);
            y = centroidsY(1,mm);
            for kk=1:length(centroidsX)
                dist{mm,1}(kk,1) = sqrt(((x-centroidsX(1,kk))^2)+ (y-centroidsY(1,kk))^2);
            end
        end
        mindist=zeros(length(dist),1);
        for jj=1:length(dist)
            minarray = mink(dist{jj,1},2);
            mindist(jj,1) = minarray(2,1);
        end
        ro (loop,1) = mean(mindist);
        stdro(loop,1) = std(mindist);
%Get the uniformity
        re(loop,1) = 0.5 * sqrt((size(Img2,1)^2)/length(centroidsX));
        uniformity(loop,1) = ro(loop,1)/re(loop,1);     
%Get wavelength and order parameter
        [~,mi,la] = runautocorrensemble_new(Img2,thresh);
        minima(loop,1) = mi;
        lamda(loop,1) = la;
        gamma(loop,1) = [1 - (sqrt(2).*stdro(loop,1)./lamda(loop,1))];
    else
        All_Props.Area{loop,1} = NaN;
        All_Props.Orient{loop,1} = NaN;
        All_Props.Circularity{loop,1} = NaN;
        All_Props.Aspect{loop,1} = NaN;
        centx{loop,1} = NaN;
        centy{loop,1} = NaN;
        n(loop,1)=NaN;
        ro (loop,1)=NaN;
        stdro(loop,1)=NaN;
        re(loop,1)=NaN;
        uniformity(loop,1)=NaN;
        minima(loop,1) = NaN;
        lamda(loop,1) = NaN;
        gamma(loop,1) = NaN;
    end
  end
 end
%% Only comments
% inc=8; sizes=size(CF.MU);blocksize = 448; kj =1:inc:sizes(2)-blocksize;
% inc=2.3; sizes=size(VI.MU);blocksize = 136; kjj =1:inc:sizes(2)-blocksize;