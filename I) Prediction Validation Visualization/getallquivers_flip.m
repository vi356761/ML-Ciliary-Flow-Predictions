function getallquivers_flip(maspath,pathy,blksize,T1,T2,pthnme)
MM = load([maspath,'Extracted_All_MAT_Files.mat']);
tt=load([pathy,'Sectioned_Velocity.mat']);

%Flipped orientation:
canvas1 = tt.Sections2.Head;
canvas2 = tt.Sections2.Tail;
canvas3 = tt.Sections2.Midup;
canvas4 = tt.Sections2.Middown;

canvass1 = xExpandMatrix(rgb2gray(canvas1), 1, 1, blksize, blksize, blksize, blksize, 0);
canvass2 = xExpandMatrix(rgb2gray(canvas2), 1, 1, blksize, blksize, blksize, blksize, 0);
canvass3 = xExpandMatrix(rgb2gray(canvas3), 1, 1, blksize, blksize, blksize, blksize, 0);
canvass4 = xExpandMatrix(rgb2gray(canvas4), 1, 1, blksize, blksize, blksize, blksize, 0);
%% Get actual velocity UX
ATT1 = isnan(MM.ro1);
ATT2 = isnan(MM.ro2);
ATT3 = isnan(MM.ro3);
ATT4 = isnan(MM.ro4);

% AT1 = reshape(ATT1,[size(MM.Master_Images1,2) size(MM.Master_Images1,1)]);
% Index1 = AT1.'; %Head 
% 
% AT2 = reshape(ATT2,[size(MM.Master_Images2,2) size(MM.Master_Images2,1)]);
% Index2 = AT2.'; %Tail
% 
% AT3 = reshape(ATT3,[size(MM.Master_Images3,2) size(MM.Master_Images3,1)]);
% Index3 = AT3.'; %Midup
% 
% AT4 = reshape(ATT4,[size(MM.Master_Images4,2) size(MM.Master_Images4,1)]);
% Index4 = AT4.'; %Middown

%................................................................................................................................................................................
ETT1 = readtable([maspath,'Divergence_Features\Head_Master_Div.xlsx'],'range','A:J');
ETT2 = readtable([maspath,'Divergence_Features\Midup_Master_Div.xlsx'],'range','A:J');
ETT3 = readtable([maspath,'Divergence_Features\Middown_Master_Div.xlsx'],'range','A:J');
ETT4 = readtable([maspath,'Divergence_Features\Tail_Master_Div.xlsx'],'range','A:J');

ETT =[ETT1;ETT2;ETT3;ETT4];

ET1 = readtable([maspath,'Velocity_Features\Head_Master_RMS.xlsx'],'range','K:K');
ET2 = readtable([maspath,'Velocity_Features\Midup_Master_RMS.xlsx'],'range','K:K');
ET3 = readtable([maspath,'Velocity_Features\Middown_Master_RMS.xlsx'],'range','K:K');
ET4 = readtable([maspath,'Velocity_Features\Tail_Master_RMS.xlsx'],'range','K:K');

EET1 = readtable([maspath,'Velocity_Features\Head_Master_Theta.xlsx'],'range','K:K');
EET2 = readtable([maspath,'Velocity_Features\Midup_Master_Theta.xlsx'],'range','K:K');
EET3 = readtable([maspath,'Velocity_Features\Middown_Master_Theta.xlsx'],'range','K:K');
EET4 = readtable([maspath,'Velocity_Features\Tail_Master_Theta.xlsx'],'range','K:K');
%................................................................................................................................................................................
%................................................................................................................................................................................
%
[~,HI] = rmoutliers(ETT1,'Mean');
ET1.Magnitude(HI) = 0;
EET1.Theta(HI) = 0;
[~,HI] = rmoutliers(ETT2,'Mean');
ET2.Magnitude(HI) = 0;
EET2.Theta(HI) = 0;
[~,HI] = rmoutliers(ETT3,'Mean');
ET3.Magnitude(HI) = 0;
EET3.Theta(HI) = 0;
[~,HI] = rmoutliers(ETT4,'Mean');
ET4.Magnitude(HI) = 0;
EET4.Theta(HI) = 0;

ET = [ET1;ET2;ET3;ET4];
ET1_Div_Norm = normalize(ET.Magnitude,'Range',[0 1]);
%EET = [EET1;EET2;EET3;EET4];
EET = [EET1.Theta;EET2.Theta;EET3.Theta;EET4.Theta];

ET_Head = ET1_Div_Norm(1:length(ET1.Magnitude),:);
ET_Mu = ET1_Div_Norm(length(ET1.Magnitude)+1:length(ET1.Magnitude)+length(ET2.Magnitude),:);
ET_Md = ET1_Div_Norm(length(ET1.Magnitude)+length(ET2.Magnitude)+1:length(ET1.Magnitude)+length(ET2.Magnitude)+length(ET3.Magnitude),:);
ET_Tail = ET1_Div_Norm(length(ET1.Magnitude)+length(ET2.Magnitude)+length(ET3.Magnitude)+1:end,:);

EET_Head = EET(1:length(EET1.Theta),:);
EET_Mu = EET(length(EET1.Theta)+1:length(EET1.Theta)+length(EET2.Theta),:);
EET_Md = EET(length(EET1.Theta)+length(EET2.Theta)+1:length(EET1.Theta)+length(EET2.Theta)+length(EET3.Theta),:);
EET_Tail = EET(length(EET1.Theta)+length(EET2.Theta)+length(EET3.Theta)+1:end,:);

% %Velocity:
% T1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Velocity\Optimized_RGPR_TrainedModel.mat');
% %Direction:
% T2=load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Direction\Optimized_RGPR_TrainedModel.mat');

Master_Divergence = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master_Divergence.xlsx');
EP = getrawvaluesback_V3(ETT,Master_Divergence);
yfit = T1.trainedModel_Optimized_RGPR.predictFcn(EP);
yfit2 = T2.trainedModel_Optimized_RGPR.predictFcn(EP);
yfit22=normalize(yfit2,'range',[min(EET) max(EET)]);

ET_Head_RMS = yfit(1:length(ET1.Magnitude),:);
ET_Mu_RMS = yfit(length(ET1.Magnitude)+1:length(ET1.Magnitude)+length(ET2.Magnitude),:);
ET_Md_RMS = yfit(length(ET1.Magnitude)+length(ET2.Magnitude)+1:length(ET1.Magnitude)+length(ET2.Magnitude)+length(ET3.Magnitude),:);
ET_Tail_RMS = yfit(length(ET1.Magnitude)+length(ET2.Magnitude)+length(ET3.Magnitude)+1:end,:);

ET_Head_Theta = yfit22(1:length(EET1.Theta),:);
ET_Mu_Theta = yfit22(length(EET1.Theta)+1:length(EET1.Theta)+length(EET2.Theta),:);
ET_Md_Theta = yfit22(length(EET1.Theta)+length(EET2.Theta)+1:length(EET1.Theta)+length(EET2.Theta)+length(EET3.Theta),:);
ET_Tail_Theta = yfit22(length(EET1.Theta)+length(EET2.Theta)+length(EET3.Theta)+1:end,:);

[~,HI] = rmoutliers(ETT1,'Mean');
ET_Head_RMS(HI) = 0;
ET_Head_Theta(HI) = 0;
[~,HI] = rmoutliers(ETT2,'Mean');
ET_Mu_RMS(HI) = 0;
ET_Mu_Theta(HI) = 0;
[~,HI] = rmoutliers(ETT3,'Mean');
ET_Md_RMS(HI) = 0;
ET_Md_Theta(HI) = 0;
[~,HI] = rmoutliers(ETT4,'Mean');
ET_Tail_RMS(HI) = 0;
ET_Tail_Theta(HI) = 0;

[G_ET_Head,G_EET_Head] =getreshapedwindowfills(ATT1,ET_Head,EET_Head);
[G_ET_Tail,G_EET_Tail] =getreshapedwindowfills(ATT2,ET_Tail,EET_Tail);
[G_ET_Midup,G_EET_Midup] =getreshapedwindowfills(ATT3,ET_Mu,EET_Mu);
[G_ET_Middown,G_EET_Middown] =getreshapedwindowfills(ATT4,ET_Md,EET_Md);

[G_ET_Head_Pred,G_EET_Head_Pred] =getreshapedwindowfills(ATT1,ET_Head_RMS,ET_Head_Theta);
[G_ET_Tail_Pred,G_EET_Tail_Pred] =getreshapedwindowfills(ATT2,ET_Tail_RMS,ET_Tail_Theta);
[G_ET_Midup_Pred,G_EET_Midup_Pred] =getreshapedwindowfills(ATT3,ET_Mu_RMS,ET_Mu_Theta);
[G_ET_Middown_Pred,G_EET_Middown_Pred] =getreshapedwindowfills(ATT4,ET_Md_RMS,ET_Md_Theta);
%%
G_EET_Head_C = convert_angles_360(G_EET_Head); G_EET_Tail_C = convert_angles_360(G_EET_Tail); G_EET_Midup_C = convert_angles_360(G_EET_Midup); G_EET_Middown_C = convert_angles_360(G_EET_Middown);
G_EET_Head_Pred_C =convert_angles_360(G_EET_Head_Pred); G_EET_Tail_Pred_C =convert_angles_360(G_EET_Tail_Pred); G_EET_Midup_Pred_C =convert_angles_360(G_EET_Midup_Pred); G_EET_Middown_Pred_C =convert_angles_360(G_EET_Middown_Pred);

All_centx1 = [MM.window_centx1]; All_centx3 = [MM.window_centx3]; All_centx4 = [MM.window_centx4]; All_centx2 = [MM.window_centx2];
All_centy1 = [MM.window_centy1]; All_centy3 = [MM.window_centy3]; All_centy4 = [MM.window_centy4]; All_centy2 = [MM.window_centy2];
ux1 = G_ET_Head.*cosd(G_EET_Head_C); uy1 = G_ET_Head.*sind(G_EET_Head_C); ux1_pred = G_ET_Head_Pred.*cosd(G_EET_Head_Pred_C); uy1_pred = G_ET_Head_Pred.*sind(G_EET_Head_Pred_C);
ux2 = G_ET_Tail.*cosd(G_EET_Tail_C); uy2 = G_ET_Tail.*sind(G_EET_Tail_C); ux2_pred = G_ET_Tail_Pred.*cosd(G_EET_Tail_Pred_C); uy2_pred = G_ET_Tail_Pred.*sind(G_EET_Tail_Pred_C);
ux3 = G_ET_Midup.*cosd(G_EET_Midup_C); uy3 = G_ET_Midup.*sind(G_EET_Midup_C); ux3_pred = G_ET_Midup_Pred.*cosd(G_EET_Midup_Pred_C); uy3_pred = G_ET_Midup_Pred.*sind(G_EET_Midup_Pred_C);
ux4 = G_ET_Middown.*cosd(G_EET_Middown_C); uy4 = G_ET_Middown.*sind(G_EET_Middown_C); ux4_pred = G_ET_Middown_Pred.*cosd(G_EET_Middown_Pred_C); uy4_pred = G_ET_Middown_Pred.*sind(G_EET_Middown_Pred_C);
%% Plot figures
figure; imshow(canvass1)
hold on;
q1=quiver(All_centx1,All_centy1,ux1,-uy1,'r');
q1.MaxHeadSize = 2;
q1.LineWidth = 2;
q1.AutoScaleFactor = 2;
hold on;
q2=quiver(All_centx1,All_centy1,ux1_pred,-uy1_pred,'b');
q2.MaxHeadSize = 2;
q2.LineWidth = 2;
q2.AutoScaleFactor = 2;
hold off;
title('Head Section')
set(gca,'ydir','reverse')
legend({'Observed','Predicted'})
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Head_Original.tif'])

% figure; imshow(canvass1)
% hold on;
% quiver(All_centx1,All_centy1,ux1,-uy1,'r')
% hold on;
% quiver(All_centx1,All_centy1,ux1_pred,-uy1_pred,'b')
% hold off;
% title('Head Section')
% set(gca,'ydir','reverse')
% legend({'Observed','Predicted'})
% set(gcf,'Position',get(0,'Screensize'))
% saveas(gcf,[pthnme,'Head_Original.tif'])
%...............................................................................................................................................................................................
%...............................................................................................................................................................................................
%...............................................................................................................................................................................................
%...............................................................................................................................................................................................
figure; imshow(canvass2)
hold on;
q1=quiver(All_centx2,All_centy2,ux2,-uy2,'r');
q1.MaxHeadSize = 2;
q1.LineWidth = 2;
q1.AutoScaleFactor = 2;
hold on;
q2=quiver(All_centx2,All_centy2,ux2_pred,-uy2_pred,'b');
q2.MaxHeadSize = 2;
q2.LineWidth = 2;
q2.AutoScaleFactor = 2;
hold off;
title('Tail Section')
set(gca,'ydir','reverse')
legend({'Observed','Predicted'})
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Tail_Original.tif'])

% figure; imshow(canvass2)
% hold on;
% quiver(All_centx2,All_centy2,ux2,-uy2,'r')
% hold on;
% quiver(All_centx2,All_centy2,ux2_pred,-uy2_pred,'b')
% hold off;
% title('Tail Section')
% set(gca,'ydir','reverse')
% legend({'Observed','Predicted'})
% set(gcf,'Position',get(0,'Screensize'))
% saveas(gcf,[pthnme,'Tail_Original.tif'])
%...............................................................................................................................................................................................
figure; imshow(canvass3)
hold on;
q1=quiver(All_centx3,All_centy3,ux3,-uy3,'r');
q1.MaxHeadSize = 2;
q1.LineWidth = 2;
q1.AutoScaleFactor = 2;
hold on;
q2=quiver(All_centx3,All_centy3,ux3_pred,-uy3_pred,'b');
q2.MaxHeadSize = 2;
q2.LineWidth = 2;
q2.AutoScaleFactor = 2;
hold off;
title('Mid-dorsal Section')
set(gca,'ydir','reverse')
legend({'Observed','Predicted'})
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Midup_Original.tif'])

% figure; imshow(canvass3)
% hold on;
% quiver(All_centx3,All_centy3,ux3,-uy3,'r')
% hold on;
% quiver(All_centx3,All_centy3,ux3_pred,-uy3_pred,'b')
% hold off;
% title('Midup Section')
% set(gca,'ydir','reverse')
% legend({'Observed','Predicted'})
% set(gcf,'Position',get(0,'Screensize'))
% saveas(gcf,[pthnme,'Midup_Original.tif'])
%...............................................................................................................................................................................................
figure; imshow(canvass4)
hold on;
q1=quiver(All_centx4,All_centy4,ux4,-uy4,'r');
q1.MaxHeadSize = 2;
q1.LineWidth = 2;
q1.AutoScaleFactor = 2;
hold on;
q2=quiver(All_centx4,All_centy4,ux4_pred,-uy4_pred,'b');
q2.MaxHeadSize = 2;
q2.LineWidth = 2;
q2.AutoScaleFactor = 2;
hold off;
title('Mid-ventral Section')
set(gca,'ydir','reverse')
legend({'Observed','Predicted'})
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Middown_Original.tif'])

% figure; imshow(canvass4)
% hold on;
% quiver(All_centx4,All_centy4,ux4,-uy4,'r')
% hold on;
% quiver(All_centx4,All_centy4,ux4_pred,-uy4_pred,'b')
% hold off;
% title('Middown Section')
% set(gca,'ydir','reverse')
% legend({'Observed','Predicted'})
% set(gcf,'Position',get(0,'Screensize'))
% saveas(gcf,[pthnme,'Middown_Original.tif'])
%% Plot only Quivers:
% figure;
% quiverC2D2(All_centx1,flip(All_centy1),ux1,uy1)
% title('Head Section Observed Flow')

figure;
quiverC2D2(All_centx1,All_centy1,ux1,-uy1)
title('Head Section Observed Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Head_Quiver_Observed.tif'])

figure;
quiverC2D2(All_centx1,All_centy1,ux1_pred,-uy1_pred)
title('Head Section Predicted Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Head_Quiver_Predicted.tif'])
%.........................................................................................................................................................
figure;
quiverC2D2(All_centx2,All_centy2,ux2,-uy2)
title('Tail Section Observed Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Tail_Quiver_Observed.tif'])

figure;
quiverC2D2(All_centx2,All_centy2,ux2_pred,-uy2_pred)
title('Tail Section Predicted Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Tail_Quiver_Predicted.tif'])
%.........................................................................................................................................................
figure;
quiverC2D2(All_centx3,All_centy3,ux3,-uy3)
title('Midup Section Observed Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Midup_Quiver_Observed.tif'])

figure;
quiverC2D2(All_centx3,All_centy3,ux3_pred,-uy3_pred)
title('Midup Section Predicted Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Midup_Quiver_Predicted.tif'])
%.........................................................................................................................................................
figure;
quiverC2D2(All_centx4,All_centy4,ux4,-uy4)
title('Middown Section Observed Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Middown_Quiver_Observed.tif'])

figure;
quiverC2D2(All_centx4,All_centy4,ux4_pred,-uy4_pred)
title('Middown Section Predicted Flow')
set(gca,'ydir','reverse')
set(gcf,'Position',get(0,'Screensize'))
saveas(gcf,[pthnme,'Middown_Quiver_Predicted.tif'])

close all;
end