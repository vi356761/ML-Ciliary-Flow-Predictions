function V2_vizualize_pred_divergence(maspath,T1,revimg,imgtitle,ylbl,blocksize)

load([maspath,'Extracted_All_MAT_Files.mat'])

ATT1 = isnan(ro1);
ATT2 = isnan(ro2);
ATT3 = isnan(ro3);
ATT4 = isnan(ro4);

AT1 = reshape(ATT1,[size(Master_Images1,2) size(Master_Images1,1)]);
Index1 = AT1.'; %Head 

AT2 = reshape(ATT2,[size(Master_Images2,2) size(Master_Images2,1)]);
Index2 = AT2.'; %Tail

AT3 = reshape(ATT3,[size(Master_Images3,2) size(Master_Images3,1)]);
Index3 = AT3.'; %Midup

AT4 = reshape(ATT4,[size(Master_Images4,2) size(Master_Images4,1)]);
Index4 = AT4.'; %Middown
%................................................................................................................................................................................
ETT1 = readtable([maspath,'Divergence_Features\Head_Master_Div.xlsx'],'range','A:J');
ETT2 = readtable([maspath,'Divergence_Features\Midup_Master_Div.xlsx'],'range','A:J');
ETT3 = readtable([maspath,'Divergence_Features\Middown_Master_Div.xlsx'],'range','A:J');
ETT4 = readtable([maspath,'Divergence_Features\Tail_Master_Div.xlsx'],'range','A:J');

ET1 = readtable([maspath,'Divergence_Features\Head_Master_Div.xlsx'],'range','K:K');
%ind1 = find(ET1.Divergence==0);
ET2 = readtable([maspath,'Divergence_Features\Midup_Master_Div.xlsx'],'range','K:K');
%ind2 = find(ET2.Divergence==0);
ET3 = readtable([maspath,'Divergence_Features\Middown_Master_Div.xlsx'],'range','K:K');
%ind3 = find(ET3.Divergence==0);
ET4 = readtable([maspath,'Divergence_Features\Tail_Master_Div.xlsx'],'range','K:K');
%ind4 = find(ET4.Divergence==0);

EET = [ETT1;ETT2;ETT3;ETT4];
Master_Divergence = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master_Divergence.xlsx');
ET = getrawvaluesback_V3(EET,Master_Divergence);

%ET = normalize(EET)
yfit = T1.trainedModel_Optimized_EGPR.predictFcn(ET);
% DEFAULT:
[~,~,idx] = histcounts(yfit);

% If the values need to be normalized twice:
% [~,~,idx2] = histcounts(yfit);
% idx = round(normalize(idx2,'range',[mean2(idx2) max(idx2)]));


ET_Head = yfit(1:length(ET1.Divergence),:);
%ET_Head(ind1)=0;

ET_Mu = yfit(length(ET1.Divergence)+1:length(ET1.Divergence)+length(ET2.Divergence),:);
%ET_Mu(ind2)=0;

ET_Md = yfit(length(ET1.Divergence)+length(ET2.Divergence)+1:length(ET1.Divergence)+length(ET2.Divergence)+length(ET3.Divergence),:);
%ET_Md(ind3)=0;

ET_Tail = yfit(length(ET1.Divergence)+length(ET2.Divergence)+length(ET3.Divergence)+1:end,:);
%ET_Tail(ind4)=0;

% 
% %................................................................................................................................................................................
% 
ET_Head_idx = idx(1:length(ET1.Divergence),:);
%ET_Head_idx(ind1)=0;

ET_Mu_idx = idx(length(ET1.Divergence)+1:length(ET1.Divergence)+length(ET2.Divergence),:);
%ET_Mu_idx(ind2)=0;

ET_Md_idx = idx(length(ET1.Divergence)+length(ET2.Divergence)+1:length(ET1.Divergence)+length(ET2.Divergence)+length(ET3.Divergence),:);
%ET_Md_idx(ind3)=0;

ET_Tail_idx = idx(length(ET1.Divergence)+length(ET2.Divergence)+length(ET3.Divergence)+1:end,:);
%ET_Tail_idx(ind4)=0;

[~,HI] = rmoutliers(ETT1,'Mean');
ET_Head(HI) = 0;
ET_Head_idx(HI) = 0;
[~,HI] = rmoutliers(ETT2,'Mean');
ET_Mu(HI) = 0;
ET_Mu_idx(HI) = 0;
[~,HI] = rmoutliers(ETT3,'Mean');
ET_Md(HI) = 0;
ET_Md_idx(HI) = 0;
[~,HI] = rmoutliers(ETT4,'Mean');
ET_Tail(HI) = 0;
ET_Tail_idx(HI) = 0;
%%
[bindiv1,~] = getbinindeximages(ET_Head,Index1,ET_Head_idx);
[bindiv2,~] = getbinindeximages(ET_Tail,Index2,ET_Tail_idx);
[bindiv3,~] = getbinindeximages(ET_Mu,Index3,ET_Mu_idx);
[bindiv4,~] = getbinindeximages(ET_Md,Index4,ET_Md_idx);
%% Get canvas
%blocksize =150;
overlap=0.75;
L1 = getcanvas(canvass1,bindiv1,blocksize,overlap); %Head 
L2 = getcanvas(canvass2,bindiv2,blocksize,overlap); %Tail
L3 = getcanvas(canvass3,bindiv3,blocksize,overlap); %Midup
L4 = getcanvas(canvass4,bindiv4,blocksize,overlap); %Middown

% For padded image
MidL = [L3;L4];
dy = size(MidL,1)-size(L1,1);

if (mod(dy,2)==0)
    dy2 = dy/2;
    dy1 = dy2;
else
   dy2 =  floor(dy/2);
   dy1 = dy-dy2;
end

pady_up1(1:dy1,size(L1,2))= 0;
pady_up2(1:dy1,size(L2,2))= 0;
pady_dn1(1:dy2,size(L1,2))= 0;
pady_dn2(1:dy2,size(L2,2))= 0;

L11 = [pady_up1;L1;pady_dn1];
L22 = [pady_up2;L2;pady_dn2];

if(revimg=="yes")
    Master_L = [L11,MidL,L22];
else
    Master_L = [L22,MidL,L11];
end
a2 = size(Master_L,1); a1 = size(Master_L,2);
%% Now Plot:
Lrgb = label2rgb(Master_L);
figure2 = figure('Colormap',...
        [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 0.9375;0.125 1 0.875;0.1875 1 0.8125;0.25 1 0.75;0.3125 1 0.6875;0.375 1 0.625;0.4375 1 0.5625;0.5 1 0.5;0.5625 1 0.4375;0.625 1 0.375;0.6875 1 0.3125;0.75 1 0.25;0.8125 1 0.1875;0.875 1 0.125;0.9375 1 0.0625;1 1 0;1 0.899999976158142 0;1 0.800000011920929 0;1 0.699999988079071 0;1 0.600000023841858 0;1 0.5 0;1 0.400000005960464 0;1 0.300000011920929 0;1 0.200000002980232 0;1 0.100000001490116 0;1 0 0;0.964285731315613 0 0;0.928571403026581 0 0;0.892857134342194 0 0;0.857142865657806 0 0;0.821428596973419 0 0;0.785714268684387 0 0;0.75 0 0;0.714285731315613 0 0;0.678571403026581 0 0;0.642857134342194 0 0;0.607142865657806 0 0;0.571428596973419 0 0;0.535714268684387 0 0;0.5 0 0]);
axes1 = axes('Parent',figure2,'YDir','reverse','Layer','top');
%Lim = caxis;
caxis([0 1])
set(axes1,'TickLength',[0 0]);

xlim(axes1,[0 a1]);
ylim(axes1,[0 a2]);

box(axes1,'on');
hold(axes1,'all');
% Create image
image(Lrgb,'Parent',axes1,'CDataMapping','scaled');
colorbar('peer',axes1);
title(imgtitle,'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[]);
yyaxis right
ylabel (ylbl,'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
k = [0, 0, 0];
axes1.YColor = k;%
end