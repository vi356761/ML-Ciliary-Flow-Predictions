function visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv,nmesv)
% Find difference and pad:
diff_trop = (n_sqr_trop*n_sqr_trop)-pdsz_trop;
M_Test_Trop2 = M_Test_Trop; Trop_Y2 = Trop_Y; Raw_Test_Trop2 = Raw_Test_Trop; 
szz = size(M_Test_Trop{1,1},1);
for mm=1:diff_trop
    gg=pdsz_trop+mm;
    M_Test_Trop2{gg,1} = [false(szz,szz)];
    Trop_Y2(gg,1) = 0;
    Raw_Test_Trop2(gg,1) =0;
end

M_Test_Trop3 = reshape(M_Test_Trop2,[n_sqr_trop, n_sqr_trop]);
% Trop_Y3 =reshape(Trop_Y2, [n_sqr_trop, n_sqr_trop]);
% Raw_Test_Trop3 = reshape(Raw_Test_Trop2,[n_sqr_trop, n_sqr_trop]);
%% Sticth images:
Master_Trop_Image=[];
for qq=1:n_sqr_trop
    Master_Row = [];
    for ww=1:n_sqr_trop
        Master_Row = [Master_Row,M_Test_Trop3{qq,ww}];
    end
    Master_Trop_Image=[Master_Trop_Image;Master_Row];
    clear Master_Row
end
%% Index of sorted divergences predictions
[~,~,idx] = histcounts(Trop_Y2);
%idx2 = reshape(idx,[n_sqr_trop, n_sqr_trop]);

for yy=1:length(Trop_Y2)
    CC = bwconncomp(M_Test_Trop2{yy,1});
    L = zeros(CC.ImageSize);
    for ii = 1:CC.NumObjects
        L(CC.PixelIdxList{ii}) = idx(yy);    %fill in indices
    end
    binind{yy,1}=L;
end
%% Index of sorted divergences raw data
[~,~,idxx] = histcounts(Raw_Test_Trop2);
%idxx2 = reshape(idxx,[n_sqr_trop, n_sqr_trop]);

for yy=1:length(Raw_Test_Trop2)
    CC = bwconncomp(M_Test_Trop2{yy,1});
    L = zeros(CC.ImageSize);
    for ii = 1:CC.NumObjects
        L(CC.PixelIdxList{ii}) = idxx(yy);    %fill in indices
    end
    binind2{yy,1}=L;
end
%% Index of difference
diffval = abs(Trop_Y2-Raw_Test_Trop2);
[~,~,iidx] = histcounts(diffval);
%iidx2 = reshape(iidx,[n_sqr_trop, n_sqr_trop]);

for yy=1:length(Trop_Y2)
    CC = bwconncomp(M_Test_Trop2{yy,1});
    L = zeros(CC.ImageSize);
    for ii = 1:CC.NumObjects
        L(CC.PixelIdxList{ii}) = iidx(yy);    %fill in indices
    end
    ibinind{yy,1}=L;
end
%% Ind images:
Master_Trop_Ind=[];
Master_Trop_Ind2=[];
Master_Trop_Ind3=[];
binind_res = reshape(binind,[n_sqr_trop n_sqr_trop]);
binind_res2 = reshape(binind2,[n_sqr_trop n_sqr_trop]);
binind_res3 = reshape(ibinind,[n_sqr_trop n_sqr_trop]);
for qq=1:n_sqr_trop
    Master_Row = [];
    Master_Row2 = [];
    Master_Row3 = [];
    for ww=1:n_sqr_trop
        Master_Row = [Master_Row,binind_res{qq,ww}];
        Master_Row2 = [Master_Row2,binind_res2{qq,ww}];
        Master_Row3 = [Master_Row3,binind_res3{qq,ww}];
    end
    Master_Trop_Ind=[Master_Trop_Ind;Master_Row];
    Master_Trop_Ind2=[Master_Trop_Ind2;Master_Row2];
    Master_Trop_Ind3=[Master_Trop_Ind3;Master_Row3];
    clear Master_Row Master_Row2
end
%% Plot 1: Predicted divergence:
sz1 = size(Master_Trop_Ind,1); sz2 = size(Master_Trop_Ind,2);
Lrgb = label2rgb(Master_Trop_Ind);
figure1 = figure('Colormap',...
        [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 0.9375;0.125 1 0.875;0.1875 1 0.8125;0.25 1 0.75;0.3125 1 0.6875;0.375 1 0.625;0.4375 1 0.5625;0.5 1 0.5;0.5625 1 0.4375;0.625 1 0.375;0.6875 1 0.3125;0.75 1 0.25;0.8125 1 0.1875;0.875 1 0.125;0.9375 1 0.0625;1 1 0;1 0.899999976158142 0;1 0.800000011920929 0;1 0.699999988079071 0;1 0.600000023841858 0;1 0.5 0;1 0.400000005960464 0;1 0.300000011920929 0;1 0.200000002980232 0;1 0.100000001490116 0;1 0 0;0.964285731315613 0 0;0.928571403026581 0 0;0.892857134342194 0 0;0.857142865657806 0 0;0.821428596973419 0 0;0.785714268684387 0 0;0.75 0 0;0.714285731315613 0 0;0.678571403026581 0 0;0.642857134342194 0 0;0.607142865657806 0 0;0.571428596973419 0 0;0.535714268684387 0 0;0.5 0 0]);
axes1 = axes('Parent',figure1,'YDir','reverse','Layer','top');
%Lim = caxis;
%caxis([0 1])
set(axes1,'TickLength',[0 0]);

xlim(axes1,[0 sz2]);
ylim(axes1,[0 sz1]);

box(axes1,'on');
hold(axes1,'all');
% Create image
image(Lrgb,'Parent',axes1,'CDataMapping','scaled');
colorbar('peer',axes1);
title(['Predicted ', nmesv],'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[]);
yyaxis right
ylabel ([nmesv],'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
k = [0, 0, 0];
axes1.YColor = k;%
set(gcf,'Position',get(0,'Screensize'))
saveas(figure1,[pathysv,'Predicted_',nmesv,'.tif'])
%% Plot 2: Observed divergence:
sz1 = size(Master_Trop_Ind2,1); sz2 = size(Master_Trop_Ind2,2);
Lrgb = label2rgb(Master_Trop_Ind2);
figure2 = figure('Colormap',...
        [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 0.9375;0.125 1 0.875;0.1875 1 0.8125;0.25 1 0.75;0.3125 1 0.6875;0.375 1 0.625;0.4375 1 0.5625;0.5 1 0.5;0.5625 1 0.4375;0.625 1 0.375;0.6875 1 0.3125;0.75 1 0.25;0.8125 1 0.1875;0.875 1 0.125;0.9375 1 0.0625;1 1 0;1 0.899999976158142 0;1 0.800000011920929 0;1 0.699999988079071 0;1 0.600000023841858 0;1 0.5 0;1 0.400000005960464 0;1 0.300000011920929 0;1 0.200000002980232 0;1 0.100000001490116 0;1 0 0;0.964285731315613 0 0;0.928571403026581 0 0;0.892857134342194 0 0;0.857142865657806 0 0;0.821428596973419 0 0;0.785714268684387 0 0;0.75 0 0;0.714285731315613 0 0;0.678571403026581 0 0;0.642857134342194 0 0;0.607142865657806 0 0;0.571428596973419 0 0;0.535714268684387 0 0;0.5 0 0]);
axes1 = axes('Parent',figure2,'YDir','reverse','Layer','top');
%Lim = caxis;
%caxis([0 1])
set(axes1,'TickLength',[0 0]);

xlim(axes1,[0 sz2]);
ylim(axes1,[0 sz1]);

box(axes1,'on');
hold(axes1,'all');
% Create image
image(Lrgb,'Parent',axes1,'CDataMapping','scaled');
colorbar('peer',axes1);
title(['Actual ', nmesv],'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[]);
yyaxis right
ylabel ([nmesv],'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
k = [0, 0, 0];
axes1.YColor = k;%
set(gcf,'Position',get(0,'Screensize'))
saveas(figure2,[pathysv,'Observed_',nmesv,'.tif'])
%% Plot 3: Observed divergence difference:
sz1 = size(Master_Trop_Ind3,1); sz2 = size(Master_Trop_Ind3,2);
Lrgb = label2rgb(Master_Trop_Ind3,'gray');
figure2 = figure('Colormap',gray);
axes1 = axes('Parent',figure2,'YDir','reverse','Layer','top');
Lim = caxis;
caxis([0 1])
set(axes1,'TickLength',[0 0]);

xlim(axes1,[0 sz2]);
ylim(axes1,[0 sz1]);

box(axes1,'on');
hold(axes1,'all');
% Create image
image(Lrgb,'Parent',axes1,'CDataMapping','scaled');
colorbar('peer',axes1);
title(['Absolute Difference of ', nmesv],'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[]);
yyaxis right
ylabel ('Absolute Difference','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
k = [0, 0, 0];
axes1.YColor = k;%
set(gcf,'Position',get(0,'Screensize'))
saveas(figure2,[pathysv,'Absolute_Difference',nmesv,'.tif'])
end