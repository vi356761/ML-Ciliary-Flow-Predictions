%% Acetylated Tubulin Segmentation for MCC Spacing
% Prepare Image: (Save both image in the same folder)
[fil1,pth] = uigetfile({'*.tif';'*.jpg';'*.jpeg'},'Select Actin Image');
[fil2,~] = uigetfile({'*.tif';'*.jpg';'*.jpeg'},'Select Cilia Image');
I1 = imread([pth,fil1]);
figure;imshow(I1)

I2 = imread([pth,fil2]);
figure;imshow(I2)

% Uncomment direction to be flipped
%revflip = 'xdir';
revflip = 'ydir';
%revflip = 'bothdir';

Imem= orientimages(I1,revflip);
Itub = orientimages(I2,revflip);
%Imem2= orientimages(II1,revflip);

figure;imshow(Imem)
figure;imshow(Itub)
figure;montage([Imem;Itub],'Size',[1 1])
%% Rotate Image if needed
%Imem_adapt= adapthisteq(Imem); % use adaptive histogram to adjust if needed
Imem_adapt= Imem;
angle = 0; % Enter angle to be flipped. adjusted based on image
Imem_rotate = imrotate(Imem_adapt,angle,'bicubic','crop');
%Imem_rotate2 = imrotate(Imem2,angle,'bicubic','crop');
Itub_rotate = imrotate(Itub,angle,'bicubic','crop');
figure;imshow(Imem_rotate)
figure;imshow(Itub_rotate)
figure;montage([Imem_rotate;Itub_rotate],'Size',[1 1])
figure;imshowpair(Imem_rotate,Itub_rotate)
%figure;imshowpair(adapthisteq(Imem_rotate),Itub_rotate)
figure;imshowpair(Imem_rotate,adapthisteq(Itub_rotate))
%% Define Sections
close all;
%figure; imshow(Imem_final_adapt)
figure; imshow(Imem_rotate)
%figure; imshow(Imem_adapt)
Obj1 = drawline();

%Draw from left to right
X1 = Obj1.Position(1,1);
X2 = Obj1.Position(2,1);

Y2 = Obj1.Position(1,2);
Y1 = Obj1.Position(2,2);

L = sqrt(((X2-X1)^2) + ((Y2-Y1)^2));
angle = atan2((Y2-Y1),(X2-X1));
angle2 = atan2d((Y2-Y1),(X2-X1));

close all;
figure; imshow(Imem_rotate)
Obj2 = drawline();

Ymid1 = Obj2.Position(1,2); %Draw top to bottom
Ymid2 = Obj2.Position(2,2);
%% Test if height adds up
% He = round(abs(Ymid2-Ymid1)/2);
% Height =  2*He + round(Ymid1) + size(Imem_adapt,1)-round(Ymid2)
%% Run the code separately for Actin and Cilia image by commenting the other one out:
%[HH,MM,TT,MU,MD] = sectionembryonew(Itub_rotate,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Imem_rotate,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Imem_adapt,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Itub_adapt,X1,X2,Y1,Y2);

%............................................................For adjusted images
%[HH1,MM1,TT1,MU1,MD1] = sectionembryonew(Fin2,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Imem_adapt,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Imem_final,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew(Itub_adapt,X1,X2,Y1,Y2);
%[HH,MM,TT,MU,MD] = sectionembryonew_YY(Imem_final_adapt,X1,X2,Y1,Y2,Ymid1,Ymid2);
%..........................................................................
%[HH,MM,TT,MU,MD] = sectionembryonew_YY(Imem_rotate,X1,X2,Y1,Y2,Ymid1,Ymid2);
[HH,MM,TT,MU,MD] = sectionembryonew_YY(Itub_rotate,X1,X2,Y1,Y2,Ymid1,Ymid2);
%clear HH MM TT MU MD
%% Comment line 82 or 83 depending on the channel:
figure;
%subplot(2,2,1); imshow(Imem_rotate)
subplot(2,2,1); imshow(Itub_rotate)

%subplot(2,2,1); imshow(Imem_adapt)
%subplot(2,2,1); imshow(Itub_adapt)

title('Full Embryo')
subplot(2,2,2); imshow(HH)
title('Head Section')
subplot(2,2,3); imshow(MM)
title('Mid Section')
subplot(2,2,4); imshow(TT)
title('Tail Section')

figure;%Draw top to bottom
subplot(1,2,1); imshow(MU)
title('Mid-up')
subplot(1,2,2); imshow(MD)
title('Mid-down')
%%
path2 = pth;
memfile = ('Sections_Mem.mat');
tubfile = ('Sections_Tub.mat');
pathmem = [path2,memfile];
pathtub = [path2,tubfile];
%save(pathmem,'Imem_rotate','Imem_adapt','HH','MM','TT','MU','MD','X1','X2','Y1','Y2','Ymid1','Ymid2')
save(pathtub,'Itub_rotate','HH','MM','TT','MU','MD','X1','X2','Y1','Y2','Ymid1','Ymid2')
%%
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10\Data\Sample4\Sections_Im4_Tub.mat')
clearvars -except pathmem pathtub 
Mem=load(pathmem);
Tub=load(pathtub);
%% Head
%path2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
figure;imshow(Mem.HH)
figure;imshow(Tub.HH)
figure;
imshowpair(Mem.HH,Tub.HH);
%imshowpair(adapthisteq(Mem.HH),adapthisteq(Tub.HH));
% h=getframe;
% F=h.cdata;
% figure;imshow(F)
%
if([path2,'Head']~=7)
    mkdir([path2,'Head'])
end
saveas(gcf,[path2,'Head\Head_Overlap.tif'])
close all;
imwrite(Mem.HH,[path2,'Head\Head_Mem.tif'])
imwrite(Tub.HH,[path2,'Head\Head_Act.tif'])
%imwrite(F,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Midup\Midup_Overlap.tif')
%% Midup
figure;imshow(Mem.MU)
figure;imshow(Tub.MU)
figure;
imshowpair(Mem.MU,Tub.MU);
%imshowpair(adapthisteq(Mem.MU),adapthisteq(Tub.MU));
% h=getframe;
% F=h.cdata;
% figure;imshow(F)
%
if([path2,'Midup']~=7)
    mkdir([path2,'Midup'])
end
saveas(gcf,[path2,'Midup\Midup_Overlap.tif'])
close all;
imwrite(Mem.MU,[path2,'Midup\Midup_Mem.tif'])
imwrite(Tub.MU,[path2,'Midup\Midup_Act.tif'])
%imwrite(F,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Midup\Midup_Overlap.tif')
%% Middown
figure;imshow(Mem.MD)
figure;imshow(Tub.MD)
figure;
imshowpair(Mem.MD,Tub.MD);
%imshowpair(adapthisteq(Mem.MD),adapthisteq(Tub.MD));
% h=getframe;
% F=h.cdata;
% figure;imshow(F)
%
if([path2,'Middown']~=7)
    mkdir([path2,'Middown'])
end
saveas(gcf,[path2,'Middown\Middown_Overlap.tif'])
close all;
imwrite(Mem.MD,[path2,'Middown\Middown_Mem.tif'])
imwrite(Tub.MD,[path2,'Middown\Middown_Act.tif'])
%imwrite(F,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Midup\Midup_Overlap.tif')
%% Tail
figure;imshow(Mem.TT)
figure;imshow(Tub.TT)
figure;
imshowpair(Mem.TT,Tub.TT);
%imshowpair(adapthisteq(Mem.TT),adapthisteq(Tub.TT));
% h=getframe;
% F=h.cdata;
% figure;imshow(F)
%
if([path2,'Tail']~=7)
    mkdir([path2,'Tail'])
end
saveas(gcf,[path2,'Tail\Tail_Overlap.tif'])
close all;
imwrite(Mem.TT,[path2,'Tail\Tail_Mem.tif'])
imwrite(Tub.TT,[path2,'Tail\Tail_Act.tif'])
%imwrite(F,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample5\Midup\Midup_Overlap.tif')
%%
imwrite(Mem.Imem_rotate,[path2,'Actin_New.tif'])
imwrite(Tub.Itub_rotate,[path2,'Cilia_New.tif'])