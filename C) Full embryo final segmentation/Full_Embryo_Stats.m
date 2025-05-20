%% Merge Sections:
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Head\Headfin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Midup\Midupfin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Middown\Middownfin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Trial3_Sample4\Tail\Tailfin.mat');
%.............................................................................................................................................................................
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\Head\Head_Fin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\Midup\Midup_Fin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\Middown\Middown_Fin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\Tail\Tail_Fin.mat');
%.............................................................................................................................................................................
%Laevis
%.............................................................................................................................................................................
% HH = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Head\Fin_Head.mat');
% MU = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Midup\Midup_Fin.mat');
% MD = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Middown\Middown_Fin.mat');
% TT = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\Laevis\Tail\Tail_Fin.mat');
% 
% Head_Fin = HH.Fin; Midup_Fin = MU.Fin;
% Tail_Fin = TT.Fin; Middown_Fin = MD.Fin;
%.............................................................................................................................................................................
%Axolotl:S4
%.............................................................................................................................................................................
pathy = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\B) After Segmentation\');
HH = load([pathy,'Head\Head_fin.mat']);
MU = load([pathy,'Midup\Midup_fin.mat']);
MD = load([pathy,'Middown\Middown_fin.mat']);
TT = load([pathy,'Tail\Tail_fin.mat']);

Head_Fin1 = HH.Apiarea; Midup_Fin1 = MU.Apiarea;
Tail_Fin1 = TT.Apiarea; Middown_Fin1 = MD.Apiarea;

Head_Fin2 = HH.Ciliarea; Midup_Fin2 = MU.Ciliarea;
Tail_Fin2 = TT.Ciliarea; Middown_Fin2 = MD.Ciliarea;
%.............................................................................................................................................................................
%Axolotl:S7
%.............................................................................................................................................................................
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
% HH = load([pathy,'Head\Head_fin.mat']);
% MU = load([pathy,'Midup\Midup_fin.mat']);
% MD = load([pathy,'Middown\Middown_fin.mat']);
% TT = load([pathy,'Tail\Tail_fin.mat']);
% 
% Head_Fin1 = HH.Apiarea; Midup_Fin1 = MU.Apiarea;
% Tail_Fin1 = TT.Apiarea; Middown_Fin1 = MD.Apiarea;
% 
% Head_Fin2 = HH.Ciliarea; Midup_Fin2 = MU.Ciliarea;
% Tail_Fin2 = TT.Ciliarea; Middown_Fin2 = MD.Ciliarea;
%.............................................................................................................................................................................
%Laevis: S9
%.............................................................................................................................................................................
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\');
% HH = load([pathy,'Head\Head_fin.mat']);
% MU = load([pathy,'Midup\Midup_fin.mat']);
% MD = load([pathy,'Middown\Middown_fin.mat']);
% TT = load([pathy,'Tail\Tail_fin.mat']);
% 
% Head_Fin = HH.Fin; Midup_Fin = MU.Fin;
% Tail_Fin = TT.Fin; Middown_Fin = MD.Fin;
%.............................................................................................................................................................................
%Laevis: S10
%.............................................................................................................................................................................
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\');
% HH = load([pathy,'Head\Head_fin.mat']);
% MU = load([pathy,'Midup\Midup_fin.mat']);
% MD = load([pathy,'Middown\Middown_fin.mat']);
% TT = load([pathy,'Tail\Tail_fin.mat']);
% 
% Head_Fin = HH.Fin; Midup_Fin = MU.Fin;
% Tail_Fin = TT.Fin; Middown_Fin = MD.Fin;
%% Rescale segmented image:
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S4\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S4\All Sections\Sections_Im4_Mem.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\All Sections\Sections_Im4_Mem.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\All Sections\Sections_Im4_Tub.mat');
%..........................................................................................................................................................................
% FOR LAEVIS
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Sample1\Sections_Im1_Mem.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Sample1\Sections_Im1_Tub.mat');
%..........................................................................................................................................................................
% Universal:
h= dir(pathy);
names = {h.name};
ff1 = contains({h.name},'Mem.mat');
ff2 = contains({h.name},'Tub.mat');
fid1 = find(ff1==1);
fid2 = find(ff2==1);
selname1 = names(fid1);
selname2 = names(fid2);
%
Mem = load([pathy,cell2mat(selname1)]);
Act = load([pathy,cell2mat(selname2)]);
%..........................................................................................................................................................................
% spc = round(abs(Mem.Ymid2-Mem.Ymid1)/2);
% df = size(Mem.MM,1) - (spc+size(Mem.MD,1));

%For membrane and actin images:
%For uneven split:
% Mu_pad = false(df,size(Mem.MU,2));
% New_MU = [Mu_pad;Fin_Midup];
% New_MM = [New_MU;Fin_Middown];

%If splitted equally
% Mu_pad = false(round(Mem.Ymid1),size(Mem.MU,2));
% Md_pad = false(round(size(Mem.MM,1)-Mem.Ymid2),size(Mem.MD,2));
% New_MU = [Mu_pad; Mem.MU];
% New_MD = [Mem.MD; Md_pad;];
% New_MM = [New_MU;New_MD];
%% For binary image
%For uneven split:
% Mu_pad = false(df,size(Mem.MU,2));
% New_MU = [Mu_pad;Midup_Fin];
% New_MM = [New_MU;Middown_Fin];

%For even split:
% Mu_pad = false(round(Mem.Ymid1),size(Mem.MU,2));
% Md_pad = false(round(size(Mem.MM,1)-Mem.Ymid2),size(Mem.MD,2));
% New_MU = [Mu_pad; Midup_Fin];
% New_MD = [Middown_Fin; Md_pad;];
% New_MM = [New_MU;New_MD];
%% Get Full Embryo: Version 1
% Mid = [Midup_Fin;Middown_Fin];
% diff = size(Head_Fin,1)-size(Mid,1);
% if(size(Mid,1)==size(Head_Fin,1))
%     Full_Emb = [Head_Fin,Mid,Tail_Fin];
%     figure;imshow(Full_Emb)
% else
%     yd = ceil(diff/2); ydpad = zeros(yd,size(Mid,2));
%     yu = floor(diff/2); yupad = zeros(yu,size(Mid,2));
%     Mid_New = [yupad;Mid;ydpad];
%     Full_Emb = [Head_Fin,Mid_New,Tail_Fin];
%     figure;imshow(Full_Emb)
% end
%% Get Full Embryo: Version 2
% Mid = [Midup_Fin;Middown_Fin];
% %diff = size(Head_Fin,1)-size(Mid,1);
% if(size(Mid,1)==size(Head_Fin,1))
%     Full_Emb1 = [Head_Fin,Mid,Tail_Fin];
%     figure;imshow(Full_Emb1)
% else
%     yd = size(Mem.Imem_adapt,1)-ceil(Mem.Ymid2)+1; ydpad = zeros(yd,size(Mid,2));
%     yu = floor(Mem.Ymid1); yupad = zeros(yu,size(Mid,2));
%     Mid_New = [yupad;Mid;ydpad];
%     Full_Emb1 = [Head_Fin,Mid_New,Tail_Fin];
%     figure;imshow(Full_Emb1)
% end
% 
% Xpad1 = false((size(Full_Emb1,1)),floor(Mem.X1));
% Xpad2 = false((size(Full_Emb1,1)),(size(Mem.Imem_rotate,2)-floor(Mem.X2)+1));
% Seg = [Xpad1,Full_Emb1,Xpad2];
% figure;imshow(Seg)
% % Mem_New = imcrop(Mem.Imem_rotate,[Mem.X1,Mem.Ymid1,Mem.X2-1,Mem.Ymid2-1]);
% % figure;imshow(Mem_New)
%% Get Full Embryo Axolotl: Version 2
% For Axolotl
 [Full_Emb1,Seg1] = getfullsizeseg_ver2(Head_Fin1,Midup_Fin1,Middown_Fin1,Tail_Fin1,Mem);
 % [Full_Emb2,Seg2] = getfullsizeseg_ver2(Head_Fin2,Midup_Fin2,Middown_Fin2,Tail_Fin2,Mem);
% For Trops and Laevis
 %[Full_Emb,Seg] = getfullsizeseg_ver2(Head_Fin,Midup_Fin,Middown_Fin,Tail_Fin,Mem);
%% Full Embryo Analysis:
%T1_S4............................................................................................................................................................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Sections_Im4_Mem.mat');

%T1_S5....................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\All Sections\Sections_Im5_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\All Sections\Sections_Im5_Mem.mat');

%T2_S2............................................................................................................................................................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Mem.mat');

%T2_S4....................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\All Sections\Sections_Im4_Mem.mat');

%T3_S3............................................................................................................................................................

%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
%Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S3\All Sections\Sections_Im3_Tub.mat');
%Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S3\All Sections\Sections_Im3_Mem.mat');

%T3_S4....................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S4\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\S4\All Sections\Sections_Im4_Mem.mat');
%% Find small areas if needed
% Check first:
Are = regionprops(Seg2,'Area');
mink([Are.Area],5)
%Areafilt = bwareafilt(Bound_img11,[0 100]);
%Areafilt = bwareafilt(Full_Emb,[0 100]);

% Areafilt = bwareafilt(Seg1,[0 100]);
% BW = bwconncomp(Areafilt);
% Are = regionprops(Areafilt,'Area');
% Seg_Full = bwareaopen(Seg,100);
%% 
%T1_S4..............................................................................................................................................................
Iact = imcrop(Act.Itub_rotate,croppos1);
Imem = imcrop(Mem.Imem_rotate,croppos1);
%T1_S5..............................................................................................................................................................
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Iadapt_new,croppos1); 
%T2_S2..............................................................................................................................................................
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Imem_adapt,croppos1);
%T2_S4..............................................................................................................................................................
% Iact1 = orientimages(Act.Itub_adapt,'xdir');
% Imem1 = orientimages(Mem.Imem_adapt,'xdir');
% Iact = imcrop(Iact1,croppos1);
% Imem = imcrop(Imem1,croppos1);

%T3_S3..............................................................................................................................................................
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Imem_adapt,croppos1);
%T3_S4..............................................................................................................................................................
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Imem_adapt,croppos1);

figure;imshowpair(Iact,Areafilt) 
figure;imshowpair(Imem,Areafilt)
%figure;imshowpair(Imem,Iact)
figure;imshowpair(adapthisteq(Imem),Iact)
%% Visualize filtered area and images
%T1_S4..............................................................................................................................................................
% T1_S4 = bwareaopen(Bound_img11,80); %T1_S4
% figure;imshow(T1_S4) %T1_S4
% figure;imshowpair(T1_S4,Iact) %T1_S4
%T1_S5..............................................................................................................................................................
% T1_S5 = bwareaopen(Bound_img11,80); %T1_S5
% figure;imshow(T1_S5) %T1_S5
% figure;imshowpair(T1_S5,adapthisteq(Iact)) %T1_S5

%T2_S2..............................................................................................................................................................
% T2_S2 = bwareaopen(Bound_img11,80); %T2_S2
% figure;imshow(T2_S2) %T2_S2
% figure;imshowpair(T2_S2,Iact) %T2_S2
%T2_S4..............................................................................................................................................................
%T2_S4 = bwareaopen(Bound_img11,80); %T2_S4
%figure;imshow(T2_S4) %T2_S4
%figure;imshowpair(T2_S4,Iact) %T2_S4

%T3_S3..............................................................................................................................................................
T3_S3 = bwareaopen(Bound_img11,80); %T3_S3
figure;imshow(T3_S3) %T3_S3
figure;imshowpair(T3_S3,Iact) %T3_S3
%T3_S4..............................................................................................................................................................
% T3_S4 = bwareaopen(Bound_img11,80); %T3_S4
% figure;imshow(T3_S4) %T3_S4
% figure;imshowpair(T3_S4,Iact) %T3_S4
%%
clearvars -except T1_S4 T1_S4_Fin T1_S5 T1_S5_Fin T2_S2 T2_S2_Fin T2_S4 T2_S4_Fin
%% Save files1
pathy1=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\FullEmbryo Sample4\All_MCC_Seg.mat');
pathy2=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\FullEmbryo Sample5\All_MCC_Seg.mat');
pathy3=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Full Embryo\All_MCC_Seg.mat');
pathy4=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Full Embryo\All_MCC_Seg.mat');

load(pathy1);
load(pathy2);
load(pathy3);
load(pathy4);
%% Get Full embryo stats sections 

%T1_S4............................................................................................................................................................
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S4\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Sections_Im4_Mem.mat');
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_rotate,croppos1);

%T1_S5....................
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S5\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\All Sections\Sections_Im5_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\All Sections\Sections_Im5_Mem.mat');
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Iadapt_new,croppos1); 

%T2_S2............................................................................................................................................................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S2\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\All Sections\Sections_Im4_Mem.mat');
% Iact = imcrop(Act.Itub_adapt,croppos1);
% Imem = imcrop(Mem.Imem_adapt,croppos1);

%T2_S4....................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S4\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\All Sections\Sections_Im4_Mem.mat');
% Iact1 = orientimages(Act.Itub_adapt,'xdir');
% Imem1 = orientimages(Mem.Imem_adapt,'xdir');
% Iact = imcrop(Iact1,croppos1);
% Imem = imcrop(Imem1,croppos1);

%T3_S3............................................................................................................................................................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample3\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S3\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample3\All Sections\Sections_Im3_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample3\All Sections\Sections_Im3_Mem.mat');
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_final,croppos1);

%T3_S4....................................................................................................................

% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S4\RawFin.mat');
% Act = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\All Sections\Sections_Im4_Tub.mat');
% Mem = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\All Sections\Sections_Im4_Mem.mat');
% Iact = imcrop(Act.Itub_rotate,croppos1);
% Imem = imcrop(Mem.Imem_final,croppos1);
%% Show Images
figure;imshowpair(Bound_img11,Iact)
figure;imshowpair(Imem,Bound_img11)
%% Save all images:
pathn = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S3\');
svpth = [pathn,'All_FullCrop_T3_S3.mat'];
save(svpth,'Iact','Imem','Bound_img11');
%% Save files2
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Raw_Full_Embryos.mat', 'T1_S4', 'T1_S5', 'T2_S2', 'T2_S4')
save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Fin_Full_Embryos.mat', 'T1_S4_Fin', 'T1_S5_Fin', 'T2_S2_Fin', 'T2_S4_Fin')
%% 
% S1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S4\RawFin.mat');
% S2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S5\RawFin.mat');
% S3 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S2\RawFin.mat');
% S4 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S4\RawFin.mat');
% S5 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S3\RawFin.mat');
% S6 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S4\RawFin.mat');
%  
% Fin1 = S1.Bound_img11;
% Fin2 = S2.Bound_img11;
% Fin3 = S3.Bound_img11;
% Fin4 = S4.Bound_img11;
% Fin5 = S5.Bound_img11;
% Fin6 = S6.Bound_img11;

%save('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Fin_Full_Embryos_All_Trials.mat','Fin1','Fin2','Fin3','Fin4','Fin5','Fin6');

%% Get act and mem
M1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S4\All_FullCrop_T1_S4.mat');
Iact1 = M1.Iact;
Imem1 = M1.Imem;
Fin1 = M1.Bound_img11;

M2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S5\All_FullCrop_T1_S5.mat');
Iact2 = M2.Iact;
Imem2 = M2.Imem;
Fin2 = M2.Bound_img11;

M3 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S2\All_FullCrop_T2_S2.mat');
Iact3 = M3.Iact;
Imem3 = M3.Imem;
Fin3 = M3.Bound_img11;

M4 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S4\All_FullCrop_T2_S4.mat');
Iact4 = M4.Iact;
Imem4 = M4.Imem;
Fin4 = M4.Bound_img11;

M5 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S3\All_FullCrop_T3_S3.mat');
Iact5 = M5.Iact;
Imem5 = M5.Imem;
Fin5 = M5.Bound_img11;

M6 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S4\All_FullCrop_T3_S4.mat');
Iact6 = M6.Iact;
Imem6 = M6.Imem;
Fin6 = M6.Bound_img11;
%% Load files for stats and measurements
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Fin_Full_Embryos.mat')
%load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Fin_Full_Embryos_All_Trials.mat');
All_Images{1,1} = Fin1;
All_Images{2,1} = Fin2;
All_Images{3,1} = Fin3;
All_Images{4,1} = Fin4;
All_Images{5,1} = Fin5;
All_Images{6,1} = Fin6;

All_Act{1,1} = adapthisteq(Iact1);
All_Act{2,1} = adapthisteq(Iact2);
All_Act{3,1} = Iact3;
All_Act{4,1} = adapthisteq(Iact4);
All_Act{5,1} = adapthisteq(Iact5);
All_Act{6,1} = adapthisteq(Iact6);

All_Mem{1,1} = adapthisteq(Imem1);
All_Mem{2,1} = adapthisteq(Imem2);
All_Mem{3,1} = adapthisteq(Imem3);
All_Mem{4,1} = adapthisteq(Imem4);
All_Mem{5,1} = adapthisteq(Imem5);
All_Mem{6,1} = adapthisteq(Imem6);
%% Visualize Embryos
visuzalize_sections_single(All_Images);
visuzalize_sections_single(All_Act);
visuzalize_sections_single(All_Mem);

visuzalize_sections2(All_Images,All_Act);
visuzalize_sections2(All_Mem,All_Images);
%% Get Props
%[Number,All_Props] = Images_allprops(All_Images);
%pf = 0.44607012222321348916049602997591; % For Trops

%pf = 0.88865191504487692170976628454634; % For Axolotl S4
%pf = 1.1375270162666363326128995563645; % For Axolotl S7

%pf = 0.89214024444642697832099205995182; % For Laevis S9
%pf = 0.88865191504487692170976628454634; % For Laevis S10

%[Number,All_Props] = Images_allprops_conv(All_Images,pf);
%% Plot files folder names
%pf = 0.44607012222321348916049602997591;
pathname1 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T1_S4\');
pathname2 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T1_S5\');
pathname3 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T2_S2\');
pathname4 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T2_S4\');
pathname5 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T3_S3\');
pathname6 = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\T3_S4\');
%% Plot Images
plot_allcell_props(All_Images{1,1},pf,pathname1)
plot_allcell_props(All_Images{2,1},pf,pathname2)
plot_allcell_props(All_Images{3,1},pf,pathname3)
plot_allcell_props(All_Images{4,1},pf,pathname4)
%%
plot_allcell_props(All_Images{5,1},pf,pathname5)
plot_allcell_props(All_Images{6,1},pf,pathname6)
%% Get Props Axolotl Laevis:
% All path:
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\');
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\');
% pathy = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\');

%........................................................................................................................................................................................
% Pixel to micron factors:
%pf = 0.44607012222321348916049602997591; % For Trops
pf = 0.88865191504487692170976628454634; % For Axolotl S4
%pf = 1.1375270162666363326128995563645; % For Axolotl S7
%pf = 0.89214024444642697832099205995182; % For Laevis S9
%pf = 0.88865191504487692170976628454634; % For Laevis S10

%........................................................................................................................................................................................
%Load binary images:
% TT1 = load([pathy,'S4_Full_Embryo_Apical3.mat']); BW1 = TT1.BW1; %S4 Axolotl 
% TT2 = load([pathy,'S4_Full_Embryo_Cilia.mat']); BW2 = TT2.Seg; %S4 Axolotl
% TT1 = load([pathy,'S7_Full_Embryo_Apical.mat']); BW1 = logical(TT1.Seg); %S7 Axolotl
% TT2 = load([pathy,'S7_Full_Embryo_Cilia.mat']); BW2 = logical(TT2.Seg); %S7 Axolotl
% load([pathy,'S9_Full_Embryo.mat']); BW = logical(Seg);%S9 Laevis
%load([pathy,'S10_Full_Embryo.mat']); BW = logical(Seg);%S10 Laevis
%save([pathy,'S4_Full_Embryo_Apical3.mat'],'BW1')
%% ........................................................................................................................................................................................
% Calculate and store properties/images:

% For Axolots:
% [Number1,All_Props1] = Single_Images_allprops_conv(BW1,pf);
% plot_allcell_props(BW1,pf,pathy)
%%
% [Number2,All_Props2] = Single_Images_allprops_conv(BW2,pf);
% plot_allcell_props(BW2,pf,pathy)
% save([pathy,'Full_Emb_Props.mat'],'Number1','Number2','All_Props1','All_Props2')
%........................................................................................................................................................................................
% For Laevis:
[Number,All_Props] = Single_Images_allprops_conv(Fin2,pf);
plot_allcell_props(BW,pf,pathy)
save([pathy,'Full_Emb_Props.mat'],'Number','All_Props')
%% All resized images:
% Laevis:
% Sample 9 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\');
% Res = load([orgpath,'Reshaped_Seg_Fin.mat']); % For Laevis

% Sample 10 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\');
% Res = load([orgpath,'Reshaped_Seg_Fin.mat']); % For Laevis
%................................................................................................................................................................
% Axolotl:
% Sample 4 
orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\');
Res = load([orgpath,'Reshaped_Seg_Cilia_Fin.mat']); % For Axolotls

% Sample 7 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\');
% Res = load([orgpath,'Reshaped_Seg_Cilia_Fin.mat']); % For Axolotls
%% All reshaped properties:
%Trops:
T1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Finresize_S1.mat');
T2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Finresize_S4.mat');
%Laevis:
orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\');
L1 = load([orgpath,'Reshaped_Seg_Fin.mat']); 
orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\');
L2 = load([orgpath,'Reshaped_Seg_Fin.mat']);
%Axolotl:
orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\');
A1 = load([orgpath,'Reshaped_Seg_Cilia_Fin.mat']); 
orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\');
A2 = load([orgpath,'Reshaped_Seg_Cilia_Fin.mat']);
%% Original Sections
T = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\Defined Crops\Original_Final_Sections.mat');
L = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\Original_Final_Sections.mat'); 
A = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\Original_Final_Sections.mat'); 
%% 
pathname = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\All Species\');
%pf = 0.44607012222321348916049602997591; %Trops
%pf = 0.89214024444642697832099205995182; %Laevis S9
%pf = 0.88865191504487692170976628454634; %Laevis S10
pf = 0.88865191504487692170976628454634; %Axolotl S4
%pf = 1.1375270162666363326128995563645; %Axolotl S7

% Img = T1.Embfin;
% Img = T2.Embfin;
% Img = L1.Embfin;
% Img = L2.Embfin;
% Img = A1.Embfin;
% Img = A2.Embfin;

% Img = T.Bound_img11;
% Img = L.Bound_img11;
% Img = A.Bound_img11;

Ver2_plot_allcell_props(Img,pf,pathname)
[Number,All_Props] = Single_Images_allprops_conv(Img,pf);
save([pathname,'Full_Emb_Props_pmf.mat'],'Number','All_Props')
%%
clear All_Props
%% Ignore extreme aspect ratio:
inn=find(Aspect>5.5);
centroidsX(inn)=[];
centroidsY(inn)=[];
Pixel(inn)=[];
O(inn)=[];
Aspect(inn)=[];