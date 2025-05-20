%% Select and read images:
% Change the path based on loaction
pathy = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\A) After Image prep\');
Tub = load([pathy,'Sections_Tub.mat']);
Mem = load([pathy,'Sections_Mem.mat']);
%% Enter if the what images need to be enhaced for tracting: Method 1
% nsel = 'default';
% %nsel = 'thresh';
% if strcmpi(nsel,'thresh')
%     dial =('Select if you need to enhance any of your images');
%     titlebox = 'Make a selection';
%     n =questdlg(dial,titlebox,'mem','tub','both','mem');
% elseif strcmpi(nsel,'default')
%     n='none';
% end
% 
% sect = input('Type the section name within single quotes:  ');
% if strcmpi(sect,'head')
%     Mem = Mem.HH; Tub = Tub.HH;
% elseif strcmpi(sect,'midup')
%     Mem = Mem.MU; Tub = Tub.MU;
% elseif strcmpi(sect,'middown')
%     Mem = Mem.MD; Tub = Tub.MD;
% elseif strcmpi(sect,'tail')
%     Mem = Mem.TT; Tub = Tub.TT;
% end
% % Show the image based on selections
% showimagepairs(n,Mem.HH,Tub.HH);
%% All in one input dialogue box: Method 2
prompt = {'Image enhancement:','Enter embryo section:'};
dlgtitle = 'Input'; %Mem, tub, or both
dims = [1 10];
definput = {'none','head'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
%
if strcmpi(answer{2,1},'head')
    MM = Mem.HH; TB = Tub.HH;
elseif strcmpi(answer{2,1},'midup')
    MM = Mem.MU; TB = Tub.MU;
elseif strcmpi(answer{2,1},'middown')
    MM = Mem.MD; TB = Tub.MD;
elseif strcmpi(answer{2,1},'tail')
    MM = Mem.TT; TB = Tub.TT;
end

showimagepairs(answer{1,1},MM,TB);
%% Trace cilia coverage area and MCC apical area
%clear xi yi xi2 yi2
regionCount1 =0; %Default uncomment
again = true;
while again
    
    promptMessage = sprintf('Draw MCC cilia coverage area #%d,\nor Quit?', regionCount1+1);
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
    elseif strcmpi(button, 'Quit')
        break;
    end
    
    promptMessage2 = sprintf('Draw MCC apical area #%d,\nor same as cilia coverage?', regionCount1);
    titleBarCaption2 = 'Continue?';
    button2 = questdlg(promptMessage2, titleBarCaption2, 'Draw New', 'Same','Draw New');
    if strcmpi(button2, 'Draw New')
        p2 = drawpolygon('LineWidth',2,'Color','cyan');
        %[thisSinglePolygonImage, xi, yi] = roipoly();
        %[~, xi{regionCount,1}, yi{regionCount,1}] = roipoly();
        [centroids2] = p2.Position;
        %cent{regionCount,1} = centroids;
        xi2{regionCount1,1} = centroids2(:,1);
        yi2{regionCount1,1} = centroids2(:,2);
        clear centroids2
    elseif strcmpi(button2, 'Same')
        xi2{regionCount1,1} = xi{regionCount1,1};
        yi2{regionCount1,1} = yi{regionCount1,1};
    end
    
end
%%
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Tail\wip4.mat','xi','yi','xi2','yi2','regionCount1','answer')

% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Tail\wip_fin.mat','xi','yi','xi2','yi2','regionCount1','answer')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Midup\Midup_fin.mat','Ciliarea','Apiarea')
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Tail\wip4.mat');

save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Tail\Tail_fin.mat','Ciliarea','Apiarea')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Middown\wip1.mat');
%TT = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Midup\Midup_fin.mat');
%%
Ciliarea = false(size(MM));
Apiarea = false(size(MM));
for kk = 1:length(xi)
    mask1 = roipoly(Ciliarea, xi{kk,1}, yi{kk,1});
    mask2 = roipoly(Apiarea, xi2{kk,1}, yi2{kk,1});
    Ciliarea(mask1)=1;
    Apiarea(mask2)=1;
end
% figure; imshow(Ciliarea)
% figure; imshow(Apiarea)
figure; imshowpair(Apiarea,Ciliarea)
% Area missing 294 point in ciliarea rewritten in 184 apiarea corresponding to 194 in ciliarea
%% Save what was saved
% Update num as needed
num=1;
save(['wip',num2str(num),'.mat'],'X1','X2','Y1','Y2','xi','yi','Cellcount')
%% Visulaize saved work to continue
showimagepairs(answer{1,1},MM,TB);
for ll=1:regionCount1
    if(~isempty(xi{ll,1}))
        drawpolygon('Position',[xi{ll,1},yi{ll,1}],'LineWidth',2,'Color','red');
        hold on;
    end
    if(~isempty(xi2{ll,1}))
        drawpolygon('Position',[xi2{ll,1},yi2{ll,1}],'LineWidth',2,'Color','cyan');
        hold on;
    end
end
hold off;
%% Remove vector: version1
rmvec1 = [80];
for jj=1:length(rmvec1)
    cc=rmvec1(jj);
    xi{cc,1}=[];
    yi{cc,1}=[];
end

%rmvec2 = [352];
for jj=1:length(rmvec1)
    cc=rmvec1(jj);
    xi2{cc,1}=[];
    yi2{cc,1}=[];
end
%% Remove vector: version2
% rmvec1 = [18,59,65,125,234]; %Cilia coverage
rmvec1 = [242,247];
for jj=1:length(rmvec1)
    cc=rmvec1(jj);
    xi{cc,1}=[];
    yi{cc,1}=[];
end

%rmvec2 = rmvec1-1; %MCC apical area
rmvec2 = [240,246]; 
for jj=1:length(rmvec2)
    cc=rmvec2(jj);
    tempx = xi2{cc+1,1};
    tempy = yi2{cc+1,1};
    xi2{cc,1}=[];
    yi2{cc,1}=[];
    xi2{cc+1,1}=[];
    yi2{cc+1,1}=[];
    xi2{cc,1}= tempx;
    yi2{cc,1}=tempy;
    clear tempx tempy
end
%% Read Images for segmented quality checks
%Tub = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Sections_Im4_Tub.mat');
%Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Sections_Im4_Mem.mat');

%Tub = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Sections_Im7_Tub.mat');
%Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Sections_Im7_Mem.mat');
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Head\FinalHeadLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Midup\FinalMidupLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Middown\FinalMiddownLaevis.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Tail\FinalTailLaevis.mat')

% figure;imshow(I);
% figure;imshow(Fin);
% figure;imshowpair(I,Fin);
% figure;imshowpair(I,Act)
% figure;imshowpair(Fin,Act)
%% Read full embryo
%For Full Embryo:
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_rotate,croppos1);
%.....................................................................................................................................................
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