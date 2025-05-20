%% Master all codes combined:
%............................................................................................................................................................................
% Path reshaped 
% %Trops
% loadpath{1,1} = ('Finresize_S1.mat');
% loadpath{2,1} = ('Finresize_S4.mat');
% %Laevis
% loadpath{3,1} = ('Reshaped_Seg_Fin.mat');
% loadpath{4,1} = ('Reshaped_Seg_Fin.mat');
% %Axolotl
% loadpath{5,1} = ('Reshaped_Seg_Cilia_Fin.mat');
% loadpath{6,1} = ('Reshaped_Seg_Cilia_Fin.mat');
loadpath{1,1} = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\Reshaped Data\Reshaped_Seg_Cilia_Fin.mat');
%% Path reshaped flipped
%Trops
%loadpath_flip(1:6,1) = {'Reshaped_Seg_Cilia_Fin_Flip.mat'};
loadpath_flip(1,1) = {'Reshaped_Seg_Cilia_Fin_Flip.mat'};
%% Common save path:
%Trops
% path{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\');
% path{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\');
% %Laevis
% path{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\');
% path{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\');
% %Axolotl
% path{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\');
% path{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\');
path{1,1} = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\F) After all feature extractions\');
%%
%cd ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Feature Extraction Tissue\');
% Default values for trop reshaped:
% thresh=10;
% blocksize = 150;
% overlap=0.75;
%Ver4_Res_Master_All_Feature_Extraction_One_One_Flow_Raw(pathi1,pathi2,blocksize,overlap,pf,thresh)
% cd ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Feature Extraction Tissue\');
% svpath1{1,1} = ([path{1,1},'Win ',num2str(blocksize(1,1)),'\All_T1_S4_Resized_tol.mat']);
% svpath1{2,1} =([path{2,1},'Win ',num2str(blocksize(2,1)),'\All_T1_S5_Resized_tol.mat']);
% svpath1{3,1} =([path{3,1},'Win ',num2str(blocksize(3,1)),'\All_T2_S2_Resized_tol.mat']);
% svpath1{4,1} =([path{4,1},'Win ',num2str(blocksize(4,1)),'\All_T2_S4_Resized_tol.mat']);
% svpath1{5,1} =([path{5,1},'Win ',num2str(blocksize(5,1)),'\All_T3_S3_Resized_tol.mat']);
% svpath1{6,1} =([path{6,1},'Win ',num2str(blocksize(6,1)),'\All_T3_S4_Resized_tol.mat']);
% 
% svpath3{1,1} = ([path{1,1},'Win ',num2str(blocksize(1,1)),'\Master_Props\']);
% svpath3{2,1} =([path{2,1},'Win ',num2str(blocksize(2,1)),'\Master_Props\']);
% svpath3{3,1} =([path{3,1},'Win ',num2str(blocksize(3,1)),'\Master_Props\']);
% svpath3{4,1} =([path{4,1},'Win ',num2str(blocksize(4,1)),'\Master_Props\']);
% svpath3{5,1} =([path{5,1},'Win ',num2str(blocksize(5,1)),'\Master_Props\']);
% svpath3{6,1} =([path{6,1},'Win ',num2str(blocksize(6,1)),'\Master_Props\']);
%%
% thresh=[10;10;8;8;16;16];
% blocksize = [150;150;120;120;240;240];
% overlap=0.75+zeros(6,1);
% pf = [1.47;1.47;2.14;2.14;2.14;2.14];
thresh=[16];
blocksize = [240];
overlap=0.75;
pf = [2.14];
%%
%cd ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Feature Extraction Tissue\');
%Ver5_Res_Master_All_Feature_Extraction_One_One_Flow_Raw(path{1,1},loadpath{1,1},150,0.75,1.47,10)
for yy=1:length(path)
    %Change lines 20 and 50 for different path%
    Ver5_Res_Master_All_Feature_Extraction_One_One_Flow_Raw(path{yy,1},loadpath{yy,1},blocksize(yy,1),overlap(yy,1),pf(yy,1),thresh(yy,1))
    %Ver5_Res_Master_All_Feature_Extraction_One_One_Flow_Raw(path{yy,1},loadpath_flip{yy,1},blocksize(yy,1),overlap(yy,1),pf(yy,1),thresh(yy,1))
    close all;clc
end
%% Save separate section-wise excel files for each sample:
% YY = readmatrix('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Features.xlsx','Range','A:A','Sheet',4);
% varnames = {'Area','Orientation','Aspect_Ratio','Circularity','Coverage_Fraction','MCC_Number','Average_Minimum_Distance','Uniformity','Wavelength','Order_Parameter'};
% numsheets = [1:7,9:11].';
% for hh=1:length(path)
% for zz = 1: length(numsheets)
%     ct = numsheets(zz);
%     HH(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','A:A','Sheet',ct));
%     MU(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','B:B','Sheet',ct));
%     MD(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','C:C','Sheet',ct));
%     TT(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','D:D','Sheet',ct));
% end
% %
%  HH_Table = array2table(HH,'VariableNames',varnames);
%  MU_Table = array2table(MU,'VariableNames',varnames);
%  MD_Table = array2table(MD,'VariableNames',varnames);
%  TT_Table = array2table(TT,'VariableNames',varnames);
%  %
%  writetable(HH_Table,[path{hh,1},'ReshapedData\Head_Master_Tol.xlsx'])
%  writetable(MU_Table,[path{hh,1},'ReshapedData\Midup_Master_Tol.xlsx'])
%  writetable(MD_Table,[path{hh,1},'ReshapedData\Middown_Master_Tol.xlsx'])
%  writetable(TT_Table,[path{hh,1},'ReshapedData\Tail_Master_Tol.xlsx'])
%  clearvars -except hh zz path numsheets varnames
% end
%% Save separate section-wise excel files for each sample:
% YY = readmatrix('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\Features.xlsx','Range','A:A','Sheet',4);
varnames = {'Area','Orientation','Aspect_Ratio','Circularity','Coverage_Fraction','MCC_Number','Average_Minimum_Distance','Uniformity','Wavelength','Order_Parameter'};
numsheets = [1:7,9:11].';
for hh=1:length(path)
for zz = 1: length(numsheets)
    ct = numsheets(zz);
    HH(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','A:A','Sheet',ct));
    MU(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','B:B','Sheet',ct));
    MD(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','C:C','Sheet',ct));
    TT(:,zz) = removeNaN(readmatrix([path{hh,1},'ReshapedData\Features.xlsx'],'Range','D:D','Sheet',ct));
end
%
 HH_Table = array2table(HH,'VariableNames',varnames);
 MU_Table = array2table(MU,'VariableNames',varnames);
 MD_Table = array2table(MD,'VariableNames',varnames);
 TT_Table = array2table(TT,'VariableNames',varnames);
 %
 writetable(HH_Table,[path{hh,1},'ReshapedData\Head_Master_Tol.xlsx'])
 writetable(MU_Table,[path{hh,1},'ReshapedData\Midup_Master_Tol.xlsx'])
 writetable(MD_Table,[path{hh,1},'ReshapedData\Middown_Master_Tol.xlsx'])
 writetable(TT_Table,[path{hh,1},'ReshapedData\Tail_Master_Tol.xlsx'])
 clearvars -except hh zz path numsheets varnames
end
%% New path:
%1...................................................................................................................................
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
%% Gather standard deviation
varnames = {'Std_Average_Minimum_Distance'};
Master_Original = [];
Master_Flip = [];
for hh=1:length(path1)

    HH1 = removeNaN(readmatrix([path1{hh,1},'Features.xlsx'],'Range','A:A','Sheet',8));
    MU1 = removeNaN(readmatrix([path1{hh,1},'Features.xlsx'],'Range','B:B','Sheet',8));
    MD1= removeNaN(readmatrix([path1{hh,1},'Features.xlsx'],'Range','C:C','Sheet',8));
    TT1 = removeNaN(readmatrix([path1{hh,1},'Features.xlsx'],'Range','D:D','Sheet',8));

    HH2 = removeNaN(readmatrix([path2{hh,1},'Features.xlsx'],'Range','A:A','Sheet',8));
    MU2 = removeNaN(readmatrix([path2{hh,1},'Features.xlsx'],'Range','B:B','Sheet',8));
    MD2 = removeNaN(readmatrix([path2{hh,1},'Features.xlsx'],'Range','C:C','Sheet',8));
    TT2 = removeNaN(readmatrix([path2{hh,1},'Features.xlsx'],'Range','D:D','Sheet',8));
    
    Mast_Org = [HH1;MU1;MD1;TT1];
    Mast_Flip = [HH2;MU2;MD2;TT2];
    
    Master_Original = [Master_Original;Mast_Org];
    Master_Flip = [Master_Flip;Mast_Flip];

    clear Mast_org Mast_Flip

end
Master_Original_Table = array2table(Master_Original,'VariableNames',varnames);
Master_Flip_Table = array2table(Master_Flip,'VariableNames',varnames);
Master_Stdro_All = [Master_Original_Table;Master_Flip_Table ];
writetable(Master_Original_Table,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master_Stdro.xlsx')
writetable(Master_Flip_Table,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master_Stdro_Flip.xlsx')
writetable(Master_Stdro_All,'D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\All Species Divergence\Master_Stdro_All.xlsx')
%%
mnk = mink(Master_Stdro_All.Std_Average_Minimum_Distance,25);
mak = maxk(Master_Stdro_All.Std_Average_Minimum_Distance,25);
me = mean2(Master_Stdro_All.Std_Average_Minimum_Distance);
%All =[Master_Stdro_All.Std_Average_Minimum_Distance;O_Total_All.Wavelength];