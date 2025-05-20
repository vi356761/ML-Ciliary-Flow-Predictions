%% Prepare Image using different Z project
%If no different z projection is needed
Imem_adapt = adapthisteq(Imem_rotate); figure;imshow(Imem_adapt)
%Itub_adapt = Itub_rotate;
Itub_adapt = adapthisteq(Itub_rotate); figure;imshow(Itub_adapt)
figure;imshowpair(Imem_adapt,Itub_adapt)

%If no different z projection is needed
%Acetylated Tubulin
Itub_adapt = adapthisteq(Itub_rotate); 
figure;imshowpair(Itub_rotate,Itub_adapt,'montage')
%% Manually using ROI
% Select high and low Zs
% HighZ = Imem_rotate;
% LowZ = Imem_rotate2;
HighZ = histeq(Imem_adapt);
LowZ = Imem_adapt;

% High on to low:
figure;imshow(LowZ)
mas = roipoly;
LowZ(mas) = HighZ(mas);
figure;imshow(LowZ)
Imem_rotate_new = LowZ;

% Low on to high:
% figure;imshow(HighZ)
% mas = roipoly;
% HighZ(mas) = LowZ(mas);
% figure;imshow(HighZ)
% Imem_rotate_new = HighZ;


Imem_adapt2 = adapthisteq(Imem_rotate_new); figure;imshow(Imem_adapt2)
figure;imshowpair(Imem_adapt2,Itub_rotate)
figure;imshowpair(LowZ,Itub_rotate)
%% Manual 2:
% High on to low:
figure;imshow(Imem_rotate)
mas = roipoly;

Im1 = Imem_rotate;
Im1(~mas)=0;
Im2 = adapthisteq(Im1); figure;imshow(Im2)

Ifin = Imem_rotate;
Ifin(mas) = Im2(mas);
figure;imshow(Ifin)

figure;imshowpair(Ifin,Itub_rotate)
%% Auto Project High on to Low
%figure;montage([Imem_adapt LowZ_Adapt])
HighZ = imadjust(Imem_adapt);
figure;imshow(HighZ)

Mem_adjust = Imem_adapt;
%lowfilt= (Imem_adapt<50);
lowfilt= (Imem_adapt>5 & Imem_adapt<50);
%Mem_adjust(lowfilt) = FullZ.Mem(lowfilt);

Mem_adjust(lowfilt) = HighZ(lowfilt);
figure;imshow(Mem_adjust)
%Mem_adapt = adapthisteq(Mem_adjust); figure;imshow(Mem_adapt)
%
%...............................filt2:
%speck=(Mem_adjust>240);
% Mem_adapt2 = histeq(Mem_adjust);figure;imshow(Mem_adapt2)
% lowfilt2 = (Mem_adjust<10);
% Mem_adjust2 = Mem_adjust;
% Mem_adjust2(lowfilt2) = Mem_adapt2(lowfilt2);
% figure;imshow(Mem_adjust2)
%% Method 2:
Mem_adjust = Imem_rotate;
lowfilt= (Imem_adapt>50 & Imem_adapt<75);
%lowfilt2= [lowfilt.*150];
Mem_adjust(lowfilt) = 150;
figure;imshow(Mem_adjust)
%% Read Images
%I1 = imread('F:\Confocal\All Tile Scans\One_One_Flow\8_10_Flow\Tile_Scan_8_16\Cyan_C1-MAX_Sample5.lif - TileScan 2 Merged.tif');
%I1 = imread('F:\Confocal\All Tile Scans\One_One_Flow\8_10_Flow\Tile_Scan_8_16\Magenta_C2-MAX_Sample5.lif - TileScan 2 Merged.tif');
% I1 = imread('D:\Embryo Tile Scans\8_10_22 Data\Confocal\Sample4\Cyan_C2-MAX_Sample4_Tile.tif');
% figure;imshow(I1)
% 
% I2 = imread('D:\Embryo Tile Scans\8_10_22 Data\Confocal\Sample4\Magenta_C2-MAX_Sample4_Tile.tif');
% figure;imshow(I2)
% 
% %revflip1 = 'xdir';
% revflip2 = 'ydir';
% %revflip3 = 'bothdir';
% %Imorient1 = orientimages(I,revflip1);
% Imem= orientimages(I1,revflip2);
% Itub = orientimages(I2,revflip2);
% 
% figure;montage([Imem;Itub],'Size',[1 1])
% %Imorient3 = orientimages(I,revflip3);
% %figure;imshow(Imorient1)
% %figure;imshow(I)
% %figure;imshow(Imorient3)
%% Rotate Image if needed
% angle = 5;
% Imem_rotate = imrotate(Imem,angle,'bicubic','crop');
% %Imem_rotate = imrotate(Imem,10,'bicubic','loose');
% Itub_rotate = imrotate(Itub,angle,'bicubic','crop');
% %Itub_rotate = imrotate(Itub,10,'bicubic','loose');
% figure;montage([Imem_rotate;Itub_rotate],'Size',[1 1])
%% Histograms to find threshold
% grayImage = Imem_rotate;
% figure;
% hObj = histogram(grayImage, 256);
% grid on;
% title('Histogram', 'FontSize', 14, 'Interpreter', 'None')
% % Find threshold.
% counts = hObj.Values;
% counts(1:50) = 0;
% [maxValue, indexOfMax] = max(counts);
% counts(1:indexOfMax) = maxValue;
% [minValue, threshold] = min(counts);
% hold on;
% line([threshold, threshold], ylim, 'Color', 'r', 'LineWidth', 2);
% %plot([threshold,threshold],[0,3000000], '-r', 'LineWidth', 2);
% xticks(0:20:255);
% hold off;
%% Level 1: Remove Blobs
% threshold =200;
% filteredImage = grayImage > threshold;
% figure;imshow(filteredImage)
% mask = roipoly;
% filteredImage(~mask)=0;
% figure;imshow(filteredImage)
%% Level 2: Get the binarized Image  
% Global
% BaseImage1 = imbinarize(grayImage);
% figure;imshow(BaseImage1)
% %Using Greythresh
% level = graythresh(grayImage);
% BaseImage2 = imbinarize(grayImage,level);
% figure;imshow(BaseImage2)
% % Adaptive
% BaseImage3 = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',1);
% figure;imshow(BaseImage3)
% %Manual:
% minthresh = 10;
% BW = grayImage > minthresh;
% BaseImage4 = grayImage;
% BaseImage4(~BW) = 0;
% figure;imshow(BaseImage4)
%% All Manual Segmentation
% thresh1 > 50
% thresh<50 & thresh>1
% BW = (grayImage<10 & grayImage>5);
% figure;imshow(BW)
%% Remove Blobs
% Ifilt1 = I;
% filt = (I>200 & I<255);
% filt2 = (I>255);
% Ifilt1(filt)=20;
% figure;imshow(Ifilt1)

% K = wiener2(I,[5 5]);
% figure;imshow(K)
%% Adjust Contrast
% I2 = imadjust(I);
% figure;imshow(I2)
% 
% I2 = adapthisteq(I);
% figure;imshow(I2)

% I = Imem_rotate;
% I2 = histeq(I);
% figure;imshow(I2)
% 
% J = imadjust(I,stretchlim(I),[]);
% figure
% imshow(J)
% 
% JJ = I2-I;
% figure;imshow(JJ);
% 
% JJ2 = JJ;
% JJind = (JJ==0);
% JJ2(JJind) = mean2(JJ);
% figure;imshow(JJ2)
% 
% JJ3 = adapthisteq(JJ2);
% figure;imshow(JJ3);
%%
% II = abs(I - mean2(I));figure;imshow(II)
% Ifilt =find(I>150);
% Inew=I;
% Inew(Ifilt)=0; figure;imshow(Inew)
% Inew(Ifilt)=mean2(I); figure;imshow(Inew)
% %Ifilt2 = find(I<50 && I>10);
% Ifilt2 = find(I<50 & I>10);
% Inew2=Inew1;
% Inew2(Ifilt2)=150;
% figure;imshow(Inew)
%% Acetylated Tubulin Segmentation
% thresh=150;
% n=2;
% embryo = segment_Act (Itub,thresh,n);
% figure;imshow(embryo)
% %figure;imshowpair(embryo,Itub)
% figure;imshowpair(Itub,embryo)
%% Prepare Image from ImageJ Files
%h = dir('F:\Confocal\All Tile Scans\One_One_Flow\8_30_Flow\Tile_Scan_9_19_22\Tile Series');
namesall = {h(3:end).name}.';
namefilt1 = find(contains(namesall ,'c001.tif'));
namefilt2 = find(contains(namesall ,'c002.tif'));
file1 = namesall(namefilt1);
file2= namesall(namefilt2);
%% Copyfiles
% path=('F:\Confocal\All Tile Scans\One_One_Flow\8_30_Flow\Tile_Scan_9_19_22\Tile Series\');
% finpath1 = ('F:\Confocal\All Tile Scans\One_One_Flow\8_30_Flow\Tile_Scan_9_19_22\Tile Series\Channel1\');
% finpath2 = ('F:\Confocal\All Tile Scans\One_One_Flow\8_30_Flow\Tile_Scan_9_19_22\Tile Series\Channel2\');
% %cd(path);
% % mkdir('Channel1')
% % mkdir('Channel2')
% for kk=1:length(file1)
%     filename1=[path,file1{kk,1}];
%     filename2=[path,file2{kk,1}];
%     despath1 = [finpath1,file1{kk,1}];
%     despath2 = [finpath2,file2{kk,1}];
%     copyfile (filename1,despath1);
%     copyfile (filename2,despath2)
% end
%% Find Rectangle
Ratio = (5612/2862);
numtiles = 64;
cc=0;
% Using Product
for kk=1:numtiles
    if(mod(numtiles,kk)==0)
        cc=cc+1;
        jj = numtiles/kk;
        rat(cc,1)=jj/kk;
        h(cc,1) = kk;
        w(cc,1) = jj;
    end
end
diffrat = abs(rat - Ratio);
[mini,indmin] = min(diffrat);
wid = w(indmin);
ht = h(indmin);

% USing Sum
% for kk=1:numtiles-1
%     jj=numtiles-kk;
%     rat(kk,1) = kk/jj;
% end
% diffrat = abs(rat - Ratio);
% [mini,indmin] = min(diffrat);
% w = indmin;
% h = numtiles-w;
%% Final Processing
Iadapt = adapthisteq(Imem_rotate); figure;imshow(Iadapt)
filt = (Imem_rotate>240);
Imem_rotate_new = Imem_rotate;
Imem_rotate_new(filt) = 50; figure;imshow(Imem_rotate_new)
%%
%Imem_adapt = adapthisteq(Imem_rotate_new); figure;imshow(Imem_adapt)
Imem_adapt = adapthisteq(Imem_rotate); figure;imshow(Imem_adapt)
Itub_adapt = adapthisteq(Itub_rotate); figure;imshow(Itub_adapt)
%% Adjust Membrane Haze
Mem_adjust = Imem_adapt;
upfilt = (Imem_adapt>190);
Mem_adjust(upfilt)=Imem_adapt(upfilt)-(Imem_rotate(upfilt).*2);
figure;imshow(Mem_adjust)
%% Adjust Membrane Haze Using Low Z Projection
% Low Z: Imem_rotate; Imem_adapt
% HighZ: FullZ.Mem; FullZ.Memadapt; FullZ.Memadjust
LowZ = imread('D:\Embryo Tile Scans\Final Trials\Laevis\Trial 1\Confocal\S8\C1-MAX_Stitched_S8_Part2.tif');
LowZ = orientimages(LowZ,'ydir');
LowZ_Mem = imrotate(LowZ,-2.5,'bicubic','crop');
LowZ_Adapt = adapthisteq(LowZ_Mem);
figure;montage([LowZ LowZ_Adapt])
%
figure;imshowpair(LowZ_Adapt,Itub_rotate)
I_tub2 = [Itub_rotate.*0.25];
figure;imshow(I_tub2)
figure;imshowpair(LowZ_Adapt,I_tub2)
%% Adjust after sectioning
HH1 = adapthisteq(HH);
MM1 = adapthisteq(MM);
MU1 = adapthisteq(MU);
MD1 = adapthisteq(MD);
TT1 = adapthisteq(TT);
%%
figure;
%subplot(2,2,1); imshow(Imem_rotate)
%subplot(2,2,1); imshow(Itub_rotate)

subplot(2,2,1); imshow(Imem_adapt)
%subplot(2,2,1); imshow(Itub_adapt)

title('Full Embryo')
subplot(2,2,2); imshow(HH1)
title('Head Section')
subplot(2,2,3); imshow(MM1)
title('Mid Section')
subplot(2,2,4); imshow(TT1)
title('Tail Section')

figure;
subplot(1,2,1); imshow(MU1)
title('Mid-up')
subplot(1,2,2); imshow(MD1)
title('Mid-down')
%% Enhance Image
% H_mem = imread('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Middown\Middown_Mem.tif');
% H_act = imread('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Middown\Middown_Act.tif');
%%
% H_mem2 = adapthisteq(H_mem);
% H_act2 = imadjust(H_act);
% %H_act2 = adapthisteq(H_act);
% %H_act2 = histeq(H_act);
% figure;imshowpair(H_mem2,H_act2);
% figure;imshowpair(H_act,H_act2,'montage');
%%
% I = imread('F:\Venkat\Edited\1 hr trimmed-20000.tif');
% II1 = rgb2gray(I);
%% Using Wiener
% %I1 = adapthisteq(II1);
% K = wiener2(II1,[4 4]);
% K2 = imadjust(K);
% %figure;imshow(K2)
% figure;imshowpair(I,K,'montage')
% figure;imshowpair(I,K2,'montage')
%% Using filter2 and medfilt
% Kaverage = filter2(fspecial('average',3),I1)/255;
% Kmedian = medfilt2(I1);
% figure;
% imshowpair(I1,Kaverage,'montage')
% figure;
% imshowpair(I1,Kmedian,'montage')
%% Using wiener functions
% hh = dir('F:\Venkat\Edited');
% for jj=3:length(hh)
%     fol = hh(jj).folder;
%     name = hh(jj).name;
%     fname = [fol,'\',name];
%     Img = imread(fname);
%     [O1,O2] = reducenoisewiener(Img);
%     desfold1 = [fol,'\Filtered1\Image',num2str(jj-2),'.tif'];
%     desfold2 = [fol,'\Filtered2\Image',num2str(jj-2),'.tif'];
%     imwrite(O1,desfold1)
%     imwrite(O2,desfold2)
% end
%%
% figure;imshow(Imem_rotate2)
% mask1 = roipoly;
% mask2 = Imem_rotate2(mask1);
% Imem_final = Imem_rotate;
% %Imem_final(mask1)=0;
% Imem_final(mask1)=mask2;
% figure;imshow(Imem_final)
%%
% Imem_final_adapt = adapthisteq(Imem_final);
% figure;imshow(Imem_final_adapt)
% 
% Imem_final_adapt = imadjust(Imem_final);
% figure;imshow(Imem_final_adapt)