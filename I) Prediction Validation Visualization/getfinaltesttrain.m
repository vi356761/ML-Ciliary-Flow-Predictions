function [Master_Train_Fin,Master_Test_Fin,Master_Train,Master_Test] = getfinaltesttrain(pth1)
D1_Test = readtable([pth1,'Test_Norm1.xlsx']);
D1_Train = readtable([pth1,'Train_Norm1.xlsx']);

D2_Test = readtable([pth1,'Test_Norm2.xlsx']);
D2_Train = readtable([pth1,'Train_Norm2.xlsx']);
%..................................................................................................................................................................%
%%Raw Data
% D1_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test1.xlsx');
% D1_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train1.xlsx');
% 
% D2_Test = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Test2.xlsx');
% D2_Train = readtable('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master Tables\Divergence\Train2.xlsx');
%..................................................................................................................................................................% 
Master_Test = [D1_Test;D2_Test];
Master_Train = [D1_Train;D2_Train];

Master_Divergence = [D1_Test;D2_Test;D1_Train;D2_Train];
Master_Divergence_Norm = normalize(Master_Divergence,'Range',[0 1]);

rs = size(D1_Test,1) + size(D2_Test,1);
Master_Train1 = Master_Divergence_Norm(rs+1:end,:);
Master_Train_Fin = Master_Train1(randperm(size(Master_Train1,1)),:);
Master_Test_Fin = Master_Divergence_Norm(1:rs,:);
end