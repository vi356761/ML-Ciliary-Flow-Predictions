%% Read image
[file,path] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.png'},'Select the image');
I = imread([path,file]);
figure;imshow(I)
%Tub = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\8_10 Data\Sample4\Sections_Im4_Tub.mat');
%% For samples 1,2
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_rotate,croppos1);
%Icolor =colormap(adapthisteq(Imem),1,0,0);
Icolor =colormap(Imem,1,0,0);
Actcolor =colormap(Iact,0,1,0);
%Actcolor =colormap(adapthisteq(Iact),0,1,0);
Segcolor=colormap(uint8(Fin).*250,0,0,1); %Change Variable................................................................
overlay_im=[Icolor + Actcolor + Segcolor]; 

close all;clc
figure;imshowpair(Imem,Iact)
%figure;imshowpair(adapthisteq(Imem),Iact)
figure;imshowpair(T2_S2,Iact) %Change Variable................................................................
figure;imshow(overlay_im)
%% For samples 3, 4
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_rotate,croppos1);
Icolor =colormap2(adapthisteq(Imem),1,0,0);
%Icolor =colormap2(Imem,1,0,0);
Actcolor =colormap2(Iact,0,1,0);
%Actcolor =colormap(adapthisteq(Iact),0,1,0);
Segcolor=colormap2(uint8(Seg_Full).*250,0,0,1); %Change Variable................................................................
overlay_im=[Icolor + Actcolor + Segcolor]; 

close all;clc
figure;imshowpair(Imem,Iact)
%figure;imshowpair(adapthisteq(Imem),Iact)
figure;imshowpair(Seg_Full,Iact) %Change Variable................................................................
figure;imshow(overlay_im)
%% Load sectionwise data to visualize
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S1\FinalTailTrial4Sample1.mat');
[file1,path1] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.png'},'Select membrane image');
I1 = imread([path1,file1]);
[file2,path2] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.png'},'Select cilia image');
I2 = imread([path2,file2]);
figure;imshow(I2)
%% Draw MCC
figure; imshowpair(I1,I2)
again = true;
regionCount = 1;
while again
	promptMessage = sprintf('Draw region #%d in the upper right image,\nor Quit?', regionCount);
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Draw', 'Quit', 'Draw');
	if strcmpi(button, 'Quit')
		break;
    end
    p = drawpolygon('LineWidth',2,'Color','cyan');
    %[thisSinglePolygonImage, xi, yi] = roipoly();
    %[~, xi{regionCount,1}, yi{regionCount,1}] = roipoly();
    [centroids] = p.Position;
    %cent{regionCount,1} = centroids;
    xi{regionCount,1} = centroids(:,1);
    yi{regionCount,1} = centroids(:,2);
    clear centroids
    regionCount = regionCount + 1;
end
%%
%clear xi yi xi2 yi2
Fin = false(size(I));
%Fin = false(size(Imem));
%Fin = Ensemble;
%Fin = T1_S5; %Change
for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    %mask = roipoly(Fin, xold{kk,1}, yold{kk,1});
    Fin(mask)=1;
end

figure; imshow(Fin)
%% Visualize Images
% figure;imshowpair(I,Fin)
% figure;imshowpair(Fin,Act)
 figure;imshowpair(I1,I2)
%%
xi2 = [xiold(3:4,1);xiold(10,1);xiold(18:19,1)];
yi2 = [yiold(3:4,1);yiold(10,1);yiold(18:19,1)];

rmvec= [16];
for hh=1:length(rmvec)
    xi{rmvec(hh),1}=[];
    yi{rmvec(hh),1}=[];
end

%%
Fin = T1_S5; %Change
for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    Fin(mask)=1;
end

Fin2 = Fin;
for kk =1:length(xi2)
    mask2 = roipoly(Fin, xi2{kk,1}, yi2{kk,1});
    %mask2 = roipoly(Fin2, xi2, yi2);
    Fin2(mask2)=0;
end

figure; imshow(Fin2)
%%

T1_S5_Fin = Fin2;
figure;imshowpair(T1_S5_Fin,Iact)
%% Save work in progress
%pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\FullEmbryo Sample4\All_MCC_Seg.mat');
pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\FullEmbryo Sample5\All_MCC_Seg.mat');
%save([pathy],'T1_S5', 'T1_S5_Fin')
load(pathy);
%save('Attempt1.mat')
%% Continue WIP
%load('Attempt1.mat')
%
%figure; imshow(I)
for ll=1:regionCount-1
    drawpolygon('Position',[xi{ll,1},yi{ll,1}],'LineWidth',2,'Color','cyan');
    hold on;
end
hold off;
%% Remove areas
n=80;
[xi2,yi2] = removeareamask(Fin2,n);
%%
Fin2 = Fin;
for kk =1:length(xi2)
    mask = roipoly(Fin2, xi2{kk,1}, yi2{kk,1});
    Fin2(mask)=1;
end
%% Add area
n=80;
[xi2,yi2] = addareamask(I,Act,n);
%%
figure; imshow(I)
for ll=12:12%ll=1:regionCount-1
    drawpolygon('Position',[xi2{ll,1},yi2{ll,1}],'LineWidth',2,'Color','cyan');
    hold on;
end
hold off;
%% Club the sections
%Check dimensions if yes combine sections else pad mid and combine sections

Head = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial2_Sample4\Head\Head_Im4_T2.mat');
Midup = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial2_Sample4\Midup\Midup_Im4_T2.mat');
Middown = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial2_Sample4\Middown\Middown_Im4_T2.mat');
Tail = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial2_Sample4\Tail\Tail_Im4_T2.mat');
%%
HH = Head.Fin;
MD = Middown.Fin;
MU = Midup.Fin;
TT = Tail.Fin;
%% If padding is needed
if(size(MD,1)+size(MD,1)~=size(HH,1))
    differ = size(MD,1)+size(MD,1)- size(HH,1);
    if(mod(differ,2)==0)
        pad = differ/2;
        MM_pad = zeros(pad,size(MU,2));
        MU_New = [MM_pad;MU];
        MD_New = [MD;MM_pad];
    else
        pad = floor(differ/2);
        Mu_pad = zeros(pad,size(MU,2));
        Md_pad = zeros(pad+1,size(MD,2));
        MU_New = [Mu_pad;MU];
        MD_New = [MD;Md_pad];
    end
end
%%
MM = [MU;MD];
Full_Embryo = [HH,MM,TT];
figure;imshow(Full_Embryo)
%%
Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Mem.mat');
Tub = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Tub.mat');
figure;imshowpair(Mem.Imem_adapt,Full_Embryo)
%%
revflip = 'xdir';
%revflip = 'ydir';
%revflip = 'bothdir';
Fin_Full_Embryo = orientimages(Full_Embryo,revflip);
figure;imshow(Fin_Full_Embryo)
%%
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Full Embryo\Sections_Final.mat','HH','MU','MD','TT')
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Full Embryo\Full_Embryo.mat','Fin_Full_Embryo','Full_Embryo')
%%
Fin = Fin_Full_Embryo;
figure;imshow(Fin_Full_Embryo)
mask = roipoly(Fin_Full_Embryo);
Fin(mask)=0;
figure;imshow(Fin)