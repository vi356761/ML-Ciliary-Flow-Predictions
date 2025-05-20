%% Select and read images:
% Change the path based on loaction
pathy = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\A) After Image prep\');
Tub = load([pathy,'Sections_Tub.mat']);
Mem = load([pathy,'Sections_Mem.mat']);
%%  All in one input dialogue box: Method 2
prompt = {'Image enhancement:','Enter embryo section:'};
dlgtitle = 'Input'; %Mem, tub, or both
dims = [1 10];
definput = {'none','Head'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
%
if strcmpi(answer{2,1},'Head')
    MM = Mem.HH; TB = Tub.HH;
elseif strcmpi(answer{2,1},'Midup')
    MM = Mem.MU; TB = Tub.MU;
elseif strcmpi(answer{2,1},'Middown')
    MM = Mem.MD; TB = Tub.MD;
elseif strcmpi(answer{2,1},'Tail')
    MM = Mem.TT; TB = Tub.TT;
end

showimagepairs(answer{1,1},MM,TB);
%% Draw MCC
%clear xi yi
regionCount1 = 0;
again = true;
while again
    promptMessage = sprintf('Draw MCC apical area #%d,\nor Quit?', regionCount1+1);
    titleBarCaption = 'Continue?';
    button = questdlg(promptMessage, titleBarCaption, 'Draw','Repeat','Quit', 'Draw');
    if strcmpi(button, 'Draw')
        regionCount1 = regionCount1 +1;
        p = drawpolygon('LineWidth',2,'Color','cyan');
        %[thisSinglePolygonImage, xi, yi] = roipoly();
        %[~, xi{regionCount,1}, yi{regionCount,1}] = roipoly();
        [centroids] = p.Position;
        %cent{regionCount,1} = centroids;
        xi{regionCount1,1} = centroids(:,1);
        yi{regionCount1,1} = centroids(:,2);
        clear centroids
    elseif strcmpi(button, 'Repeat')
        xi{regionCount1,1} =[];
        yi{regionCount1,1} =[];
        %regionCount1 = regionCount1 -1;
        p = drawpolygon('LineWidth',2,'Color','red');
        [centroids] = p.Position;
        xi{regionCount1,1} = centroids(:,1);
        yi{regionCount1,1} = centroids(:,2);
        clear centroids

    elseif strcmpi(button, 'Quit')
        break;
    end
end

%% Remove vectors as needed: version1
% rmvec1 = [238];
% for jj=1:length(rmvec1)
%     cc=rmvec1(jj);
%     xi{cc,1}=[];
%     yi{cc,1}=[];
% end
%% Make masks:
%clear xi yi
Fin = false(size(MM));

for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    Fin(mask)=1;
end

figure; imshow(Fin)
figure; imshowpair(Fin,MM)
figure; imshowpair(Fin,TB)
%% Work in progress:
%showimagepairs(answer{1,1},MM,TB);
figure;imshowpair(MM,imadjust(TB))
for ll=1:regionCount1
    if(~isempty(xi{ll,1}))
        drawpolygon('Position',[xi{ll,1},yi{ll,1}],'LineWidth',2,'Color','cyan');
        hold on;
    end
end
hold off;
%% Save work:
%save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Tail\wip_fin.mat','xi','yi','xi2','yi2','regionCount1','answer')


%save([pathy,answer{2,1},'\wip2.mat'],'xi','yi','regionCount1','answer','MM','TB')
%save([pathy,answer{2,1},'\',answer{2,1},'_fin.mat'],'Fin')

save([pathy,answer{2,1},'\',answer{2,1},'_fin.mat'],'Fin','Fin2')
save([pathy,answer{2,1},'\wip_fin.mat'],'xi','yi','regionCount1','answer','MM','TB','xi2','yi2')
%% Load work to continue wip:
%load([pathy,'Tail\wip1.mat']);
%load([pathy,answer{2,1},'\wip4.mat']);
%load([pathy,answer{2,1},'\',answer{2,1},'_fin.mat']);
%% Remove area:
again = true;
regionCount = 0;
while again
	promptMessage = sprintf('Remove region #%d in the upper right image,\nor Quit?', regionCount + 1);
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Remove', 'Quit', 'Remove');
    if strcmpi(button, 'Quit')
		break;
    end
	regionCount = regionCount + 1;
    p = drawpolygon('LineWidth',2,'Color','red');
    [centroids] = p.Position;
    xi2{regionCount,1} = centroids(:,1);
    yi2{regionCount,1} = centroids(:,2);
    clear centroids
end
%% Remove Maks:
Fin2 = Fin;

for kk =1:length(xi2)
    mask = roipoly(Fin2, xi2{kk,1}, yi2{kk,1});
    Fin2(mask)=0;
end

figure; imshow(Fin2)
figure; imshowpair(Fin2,MM)
figure; imshowpair(Fin2,TB)