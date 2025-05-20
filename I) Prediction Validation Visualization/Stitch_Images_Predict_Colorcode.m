%% Load Test Labels, plot everything 
%%Divergence:
% D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test_Norm1.xlsx');
% D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Train_Norm1.xlsx');
% 
% D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test_Norm2.xlsx');
% D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Train_Norm2.xlsx');
% %..................................................................................................................................................................%
% %%Raw Data
% % D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test1.xlsx');
% % D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Train1.xlsx');
% % 
% % D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test2.xlsx');
% % D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Train2.xlsx');
% %..................................................................................................................................................................% 
% Master_Test = [D1_Test;D2_Test];
% Master_Train = [D1_Train;D2_Train];
% 
% Test_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test1.xlsx');
% Test_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test2.xlsx');
% Test_Label = [Test_Label1;Test_Label2];
% 
% Train_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train1.xlsx');
% Train_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train2.xlsx');
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
%%
%%Velocity:
D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test_Norm1.xlsx');
D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Train_Norm1.xlsx');

D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test_Norm2.xlsx');
D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Train_Norm2.xlsx');
%..................................................................................................................................................................% 
%Raw Data
% D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test1.xlsx');
% D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Train1.xlsx');
% 
% D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test2.xlsx');
% D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Train2.xlsx');
.................................................................................................................................................................. 
Master_Test = [D1_Test;D2_Test];
Master_Train = [D1_Train;D2_Train];

Test_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test1.xlsx');
Test_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test2.xlsx');
Test_Label = [Test_Label1;Test_Label2];

Train_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train1.xlsx');
Train_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train2.xlsx');
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
% D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Test_Norm1.xlsx');
% D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Train_Norm1.xlsx');
% 
% D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Test_Norm2.xlsx');
% D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Train_Norm2.xlsx');
% .................................................................................................................................................................. 
% % % Raw Data:
% % % D1_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Test1.xlsx');
% % % D1_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Train1.xlsx');
% % % 
% % % D2_Test = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Test2.xlsx');
% % % D2_Train = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Train2.xlsx');
% ..................................................................................................................................................................
% Master_Test = [D1_Test;D2_Test];
% Master_Train = [D1_Train;D2_Train];
% 
% Test_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test1.xlsx');
% Test_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test2.xlsx');
% Test_Label = [Test_Label1;Test_Label2];
% 
% Train_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train1.xlsx');
% Train_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train2.xlsx');
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
%% New species wise normalized table for feature ranking:
%Raw_Test = [RawTest1;RawTest2];

Raw_Test  = [D1_Train;D2_Train];
%..........................................................................................................................................................................................................
Raw_Test1 = getrawvaluesback_V3(Raw_Test(:,1:end-1),Master_Divergence(:,1:end-1));
%Raw_Test1 = getrawvaluesback_V3(Raw_Test(:,1:end-1),Master_Velocity(:,1:end-1));
%Raw_Test1 = getrawvaluesback_V3(Raw_Test(:,1:end-1),Master_Direction(:,1:end-1));
Raw_Test_Fin =[Raw_Test1,Raw_Test(:,end)];
%Raw_Test_Fin = Raw_Test.Magnitude;
%Raw_Test_Fin = Raw_Test.Theta;
%..........................................................................................................................................................................................................
%
t=0; l=0; a=0;
for vv=1:length(Train_Label)
    if(strcmpi(Train_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Trop_Table(t,:) = Raw_Test_Fin(vv,:);
        Trop_Table_Raw(t,:) = Raw_Test(vv,:);
    elseif(strcmpi(Train_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Laevis_Table(l,:) = Raw_Test_Fin(vv,:);
        Laevis_Table_Raw(l,:) = Raw_Test(vv,:);
    else
        a=a+1;
        Axolotl_Table(a,:) = Raw_Test_Fin(vv,:);
        Axolotl_Table_Raw(a,:) = Raw_Test(vv,:);
    end
end
%% Plot among features:
%figure('Position', get(0, 'Screensize'));
figure;
plot(Trop_Table_Raw.Circularity,Trop_Table_Raw.Area,'.','Color','m','LineWidth',4);
title('Circularity Vs Area','FontSize',15)
xlabel('Circularity','FontWeight','bold','FontSize',15)
ylabel('Area','FontWeight','bold','FontSize',15)

figure;
plot(Laevis_Table_Raw.Circularity,Laevis_Table_Raw.Area,'.','Color','m','LineWidth',4);
title('Circularity Vs Area','FontSize',15)
xlabel('Circularity','FontWeight','bold','FontSize',15)
ylabel('Area','FontWeight','bold','FontSize',15)

figure;
plot(Axolotl_Table_Raw.Circularity,Axolotl_Table_Raw.Area,'.','Color','m','LineWidth',4);
title('Circularity Vs Area','FontSize',15)
xlabel('Circularity','FontWeight','bold','FontSize',15)
ylabel('Area','FontWeight','bold','FontSize',15)
% pathii = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Raw_Features_Tropicalis\');
% %all_features_plot_select(Master_Features,pathii);
% all_features_plot(Trop_Table_Raw(:,1:end-1),pathii);
% 
% pathii2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Raw_Features_Laevis\');
% all_features_plot(Laevis_Table_Raw(:,1:end-1),pathii2);
% 
% pathii3 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Raw_Features_Axolotl\');
% all_features_plot(Axolotl_Table_Raw(:,1:end-1),pathii3);
%% Load models:
%Divergence:
%load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Divergence\Optimized_EGPR_TrainedModel.mat')
%Velocity:
load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\Optimized_RGPR_TrainedModel.mat')
%Direction:
%load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\Optimized_RGPR_TrainedModel.mat')
%% Load test and train images:
M1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Test_Train_Images1.mat');
M2 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Test_Train_Images2.mat');
M_Test = [M1.M_Test_Images;M2.M_Test_Images];
%% Predictions:
% Prepare data for predictions:
%................................................................................................................................................................................................
% Act_Test = Master_Test_Fin.Divergence;
% Master_Test_Fin.Divergence=NaN(size(Master_Test_Fin,1),1);

Act_Test = Master_Test_Fin.Magnitude;
Master_Test_Fin.Magnitude=NaN(size(Master_Test_Fin,1),1);

% Act_Test = Master_Test_Fin.Theta;
% Master_Test_Fin.Theta=NaN(size(Master_Test_Fin,1),1);
%................................................................................................................................................................................................
% Make predictions
%................................................................................................................................................................................................
% YY2 = trainedModel_Optimized_EGPR.predictFcn(Master_Test_Fin);
% Y_Act = Act_Test;

YY2 = trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin);
Y_Act = Act_Test;
%................................................................................................................................................................................................
%%   Performance metrics:
RE = (YY2-Y_Act).^2;
R2 = 1-[sum(RE)/sum((Y_Act-mean2(Y_Act)).^2)]
R22 = (var(YY2)/var(Y_Act))
Co = corrcoef(Y_Act,YY2);
P = Co(1,2)^2
%% Split YY:
%..........................................................................................................................................................................................................
%Master_Features = getrawvaluesback_V2(Master_Test_Fin,Master_Divergence);
%Master_Features = getrawvaluesback_V2(Master_Test_Fin,Master_Velocity);
%..........................................................................................................................................................................................................
t=0; l=0; a=0;
Trop_Y =[];Axolotl_Y =[]; Laevis_Y =[];
for vv=1:length(Test_Label)
    if(strcmpi(Test_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Trop_Y(t,1)=YY2(vv,1);
        M_Test_Trop{t,1} = M_Test{vv,1};
    elseif(strcmpi(Test_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Laevis_Y(l,1)=YY2(vv,1);
        M_Test_Laevis{l,1} = M_Test{vv,1};
    else
        a=a+1;
        Axolotl_Y(a,1)=YY2(vv,1);
        M_Test_Axolotl{a,1} = M_Test{vv,1};
    end
end
%..........................................................................................................................................................................................................
%Min_max_div = readmatrix('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Min_Max_Final_Divergence.xlsx');
Min_max_div = readmatrix('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Min_Max_RMS.xlsx');
%Min_max_div = readmatrix('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\Min_Max_Direction.xlsx');
%..........................................................................................................................................................................................................
Trop_Y_Raw = normalize(Trop_Y,'range',[Min_max_div(1,1) Min_max_div(2,1)]);
Laevis_Y_Raw = normalize(Laevis_Y,'range',[Min_max_div(1,2) Min_max_div(2,2)]);
Axolotl_Y_Raw = normalize(Axolotl_Y,'range',[Min_max_div(1,3) Min_max_div(2,3)]);
Ensembled_Predictions_Raw = [Trop_Y_Raw;Laevis_Y_Raw;Axolotl_Y_Raw];
%% Gather Raw test:
%..........................................................................................................................................................................................................
% RawTest1 = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test1.xlsx');
% RawTest2 = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\Test2.xlsx');
% RawTest1 = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test1.xlsx');
% RawTest2 = readtable('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\Test2.xlsx');
%..........................................................................................................................................................................................................
%Raw_Test = [RawTest1;RawTest2];
Raw_Test  = [D1_Test;D2_Test];
%..........................................................................................................................................................................................................
%Raw_Test_Fin = Raw_Test.Divergence;
Raw_Test_Fin = Raw_Test.Magnitude;
%Raw_Test_Fin = Raw_Test.Theta;
%..........................................................................................................................................................................................................
%
t=0; l=0; a=0;
Raw_Test_Trop=[]; Raw_Test_Laevis=[]; Raw_Test_Axolotl=[];
for vv=1:length(Test_Label)
    if(strcmpi(Test_Label{vv,1},('Tropicalis'))==1)
        t=t+1;
        Raw_Test_Trop(t,1)=Raw_Test_Fin(vv,1);
        Trop_Table(t,:) = Raw_Test(vv,1:end-1);
    elseif(strcmpi(Test_Label{vv,1},('Laevis'))==1)
        l=l+1;
        Raw_Test_Laevis(l,1)=Raw_Test_Fin(vv,1);
        Laevis_Table(l,:) = Raw_Test(vv,1:end-1);
    else
        a=a+1;
        Raw_Test_Axolotl(a,1)=Raw_Test_Fin(vv,1);
        Axolotl_Table(a,:) = Raw_Test(vv,1:end-1);
    end
end
Ensembled_Raw_Test = [Raw_Test_Trop;Raw_Test_Laevis;Raw_Test_Axolotl];
Esembled_Table_Features = [[Trop_Table];[Laevis_Table];[Axolotl_Table]];
%% Performance metrics raw data:
% Ensembled_Predictions_Norm = normalize(Ensembled_Predictions_Raw,'Range',[0 1]);
% Ensembled_Norm_Test = normalize(Ensembled_Raw_Test,'Range',[0 1]);
% % Ensembled_Predictions_Norm = Ensembled_Predictions_Raw;
% % Ensembled_Norm_Test = Ensembled_Raw_Test;
% 
% RE = (Ensembled_Norm_Test-Ensembled_Predictions_Norm).^2;
% R2 = 1-[sum(RE)/sum((Ensembled_Norm_Test-mean2(Ensembled_Norm_Test)).^2)]
% %R22 = [var(Ensembled_Predictions_Norm)/var(Ensembled_Norm_Test)]
% R22 = [sum((Ensembled_Predictions_Norm-mean2(Ensembled_Norm_Test)).^2)]/[sum((Ensembled_Norm_Test-mean2(Ensembled_Norm_Test)).^2)]
% Co = corrcoef(Ensembled_Norm_Test,Ensembled_Predictions_Norm);
% P = Co(1,2)^2
%% Pad and stitch images:
%Get original sizes
pdsz = size(YY2,1);
pdsz_trop = size(Trop_Y,1); 
pdsz_laevis = size(Laevis_Y,1); 
pdsz_axolotl = size(Axolotl_Y,1);
%Get nearest square
n_sqr = ceil(sqrt(pdsz));
n_sqr_trop = ceil(sqrt(pdsz_trop));
n_sqr_laevis = ceil(sqrt(pdsz_laevis));
n_sqr_axolotl = ceil(sqrt(pdsz_axolotl));
%% Resize test images to keep the size consistent:
New_M_Test = cell(size(M_Test));
for ee=1:length(M_Test)
    if(size(M_Test{ee,1},1)~=120)
        New_M_Test{ee,1}= imresize(M_Test{ee,1},[120 120],'bicubic');
    else
        New_M_Test{ee,1}=M_Test{ee,1};
    end
end
%% Visualize test divergence using functions:
%Divergence........................................................................................................................................................................................................................................................
%pathysv = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Divergence\Figures\');
% visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Divergence');

% pathysv1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Divergence\Figures\New Figures All Test\Tropicalis\');
% pathysv2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Divergence\Figures\New Figures All Test\Laevis\');
% pathysv3 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Divergence\Figures\New Figures All Test\Axolotl\');
% visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Divergence');
% visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Divergence');
% visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Divergence');
%.........................................................................................................................................................................................................................................................................
%Velocity..................................................................................................................................................................................................................................................................
%pathysv = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Velocity\Figures\');
pathysv = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\');
visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Velocity');

% pathysv1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Velocity\Figures\New Figures All Test\Tropicalis\');
% pathysv2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Velocity\Figures\New Figures All Test\Laevis\');
% pathysv3 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Velocity\Figures\New Figures All Test\Axolotl\');
% visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Velocity');
% visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Velocity');
% visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Velocity');
%.........................................................................................................................................................................................................................................................................
%Direction................................................................................................................................................................................................................................................................
% pathysv = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Direction\Figures\');
% visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Direction');

% pathysv1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Direction\Figures\New Figures All Test\Tropicalis\');
% pathysv2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Direction\Figures\New Figures All Test\Laevis\');
% pathysv3 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Direction\Figures\New Figures All Test\Axolotl\');
% visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Direction');
% visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Direction');
% visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Direction');
%% Full Tiles:
%Divergence...............................................................................................................................................................................................................................................................
%Full_Tiles_visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Divergence');

% Full_Tiles_visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Divergence');
% Full_Tiles_visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Divergence');
% Full_Tiles_visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Divergence');

%Velocity...............................................................................................................................................................................................................................................................
Full_Tiles_visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Velocity');

% Full_Tiles_visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Velocity');
% Full_Tiles_visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Velocity');
% Full_Tiles_visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Velocity');

%Direction...............................................................................................................................................................................................................................................................
%Full_Tiles_visualize_test_all(n_sqr,pdsz,New_M_Test,YY2,Y_Act,pathysv,'Direction');

% Full_Tiles_visualize_test_all(n_sqr_trop,pdsz_trop,M_Test_Trop,Trop_Y,Raw_Test_Trop,pathysv1,'Direction');
% Full_Tiles_visualize_test_all(n_sqr_laevis,pdsz_laevis,M_Test_Laevis,Laevis_Y,Raw_Test_Laevis,pathysv2,'Direction');
% Full_Tiles_visualize_test_all(n_sqr_axolotl,pdsz_axolotl,M_Test_Axolotl,Axolotl_Y,Raw_Test_Axolotl,pathysv3,'Direction');
%% Visualize Vectors:
pth=('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Divergence\');
pth1=('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Velocity\');
pth2=('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Direction\');
[Master_Train_Fin,Master_Test_Fin,Master_Train,Master_Test] = getfinaltesttrain(pth);
[Master_Train_Fin1,Master_Test_Fin1,Master_Train1,Master_Test1] = getfinaltesttrain(pth1);
[Master_Train_Fin2,Master_Test_Fin2,Master_Train2,Master_Test2] = getfinaltesttrain(pth2);
%% All Labels and images:
Test_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test1.xlsx');
Test_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Test2.xlsx');
Test_Label = [Test_Label1;Test_Label2];

Train_Label1 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train1.xlsx');
Train_Label2 = readcell('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Label_Train2.xlsx');
Train_Label = [Train_Label1;Train_Label2];

M1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Test_Train_Images1.mat');
M2 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\All assembled data\Test_Train_Images2.mat');
M_Test = [M1.M_Test_Images;M2.M_Test_Images];
%% Load models
%Divergence:
T = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Divergence\All Features\Optimized_EGPR_TrainedModel.mat');
X = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Divergence\All Features\TrainedModels.mat');
V = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Divergence\All Features\RGPR_TrainedModel.mat');
Z = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Divergence\All Features\EGPR_TrainedModel.mat');
%Velocity:
T1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\All Features\Optimized_RGPR_TrainedModel.mat');
X1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\All Features\TrainedModels.mat');
V1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\All Features\RGPR_TrainedModel.mat');
Z1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\All Features\EGPR_TrainedModel.mat');

%Direction:
T2=load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\Optimized_RGPR_TrainedModel.mat');
X2 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\TrainedModels.mat');
V2 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\RGPR_TrainedModel.mat');
Z2 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\EGPR_TrainedModel.mat');
%% Make predictions
Act_Test = Master_Test_Fin.Divergence;
Master_Test_Fin.Divergence=NaN(size(Master_Test_Fin,1),1);

Act_Test1 = Master_Test_Fin1.Magnitude;
Master_Test_Fin1.Magnitude=NaN(size(Master_Test_Fin1,1),1);

Act_Test2 = Master_Test_Fin2.Theta;
Master_Test_Fin2.Theta=NaN(size(Master_Test_Fin2,1),1);

%Divergence:
YY = T.trainedModel_Optimized_EGPR.predictFcn(Master_Test_Fin);
YY_Opt_EGPR = T.trainedModel_Optimized_EGPR.predictFcn(Master_Test_Fin);
YY_FGauss = X.trainedModel_FGaussSVM.predictFcn(Master_Test_Fin);
YY_Linear = X.trainedModel_IntLinear.predictFcn(Master_Test_Fin);
YY_Tree = X.trainedModel_Mtree.predictFcn(Master_Test_Fin);
YY_EGPR = Z.trainedModel_EGPR.predictFcn(Master_Test_Fin);
YY_RGPR = V.trainedModel_RGPR.predictFcn(Master_Test_Fin);
Y_Act = Act_Test;

%Velocity:
YY1 = T1.trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin1);
YY1_Opt_RGPR = T1.trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin1);
YY1_FGauss = X1.trainedModel_FGaussSVM.predictFcn(Master_Test_Fin1);
YY1_Linear = X1.trainedModel_IntLinear.predictFcn(Master_Test_Fin1);
YY1_Tree = X1.trainedModel_Mtree.predictFcn(Master_Test_Fin1);
YY1_EGPR = Z1.trainedModel_EGPR.predictFcn(Master_Test_Fin1);
YY1_RGPR = V1.trainedModel_RGPR.predictFcn(Master_Test_Fin1);
Y_Act1 = Act_Test1;

%Direction:
YY2 = T2.trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin2);
YY2_Opt_RGPR = T2.trainedModel_Optimized_RGPR.predictFcn(Master_Test_Fin2);
YY2_FGauss = X2.trainedModel_FGaussSVM.predictFcn(Master_Test_Fin2);
YY2_Linear = X2.trainedModel_IntLinear.predictFcn(Master_Test_Fin2);
YY2_Tree = X2.trainedModel_Mtree.predictFcn(Master_Test_Fin2);
YY2_EGPR = Z2.trainedModel_EGPR.predictFcn(Master_Test_Fin2);
YY2_RGPR = V2.trainedModel_RGPR.predictFcn(Master_Test_Fin2);
Y_Act2 = Act_Test2;
%% Gather predictions from different models:
vrnmes = {'Observed','Optimized_EGPR','EGPR','RGPR','Gauss_SVM','Tree','Linear'};
vrnmes2 = {'Observed','Optimized_RGPR','EGPR','RGPR','Gauss_SVM','Tree','Linear'};
Master_Y =array2table([Y_Act,YY_Opt_EGPR,YY_EGPR,YY_RGPR,YY_FGauss,YY_Tree,YY_Linear],'VariableNames',vrnmes);
Master_Y1 =array2table([Y_Act1,YY1_Opt_RGPR,YY1_EGPR,YY1_RGPR,YY1_FGauss,YY1_Tree,YY1_Linear],'VariableNames',vrnmes2);
Master_Y2 =array2table([Y_Act2,YY2_Opt_RGPR,YY2_EGPR,YY2_RGPR,YY2_FGauss,YY2_Tree,YY2_Linear],'VariableNames',vrnmes2);
%% Plot CDF using functions:
[y1, y2] = plotPDF(Y_Act2,YY2_Opt_RGPR);
[yy1, yy2] = plotCDF(Y_Act2,YY2_Opt_RGPR);
%% Quiver preparation and plots:
diffmat = zeros((28*28)-741,1);
Y2 = normalize(YY2,'Range',[-180 180]); Y_Act22 = normalize(Y_Act2,'Range',[-180 180]);
u = [Y_Act1.*cosd(Y_Act22);diffmat]; v = [Y_Act1.*sind(Y_Act22);diffmat];
u1 = [YY1.*cosd(Y2);diffmat]; v1 = [YY1.*sind(Y2);diffmat];
% uu= imresize(u,[27 27],'bicubic'); uu1= imresize(u1,[27 27],'bicubic');
% vv= imresize(v,[27 27],'bicubic'); vv1= imresize(v1,[27 27],'bicubic');
uu= reshape(u,[28 28]); uu1= reshape(u1,[28 28]);
vv= reshape(v,[28 28]); vv1= reshape(v1,[28 28]);
[xx,yy]=meshgrid(1:1:28);
%[xx,yy]=meshgrid(1:10:28*10);
%% Plot quivers:
figure;
quiverC2D2(xx,yy,uu,vv,'scale',2,'LineWidth', 2,'MaxHeadSize', 1); %2
title('Actual Velocity')

figure;
quiverC2D2(xx,yy,uu1,vv1,'scale',2,'LineWidth', 2,'MaxHeadSize', 1); %2
title('Predicted Velocity')
%%
% figure; imshow(Im); hold on;
figure; hold on;
q = quiver(xx,yy,uu,vv,'r'); 
q.MaxHeadSize = 2;
q.LineWidth = 2;
q.AutoScaleFactor = 1;
hold on;
q2 = quiver(xx,yy,uu1,vv1,'b'); 
q2.MaxHeadSize = 2;
q2.LineWidth = 2;
q2.AutoScaleFactor = 1;
hold off;
legend({'Observed','Predicted'})
%% Get dot product:
All_Obs = [u,v]; All_Pred = [u1,v1];
% Pro_Obs = mean2(dot(All_Obs,All_Obs,2))
% Pro_Pred = mean2(dot(All_Pred,All_Pred,2))
% Pro = mean2(dot(All_Obs,All_Pred,2))
% Pro/mean([Pro_Pred,Pro_Obs])

Pro_Obs = dot(All_Obs,All_Obs,2);
Pro = dot(All_Pred,All_Obs,2);
figure;
plot(Pro_Obs,Pro,'.r','MarkerSize',10)
title('Observed Vs Predicted Projections','FontSize',15)
xlabel('Observed projection','FontWeight','bold','FontSize',15)
ylabel('Predicted projection','FontWeight','bold','FontSize',15)
%%
figure;
plot(Y_Act2,YY2,'.r','MarkerSize',10)
title('Observed Vs Predicted Angles','FontSize',15)
xlabel('Normalized Observed Angle','FontWeight','bold','FontSize',15)
ylabel('Normalized Predicted Angle','FontWeight','bold','FontSize',15)

figure;
plot(Y_Act22,Y2,'.r','MarkerSize',10)
title('Observed Vs Predicted Angles','FontSize',15)
xlabel('Observed Angle','FontWeight','bold','FontSize',15)
ylabel('Predicted Angle','FontWeight','bold','FontSize',15)
%% Rose Plot
figure;
h=polarhistogram(deg2rad(Y_Act22),10,'FaceColor','red');
hold on;
h2=polarhistogram(deg2rad(Y2),10,'FaceColor','blue','FaceAlpha',0.5);
set(h,{'linew'},{2})
set(h2,{'linew'},{2})
%h.DisplayStyle = 'stairs';
ax2=gca;
box on;
ax2.FontWeight = 'bold';
ax2.FontSize=25;
%ax2.ThetaDir = 'clockwise';
% ax2.XAxis.FontSize = 15;
% ax2.YAxis.FontSize = 20;
set(ax2,'LineWidth',4)
set(ax2, 'FontName', 'Arial')
legend({'Actual Angle','Predicted Angle'})
%set(gcf, 'Position', get(0, 'Screensize'));
%saveas(gcf,[path,'polarhistogram_1.jpg']);
%% Angle Difference:
figure;
%h=polarhistogram(deg2rad(Y_Act22-Y2),10,'FaceColor','red');
h=polarhistogram(deg2rad(abs(Y_Act22-Y2)),10,'FaceColor','red');
set(h,{'linew'},{2})
%h.DisplayStyle = 'stairs';
ax2=gca;
box on;
ax2.FontWeight = 'bold';
ax2.FontSize=25;
%ax2.ThetaDir = 'clockwise';
% ax2.XAxis.FontSize = 15;
% ax2.YAxis.FontSize = 20;
set(ax2,'LineWidth',4)
set(ax2, 'FontName', 'Arial')
%set(gcf, 'Position', get(0, 'Screensize'));
%% Prepare data
%Load Features:
% %Features Location
% path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData\');
% %Laevis
% path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData\');
% path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData\');
% %Axolotl
% path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData\');
% path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData\');
%% Test + Train Embryo visualization divergence
%dd=3;
%maspath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
%loadpath1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Extracted_All_MAT_Files.mat');
% blocksize = [150;150;120;120;240;240];
% imgtitle = 'Observed Divergence';
% revimg = 'yes';
% ylab = ('Divergence');
% for dd=1:6
%     V2_vizualize_exp_divergence(path1{dd,1},revimg,imgtitle,ylab,blocksize(dd,1))
% end
% Single test image demo:
imgtitle = 'Observed Divergence';
revimg = 'yes';
ylab = ('Divergence');
imgtitle1 = 'Predicted Divergence';


path1=('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\F) After all feature extractions\ReshapedData\');
V2_vizualize_exp_divergence(path1,revimg,imgtitle,ylab,240);
V2_vizualize_pred_divergence(path1,T,revimg,imgtitle1,ylab,240)
%%
%blocksize = [150;150;120;120;240;240];
% maspath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% loadpath1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Extracted_All_MAT_Files.mat');
%imgtitle1 = 'RGPR Predicted Divergence Magnitude';
% imgtitle = 'Predicted Divergence';
% revimg = 'yes';
% ylab = ('Divergence');
% for dd=1:6
%     V2_vizualize_pred_divergence(path1{dd,1},T,revimg,imgtitle,ylab,blocksize(dd,1))
% end

% Single test image demo
%% Visualize Y Labels
figure;
h1 = histogram(Y_Act);
h1.FaceColor = [0 1 1];
hold on;
h2 = histogram(YY,'FaceAlpha',0.5);
h2.FaceColor = [0 0 0];
hold off
axis tight
ylabel('Counts')
xlabel('Normalized Divergence')
%xlabel('Normalized Velocity Magnitude')
%xlabel('Normalized Direction')
ax2=gca;
box on;
ax2.FontWeight = 'bold';
ax2.FontSize=25;
set(ax2,'LineWidth',4)
set(ax2, 'FontName', 'Arial')
legend('Observed Data','Predicted Data')
%% Test + Train Embryo visualization velocity
% %dd=3;
% %maspath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% %loadpath1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Extracted_All_MAT_Files.mat');
% blocksize = [150;150;120;120;240;240];
% imgtitle = 'Observed Velocity Magnitude';
% revimg = 'yes';
% %revimg = 'no';
% ylab = ('Velocity Magnitude');
% for dd=1:6
%     V2_vizualize_exp_magnitude(path1{dd,1},revimg,imgtitle,ylab,blocksize(dd,1))
% end
%%
% blocksize = [150;150;120;120;240;240];
% % maspath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% % loadpath1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Extracted_All_MAT_Files.mat');
% %imgtitle1 = 'RGPR Predicted Velocity Magnitude';
% imgtitle = 'Predicted Velocity Magnitude';
% revimg = 'yes';
% %revimg = 'no';
% ylab = ('Velocity Magnitude');
% for dd=1:6
%     V2_vizualize_pred_magnitude(path1{dd,1},T1,revimg,imgtitle,ylab,blocksize(dd,1))
% end
%% Plot quiver for batch
%Velocity Location
% pathyy{1,1} = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\Sectioned Velocity\');
% pathyy{2,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\Sectioned Velocity\');
% %Laevis
% pathyy{3,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S9\Sectioned Velocity\');
% pathyy{4,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\Sectioned Velocity\');
% %Axolotl
% pathyy{5,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S4\Sectioned Velocity\');
% pathyy{6,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\Sectioned Velocity\');
%% 
%Window extracted features location
% path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData\');
% %Laevis
% path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData\');
% path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData\');
% %Axolotl
% path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData\');
% path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData\');

%Window extracted features location
% path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData_Flip\');
% path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData_Flip\');
% %Laevis
% path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData_Flip\');
% path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData_Flip\');
% %Axolotl
% path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData_Flip\');
% path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData_Flip\');
% %.................................................................................................................................................................................................................................................................
% % Savepath location:
% % pthnme{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Tropicalis\Sample1\');
% % pthnme{2,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Tropicalis\Sample2\');
% % pthnme{3,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Laevis\Sample1\');
% % pthnme{4,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Laevis\Sample2\');
% % pthnme{5,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Axolotl\Sample1\');
% % pthnme{6,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers\Axolotl\Sample2\');
% 
% %Save location flipped:
% pthnme{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Tropicalis\Sample1\');
% pthnme{2,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Tropicalis\Sample2\');
% pthnme{3,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Laevis\Sample1\');
% pthnme{4,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Laevis\Sample2\');
% pthnme{5,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Axolotl\Sample1\');
% pthnme{6,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Figures\Quivers_Flip\Axolotl\Sample2\');
%blocksize = [150;150;120;120;240;240];
%%
% T1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\Optimized_RGPR_TrainedModel.mat');
% %Direction:
% T2=load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\Optimized_RGPR_TrainedModel.mat');
% for gg=1:length(path1)
%     getallquivers(path1{gg,1},pathyy{gg,1},blocksize(gg,1),T1,T2,pthnme{gg,1})
% end
%%
% gg=6;
% getallquivers(path1{gg,1},pathyy{gg,1},blocksize(gg,1),T1,T2,pthnme{gg,1})
%% Quiver for single image demo
%Velocity:
T1 = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Velocity\Optimized_RGPR_TrainedModel.mat');
%Direction:
T2=load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\Master Models\Direction\Optimized_RGPR_TrainedModel.mat');
%%
path1=('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\F) After all feature extractions\ReshapedData\');
pathyy = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\Sectioned Velocity\');
pthnme = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\G) Stored models\');
getallquivers(path1,pathyy,240,T1,T2,pthnme)