%% Get universal test and train sets:
%Load Features:
% %Features Location
path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData\');
%Laevis
path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData\');
path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData\');
%Axolotl
path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData\');
path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData\');

%Features Location Flipped
path2{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData_Flip\');
path2{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData_Flip\');
%Laevis
path2{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData_Flip\');
path2{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData_Flip\');
%Axolotl
path2{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData_Flip\');
path2{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData_Flip\');
%% Subpathname
subpathname_div{1,1}=('Divergence_Features\Head_Master_Div.xlsx');
subpathname_div{2,1}=('Divergence_Features\Midup_Master_Div.xlsx');
subpathname_div{3,1}=('Divergence_Features\Middown_Master_Div.xlsx');
subpathname_div{4,1}=('Divergence_Features\Tail_Master_Div.xlsx');

subpathname_rms{1,1}=('Velocity_Features\Head_Master_RMS.xlsx');
subpathname_rms{2,1}=('Velocity_Features\Midup_Master_RMS.xlsx');
subpathname_rms{3,1}=('Velocity_Features\Middown_Master_RMS.xlsx');
subpathname_rms{4,1}=('Velocity_Features\Tail_Master_RMS.xlsx');

subpathname_theta{1,1}=('Velocity_Features\Head_Master_Theta.xlsx');
subpathname_theta{2,1}=('Velocity_Features\Midup_Master_Theta.xlsx');
subpathname_theta{3,1}=('Velocity_Features\Middown_Master_Theta.xlsx');
subpathname_theta{4,1}=('Velocity_Features\Tail_Master_Theta.xlsx');

subpathname{1,1}=('Head_Master_Tol.xlsx');
subpathname{2,1}=('Midup_Master_Tol.xlsx');
subpathname{3,1}=('Middown_Master_Tol.xlsx');
subpathname{4,1}=('Tail_Master_Tol.xlsx');
%% New Train function:
tic
hol=7.5; %Percentage of data held per section
%Images:
M_Test_Images=[]; M_Train_Images=[]; 
%Divergence:
M_Test_Norm_Div=[]; M_Train_Norm_Div=[]; M_Test_Div=[]; M_Train_Div=[];
%RMS:
M_Test_Norm_Rms=[]; M_Train_Norm_Rms=[]; M_Test_Rms=[]; M_Train_Rms=[];
%Theta:
M_Test_Norm_Theta=[]; M_Train_Norm_Theta=[]; M_Test_Theta=[]; M_Train_Theta=[];

for uu=1:length(path1)
    [Test_Images,Train_Images,S_Test_Div,S_Train_Div,S_Test_Norm_Div,S_Train_Norm_Div,S_Test_Rms,S_Train_Rms,S_Test_Norm_Rms,S_Train_Norm_Rms,S_Test_Theta,S_Train_Theta,S_Test_Norm_Theta,S_Train_Norm_Theta] = master_test_train_sample(path2{uu,1},subpathname,subpathname_div,subpathname_rms,subpathname_theta,hol);
    %Images:
    M_Test_Images=[M_Test_Images;Test_Images]; M_Train_Images=[M_Train_Images;Train_Images];
    %Divergence:
    M_Test_Norm_Div=[M_Test_Norm_Div;S_Test_Norm_Div]; M_Train_Norm_Div=[M_Train_Norm_Div;S_Train_Norm_Div]; M_Test_Div=[M_Test_Div;S_Test_Div]; M_Train_Div=[M_Train_Div;S_Train_Div];
    %RMS:
    M_Test_Norm_Rms=[M_Test_Norm_Rms;S_Test_Norm_Rms]; M_Train_Norm_Rms=[M_Train_Norm_Rms;S_Train_Norm_Rms]; M_Test_Rms=[M_Test_Rms;S_Test_Rms]; M_Train_Rms=[M_Train_Rms;S_Train_Rms];
    %Theta:
    M_Test_Norm_Theta=[M_Test_Norm_Theta;S_Test_Norm_Theta]; M_Train_Norm_Theta=[M_Train_Norm_Theta;S_Train_Norm_Theta]; M_Test_Theta=[ M_Test_Theta;S_Test_Theta]; M_Train_Theta=[M_Train_Theta;S_Train_Theta];

    clear Test_Images Train_Images S_Test_Div S_Train_Div S_Test_Norm_Div S_Train_Norm_Div S_Test_Rms S_Train_Rms S_Test_Norm_Rms S_Train_Norm_Rms S_Test_Theta S_Train_Theta S_Test_Norm_Theta S_Train_Norm_Theta 
end

toc
%% Add labels:
label_test = labelsamples(M_Test_Images);
label_train = labelsamples(M_Train_Images);
%% Save tables:
% %Divergence: 
% %Raw table
% writetable(M_Train_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train1.xlsx')
% writetable(M_Test_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test1.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train_Norm1.xlsx')
% writetable(M_Test_Norm_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test_Norm1.xlsx')
% %Label
% writecell(label_train,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train1.xlsx')
% writecell(label_test,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test1.xlsx')
% %.........................................................................................................................................................................................................................
% %Velocity: 
% %Raw table
% writetable(M_Train_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train1.xlsx')
% writetable(M_Test_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test1.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train_Norm1.xlsx')
% writetable(M_Test_Norm_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test_Norm1.xlsx')
% %.........................................................................................................................................................................................................................
% %Direction: 
% %Raw table
% writetable(M_Train_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train1.xlsx')
% writetable(M_Test_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test1.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train_Norm1.xlsx')
% writetable(M_Test_Norm_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test_Norm1.xlsx')
% %Images:
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Test_Train_Images1.mat','M_Test_Images','M_Train_Images')
%% For flipped images
% %Divergence: 
% %Raw table
% writetable(M_Train_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train2.xlsx')
% writetable(M_Test_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test2.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train_Norm2.xlsx')
% writetable(M_Test_Norm_Div,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test_Norm2.xlsx')
% %Label
% writecell(label_train,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train2.xlsx')
% writecell(label_test,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test2.xlsx')
% %.........................................................................................................................................................................................................................
% %Velocity: 
% %Raw table
% writetable(M_Train_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train2.xlsx')
% writetable(M_Test_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test2.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train_Norm2.xlsx')
% writetable(M_Test_Norm_Rms,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test_Norm2.xlsx')
% %.........................................................................................................................................................................................................................
% %Direction: 
% %Raw table
% writetable(M_Train_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train2.xlsx')
% writetable(M_Test_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test2.xlsx')
% %Output Normalized
% writetable(M_Train_Norm_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train_Norm2.xlsx')
% writetable(M_Test_Norm_Theta,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test_Norm2.xlsx')
% %Images:
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Test_Train_Images2.mat','M_Test_Images','M_Train_Images')
%% Single master table Divergence:
%%Divergence:
%%D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test_Norm1.xlsx');
%%D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train_Norm1.xlsx');
% 
%%D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test_Norm2.xlsx');
%%D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train_Norm2.xlsx');
%%..................................................................................................................................................................%
%Raw Data
% D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test1.xlsx');
% D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train1.xlsx');
% 
% D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test2.xlsx');
% D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train2.xlsx');
% %..................................................................................................................................................................% 
% Master_Test = [D1_Test;D2_Test];
% Master_Train = [D1_Train;D2_Train];
% 
% Test_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test1.xlsx');
% Test_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test2.xlsx');
% Test_Label = [Test_Label1;Test_Label2];
% 
% Train_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train1.xlsx');
% Train_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train2.xlsx');
% Train_Label = [Train_Label1;Train_Label2];
% 
% All_Label = [Test_Label;Train_Label];
% 
% Master_Divergence = [D1_Test;D2_Test;D1_Train;D2_Train];
% Master_Divergence_Norm = normalize(Master_Divergence,'Range',[0 1]);
% 
% rs = size(D1_Test,1) + size(D2_Test,1);
% Master_Train1 = Master_Divergence_Norm(rs+1:end,:);
% Master_Train_Fin = Master_Train1(randperm(size(Master_Train1,1)),:);
% Master_Test_Fin = Master_Divergence_Norm(1:rs,:);
%% Single master table velocity:
%%Velocity:
D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test_Norm1.xlsx');
D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train_Norm1.xlsx');

D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test_Norm2.xlsx');
D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train_Norm2.xlsx');
%..................................................................................................................................................................% 
%Raw Data
% D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test1.xlsx');
% D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train1.xlsx');
% 
% D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test2.xlsx');
% D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train2.xlsx');
.................................................................................................................................................................. 
Master_Test = [D1_Test;D2_Test];
Master_Train = [D1_Train;D2_Train];

Test_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test1.xlsx');
Test_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test2.xlsx');
Test_Label = [Test_Label1;Test_Label2];

Train_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train1.xlsx');
Train_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train2.xlsx');
Train_Label = [Train_Label1;Train_Label2];

All_Label = [Test_Label;Train_Label];

Master_Velocity = [D1_Test;D2_Test;D1_Train;D2_Train];
Master_Velocity_Norm = normalize(Master_Velocity,'Range',[0 1]);

rs = size(D1_Test,1) + size(D2_Test,1);
Master_Train1 = Master_Velocity_Norm(rs+1:end,:);
Master_Train_Fin = Master_Train1(randperm(size(Master_Train1,1)),:);
Master_Test_Fin = Master_Velocity_Norm(1:rs,:);
%% Single master table direction
%%Direction:
% D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test_Norm1.xlsx');
% D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train_Norm1.xlsx');
% 
% D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test_Norm2.xlsx');
% D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train_Norm2.xlsx');
%.................................................................................................................................................................. 
%Raw Data:
% D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test1.xlsx');
% D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train1.xlsx');
% 
% D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Test2.xlsx');
% D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Direction\Train2.xlsx');
%..................................................................................................................................................................
% Master_Test = [D1_Test;D2_Test];
% Master_Train = [D1_Train;D2_Train];
% 
% Test_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test1.xlsx');
% Test_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Test2.xlsx');
% Test_Label = [Test_Label1;Test_Label2];
% 
% Train_Label1 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train1.xlsx');
% Train_Label2 = readcell('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Label_Train2.xlsx');
% Train_Label = [Train_Label1;Train_Label2];
% 
% All_Label = [Test_Label;Train_Label];
% 
% Master_Direction = [D1_Test;D2_Test;D1_Train;D2_Train];
% Master_Direction_Norm = normalize(Master_Direction,'Range',[0 1]);
% 
% rs = size(D1_Test,1) + size(D2_Test,1);
% Master_Train1 = Master_Direction_Norm(rs+1:end,:);
% Master_Train_Fin = Master_Train1(randperm(size(Master_Train1,1)),:);
% Master_Test_Fin = Master_Direction_Norm(1:rs,:);
%% PCA
[coeff,score,~,~,explained,~] = pca(table2array(Master_Velocity_Norm(:,1:end-1)));
figure;
biplot(coeff(:,1:2),'scores',score(:,1:2),'varlabels',{'Area','Orientation','Aspect','Circularity','Coverage','MCC_Number','Avg_Dist','Uniformity','Wavelength','Order_Parameter'});
set(gcf, 'Position', get(0, 'Screensize'));
%saveas(gcf,[divpath,'Win ',num2str(blocksize),'\Final Models\PCA2.tif']);
%%
figure;
biplot(coeff(:,1:3),'scores',score(:,1:3),'varlabels',{'Area','Orientation','Aspect','Circularity','Coverage','MCC_Number','Avg_Dist','Uniformity','Wavelength','Order_Parameter'});
set(gcf, 'Position', get(0, 'Screensize'));
%% Test Train Images:
T1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Test_Train_Images1.mat');
T2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Test_Train_Images2.mat');
%% Save Test Images as tif:
imgsvpth = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Raw Test Images\');
for nn=1:length(T1.M_Train_Images)
    tempimg = T1.M_Train_Images{nn,1};
    imwrite(tempimg,[imgsvpth,'Test_Img',num2str(nn),'.tif'])
    clear tempimg
end
%% Table for classification:
Label_Table_Train = cell2table(Train_Label,'VariableNames',{'Species'});
Class_Table = [Master_Train1(:,1:end-1),Label_Table_Train];
Class_Table_Fin = Class_Table(randperm(size(Class_Table,1)),:);
%% Save divergence model:
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Divergence\TrainedModels.mat','trainedModel_IntLinear','trainedModel_FGaussSVM','trainedModel_Mtree')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Divergence\RGPR_TrainedModel.mat','trainedModel_RGPR')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Divergence\EGPR_TrainedModel.mat','trainedModel_EGPR')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Divergence\Optimized_EGPR_TrainedModel.mat','trainedModel_Optimized_EGPR')
%% Save velocity model:
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Velocity\TrainedModels.mat','trainedModel_IntLinear','trainedModel_FGaussSVM','trainedModel_Mtree')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Velocity\RGPR_TrainedModel.mat','trainedModel_RGPR')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Velocity\EGPR_TrainedModel.mat','trainedModel_EGPR')
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Velocity\Optimized_RGPR_TrainedModel.mat','trainedModel_Optimized_RGPR')
%% Save direction model:
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Direction\TrainedModels.mat','trainedModel_IntLinear','trainedModel_FGaussSVM','trainedModel_Mtree')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Direction\RGPR_TrainedModel.mat','trainedModel_RGPR')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Direction\EGPR_TrainedModel.mat','trainedModel_EGPR')
% save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Models\Direction\Optimized_RGPR_TrainedModel.mat','trainedModel_Optimized_RGPR')
%% Predictions:
% Prepare data for predictions:
%................................................................................................................................................................................................
Act_Test = Master_Test_Fin.Divergence;
Master_Test_Fin.Divergence=NaN(size(Master_Test_Fin,1),1);

% Act_Test = Master_Test_Fin.Magnitude;
% Master_Test_Fin.Magnitude=NaN(size(Master_Test_Fin,1),1);
%................................................................................................................................................................................................
% Make predictions
%................................................................................................................................................................................................
%YY2 = trainedModel_EGPR.predictFcn(Master_Test_Fin);
YY2 = trainedModel_Optimized_EGPR.predictFcn(Master_Test_Fin);
Y_Act = Act_Test;

% YY2 = trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin);
% Y_Act = Act_Test;
%................................................................................................................................................................................................
%   Performance metrics:
RE = (YY2-Y_Act).^2;
R2 = 1-[sum(RE)/sum((Y_Act-mean2(Y_Act)).^2)]
R22 = var(YY2)/var(Y_Act)
Co = corrcoef(Y_Act,YY2);
P = Co(1,2)^2
%% Split YY:
%Master_Features = getrawvaluesback_V2(Master_Test_Fin,Master_Divergence);
Master_Features = getrawvaluesback_V2(Master_Test_Fin,Master_Velocity);
t=0; l=0; a=0;
Trop_Y =[];Axolotl_Y =[]; Laevis_Y =[];
for vv=1:length(Test_Label)
    if(strcmpi(Test_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Trop_Y(t,1)=YY2(vv,1);
        Trop_Table(t,:) = Master_Features(vv,:);
    elseif(strcmpi(Test_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Laevis_Y(l,1)=YY2(vv,1);
        Laevis_Table(l,:) = Master_Features(vv,:);
    else
        a=a+1;
        Axolotl_Y(a,1)=YY2(vv,1);
        Axolotl_Table(a,:) = Master_Features(vv,:);
    end
end
%Min_max_div = readmatrix('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Min_Max_Final_Divergence.xlsx');
Min_max_div = readmatrix('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Min_Max_RMS.xlsx');
Trop_Y_Raw = normalize(Trop_Y,'range',[Min_max_div(1,1) Min_max_div(2,1)]);
Laevis_Y_Raw = normalize(Laevis_Y,'range',[Min_max_div(1,2) Min_max_div(2,2)]);
Axolotl_Y_Raw = normalize(Axolotl_Y,'range',[Min_max_div(1,3) Min_max_div(2,3)]);

Esembled_Table_Features = [[Trop_Table];[Laevis_Table];[Axolotl_Table]];
Ensembled_Predictions_Raw = [Trop_Y_Raw;Laevis_Y_Raw;Axolotl_Y_Raw];
%% Full data split divergence:
% t=0; l=0; a=0;
% for vv=1:length(All_Label)
%     if(strcmpi(All_Label{vv,1},('Tropicalis'))==1)
%         t=t+1;
%         Trop_Table(t,:) = Master_Divergence(vv,:);
%     elseif(strcmpi(All_Label{vv,1},('Laevis'))==1)
%         l=l+1;
%         Laevis_Table(l,:) = Master_Divergence(vv,:);
%     else
%         a=a+1;
%         Axolotl_Table(a,:) = Master_Divergence(vv,:);
%     end
% end
% [Min_Max_Trop,~] = getminmaxtable(Trop_Table);
% [Min_Max_Laevis,~] = getminmaxtable(Laevis_Table);
% [Min_Max_Axolotl,~] = getminmaxtable(Axolotl_Table);
%% Full data split velocity:
% t=0; l=0; a=0;
% for vv=1:length(All_Label)
%     if(strcmpi(All_Label{vv,1},('Tropicalis'))==1)
%         t=t+1;
%         Trop_Table(t,:) = Master_Velocity(vv,:);
%     elseif(strcmpi(All_Label{vv,1},('Laevis'))==1)
%         l=l+1;
%         Laevis_Table(l,:) = Master_Velocity(vv,:);
%     else
%         a=a+1;
%         Axolotl_Table(a,:) = Master_Velocity(vv,:);
%     end
% end
% [Min_Max_Trop,~] = getminmaxtable(Trop_Table);
% [Min_Max_Laevis,~] = getminmaxtable(Laevis_Table);
% [Min_Max_Axolotl,~] = getminmaxtable(Axolotl_Table);
%% Output Vs Input Raw Features
%Divergence:
pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\All_Features_Raw\Features Vs Output\Divergence\Axolotl\');
multiple_line_plots_trend_V2(Axolotl_Table,pathy);

%Velocity:
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\All_Features_Raw\Features Vs Output\Velocity\Axolotl\');
% multiple_line_plots_trend_V2(Axolotl_Table,pathy);
%% Gather Raw test:
% RawTest1 = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test1.xlsx');
% RawTest2 = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test2.xlsx');
RawTest1 = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test1.xlsx');
RawTest2 = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test2.xlsx');
Raw_Test = [RawTest1;RawTest2];
%Raw_Test_Fin = Raw_Test.Divergence;
Raw_Test_Fin = Raw_Test.Magnitude;
%
t=0; l=0; a=0;
Raw_Test_Trop=[]; Raw_Test_Laevis=[]; Raw_Test_Axolotl=[];
for vv=1:length(Test_Label)
    if(strcmpi(Test_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Raw_Test_Trop(t,1)=Raw_Test_Fin(vv,1);
    elseif(strcmpi(Test_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Raw_Test_Laevis(l,1)=Raw_Test_Fin(vv,1);
    else
        a=a+1;
        Raw_Test_Axolotl(a,1)=Raw_Test_Fin(vv,1);
    end
end
Ensembled_Raw_Test = [Raw_Test_Trop;Raw_Test_Laevis;Raw_Test_Axolotl];
%% Performance metrics:
RE = (Ensembled_Raw_Test-Ensembled_Predictions_Raw).^2;
R2 = 1-[sum(RE)/sum((Ensembled_Raw_Test-mean2(Ensembled_Raw_Test)).^2)]
R22 = var(Ensembled_Predictions_Raw)/var(Ensembled_Raw_Test)
Co = corrcoef(Ensembled_Raw_Test,Ensembled_Predictions_Raw);
P = Co(1,2)^2
%% Prediction comparison:
figure;
%plot(Ensembled_Raw_Test,Ensembled_Predictions_Raw,'.c','LineWidth',4,'MarkerSize',30);
plot(Raw_Test_Trop,Trop_Y_Raw,'.c','LineWidth',4,'MarkerSize',30);hold on;
plot(Raw_Test_Laevis,Laevis_Y_Raw,'.m','LineWidth',4,'MarkerSize',30);hold on;
plot(Raw_Test_Axolotl,Axolotl_Y_Raw,'.k','LineWidth',4,'MarkerSize',30);hold off;
xlabel('Observed Divergence','FontWeight','bold','FontSize',15)
ylabel('Predicted Divergence','FontWeight','bold','FontSize',15)
legend({'Tropicalis','Laevis','Axolotl'})
%% Features Vs Divergence
%figure('Position', get(0, 'Screensize'));
% figure;
% plot(Trop_Table.Area,Trop_Y_Raw,'.c','LineWidth',4,'MarkerSize',30);hold on;
% plot(Laevis_Table.Area,Laevis_Y_Raw,'.m','LineWidth',4,'MarkerSize',30);hold on;
% plot(Axolotl_Table.Area,Axolotl_Y_Raw,'.k','LineWidth',4,'MarkerSize',30);hold off;
% xlabel('MCC Area','FontWeight','bold','FontSize',15)
% ylabel('Divergence','FontWeight','bold','FontSize',15)
%% Get master divergence sepecies wise:
%%Divergence:
% D1_Test_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test1.xlsx');
% D1_Train_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train1.xlsx');
% 
% D2_Test_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test2.xlsx');
% D2_Train_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train2.xlsx');
% 
% Master_Divergence_Raw = [D1_Test_Raw;D2_Test_Raw;D1_Train_Raw;D2_Train_Raw];

%Velocity:
D1_Test_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test1.xlsx');
D1_Train_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train1.xlsx');

D2_Test_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Test2.xlsx');
D2_Train_Raw = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Velocity\Train2.xlsx');

Master_Divergence_Raw = [D1_Test_Raw;D2_Test_Raw;D1_Train_Raw;D2_Train_Raw];

t=0; l=0; a=0;
%Raw_All_Trop=[]; Raw_All_Laevis=[]; Raw_All_Axolotl=[];
for vv=1:length(All_Label)
    if(strcmpi(All_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Raw_All_Trop(t,:)=Master_Divergence_Raw (vv,:);
    elseif(strcmpi(All_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Raw_All_Laevis(l,:)=Master_Divergence_Raw (vv,:);
    else
        a=a+1;
        Raw_All_Axolotl(a,:)=Master_Divergence_Raw (vv,:);
    end
end
%Ensembled_Raw_Test = [Raw_Test_Trop;Raw_Test_Laevis;Raw_Test_Axolotl];
%% Plot all raw values
%figure('Position', get(0, 'Screensize'));
% figure;
% plot(Raw_All_Trop.Area,Raw_All_Trop.Divergence,'.c','LineWidth',4,'MarkerSize',30);hold on;
% plot(Raw_All_Laevis.Area,Raw_All_Laevis.Divergence,'.m','LineWidth',4,'MarkerSize',30);hold on;
% plot(Raw_All_Axolotl.Area,Raw_All_Axolotl.Divergence,'.k','LineWidth',4,'MarkerSize',30);hold off;
% xlabel('MCC Area','FontWeight','bold','FontSize',15)
% ylabel('Divergence','FontWeight','bold','FontSize',15)
pathii=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\All_Features_Raw\Ensembled Predictions\Raw Values Velocity\');
Plotrawvalues_All(Raw_All_Trop,Raw_All_Laevis,Raw_All_Axolotl,pathii)
%% Plot all predicted values
pathii=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\All_Features_Raw\Ensembled Predictions\Predicted Values\');
Plotrawvalues_Predictions(Trop_Table,Laevis_Table,Axolotl_Table,Trop_Y_Raw,Laevis_Y_Raw,Axolotl_Y_Raw,pathii)
%% Predicted Average Table Response:
Matri = [1:4,6,7,9].';
varnames = Master_Test_Fin.Properties.VariableNames;
x=[0.01:0.01:1].';
M_Avg_Tab=[];
for gg=1:length(Matri)
    g = Matri(gg,1);
    Avg_Tab_Mat = 0.5+zeros(100,11);
    Avg_Tab_Mat(:,g)=x;
    New_cvg = Avg_Tab_Mat(:,1).*Avg_Tab_Mat(:,6);
    New_u = sqrt(Avg_Tab_Mat(:,6)).*Avg_Tab_Mat(:,7);
    New_o = 1 - (sqrt(2)*0.0564)./Avg_Tab_Mat(:,9);
    Avg_Tab_Mat(:,5)=New_cvg;
    Avg_Tab_Mat(:,8)=New_u;
    Avg_Tab_Mat(:,10)=New_o;
    Avg_Table = array2table(Avg_Tab_Mat,'VariableNames',varnames);
    Y(:,gg) = trainedModel_Optimized_EGPR.predictFcn(Avg_Table);
    M_Avg_Tab=[M_Avg_Tab;Avg_Tab_Mat];
end
%% Plot Average Table Response:
pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\All_Features_Raw\Average Response Predictions\');
multiple_single_prediction_plot_V3(Avg_Table,x,Y,pathy,Matri,Master_Divergence)
%% New Tables for square plot
% Pairs:[1-5,6-5,6-8,7-8,9-10] 
% Dependent: [5,8,10]
varnames = Master_Test.Properties.VariableNames;
xx = linspace(0.01,1,10);
Arr = meshgrid(xx);
Pr2 =Arr.';
Avg_Tab_Mat_Area = 0.5+zeros(100,11);
Avg_Tab_Mat_Area(:,1)=Arr(:);
Avg_Tab_Mat_Area(:,6)=Pr2(:);
New_cvg = Avg_Tab_Mat_Area(:,1).*Avg_Tab_Mat_Area(:,6);
New_u = sqrt(Avg_Tab_Mat_Area(:,6)).*Avg_Tab_Mat_Area(:,7);
New_o = 1 - (sqrt(2)*0.0564)./Avg_Tab_Mat_Area(:,9);
%New_o = normalize(New_o,'range',[0 1]);
Avg_Tab_Mat_Area(:,5)=New_cvg;
Avg_Tab_Mat_Area(:,8)=New_u;
Avg_Tab_Mat_Area(:,10)=New_o;
Avg_Table_Area = array2table(Avg_Tab_Mat_Area,'VariableNames',varnames);
%YY= trainedModel_Optimized_EGPR.predictFcn(Avg_Table_Area);
YY= trainedModel_Optimized_RGPR.predictFcn(Avg_Table_Area);
%% Get back raw values:
%Data3 = table2array(getrawvaluesback_V2(Avg_Table_Area,Master_Divergence));
Data3 = table2array(getrawvaluesback_V2(Avg_Table_Area,Master_Velocity));
%% Surface Plot
figure;
%....................................................................................................................................................
surface(reshape(Data3(:,1),[10 10]),reshape(Data3(:,6),[10 10]),reshape(YY,[10 10]))
%title('Area, Number of MCC Vs Divergence ','FontSize',15)
title('Area, Number of MCC Vs Velocity ','FontSize',15)
xlabel('Area','FontWeight','bold','FontSize',15)
%........................................................................................................................................................
ylabel('Number of MCC','FontWeight','bold','FontSize',15)
%zlabel('Divergence','FontWeight','bold','FontSize',15)
zlabel('Velocity','FontWeight','bold','FontSize',15)
set(gca,'FontWeight','bold','FontSize',15)
%legend('divergence');
colormap parula;
colorbar;
%parula;
%view(3)