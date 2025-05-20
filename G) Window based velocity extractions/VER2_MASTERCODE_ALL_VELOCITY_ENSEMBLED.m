%% Extract window based velocities
% Common save path:
%
%1...................................................................................................................................
% %Features Location
% path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData\');
% path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData\');
% %Laevis
% path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData\');
% path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData\');
% %Axolotl
% path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData\');
% path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData\');

path1{1,1} =('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\F) After all feature extractions\ReshapedData\');

%Features Location Flipped
% path1{1,1} = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\ReshapedData_Flip\');
% path1{2,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\ReshapedData_Flip\');
% %Laevis
% path1{3,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\ReshapedData_Flip\');
% path1{4,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\ReshapedData_Flip\');
% %Axolotl
% path1{5,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\ReshapedData_Flip\');
% path1{6,1} =('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\ReshapedData_Flip\');

%2...................................................................................................................................
%Velocity Location
% pathy{1,1} = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\Sectioned Velocity\');
% pathy{2,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\Sectioned Velocity\');
% %Laevis
% pathy{3,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S9\Sectioned Velocity\');
% pathy{4,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\Sectioned Velocity\');
% %Axolotl
% pathy{5,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S4\Sectioned Velocity\');
% pathy{6,1} =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\Sectioned Velocity\');

pathy{1,1} =('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\Sectioned Velocity\');
%% Window Settings
%thresh=[10;10;8;8;16;16];
%blocksize = [150;150;120;120;240;240];
%overlap=0.75;

thresh=[16];
blocksize = [240];
overlap=0.75;
%pf = [2.14];
%%
% svpath2{1,1} =([path1{1,1},'Extracted_All_MAT_Files.mat']);
% svpath2{2,1} =([path1{2,1},'Extracted_All_MAT_Files.mat']);
% svpath2{3,1} =([path1{3,1},'Extracted_All_MAT_Files.mat']);
% svpath2{4,1} =([path1{4,1},'Extracted_All_MAT_Files.mat']);
% svpath2{5,1} =([path1{5,1},'Extracted_All_MAT_Files.mat']);
% svpath2{6,1} =([path1{6,1},'Extracted_All_MAT_Files.mat']);

svpath2{1,1} =([path1{1,1},'Extracted_All_MAT_Files.mat']);
%% DEFAULT NORMALIZED
for ff = 1:length(path1)
    if(exist([path1{ff,1},'Divergence_Features'])~=7)
        mkdir([path1{ff,1},'Divergence_Features'])
    end
    if(exist([path1{ff,1},'Velocity_Features'])~=7)
        mkdir([path1{ff,1},'Velocity_Features'])
    end
end
%% FOR RAW VELOCITY VALUES 
%cd('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Window Based Velocity Extractions')
tic
for kk= 1:length(pathy)
VER5_MASTER_VELOCITY_EXTRACTION(blocksize(kk,1),overlap,pathy{kk,1},path1{kk,1},svpath2{kk,1})
%FLIP_VER5_MASTER_VELOCITY_EXTRACTION(blocksize(kk,1),overlap,pathy{kk,1},path1{kk,1},svpath2{kk,1})
end
toc