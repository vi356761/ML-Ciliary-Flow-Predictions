%% Read Image
%Tub = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Sample1\Sections_Im1_Tub.mat');
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Head\FinalHeadLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Midup\FinalMidupLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Middown\FinalMiddownLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Tail\FinalTailLaevis.mat')

% figure;imshow(I);
% figure;imshow(Fin);
% figure;imshowpair(I,Fin);
% figure;imshowpair(I,Act)
% figure;imshowpair(Fin,Act)
%..........................................................................................................................................................................................
% figure;imshow(adapthisteq(I));
% figure;imshow(Fin);
% figure;imshowpair(adapthisteq(I),Fin);
% figure;imshowpair(Fin,Act)

%figure;imshowpair(I,Act)
%figure;imshowpair(I,imadjust(Act))
%figure;imshowpair(Tail,Tub.TT)
%figure;imshowpair(TMem,Tail)
%figure;imshowpair(MiMem,Middown5)

% figure;imshow(I);
% figure;imshow(Fin2);f
% figure;imshowpair(I,Fin2);
% figure;imshowpair(I,Act)
% figure;imshowpair(Fin2,Act)
%%
%For Full Embryo:
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_rotate,croppos1);
%.....................................................................................................................................................
%Seg = Seg1; %Apical Area
%Seg = Seg2; %Cilia Coverage Area
Icolor =colormap2(adapthisteq(Mem.Imem_rotate),1,0,0);
Actcolor =colormap2(Act.Itub_rotate,0,1,0);
Segcolor=colormap2(uint8(Seg).*250,0,0,1);
overlay_im=[Icolor + Actcolor + Segcolor];

close all;clc
figure;imshowpair(Mem.Imem_rotate,Act.Itub_rotate)
figure;imshowpair(Seg,Act.Itub_rotate)
figure;imshow(overlay_im)
%................................................................................................................................................
%For Sections:
%Icolor =colormap2(adapthisteq(I),1,0,0);
%Icolor =colormap2(I,1,0,0);
%Actcolor =colormap2(Act,0,1,0);
%Actcolor =colormap2(adapthisteq(Iact),0,1,0);
% Segcolor=colormap2(uint8(Fin).*250,0,0,1); %Change Variable.......................................................................................................................................
% overlay_im=[Icolor + Actcolor + Segcolor]; 

% close all;clc
% figure;imshowpair(I,Act)
%figure;imshowpair(adapthisteq(Imem),Iact)
% figure;imshowpair(Fin,Act) %Change Variable................................................................
% figure;imshow(overlay_im)
%% Add and remove area
%clear xi yi xi2 yi2
again = true;
regionCount1 =0;
regionCount2 = 0;
while again 
	promptMessage = sprintf('Do yopu want to continue,\nor Quit?');
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Draw', 'Quit', 'Draw');
	if strcmpi(button, 'Quit')
		break;
    end
    
    promptMessage = sprintf('Remove Area #%d in the upper right image,\nor Quit?', regionCount1+1);
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Draw', 'Quit', 'Draw');
	if strcmpi(button, 'Draw')
        regionCount1 = regionCount1 +1; 
        p = drawpolygon('LineWidth',2,'Color','red');
        %[thisSinglePolygonImage, xi, yi] = roipoly();
        %[~, xi{regionCount,1}, yi{regionCount,1}] = roipoly();
        [centroids] = p.Position;
        %cent{regionCount,1} = centroids;
        xi{regionCount1,1} = centroids(:,1);
        yi{regionCount1,1} = centroids(:,2);
        clear centroids
%       else
%         continue;
    end
    
    promptMessage = sprintf('Add Area #%d in the upper right image,\nor Quit?', regionCount2+1);
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Draw', 'Quit', 'Draw');
	if strcmpi(button, 'Draw')
        regionCount2 = regionCount2 +1; 
        p2 = drawpolygon('LineWidth',2,'Color','cyan');
        %[thisSinglePolygonImage, xi, yi] = roipoly();
        %[~, xi{regionCount,1}, yi{regionCount,1}] = roipoly();
        [centroids2] = p2.Position;
        %cent{regionCount,1} = centroids;
        xi2{regionCount2,1} = centroids2(:,1);
        yi2{regionCount2,1} = centroids2(:,2);
        clear centroids2
    else
        continue;
    end
    
end
%%
figure;imshow(overlay_im)
for ll=1:regionCount2
    %drawpolygon('Position',[xi{ll,1},yi{ll,1}],'LineWidth',2,'Color','red');
    drawpolygon('Position',[xi2{ll,1},yi2{ll,1}],'LineWidth',2,'Color','cyan');
    hold on;
end
hold off;
%% Remove values if needed
rmvec1 = [4];
for jj=1:length(rmvec1)
    cc=rmvec1(jj);
    xi{cc,1}=[];
    yi{cc,1}=[];
end

rmvec2 = [3];
for jj=1:length(rmvec2)
    cc=rmvec2(jj);
    xi2{cc,1}=[];
    yi2{cc,1}=[];
end

%% Remove area
Remarea = Seg;
%Remarea = Addarea;
%Remarea = Fin; %Change Variable................................................................
for kk =1:length(xi)
    mask = roipoly(Remarea, xi{kk,1}, yi{kk,1});
    Remarea(mask)=0;
end

figure; imshow(Remarea)
%% Add area
Addarea = Remarea;
%Addarea = Fin;
%Addarea = Seg;
for kk =1:length(xi2)
    mask = roipoly(Addarea, xi2{kk,1}, yi2{kk,1});
    %mask = roipoly(Fin, xi2{kk,1}, yi2{kk,1});
    Addarea(mask)=1;
end
figure; imshow(Addarea)
%% Save New Full Embryo
%save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\All Sections\Full_Embryo_T4_S4.mat','T4_S4')
save([pathy,'S10_Full_Embryo.mat'],'Seg')
%%
%Segcolor=colormap2(uint8(Addarea).*250,0,0,1); 
%Segcolor=colormap2(uint8(Remarea).*250,0,0,1); 
%overlay_im=[Icolor + Actcolor + Segcolor];
figure;imshow(overlay_im)
figure;imshowpair(Addarea,Act)
%figure;imshowpair(Remarea,Act)
%figure;imshowpair(Midup_Fin,Act)
%% Save New
Tail_Fin = bwareaopen(Addarea,100);
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S1\Tail\Tail_Fin.mat','Tail_Fin')
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S1\Tail\Tail_Fin_coords.mat','Fin','xi','yi','xi2','yi2')
%% Save removed and added areas
%save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample3\Tail\attempt1.mat','xi','yi','xi2','yi2','regionCount1','regionCount2')
%save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample3\Head\FinalAttemptHeadTrial3Sample3.mat')

save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Tail\attempt1.mat','xi2','yi2','regionCount1','regionCount2')
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Tail\Tailfin.mat','Fin_Tail')

%Test saved
Test = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Tail\Tailfin.mat');
figure;imshowpair(Test.Fin_Tail,Act)
%% Save work in progress
%pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\FullEmbryo Sample4\All_MCC_Seg.mat');
%pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\FullEmbryo Sample5\All_MCC_Seg.mat');
%pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Full Embryo\All_MCC_Seg.mat');
pathy=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Full Embryo\All_MCC_Seg.mat');
%save([pathy],'T2_S4', 'T2_S4_Fin') %Change Variable................................................................
load(pathy);
%% Clear variables
%clear xi yi xi2 yi2 Fin Fin2
Icolor =colormap2(adapthisteq(I),1,0,0);
Actcolor =colormap2(Act,0,1,0);
Segcolor=colormap2(uint8(Fin).*180,0,0,1);
overlay_im=[Icolor + Actcolor + Segcolor];
%% Figures
close all;
figure;imshowpair(I,imadjust(Act))
figure;imshowpair(I,Fin)
figure;imshowpair(Fin,Act)
figure;imshow(overlay_im)
%%
Middown_Im5 = Addarea;
figure;imshow(Addarea)
mask = roipoly(Addarea);
Middown_Im5 (mask)=0;
figure;imshow(Middown_Im5)